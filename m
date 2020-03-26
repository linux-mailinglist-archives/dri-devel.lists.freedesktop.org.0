Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3891942B1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 16:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0696E8E6;
	Thu, 26 Mar 2020 15:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0636E8E6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Mar 2020 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585235414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qT1MlsFZjL/Pyv0GRkULd+FlNtAxY2qB5OOmCnZfvc8=;
 b=EodfBcueINZqBIOuQgsHhk8OzK6dHfgJme2UMCvKJZG/wH2fP10OQrzPZZcaRk5I82GExN
 b0GSgxM/qlG3geNGYUh0bNsK6bjgSgnsqmF0QnoY2UZyXFJN9VbJHp+ZrQP3z/IjrdHNKM
 WEzrMy/SZUn1JustxNwwdH5+1q0PWew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-rzak6iUMPS6gSepn1yYlJA-1; Thu, 26 Mar 2020 11:10:13 -0400
X-MC-Unique: rzak6iUMPS6gSepn1yYlJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50AF1800D53;
 Thu, 26 Mar 2020 15:10:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BDE41001920;
 Thu, 26 Mar 2020 15:10:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/fb-helper: Add TODO for making drm_fb_helper_alloc_fbi
 fill apertures
Date: Thu, 26 Mar 2020 16:10:09 +0100
Message-Id: <20200326151009.102377-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently drivers using drm_fbdev_generic_setup() end up with a single
empty aperture in their fb_info struct.

Not having the proper info in the apertures list causes
register_framebuffer to not remove conflicting framebuffers,
which some drivers currently workaround by manually calling
drm_fb_helper_remove_conflicting_pci_framebuffers().

Add a TODO as a reminder that we need to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 4c7cbce7bae7..16b8dc38d022 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -526,6 +526,14 @@ struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
 	if (ret)
 		goto err_release;
 
+	/*
+	 * TODO: We really should be smarter here and alloc an apperture
+	 * for each IORESOURCE_MEM resource helper->dev->dev has and also
+	 * init the ranges of the appertures based on the resources.
+	 * Note some drivers currently count on there being only 1 empty
+	 * aperture and fill this themselves, these will need to be dealt
+	 * with somehow when fixing this.
+	 */
 	info->apertures = alloc_apertures(1);
 	if (!info->apertures) {
 		ret = -ENOMEM;
-- 
2.26.0.rc2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
