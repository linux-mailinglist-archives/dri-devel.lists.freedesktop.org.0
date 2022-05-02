Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3858516C8E
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 10:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CCC10FD91;
	Mon,  2 May 2022 08:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7444410FD90
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFdAbAFC6hVBQLu+NPQWCbO+3EFmV4d5chrstqJm+WU=;
 b=M7U2M22x1JXNii8+rnShpDxAEcUDlkl8Zzpa59NM8t9b7takn4cO8YY2phtbBjaRClznDT
 AQQBE6OVB7NA5/3z+pDWY7haETUj84CcG2yF7i/gig1y7GFwSGiHzfBqBzp/tfjf0vhQ4T
 Xs5oyN2jEySA/k1+i9p7wH83a77WpTE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-XqE3YOw6Mdivku_LjtBwNg-1; Mon, 02 May 2022 04:53:06 -0400
X-MC-Unique: XqE3YOw6Mdivku_LjtBwNg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so2445165wrd.14
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 01:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RFdAbAFC6hVBQLu+NPQWCbO+3EFmV4d5chrstqJm+WU=;
 b=eMrhWBw1Qu1cT7grwln3WMAdXop78f/1FowmU/NTpsB8K4yDJBQpuWxmVmT2lcbfD4
 DaPBK0zJflhsfly9w4SLBgYMMyOXxWSspcD1RYg31mUvpYruQMQ5lUuStQMcECDReBqG
 YA4c+p0kpCTkZNptEQtG/tFp1MqkSVJOgUwiFno3YqyY/mtE/IIcn9Rqk80NEIw/tF5w
 R0sZwv8NxU1gzP/bEBqtdtiuYmpHteBq2O5TgSOEr+QvCRy72pmw2FrzQiodckAdOa/L
 L/5utTePHAL5IhHzoEK5pR9LsBPusv2IM2xxXZoniqJ8u8HR6+icYMaXq0d4EMvLC5Sl
 HWIg==
X-Gm-Message-State: AOAM531QmD2JKcKSVrHzVQp09lkyO/o3wr0uC0QRTsv+XF1ydVDwwSy0
 yEPOyRvjLawjvLfuD5ThhpCwwNoMAQHOYwAONDv+8oPau3BQCHN2V7C5sduq8t87YR1wh+lxdp7
 /pmVNg4ulnpNcDLEDTkAcl0TpgskI
X-Received: by 2002:a05:600c:6022:b0:394:3943:dd61 with SMTP id
 az34-20020a05600c602200b003943943dd61mr4082567wmb.196.1651481585094; 
 Mon, 02 May 2022 01:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwAdCi1b+GagstF4L/akza3x40XLpRMN8KNh6WPEAQN0F84cne1/xuXbVNcY/l5tbIzjtp6A==
X-Received: by 2002:a05:600c:6022:b0:394:3943:dd61 with SMTP id
 az34-20020a05600c602200b003943943dd61mr4082552wmb.196.1651481584883; 
 Mon, 02 May 2022 01:53:04 -0700 (PDT)
Received: from minerva.. ([90.167.94.74]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfc041000000b0020c5253d8desm6823400wrf.42.2022.05.02.01.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 01:53:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm: Allow simpledrm to setup its emulated FB as firmware
 provided
Date: Mon,  2 May 2022 10:52:59 +0200
Message-Id: <20220502085259.286590-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502084830.285639-1-javierm@redhat.com>
References: <20220502084830.285639-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Indicate to fbdev subsystem that the registered framebuffer is provided by
the system firmware, so that it can handle accordingly. For example, would
unregister the FB devices if asked to remove the conflicting framebuffers.

Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
Drivers can use this to indicate the FB helper initialization that the FB
registered is provided by the firmware, so it can be configured as such.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_fb_helper.c  |  9 +++++++++
 drivers/gpu/drm/tiny/simpledrm.c |  2 +-
 include/drm/drm_fb_helper.h      | 10 ++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index f626947bb9b9..c2ff986f064d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 		/* don't leak any physical addresses to userspace */
 		info->flags |= FBINFO_HIDE_SMEM_START;
 
+	/* Indicate that the framebuffer is provided by the firmware */
+	if (fb_helper->firmware)
+		info->flags |= FBINFO_MISC_FIRMWARE;
+
 	/* Need to drop locks to avoid recursive deadlock in
 	 * register_framebuffer. This is ok because the only thing left to do is
 	 * register the fbdev emulation instance in kernel_fb_helper_list. */
@@ -2511,6 +2515,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
  *               @dev->mode_config.preferred_depth is used instead.
+ * * DRM_FB_FW:  if the framebuffer for the device is provided by the
+ *               system firmware.
  *
  * This function sets up generic fbdev emulation for drivers that supports
  * dumb buffers with a virtual address and that can be mmap'ed.
@@ -2537,6 +2543,7 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
 {
 	struct drm_fb_helper *fb_helper;
 	unsigned int preferred_bpp = DRM_FB_GET_OPTION(DRM_FB_BPP, options);
+	bool firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);
 	int ret;
 
 	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
@@ -2569,6 +2576,8 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
 		preferred_bpp = 32;
 	fb_helper->preferred_bpp = preferred_bpp;
 
+	fb_helper->firmware = firmware;
+
 	ret = drm_fbdev_client_hotplug(&fb_helper->client);
 	if (ret)
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f5b8e864a5cd..5dcc21ea6180 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -901,7 +901,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 0);
+	drm_fbdev_generic_setup(dev, DRM_FB_SET_OPTION(DRM_FB_FW, 1));
 
 	return 0;
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 1da3ef76f499..0eec500e0784 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -44,6 +44,7 @@ enum mode_set_atomic {
 };
 
 #define DRM_FB_BPP_MASK GENMASK(7, 0)
+#define DRM_FB_FW_MASK GENMASK(8, 8)
 
 /* Using the GNU statement expression extension */
 #define DRM_FB_SET_OPTION(option, value)			\
@@ -197,6 +198,15 @@ struct drm_fb_helper {
 	 * See also: @deferred_setup
 	 */
 	int preferred_bpp;
+
+	/**
+	 * @firmware:
+	 *
+	 * Set if the driver indicates to the FB helper initialization that the
+	 * framebuffer for the device being registered is provided by firmware,
+	 * so that it can pass this on when registering the framebuffer device.
+	 */
+	bool firmware;
 };
 
 static inline struct drm_fb_helper *
-- 
2.35.1

