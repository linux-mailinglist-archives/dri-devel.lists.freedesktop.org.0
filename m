Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58F5BB8A6
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A20710E3BE;
	Sat, 17 Sep 2022 14:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ED910E3A7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663423441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6U7KwqH89K4PhH/6Ykfn7HtN1TvEt2/xhLXlSzClh64=;
 b=KhZxM3V+qn96uJox3rFIfHW8GwGRC+owmnquEcX6KvbuODw1ao0ikPkls4VmkTgmK3gYJK
 nh6JOOUBydBzfqZgXnMOZ9rEDbzRf54izWyfcULO3Y0biO3afKGkAuWyswSJUMMkcF8ZjW
 0WSvZOgUnCITHYOzroP2jLK9wRSZtjc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-hZaUXfnUOye52G2AalP_YQ-1; Sat, 17 Sep 2022 10:03:57 -0400
X-MC-Unique: hZaUXfnUOye52G2AalP_YQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4727A1C05B01;
 Sat, 17 Sep 2022 14:03:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9246140C6EC2;
 Sat, 17 Sep 2022 14:03:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 3/5] drm/gma500: Use backlight_get_brightness() to get the
 brightness
Date: Sat, 17 Sep 2022 16:03:50 +0200
Message-Id: <20220917140352.526507-4-hdegoede@redhat.com>
In-Reply-To: <20220917140352.526507-1-hdegoede@redhat.com>
References: <20220917140352.526507-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Use backlight_get_brightness() instead of directly referencing
bd->props.brightness. This will take backlight_is_blank() into account,
properly setting brightness to 0 when screen-blanking has been requested
through the backlight sysfs interface.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2 of the patch-set:
- New patch in v2 of the patch-set
---
 drivers/gpu/drm/gma500/backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index d113c5810ca5..9be28dc0bdd1 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -52,7 +52,7 @@ static int gma_backlight_get_brightness(struct backlight_device *bd)
 static int gma_backlight_update_status(struct backlight_device *bd)
 {
 	struct drm_device *dev = bl_get_data(bd);
-	int level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 
 	/* Percentage 1-100% being valid */
 	if (level < 1)
-- 
2.37.3

