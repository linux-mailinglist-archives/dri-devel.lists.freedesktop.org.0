Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0285517E4B
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 09:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60C10EAC1;
	Tue,  3 May 2022 07:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866B910EA4F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651562155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7Xo+XfuxpwgRvmh+x+4llEf06yjZT56T0kzU1GhsAM=;
 b=IFXO9Ch1X5eO+kTE47+mUx5P4koZxKBfl5XKKIGrJXa8SvhvZAfsr0W8GrydEb7RI2BI4a
 wn2nNQpzQPi031nvK9pyKm2+ZOi0cMR+3J+OQ0132zGdACwLNa46DTERsAJ0zkopBaziDm
 P1QzrMSjNioNGCkY5I9gsxyqgQN099o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-96veXZodOvi-y5XH19_qyA-1; Tue, 03 May 2022 03:15:54 -0400
X-MC-Unique: 96veXZodOvi-y5XH19_qyA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso5563342wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 00:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7Xo+XfuxpwgRvmh+x+4llEf06yjZT56T0kzU1GhsAM=;
 b=K8igG1qlPXXw7xtmHOp/y6pBIqYY8vd2bi3subiainhbv8+j/cG5hS1dlIvXno6aHl
 yh1d3rfn/jBVYO/hzFJMSJNfd5q93ODmqdhdOzh8dqjIZicdTxyqvt8W/HZdH3OWVUX7
 5fgkF1w+otgvM3MX5p0or4Tdb6VB9adv9+hWmUMQ2WCxjl6U3/IgZHoqOPUw9D9u54Ly
 t65Y/3X7ziUYWX65kj9t+7iXnDFq6J2Sso5UK36zj5tskkzTKQ6tEv2pxGN8fJAYLAPe
 EQ8OkXopClxLkEBO+1uxMuiNeVmzCAtpY4icD8cPixLHAUao238X3xKlBrUGgf9aSrgM
 dvyQ==
X-Gm-Message-State: AOAM530cCGLRgPg/Roq4q+NE7bIBKV0BqUuDBG5Nb2MBTbS5nfXxfkQ4
 gimgKLfG3fJQ8dwk6+vkpOnqcg++f+7bPqPDAcxefYrsHa2asRyg2hiOBKk76E1M0TfS9lHb3q6
 MS3leA4Pg48uRms8vfcH+hQYfO4Ge
X-Received: by 2002:a05:6000:156a:b0:20c:64e3:948f with SMTP id
 10-20020a056000156a00b0020c64e3948fmr5556152wrz.436.1651562153583; 
 Tue, 03 May 2022 00:15:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynU4A8UAMBzp9HgBNoyG2MT4qKn8ajICWkatc7Q4nPkcU1AC0+1p+2JSCGZAIYuxarLlCg5w==
X-Received: by 2002:a05:6000:156a:b0:20c:64e3:948f with SMTP id
 10-20020a056000156a00b0020c64e3948fmr5556139wrz.436.1651562153365; 
 Tue, 03 May 2022 00:15:53 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003942a244f33sm1035387wmp.12.2022.05.03.00.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 00:15:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Date: Tue,  3 May 2022 09:15:40 +0200
Message-Id: <20220503071540.471667-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503071540.471667-1-javierm@redhat.com>
References: <20220503071540.471667-1-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v3:
- Drop the firmware local variable (Laurent Pinchart).
- Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).

 drivers/gpu/drm/drm_fb_helper.c  |  8 ++++++++
 drivers/gpu/drm/tiny/simpledrm.c |  2 +-
 include/drm/drm_fb_helper.h      | 10 ++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 52042ba1e4cf..28b21858b726 100644
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
@@ -2512,6 +2516,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
  *   @dev->mode_config.preferred_depth is used instead.
+ * * DRM_FB_FW: if the framebuffer for the device is provided by the
+ *   system firmware.
  *
  * This function sets up generic fbdev emulation for drivers that supports
  * dumb buffers with a virtual address and that can be mmap'ed.
@@ -2569,6 +2575,8 @@ void drm_fbdev_generic_setup(struct drm_device *dev, const unsigned int options)
 	if (!fb_helper->preferred_bpp)
 		fb_helper->preferred_bpp = 32;
 
+	fb_helper->firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);
+
 	ret = drm_fbdev_client_hotplug(&fb_helper->client);
 	if (ret)
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index f5b8e864a5cd..f6f1c5e108b2 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -901,7 +901,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, 0);
+	drm_fbdev_generic_setup(dev, DRM_FB_OPTION(DRM_FB_FW, 1));
 
 	return 0;
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 5fc41cf0c987..5a17af423944 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -44,6 +44,7 @@ enum mode_set_atomic {
 };
 
 #define DRM_FB_BPP_MASK GENMASK(7, 0)
+#define DRM_FB_FW_MASK GENMASK(8, 8)
 
 /* Using the GNU statement expression extension */
 #define DRM_FB_OPTION(option, value)				\
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

