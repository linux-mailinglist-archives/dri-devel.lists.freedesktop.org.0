Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372094390B5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 09:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA789E05;
	Mon, 25 Oct 2021 07:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6289E05
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635148753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0p9g1EJ/0qWdAEcRtSmulfYZr3WWmbZrrR9U8/IUCM=;
 b=L0qo6FD4atO/VgjpEZljL8vNtsTRhGKHJqXCjNvh8miMCfd+lLGR7FWiL35KVp2o/+6qaT
 469zTm2NJdMI6pmicTyRoYHf9jlF6rVSa8aaSZDjwS8El0DrfuLRTnwADbxE4nUFnvl6gE
 +SOkJaCFI6rCEhX9w+10LUSwhb6naZ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-vtuClTjfNRahuAbOcWVsGg-1; Mon, 25 Oct 2021 03:58:07 -0400
X-MC-Unique: vtuClTjfNRahuAbOcWVsGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 z8-20020adfec88000000b00168672580e0so1654089wrn.21
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 00:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0p9g1EJ/0qWdAEcRtSmulfYZr3WWmbZrrR9U8/IUCM=;
 b=MZeGnKGllPBs9aVYxWLpGvBGuI0GoTiaQdDsbmHjQt13BDRCP1fzTnSjsNfEeiRKAv
 1sGpUVsZVMHqarsM4IQbmR0J0okvCiqXlHCsXOIq7fqnER5ltHmTxAwgPbeZPLaLo32A
 J/tRV291PIxe/rf1OVK1CT4maLsDvI2yQDxQsGOo6ennrK1q43rxrNa9VkcYCtKBXTDo
 l57Enimzp0CZ9wm5HmWBGSr2snt4cPVoOptTgybNwadspTQrdbXN2ZHvkaI+RVFbf6O6
 ZrFnusQBh71gJMm/WXtYWqTah7dqy4XbOkRyNTolbs0+D1CAII9aNM+vbJti9iFqzOQ0
 WZbQ==
X-Gm-Message-State: AOAM531NSF/sWvnzpb5ut+8HuD1hk8k32VGqyhZE82rwDVOT5EaEcpuH
 8k21gXv7Zxxe14cIaNf+nKMaFH5Ax7gz51lzeaoyVnEg8B/AmZp9xs2ERHlIT/Pt7dCX+nqxLrN
 0wYOwyr0mnrGq/zi4lE6IGDWdGA4d
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr5095633wmj.98.1635148686655; 
 Mon, 25 Oct 2021 00:58:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeNzkCghAlbSOu9+pb40+e2jeuC0g3pAsuLw7y+ObmidA5Y7eKQIcaEQLbwjJtVjm7FZobuw==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr5095606wmj.98.1635148686449; 
 Mon, 25 Oct 2021 00:58:06 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id d1sm15939502wrr.72.2021.10.25.00.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:58:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Neal Gompa <ngompa13@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/aperture: Prevent conflicting framebuffers removal
 if option is set
Date: Mon, 25 Oct 2021 09:57:56 +0200
Message-Id: <20211025075756.3479157-3-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025075756.3479157-1-javierm@redhat.com>
References: <20211025075756.3479157-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The simpledrm driver allows to use the frame buffer that was set-up by the
firmware. This gives early video output before the platform DRM driver is
probed and takes over.

But it would be useful to have a way to disable this take over by native
DRM drivers. For example, there may be bugs in the DRM drivers that could
cause the display output to not work correctly.

For those cases, it would be good to keep the simpledrm driver instead and
at least get a working display as set-up by the firmware.

Let's add a drm.disable_native_drivers kernel command line parameter, that
when set to true it prevents the conflicting framebuffers to being removed.

Since the drivers call drm_aperture_remove_conflicting_framebuffers() very
early in their probe callback, this will cause the drivers' probe to fail.

Thanks to Neal Gompa for the suggestion and Thomas Zimmermann for the idea
on how this could be implemented.

Suggested-by: Neal Gompa <ngompa13@gmail.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Rename command line parameter to drm.disable_native_drivers.
- Return -EBUSY instead of -EINVAL when the function fails.
- Invert the parameter logic and make it false by default.

 drivers/gpu/drm/drm_aperture.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_aperture.c
index 1a8ed0c616d6..6ae20b6d6499 100644
--- a/drivers/gpu/drm/drm_aperture.c
+++ b/drivers/gpu/drm/drm_aperture.c
@@ -14,6 +14,11 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
+static bool drm_disable_native_drivers;
+module_param_named(disable_native_drivers, drm_disable_native_drivers, bool, 0600);
+MODULE_PARM_DESC(disable_native_drivers,
+		 "Disable native DRM drivers probing [default=false]");
+
 /**
  * DOC: overview
  *
@@ -307,6 +312,9 @@ static int drm_aperture_remove_conflicting_fbdev_framebuffers(resource_size_t ba
  * This function removes graphics device drivers which use memory range described by
  * @base and @size.
  *
+ * The conflicting framebuffers removal does not happen when drm.disable_native_drivers=1 is
+ * set. When this option is enabled, the function will return an -EBUSY errno code instead.
+ *
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
@@ -315,6 +323,9 @@ int drm_aperture_remove_conflicting_framebuffers(resource_size_t base, resource_
 {
 	int ret;
 
+	if (drm_disable_native_drivers)
+		return -EBUSY;
+
 	ret = drm_aperture_remove_conflicting_fbdev_framebuffers(base, size, primary,
 								 req_driver);
 	if (ret)
@@ -335,6 +346,9 @@ EXPORT_SYMBOL(drm_aperture_remove_conflicting_framebuffers);
  * for any of @pdev's memory bars. The function assumes that PCI device with
  * shadowed ROM drives a primary display and so kicks out vga16fb.
  *
+ * The conflicting framebuffers removal does not happen when drm.disable_native_drivers=1 is
+ * set. When this option is enabled, the function will return an -EBUSY errno code instead.
+ *
  * Returns:
  * 0 on success, or a negative errno code otherwise
  */
@@ -344,6 +358,9 @@ int drm_aperture_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 	resource_size_t base, size;
 	int bar, ret = 0;
 
+	if (drm_disable_native_drivers)
+		return -EBUSY;
+
 	for (bar = 0; bar < PCI_STD_NUM_BARS; ++bar) {
 		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
 			continue;
-- 
2.31.1

