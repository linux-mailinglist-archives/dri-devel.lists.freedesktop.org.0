Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94033A84A05
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D594110EA4B;
	Thu, 10 Apr 2025 16:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qf7S9LfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56D610EA47;
 Thu, 10 Apr 2025 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302833; x=1775838833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ci23s2yV7joLO42Fmxs4iQxQok0ZlXRvmX/Awh5Boe4=;
 b=Qf7S9LfNfhpuGIpRvHGBiisFwh7H813RfSw2C8X9ao/YESmr3fSMJQGc
 9wkjJfln05SFDk2hin8FwAlYNeZS5HPkfXVbaMaZbnM4A2hJLUtyDcv7p
 tEKaw+hedUHAxa0ZrMYToJAOSh1eSckFLpT5JKopXn+b+asAoe4mQaYqn
 gYW9jQ64fdMFEIBCzuGVK5Sk2A/zTy15Pr/MtD6Wc72mjNkxsTW5yer6x
 LKaz6TZ2SkyU6bmRJGxoAuQlKVOsELoN2bE85h1uF4IXQgHbdrVIRgVQT
 wIzNUpB3/JhhsNxhFXUF8wpt7KwOSaWGsi+2c92UiiaS50j4Msbwh8L8B w==;
X-CSE-ConnectionGUID: HkPMZ4DqSBWfSuq46CHM2w==
X-CSE-MsgGUID: Sz9pGKCFReOpXzKDBkJwtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220147"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:53 -0700
X-CSE-ConnectionGUID: ply9cMZVTZStZJCamCh4UQ==
X-CSE-MsgGUID: guMNP9+ATVOLzYSdgdd5CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129404"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, virtualization@lists.linux.dev
Subject: [PATCH 17/19] drm/virtio: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:16 +0300
Message-ID: <20250410163218.15130-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: virtualization@lists.linux.dev
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 93763b91bab5..e5805ca646c7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -66,6 +66,7 @@ static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
 static int
 virtio_gpu_framebuffer_init(struct drm_device *dev,
 			    struct virtio_gpu_framebuffer *vgfb,
+			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd,
 			    struct drm_gem_object *obj)
 {
@@ -73,7 +74,7 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
 
 	vgfb->base.obj[0] = obj;
 
-	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, info, mode_cmd);
 
 	ret = drm_framebuffer_init(dev, &vgfb->base, &virtio_gpu_fb_funcs);
 	if (ret) {
@@ -315,7 +316,7 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ret = virtio_gpu_framebuffer_init(dev, virtio_gpu_fb, mode_cmd, obj);
+	ret = virtio_gpu_framebuffer_init(dev, virtio_gpu_fb, info, mode_cmd, obj);
 	if (ret) {
 		kfree(virtio_gpu_fb);
 		drm_gem_object_put(obj);
-- 
2.49.0

