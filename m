Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F37BA86661
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 21:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88D710EC86;
	Fri, 11 Apr 2025 19:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hptnRUTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395D10EC6B;
 Fri, 11 Apr 2025 19:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744399798; x=1775935798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0XI+8dOnzwArZciGMA9WwX2edCFJFM1pt1w/ixtXz0=;
 b=hptnRUTQ8eHK3+eY1otd+Kup0ci21iTwmdn8Yuqst19d0aOrlt7SRFAo
 gewMkdj+VGntrrgEm9kO+8IICFYppJ9izs1BjSOLV5eMv9E3S7P/Qct1q
 x+sdpR3BQSDG1oIqucW9uYDNs87P1FwNSHOg00nvjEgZZJh8C+EM8RA6/
 GYPKGV3mZPDvea4AJlK3NDVGnuud1R3eOoLYbf7uQfa2OzXDW20bd//bh
 DATJmFmv9cQqqeFQDGPyOkjo085Gw1zGtCNHzzJlrJDGPEJCeP2XseH3f
 Wm19iv5IDiGEIixp5D6GcclcpezJSxu+RQZ0RX/8tOzrGvgAJl55DajM3 w==;
X-CSE-ConnectionGUID: jrIjwRbDRCyKBdSg4ny5YQ==
X-CSE-MsgGUID: 6IzDA/nERJiiv/HdhGo/MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="68451221"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="68451221"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 12:29:56 -0700
X-CSE-ConnectionGUID: +30Dfz/QSNe/45WhqasBXA==
X-CSE-MsgGUID: bgVHdkQZRVyuqWH1+MmLKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="134434869"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 11 Apr 2025 12:29:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 22:29:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	Laurent@freedesktop.org, "Pinchart <la"@freedesktop.org
Subject: [PATCH v2 04/19] drm: Pass the format info to .fb_create()
Date: Fri, 11 Apr 2025 22:29:42 +0300
Message-ID: <20250411192942.9705-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-5-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-5-ville.syrjala@linux.intel.com>
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

Pass along the format information from the top to .fb_create()
so that we can avoid redundant (and somewhat expensive) lookups
in the drivers.

Done with cocci (with some manual fixups):
@@
identifier func =~ ".*create.*";
identifier dev, file, mode_cmd;
@@
struct drm_framebuffer *func(
       struct drm_device *dev,
       struct drm_file *file,
+      const struct drm_format_info *info,
       const struct drm_mode_fb_cmd2 *mode_cmd)
{
...
(
- const struct drm_format_info *info = drm_get_format_info(...);
|
- const struct drm_format_info *info;
...
- info = drm_get_format_info(...);
)
<...
- if (!info)
-    return ...;
...>
}

@@
identifier func =~ ".*create.*";
identifier dev, file, mode_cmd;
@@
struct drm_framebuffer *func(
       struct drm_device *dev,
       struct drm_file *file,
+      const struct drm_format_info *info,
       const struct drm_mode_fb_cmd2 *mode_cmd)
{
...
}

@find@
identifier fb_create_func =~ ".*create.*";
identifier dev, file, mode_cmd;
@@
struct drm_framebuffer *fb_create_func(
       struct drm_device *dev,
       struct drm_file *file,
+      const struct drm_format_info *info,
       const struct drm_mode_fb_cmd2 *mode_cmd);

@@
identifier find.fb_create_func;
expression dev, file, mode_cmd;
@@
fb_create_func(dev, file
+	       ,info
	       ,mode_cmd)

@@
expression dev, file, mode_cmd;
@@
drm_gem_fb_create(dev, file
+	       ,info
	       ,mode_cmd)

@@
expression dev, file, mode_cmd;
@@
drm_gem_fb_create_with_dirty(dev, file
+	       ,info
	       ,mode_cmd)

@@
expression dev, file_priv, mode_cmd;
identifier info, fb;
@@
info = drm_get_format_info(...);
...
fb = dev->mode_config.funcs->fb_create(dev, file_priv
+                                      ,info
                                       ,mode_cmd);

@@
identifier dev, file_priv, mode_cmd;
@@
struct drm_mode_config_funcs {
...
struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
                                     struct drm_file *file_priv,
+                                     const struct drm_format_info *info,
                                     const struct drm_mode_fb_cmd2 *mode_cmd);
...
};

v2: Fix kernel docs (Laurent)
    Fix commit msg (Geert)

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: virtualization@lists.linux.dev
Cc: spice-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c            |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h            |  1 +
 .../gpu/drm/arm/display/komeda/komeda_framebuffer.c    |  1 +
 .../gpu/drm/arm/display/komeda/komeda_framebuffer.h    |  1 +
 drivers/gpu/drm/arm/malidp_drv.c                       |  3 ++-
 drivers/gpu/drm/armada/armada_fb.c                     |  6 ++----
 drivers/gpu/drm/armada/armada_fb.h                     |  3 ++-
 drivers/gpu/drm/drm_framebuffer.c                      |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c           |  4 ++++
 drivers/gpu/drm/exynos/exynos_drm_fb.c                 |  4 +---
 drivers/gpu/drm/gma500/framebuffer.c                   |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c                |  1 +
 drivers/gpu/drm/i915/display/intel_fb.h                |  1 +
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c              |  5 +++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                 |  7 ++-----
 drivers/gpu/drm/msm/msm_drv.h                          |  3 ++-
 drivers/gpu/drm/msm/msm_fb.c                           |  6 ++----
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                      | 10 ++--------
 drivers/gpu/drm/nouveau/nouveau_display.c              |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.h              |  1 +
 drivers/gpu/drm/omapdrm/omap_fb.c                      |  6 ++----
 drivers/gpu/drm/omapdrm/omap_fb.h                      |  3 ++-
 drivers/gpu/drm/qxl/qxl_display.c                      |  1 +
 drivers/gpu/drm/radeon/radeon_display.c                |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c          |  3 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c           |  3 ++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c       |  3 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c             |  7 +------
 drivers/gpu/drm/tegra/drm.h                            |  1 +
 drivers/gpu/drm/tegra/fb.c                             |  4 +---
 drivers/gpu/drm/tests/drm_framebuffer_test.c           |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                          |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_display.c               |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                    |  1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c                |  1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c                      |  3 ++-
 include/drm/drm_gem_framebuffer_helper.h               |  3 +++
 include/drm/drm_mode_config.h                          |  1 +
 38 files changed, 59 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 35c778426a7c..10c57ded0e3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1297,6 +1297,7 @@ static int amdgpu_display_framebuffer_init(struct drm_device *dev,
 struct drm_framebuffer *
 amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 				       struct drm_file *file_priv,
+				       const struct drm_format_info *info,
 				       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct amdgpu_framebuffer *amdgpu_fb;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
index dfa0d642ac16..930c171473b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
@@ -44,6 +44,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 struct drm_framebuffer *
 amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 				       struct drm_file *file_priv,
+				       const struct drm_format_info *info,
 				       const struct drm_mode_fb_cmd2 *mode_cmd);
 const struct drm_format_info *
 amdgpu_lookup_format_info(u32 format, uint64_t modifier);
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index df5da5a44755..29b05482f713 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -157,6 +157,7 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev, struct komeda_fb *kfb,
 
 struct drm_framebuffer *
 komeda_fb_create(struct drm_device *dev, struct drm_file *file,
+		 const struct drm_format_info *info,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct komeda_dev *mdev = dev->dev_private;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
index c61ca98a3a63..02b2b8ae482a 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
@@ -37,6 +37,7 @@ struct komeda_fb {
 
 struct drm_framebuffer *
 komeda_fb_create(struct drm_device *dev, struct drm_file *file,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd);
 int komeda_fb_check_src_coords(const struct komeda_fb *kfb,
 			       u32 src_x, u32 src_y, u32 src_w, u32 src_h);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 558e44a7e627..8b920566f2e8 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -377,6 +377,7 @@ malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
 
 static struct drm_framebuffer *
 malidp_fb_create(struct drm_device *dev, struct drm_file *file,
+		 const struct drm_format_info *info,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	if (mode_cmd->modifier[0]) {
@@ -384,7 +385,7 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 			return ERR_PTR(-EINVAL);
 	}
 
-	return drm_gem_fb_create(dev, file, mode_cmd);
+	return drm_gem_fb_create(dev, file, info, mode_cmd);
 }
 
 static const struct drm_mode_config_funcs malidp_mode_config_funcs = {
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index 85fc2cb50544..597720e229c2 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -84,11 +84,9 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 }
 
 struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
-	struct drm_file *dfile, const struct drm_mode_fb_cmd2 *mode)
+	struct drm_file *dfile, const struct drm_format_info *info,
+	const struct drm_mode_fb_cmd2 *mode)
 {
-	const struct drm_format_info *info = drm_get_format_info(dev,
-								 mode->pixel_format,
-								 mode->modifier[0]);
 	struct armada_gem_object *obj;
 	struct armada_framebuffer *dfb;
 	int ret;
diff --git a/drivers/gpu/drm/armada/armada_fb.h b/drivers/gpu/drm/armada/armada_fb.h
index c5bc53d7e0c4..41ba76dd80d6 100644
--- a/drivers/gpu/drm/armada/armada_fb.h
+++ b/drivers/gpu/drm/armada/armada_fb.h
@@ -19,5 +19,6 @@ struct armada_framebuffer {
 struct armada_framebuffer *armada_framebuffer_create(struct drm_device *,
 	const struct drm_mode_fb_cmd2 *, struct armada_gem_object *);
 struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
-	struct drm_file *dfile, const struct drm_mode_fb_cmd2 *mode);
+	struct drm_file *dfile, const struct drm_format_info *info,
+	const struct drm_mode_fb_cmd2 *mode);
 #endif
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index ae09ef6977b2..61a7213f2389 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -302,7 +302,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	fb = dev->mode_config.funcs->fb_create(dev, file_priv, r);
+	fb = dev->mode_config.funcs->fb_create(dev, file_priv, info, r);
 	if (IS_ERR(fb)) {
 		drm_dbg_kms(dev, "could not create framebuffer\n");
 		return fb;
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 8f1213ea0e16..56ba0c967bd7 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -263,6 +263,7 @@ static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
  *                       &drm_mode_config_funcs.fb_create callback
  * @dev: DRM device
  * @file: DRM file that holds the GEM handle(s) backing the framebuffer
+ * @info: pixel format information
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  *
  * This function creates a new framebuffer object described by
@@ -282,6 +283,7 @@ static const struct drm_framebuffer_funcs drm_gem_fb_funcs = {
  */
 struct drm_framebuffer *
 drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
+		  const struct drm_format_info *info,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
@@ -300,6 +302,7 @@ static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
  *                       &drm_mode_config_funcs.fb_create callback
  * @dev: DRM device
  * @file: DRM file that holds the GEM handle(s) backing the framebuffer
+ * @info: pixel format information
  * @mode_cmd: Metadata from the userspace framebuffer creation request
  *
  * This function creates a new framebuffer object described by
@@ -320,6 +323,7 @@ static const struct drm_framebuffer_funcs drm_gem_fb_funcs_dirtyfb = {
  */
 struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index bcf7b534d1f7..9ae526825726 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -94,11 +94,9 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 
 static struct drm_framebuffer *
 exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_format_info *info,
 		      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	const struct drm_format_info *info = drm_get_format_info(dev,
-								 mode_cmd->pixel_format,
-								 mode_cmd->modifier[0]);
 	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
 	struct drm_framebuffer *fb;
 	int i;
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index c82e623a2071..a4a18ec2dd56 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -97,6 +97,7 @@ struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
  */
 static struct drm_framebuffer *psb_user_framebuffer_create
 			(struct drm_device *dev, struct drm_file *filp,
+			 const struct drm_format_info *info,
 			 const struct drm_mode_fb_cmd2 *cmd)
 {
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 34a29488311f..0dffe40adb22 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -2323,6 +2323,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
 struct drm_framebuffer *
 intel_user_framebuffer_create(struct drm_device *dev,
 			      struct drm_file *filp,
+			      const struct drm_format_info *info,
 			      const struct drm_mode_fb_cmd2 *user_mode_cmd)
 {
 	struct drm_framebuffer *fb;
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index 7d1267fbeee2..00181c4a67dc 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -109,6 +109,7 @@ intel_framebuffer_create(struct drm_gem_object *obj,
 struct drm_framebuffer *
 intel_user_framebuffer_create(struct drm_device *dev,
 			      struct drm_file *filp,
+			      const struct drm_format_info *info,
 			      const struct drm_mode_fb_cmd2 *user_mode_cmd);
 
 bool intel_fb_modifier_uses_dpt(struct intel_display *display, u64 modifier);
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index f851e9ffdb28..9db1ceaed518 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -901,14 +901,15 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 
 static struct drm_framebuffer *
 ingenic_drm_gem_fb_create(struct drm_device *drm, struct drm_file *file,
+			  const struct drm_format_info *info,
 			  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(drm);
 
 	if (priv->soc_info->map_noncoherent)
-		return drm_gem_fb_create_with_dirty(drm, file, mode_cmd);
+		return drm_gem_fb_create_with_dirty(drm, file, info, mode_cmd);
 
-	return drm_gem_fb_create(drm, file, mode_cmd);
+	return drm_gem_fb_create(drm, file, info, mode_cmd);
 }
 
 static struct drm_gem_object *
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 64521577b05f..76fd10afe467 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -43,16 +43,13 @@ static const struct drm_mode_config_helper_funcs mtk_drm_mode_config_helpers = {
 static struct drm_framebuffer *
 mtk_drm_mode_fb_create(struct drm_device *dev,
 		       struct drm_file *file,
+		       const struct drm_format_info *info,
 		       const struct drm_mode_fb_cmd2 *cmd)
 {
-	const struct drm_format_info *info = drm_get_format_info(dev,
-								 cmd->pixel_format,
-								 cmd->modifier[0]);
-
 	if (info->num_planes != 1)
 		return ERR_PTR(-EINVAL);
 
-	return drm_gem_fb_create(dev, file, cmd);
+	return drm_gem_fb_create(dev, file, info, cmd);
 }
 
 static const struct drm_mode_config_funcs mtk_drm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201..ba82fa756e57 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -271,7 +271,8 @@ uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
-		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd);
+		struct drm_file *file, const struct drm_format_info *info,
+		const struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index df2f85c44d55..4aef51cef3d5 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -134,11 +134,9 @@ const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb)
 }
 
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
-		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd)
+		struct drm_file *file, const struct drm_format_info *info,
+		const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	const struct drm_format_info *info = drm_get_format_info(dev,
-								 mode_cmd->pixel_format,
-								 mode_cmd->modifier[0]);
 	struct drm_gem_object *bos[4] = {0};
 	struct drm_framebuffer *fb;
 	int ret, i, n = info->num_planes;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 09329af9b01e..0b756da2fec2 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -91,21 +91,15 @@ void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
 
 static struct drm_framebuffer *
 mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		const struct drm_format_info *info,
 		const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	const struct drm_format_info *info;
-
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-	if (!info)
-		return ERR_PTR(-EINVAL);
-
 	if (mode_cmd->width * info->cpp[0] != mode_cmd->pitches[0]) {
 		dev_dbg(dev->dev, "Invalid pitch: fb width must match pitch\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+	return drm_gem_fb_create(dev, file_priv, info, mode_cmd);
 }
 
 static const struct drm_mode_config_funcs mxsfb_mode_config_funcs = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index a54c3f132c5c..3df388784bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -333,6 +333,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 struct drm_framebuffer *
 nouveau_user_framebuffer_create(struct drm_device *dev,
 				struct drm_file *file_priv,
+				const struct drm_format_info *info,
 				const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_framebuffer *fb;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 1f506f8b289c..e45f211501f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -67,5 +67,6 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb, uint32_t *tile_mode,
 
 struct drm_framebuffer *
 nouveau_user_framebuffer_create(struct drm_device *, struct drm_file *,
+				const struct drm_format_info *,
 				const struct drm_mode_fb_cmd2 *);
 #endif
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index e18878068c57..36afcd1c1fd7 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -335,11 +335,9 @@ void omap_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 #endif
 
 struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
-		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd)
+		struct drm_file *file, const struct drm_format_info *info,
+		const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	const struct drm_format_info *info = drm_get_format_info(dev,
-								 mode_cmd->pixel_format,
-								 mode_cmd->modifier[0]);
 	unsigned int num_planes = info->num_planes;
 	struct drm_gem_object *bos[4];
 	struct drm_framebuffer *fb;
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.h b/drivers/gpu/drm/omapdrm/omap_fb.h
index b75f0b5ef1d8..0873f953cf1d 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.h
+++ b/drivers/gpu/drm/omapdrm/omap_fb.h
@@ -20,7 +20,8 @@ struct omap_overlay_info;
 struct seq_file;
 
 struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
-		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd);
+		struct drm_file *file, const struct drm_format_info *info,
+		const struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
 		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
 int omap_framebuffer_pin(struct drm_framebuffer *fb);
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 70aff64ced87..f7bc83f2d489 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1176,6 +1176,7 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
 static struct drm_framebuffer *
 qxl_user_framebuffer_create(struct drm_device *dev,
 			    struct drm_file *file_priv,
+			    const struct drm_format_info *info,
 			    const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	return drm_gem_fb_create_with_funcs(dev, file_priv, mode_cmd,
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 8f5f8abcb1b4..85b714ac9882 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1314,6 +1314,7 @@ radeon_framebuffer_init(struct drm_device *dev,
 static struct drm_framebuffer *
 radeon_user_framebuffer_create(struct drm_device *dev,
 			       struct drm_file *file_priv,
+			       const struct drm_format_info *info,
 			       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 70d8ad065bfa..af22a5d23637 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -426,6 +426,7 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 
 static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		  const struct drm_format_info *info,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
@@ -490,7 +491,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		}
 	}
 
-	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+	return drm_gem_fb_create(dev, file_priv, info, mode_cmd);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 55a97691e9b2..87f171145a23 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -191,6 +191,7 @@ int rzg2l_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 
 static struct drm_framebuffer *
 rzg2l_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		   const struct drm_format_info *info,
 		   const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	const struct rzg2l_du_format_info *format;
@@ -214,7 +215,7 @@ rzg2l_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-EINVAL);
 	}
 
-	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+	return drm_gem_fb_create(dev, file_priv, info, mode_cmd);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
index 4202ab00fb0c..fd9460da1789 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
@@ -117,6 +117,7 @@ const struct shmob_drm_format_info *shmob_drm_format_info(u32 fourcc)
 
 static struct drm_framebuffer *
 shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		    const struct drm_format_info *info,
 		    const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	const struct shmob_drm_format_info *format;
@@ -144,7 +145,7 @@ shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		}
 	}
 
-	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+	return drm_gem_fb_create(dev, file_priv, info, mode_cmd);
 }
 
 static const struct drm_mode_config_funcs shmob_drm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index bf25286c7665..d46297bec5f8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -30,17 +30,12 @@ static const struct drm_mode_config_helper_funcs rockchip_mode_config_helpers =
 
 static struct drm_framebuffer *
 rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
+		   const struct drm_format_info *info,
 		   const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_afbc_framebuffer *afbc_fb;
-	const struct drm_format_info *info;
 	int ret;
 
-	info = drm_get_format_info(dev, mode_cmd->pixel_format,
-				   mode_cmd->modifier[0]);
-	if (!info)
-		return ERR_PTR(-ENOMEM);
-
 	afbc_fb = kzalloc(sizeof(*afbc_fb), GFP_KERNEL);
 	if (!afbc_fb)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 0b65e69f3a8a..77e520c43f72 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -190,6 +190,7 @@ struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 				       unsigned int num_planes);
 struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 					struct drm_file *file,
+					const struct drm_format_info *info,
 					const struct drm_mode_fb_cmd2 *cmd);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 634c6346d947..24907573e758 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -132,11 +132,9 @@ struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
 
 struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 					struct drm_file *file,
+					const struct drm_format_info *info,
 					const struct drm_mode_fb_cmd2 *cmd)
 {
-	const struct drm_format_info *info = drm_get_format_info(drm,
-								 cmd->pixel_format,
-								 cmd->modifier[0]);
 	struct tegra_bo *planes[4];
 	struct drm_gem_object *gem;
 	struct drm_framebuffer *fb;
diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 6ea04cc8f324..9b8e01e8cd91 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -363,6 +363,7 @@ struct drm_framebuffer_test_priv {
 
 static struct drm_framebuffer *fb_create_mock(struct drm_device *dev,
 					      struct drm_file *file_priv,
+					      const struct drm_format_info *info,
 					      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_framebuffer_test_priv *priv = container_of(dev, typeof(*priv), dev);
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index f5b167417428..8f983edb81ff 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -530,6 +530,7 @@ static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
 
 static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
 					     struct drm_file *file_priv,
+					     const struct drm_format_info *info,
 					     const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -568,7 +569,7 @@ static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
 		mode_cmd = &mode_cmd_local;
 	}
 
-	return drm_gem_fb_create(dev, file_priv, mode_cmd);
+	return drm_gem_fb_create(dev, file_priv, info, mode_cmd);
 }
 
 /* Our CTM has some peculiar limitations: we can only enable it for one CRTC
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 59a45e74a641..f9a98fbbabd1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -293,6 +293,7 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 static struct drm_framebuffer *
 virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 				   struct drm_file *file_priv,
+				   const struct drm_format_info *info,
 				   const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct drm_gem_object *obj = NULL;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 05b1c54a070c..2d48a28cda9c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -712,6 +712,7 @@ vmw_kms_new_framebuffer(struct vmw_private *dev_priv,
 
 static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 						 struct drm_file *file_priv,
+						 const struct drm_format_info *info,
 						 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct vmw_private *dev_priv = vmw_priv(dev);
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index dfa78a49a6d9..a360003bee47 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -54,6 +54,7 @@ static const struct drm_framebuffer_funcs fb_funcs = {
 
 static struct drm_framebuffer *
 fb_create(struct drm_device *dev, struct drm_file *filp,
+	  const struct drm_format_info *info,
 	  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct xen_drm_front_drm_info *drm_info = dev->dev_private;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index b47463473472..2bee0a2275ed 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -373,6 +373,7 @@ static int zynqmp_dpsub_dumb_create(struct drm_file *file_priv,
 
 static struct drm_framebuffer *
 zynqmp_dpsub_fb_create(struct drm_device *drm, struct drm_file *file_priv,
+		       const struct drm_format_info *info,
 		       const struct drm_mode_fb_cmd2 *mode_cmd)
 {
 	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
@@ -383,7 +384,7 @@ zynqmp_dpsub_fb_create(struct drm_device *drm, struct drm_file *file_priv,
 	for (i = 0; i < ARRAY_SIZE(cmd.pitches); ++i)
 		cmd.pitches[i] = ALIGN(cmd.pitches[i], dpsub->dma_align);
 
-	return drm_gem_fb_create(drm, file_priv, &cmd);
+	return drm_gem_fb_create(drm, file_priv, info, &cmd);
 }
 
 static const struct drm_mode_config_funcs zynqmp_dpsub_mode_config_funcs = {
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index d302521f3dd4..4fdf9d3d1863 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -8,6 +8,7 @@ struct drm_afbc_framebuffer;
 struct drm_device;
 struct drm_fb_helper_surface_size;
 struct drm_file;
+struct drm_format_info;
 struct drm_framebuffer;
 struct drm_framebuffer_funcs;
 struct drm_gem_object;
@@ -32,9 +33,11 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_framebuffer_funcs *funcs);
 struct drm_framebuffer *
 drm_gem_fb_create(struct drm_device *dev, struct drm_file *file,
+		  const struct drm_format_info *info,
 		  const struct drm_mode_fb_cmd2 *mode_cmd);
 struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
 int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 6fca0362bc31..bea88446fcdc 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -82,6 +82,7 @@ struct drm_mode_config_funcs {
 	 */
 	struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
 					     struct drm_file *file_priv,
+					     const struct drm_format_info *info,
 					     const struct drm_mode_fb_cmd2 *mode_cmd);
 
 	/**
-- 
2.49.0

