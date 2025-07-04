Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8983AF8A1A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6767910E972;
	Fri,  4 Jul 2025 07:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3szSnOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A54F10E96A;
 Fri,  4 Jul 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615656; x=1783151656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O8egqTt7UsUxxJR5g7PvhZjDC48I3N4QwWH4q93qWUQ=;
 b=c3szSnOxJ8aYQig54RvkXSKLERTLjnlmFrF83cVmpKJCRIPAz4q7gfui
 oHiGNkOzQW18Cfkq/5ighCOgpCAEprvVgfVm5PLeDIaguLS3LyZlJyVlt
 Z5/OsUQaPmjmLRTsSp4n/fF40pylM8KWsCtVpSPO6J0HeNGYRYd0e+wpW
 U63irEiruoQ2ntlRpn+Igp60Tu/6EEL99MV5VOMdKAHzYTlc55XbSJ2Qp
 ++7Vfv4yDBbneraJJo/BOgRXX4zIb/7BJxaH0PsCi2ZjrAdrJ66hOK8pf
 LromoOZnHD1aiJ7kE3OMcYOyhx5wd+Z43IoTDoWH6bOgaza3BNQgBdisA w==;
X-CSE-ConnectionGUID: +V/0BVzcSU+8gc+jkHq/Cw==
X-CSE-MsgGUID: Qtsv8LCjScWmm/Po/Ls7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494552"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494552"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:16 -0700
X-CSE-ConnectionGUID: WfIGKu++T/KZR4Pj6Hj17g==
X-CSE-MsgGUID: UeLDkmiTSKSncwjAXB02OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924240"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:12 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id 6D57D447EB;
 Fri,  4 Jul 2025 10:54:10 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 17/80] drm/nouveau: Remove redundant
 pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:10 +0300
Message-Id: <20250704075410.3217943-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
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
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 2 --
 drivers/gpu/drm/nouveau/nouveau_connector.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_debugfs.c   | 1 -
 drivers/gpu/drm/nouveau/nouveau_display.c   | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c       | 4 ----
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 3 ---
 6 files changed, 12 deletions(-)

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
index 200e65a7cefc..40eedb349c6c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -62,7 +62,6 @@ nouveau_debugfs_strap_peek(struct seq_file *m, void *data)
 	seq_printf(m, "0x%08x\n",
 		   nvif_rd32(&drm->client.device.object, 0x101000));
 
-	pm_runtime_mark_last_busy(drm->dev->dev);
 	pm_runtime_put_autosuspend(drm->dev->dev);
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index c50ec347b30a..c74f5ef315a7 100644
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
index 0c82a63cd49d..1dccd4af1bea 100644
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
index 690e10fbf0bd..d0f034b4a67c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -89,7 +89,6 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 
 	ttm_bo_put(&nvbo->bo);
 
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
@@ -206,7 +204,6 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 			ret = pm_runtime_get_sync(dev);
 			if (!WARN_ON(ret < 0 && ret != -EACCES)) {
 				nouveau_gem_object_unmap(nvbo, vma);
-				pm_runtime_mark_last_busy(dev);
 			}
 			pm_runtime_put_autosuspend(dev);
 		}
-- 
2.39.5

