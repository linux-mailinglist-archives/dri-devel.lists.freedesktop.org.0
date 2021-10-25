Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747624390A9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 09:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5874789E39;
	Mon, 25 Oct 2021 07:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C61F89DEC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635148690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYqAJMiMehgYdp+cI4y2X1DXGszUCH2Ol7ATB/O0Np0=;
 b=HlqMDcr7hEwul6M0x2YxhBO9dqV4LECFGvEtiDQkm3VFw5I5lqgHLAUqTUEIIMxklQLdvA
 Bv43p+BlgCv+rRFXl9Add4h1q0yzYWU8FzupXuyPp15SMaRsiWMrcFz+iOK4jey4DjsMcr
 268nwIibGJL1+0JozA780KrVh6m2ds8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-rdhXLYPLMR-opDUF3GTkqQ-1; Mon, 25 Oct 2021 03:58:06 -0400
X-MC-Unique: rdhXLYPLMR-opDUF3GTkqQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u15-20020a5d514f000000b001687ebddea3so1487387wrt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 00:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYqAJMiMehgYdp+cI4y2X1DXGszUCH2Ol7ATB/O0Np0=;
 b=EZPpTyAZIljGex+N3JyTfKMhR2x4m7ho0bLqKClrZKLzr/qrnFRc0shDglcfcbGaiM
 eyRy83xFTQK9Op9sAWWQcn10xjhLETQ9c7wftWRfnKem0RcVHvld+8yeFT0uyvnU9C6M
 wA2QkYbX7bi6k0JyZgWch/JNoo925DRSdW8goJ5qHDsKnMNGSAkrGsviXo+nRCR6faxJ
 1tsU+FHNrPYSjTZBOQWB3BAl7slsLZN7BUCsuyfqCTvH0tVE4dtQvxqCI1RD8JxmNfMv
 Y84NcLFR3ODxDVJ/yeHCTHWGWEINu5wazNvg+fJTFoSk4cuWj5UFqjU/WS6ehYFyw29w
 hhZg==
X-Gm-Message-State: AOAM532ucbtCvMywlUqTtFEWReSurnp3f2z7GMzTE8hy2z2lFTCLjwR1
 2Zd8kaqLgRCv8cYwFaqf3VG89m8z1d+Fy8jxmxhqaQPQpS/YEVJRSLEuH85ex9h3lPW4pX8uPwX
 uH0jz7uJM9+UL4d6GzNxbx+0b/4ny
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr8909375wmj.54.1635148685186; 
 Mon, 25 Oct 2021 00:58:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwYO5IXedqQl2OZFOdR0R166cWLfHsmJ4vD73vZAnbEkTR6bjbhzQlZ18zaAoPsiaVsGc+VQ==
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr8909347wmj.54.1635148684962; 
 Mon, 25 Oct 2021 00:58:04 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id d1sm15939502wrr.72.2021.10.25.00.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:58:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Neal Gompa <ngompa13@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/aperture: Move conflicting fbdev frame buffer
 removal to a helper
Date: Mon, 25 Oct 2021 09:57:55 +0200
Message-Id: <20211025075756.3479157-2-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025075756.3479157-1-javierm@redhat.com>
References: <20211025075756.3479157-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The logic to remove the conflicting frame buffers for fbdev devices that
use a given memory range is only compiled if CONFIG_FB option is enabled.

But having an ifdefery in drm_aperture_remove_conflicting_framebuffers()
makes the function harder to extend. Move the logic into its own helper.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/drm_aperture.c | 39 ++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 74bd4a76b253..1a8ed0c616d6 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -273,6 +273,30 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
 	mutex_unlock(&drm_apertures_lock);
 }
 
+static int drm_aperture_remove_conflicting_fbdev_framebuffers(resource_size_t base,
+							      resource_size_t size, bool primary,
+							      const struct drm_driver *req_driver)
+{
+#if IS_REACHABLE(CONFIG_FB)
+	struct apertures_struct *a;
+	int ret;
+
+	a = alloc_apertures(1);
+	if (!a)
+		return -ENOMEM;
+
+	a->ranges[0].base = base;
+	a->ranges[0].size = size;
+
+	ret = remove_conflicting_framebuffers(a, req_driver->name, primary);
+	kfree(a);
+
+	if (ret)
+		return ret;
+#endif
+	return 0;
+}
+
 /**
  * drm_aperture_remove_conflicting_framebuffers - remove existing framebuffers in the given range
  * @base: the aperture's base address in physical memory
@@ -289,23 +313,12 @@ static void drm_aperture_detach_drivers(resource_size_t base, resource_size_t si
 int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_size_t size,
 						 bool primary, const struct drm_driver *req_driver)
 {
-#if IS_REACHABLE(CONFIG_FB)
-	struct apertures_struct *a;
 	int ret;
 
-	a = alloc_apertures(1);
-	if (!a)
-		return -ENOMEM;
-
-	a->ranges[0].base = base;
-	a->ranges[0].size = size;
-
-	ret = remove_conflicting_framebuffers(a, req_driver->name, primary);
-	kfree(a);
-
+	ret = drm_aperture_remove_conflicting_fbdev_framebuffers(base, size, primary,
+								 req_driver);
 	if (ret)
 		return ret;
-#endif
 
 	drm_aperture_detach_drivers(base, size);
 
-- 
2.31.1

