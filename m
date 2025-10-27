Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6FC0DF0E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0527610E496;
	Mon, 27 Oct 2025 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5JTx+DC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C22410E48A;
 Mon, 27 Oct 2025 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761570905; x=1793106905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0xbOnABFx4yaNxMOaQqBF3f8SvG8AUnBGKWAFQjol5Y=;
 b=C5JTx+DCTdTCa2yeeJcUt1jQLym1eIX0kfJLP19/e+qerhLUH+KrcJKM
 IxZRcQfBqwv+hdB5bioANFEjyqbYj4G3/BwX+8cxVwEGIaN2QuGKa76AO
 YZuGlENm9BAIDK8/d1CgjXgGxMD+65h6ukWnUA2u9WRkOxFcY0L5yxZe2
 FXfIxhg+5c80fkU2OVtmBKiN78G+gDR8qz9naJA7xsYUxNR1Ued9wPzKC
 An+rCoqZrSEI3PfTXDBxJIQVN5B/y4CB1P5HxbreNUa29qGJsme0Gb2Hu
 nV3b1YCmWvOzdANdeRRynWzdM4d4jCvzyu+BdTvZucq1u1hJ1FAryCjAx w==;
X-CSE-ConnectionGUID: fM5Z0umSQk+Nl9UfXGMrpg==
X-CSE-MsgGUID: IsFdC2YQQimhFWTDkRz5Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73936330"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73936330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:15:04 -0700
X-CSE-ConnectionGUID: x3PgRH6oTZi6rfcuPXi6rQ==
X-CSE-MsgGUID: Gms1rF0DRLWrbp92MMt7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189078446"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:14:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id BCA5E121EF1;
 Mon, 27 Oct 2025 15:14:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDN3Y-00000001dzn-31Ja; Mon, 27 Oct 2025 15:14:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Hung <alex.hung@amd.com>, Antonio Quartulli <antonio@mandelbit.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Liao Yuanhong <liaoyuanhong@vivo.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Prike Liang <Prike.Liang@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 ganglxie <ganglxie@amd.com>, Xiang Liu <xiang.liu@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>, Ce Sun <cesun102@amd.com>,
 Dave Airlie <airlied@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Imre Deak <imre.deak@intel.com>, Ben Skeggs <bskeggs@nvidia.com>,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/radeon: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Mon, 27 Oct 2025 15:14:40 +0200
Message-ID: <20251027131440.392052-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027131440.392052-1-sakari.ailus@linux.intel.com>
References: <20251027131440.392052-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/gpu/drm/radeon/radeon_acpi.c       |  1 -
 drivers/gpu/drm/radeon/radeon_connectors.c | 20 +++++---------------
 drivers/gpu/drm/radeon/radeon_display.c    |  2 --
 drivers/gpu/drm/radeon/radeon_drv.c        |  2 --
 drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
 drivers/gpu/drm/radeon/radeon_kms.c        |  4 ----
 6 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 22ce61bdfc06..08f8ba4fd148 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -408,7 +408,6 @@ static int radeon_atif_handler(struct radeon_device *rdev,
 			pm_runtime_get_sync(rdev_to_drm(rdev)->dev);
 			/* Just fire off a uevent and let userspace tell us what to do */
 			drm_helper_hpd_irq_event(rdev_to_drm(rdev));
-			pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
 			pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 		}
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 9f6a3df951ba..012d8b2295b8 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -875,10 +875,8 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
 
 	radeon_connector_update_scratch_regs(connector, ret);
 
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -1066,10 +1064,8 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
 	radeon_connector_update_scratch_regs(connector, ret);
 
 out:
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -1154,10 +1150,8 @@ radeon_tv_detect(struct drm_connector *connector, bool force)
 		ret = radeon_connector_analog_encoder_conflict_solve(connector, encoder, ret, false);
 	radeon_connector_update_scratch_regs(connector, ret);
 
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -1402,10 +1396,8 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 	}
 
 exit:
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
@@ -1714,10 +1706,8 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 	}
 
 out:
-	if (!drm_kms_helper_is_poll_worker()) {
-		pm_runtime_mark_last_busy(connector->dev->dev);
+	if (!drm_kms_helper_is_poll_worker())
 		pm_runtime_put_autosuspend(connector->dev->dev);
-	}
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 351b9dfcdad8..35fb99bcd9a7 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -644,8 +644,6 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 		if (crtc->enabled)
 			active = true;
 
-	pm_runtime_mark_last_busy(dev->dev);
-
 	rdev = dev->dev_private;
 	/* if we have active crtcs and we don't have a power ref,
 	   take the current one */
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 88e821d67af7..d0af0cef178a 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -477,7 +477,6 @@ static int radeon_pmops_runtime_idle(struct device *dev)
 		}
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	/* we don't want the main rpm_idle to call suspend - we want to autosuspend */
 	return 1;
@@ -499,7 +498,6 @@ long radeon_drm_ioctl(struct file *filp,
 
 	ret = drm_ioctl(filp, cmd, arg);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 4df6c9167bf0..c2cfe2d7915f 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -154,7 +154,6 @@ static int radeon_fbdev_fb_open(struct fb_info *info, int user)
 	return 0;
 
 err_pm_runtime_mark_last_busy:
-	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
 	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 	return ret;
 }
@@ -164,7 +163,6 @@ static int radeon_fbdev_fb_release(struct fb_info *info, int user)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
 
-	pm_runtime_mark_last_busy(rdev_to_drm(rdev)->dev);
 	pm_runtime_put_autosuspend(rdev_to_drm(rdev)->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 645e33bf7947..3144890b6007 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -170,7 +170,6 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 		pm_runtime_set_autosuspend_delay(dev->dev, 5000);
 		pm_runtime_set_active(dev->dev);
 		pm_runtime_allow(dev->dev);
-		pm_runtime_mark_last_busy(dev->dev);
 		pm_runtime_put_autosuspend(dev->dev);
 	}
 
@@ -677,7 +676,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 		file_priv->driver_priv = fpriv;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return 0;
 
@@ -687,7 +685,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	kfree(fpriv);
 
 err_suspend:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return r;
 }
@@ -737,7 +734,6 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
 		kfree(fpriv);
 		file_priv->driver_priv = NULL;
 	}
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
-- 
2.47.3

