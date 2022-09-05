Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF105AD411
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 15:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E92110E3A4;
	Mon,  5 Sep 2022 13:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2EC10E390
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 13:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662385065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/pXD7aQbta8VpoKA60AQUB7mtKPR9zOjvt9Jr1a3+Q=;
 b=TAEXFSKdCOMS1vzMJIthojwb7Dsq+vrtNALYbSzJa6eGKfY7oRs96sdnH9eaDVpx3JRa36
 YG03GLunS95s2dhyvIs91/xqFlG4MiQEDqhSIqQbPVxR1lr7IHxGq0GgAgxolEzSjPIFFk
 ix5iGo+fT8CrilqgSIAYa8MJhvSPuYk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-9bUeBEtJMxaxnP7S5Yq6Cg-1; Mon, 05 Sep 2022 09:37:44 -0400
X-MC-Unique: 9bUeBEtJMxaxnP7S5Yq6Cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C105B29ABA14;
 Mon,  5 Sep 2022 13:37:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E76340D282E;
 Mon,  5 Sep 2022 13:37:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 2/3] drm/gma500: Fix crtc_vblank reference leak when userspace
 queues multiple events
Date: Mon,  5 Sep 2022 15:37:37 +0200
Message-Id: <20220905133738.466490-3-hdegoede@redhat.com>
In-Reply-To: <20220905133738.466490-1-hdegoede@redhat.com>
References: <20220905133738.466490-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gma500 page-flip code kinda assume that userspace never queues more
then 1 vblank event. So basically it assume that userspace does:

- page-flip
- wait for vblank event
- render
- page-flip
- etc.

In the case where userspace would submit 2 page-flips without waiting
for the first to finish, the current code will just overwrite
gma_crtc->page_flip_event with the event from the 2nd page-flip.

Before this patch if page-flips are submitted then drm_crtc_vblank_get()
will get called twice, where drm_crtc_vblank_put(crtc) will only be run
once, since only 1 event will get reported (the last event set in
gma_crtc->page_flip_event).

Fix the crtc_vblank reference leak by not calling drm_crtc_vblank_get()
when replacing a still set gma_crtc->page_flip_event with a new one.

And while at it add a warning for when userspace tries to queue
multiple page-flips with events attached which gma500 currently
does not support.

Note this is not a real fix for the issue of the gma500 code not
supporting multiple page-flips events being pending, but it at least
improves the situation a bit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/gma_display.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index cf038e322164..c4084301afb4 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -528,10 +528,13 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 
 	if (event) {
 		spin_lock_irqsave(&dev->event_lock, flags);
-
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-
-		gma_crtc->page_flip_event = event;
+		if (!gma_crtc->page_flip_event) {
+			WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+			gma_crtc->page_flip_event = event;
+		} else {
+			drm_warn_once(dev, "page_flip_event already set, gma500 does not support queing multiple events\n");
+			gma_crtc->page_flip_event = event;
+		}
 		spin_unlock_irqrestore(&dev->event_lock, flags);
 
 		/* Call this locked if we want an event at vblank interrupt. */
-- 
2.36.1

