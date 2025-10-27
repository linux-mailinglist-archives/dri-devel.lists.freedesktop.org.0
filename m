Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CCEC0DF06
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9139210E48E;
	Mon, 27 Oct 2025 13:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABuoW4Su";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C1C10E48A;
 Mon, 27 Oct 2025 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761570904; x=1793106904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DWRYbL2kewo1Mvi1sseMJGtPVRQaXtkZN1kaWSRoUUg=;
 b=ABuoW4SuyhtoajFqag+vTCioDssz9nGeTa30AfuLm3A6hmmsPaQljac2
 jyrM62rKnP5yMqnxut3ijLjOY+nfA+d/Jsslh0t9yg+8GjQbqitNTYWkT
 RZyptNmbgR0RCzh1P6RtrvSSPO9ClI8EmASZUbO5etKd8S2wDGBvuky2y
 7h/p3sEXqfYH29TiMiAya/9A6+vhWYHjRhD/RL2tAhokxh8JbQAAt4gGI
 hOjG9qdb/of0yQRfSznMUA2qFo9/sal4neEGZqTvXmucAWbCZ1G2/SoM4
 GZI8NhI9kpPD0hV5EM4r79yjBeVDn11C2LBW6KNjhZfisTz/8iJgbXXlV A==;
X-CSE-ConnectionGUID: eJngC/7QSKWB/tj5EHkGVQ==
X-CSE-MsgGUID: ycJ78r+sQ6qqH19bCIOKnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73936329"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="73936329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:15:03 -0700
X-CSE-ConnectionGUID: otbfpOYNSPG4aKsjVdjr2w==
X-CSE-MsgGUID: /MjBCcUdS5a8kW3d9oxzPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="185388162"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:14:54 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
 by kekkonen.fi.intel.com (Postfix) with ESMTP id BBBDC121EC5;
 Mon, 27 Oct 2025 15:14:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
 (envelope-from <sakari.ailus@linux.intel.com>)
 id 1vDN3Y-00000001dzj-2wFH; Mon, 27 Oct 2025 15:14:40 +0200
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
Subject: [PATCH 2/3] drm/nouveau: Remove redundant pm_runtime_mark_last_busy()
 calls
Date: Mon, 27 Oct 2025 15:14:39 +0200
Message-ID: <20251027131440.392052-2-sakari.ailus@linux.intel.com>
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 2 --
 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   | 1 -
 drivers/gpu/drm/nouveau/nouveau_display.c   | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c       | 4 ----
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 6 +-----
 6 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e97e39abf3a2..682d21a8a82d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1222,7 +1222,6 @@ nv50_mstc_detect(struct drm_connector *connector,
 		goto out;
 
 out:
-	pm_runtime_mark_last_busy(connector->dev->dev);
 	pm_runtime_put_autosuspend(connector->dev->dev);
 	return ret;
 }
@@ -2411,7 +2410,6 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	drm_atomic_state_put(state);
 
 	/* Drop the RPM ref we got from nv50_disp_atomic_commit() */
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 63621b1510f6..7d0c5e42d1dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -673,7 +673,6 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	if (!nv_connector->edid)
 		drm_dp_cec_unset_edid(&nv_connector->aux);
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return conn_status;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index c7869a639bef..70ce03e9d7fc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -62,7 +62,6 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 	seq_printf(m, "0x%08x\n",
 		   nvif_rd32(&drm->client.device.object, 0x101000));
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
 	pm_runtime_put_autosuspend(drm->dev->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 00515623a2cc..6747fb5f6b0c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -495,7 +495,6 @@ nouveau_display_hpd_work(struct work_struct *work)
 	if (first_changed_connector)
 		drm_connector_put(first_changed_connector);
 
-	pm_runtime_mark_last_busy(dev->dev);
 noop:
 	pm_runtime_put_autosuspend(dev->dev);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1527b801f013..c077a2b8fc41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1177,7 +1177,6 @@ nouveau_pmops_runtime_idle(struct device *dev)
 		return -EBUSY;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_autosuspend(dev);
 	/* we don't want the main rpm_idle to call suspend - we want to autosuspend */
 	return 1;
@@ -1224,7 +1223,6 @@ nouveau_drm_open(struct drm_device *dev, struct drm_file *fpriv)
 		kfree(cli);
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
@@ -1258,7 +1256,6 @@ nouveau_drm_postclose(struct drm_device *dev, struct drm_file *fpriv)
 
 	nouveau_cli_fini(cli);
 	kfree(cli);
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	drm_dev_exit(dev_index);
 }
@@ -1306,7 +1303,6 @@ nouveau_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		break;
 	}
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 395d92ab6271..2abb04ff09f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -89,7 +89,6 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 
 	ttm_bo_fini(&nvbo->bo);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
@@ -127,7 +126,6 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 		ret = nouveau_vma_new(nvbo, vmm, &vma);
 	else
 		ret = 0;
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 out:
 	ttm_bo_unreserve(&nvbo->bo);
@@ -204,10 +202,8 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vma) {
 		if (--vma->refs == 0) {
 			ret = pm_runtime_get_sync(dev);
-			if (!WARN_ON(ret < 0 && ret != -EACCES)) {
+			if (!WARN_ON(ret < 0 && ret != -EACCES))
 				nouveau_gem_object_unmap(nvbo, vma);
-				pm_runtime_mark_last_busy(dev);
-			}
 			pm_runtime_put_autosuspend(dev);
 		}
 	}
-- 
2.47.3

