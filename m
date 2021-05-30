Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60273950F7
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 14:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6BD6E3F2;
	Sun, 30 May 2021 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD186E3F2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ehO58t36Zx3T4WQ4QMHtz1+nZQPZBtBs8exoXFcazjY=; b=FnMR9QhKF9q1+HOH0sDdGTD6b0
 u03DcSIzZiImXId87v9SCh5H1W+VZBHvLg4yNhxp5qBmDJvfJ12DcDrzcKtlwKEYjDsUHG5QwpNXH
 G09WLHzxde9QXh37uibdQ76W/Jhx2NUkP6nTjAyJSZGrrEp7PdpsdFlyY0PKkmRH7ta/PZ0J4dCCE
 XnKshANB1hoytQLfUH32MvVtslFKdMOVMWIZb6vz8KJkLI/iJ+dBnZsJgqczqDmFynV5NEdmhtFAH
 GXeDxLQ3MklnpJlV+07NbXCDoqsRBl1TPRgvWK71ENsa/pALFbNec8TiVD25a1BbKv+4O42TKRTQA
 Fx5bBejw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lnKSQ-000775-Bx; Sun, 30 May 2021 15:22:18 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v6 10/14] drm/tegra: Implement syncpoint management UAPI
Date: Sun, 30 May 2021 15:21:52 +0300
Message-Id: <20210530122156.3292479-11-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210530122156.3292479-1-mperttunen@nvidia.com>
References: <20210530122156.3292479-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement TegraDRM IOCTLs for allocating and freeing syncpoints.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- New patch
---
 drivers/gpu/drm/tegra/drm.c  |  5 ++++
 drivers/gpu/drm/tegra/uapi.c | 56 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/tegra/uapi.h |  5 ++++
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index a15954c1a047..7530c988f795 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -91,6 +91,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 
 	idr_init_base(&fpriv->legacy_contexts, 1);
 	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
+	xa_init(&fpriv->syncpoints);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -726,6 +727,10 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
 			  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
 			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_ALLOCATE, tegra_drm_ioctl_syncpoint_allocate,
+			  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(TEGRA_SYNCPOINT_FREE, tegra_drm_ioctl_syncpoint_free,
+			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_gem_create, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_gem_mmap, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index 59b698817d5c..2788c5b4ae4f 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -48,13 +48,18 @@ static void tegra_drm_channel_ctx_close(struct tegra_drm_context *ctx)
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
 {
-	unsigned long ctx_id;
 	struct tegra_drm_context *ctx;
+	struct host1x_syncpt *sp;
+	unsigned long id;
 
-	xa_for_each(&file->contexts, ctx_id, ctx)
+	xa_for_each(&file->contexts, id, ctx)
 		tegra_drm_channel_ctx_close(ctx);
 
+	xa_for_each(&file->syncpoints, id, sp)
+		host1x_syncpt_put(sp);
+
 	xa_destroy(&file->contexts);
+	xa_destroy(&file->syncpoints);
 }
 
 static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra,
@@ -298,3 +303,50 @@ int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
 
 	return 0;
 }
+
+int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
+				       struct drm_file *file)
+{
+	struct host1x *host1x = tegra_drm_to_host1x(drm->dev_private);
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_syncpoint_allocate *args = data;
+	struct host1x_syncpt *sp;
+	int err;
+
+	if (args->id)
+		return -EINVAL;
+
+	sp = host1x_syncpt_alloc(host1x, HOST1X_SYNCPT_CLIENT_MANAGED,
+				 current->comm);
+	if (!sp)
+		return -EBUSY;
+
+	args->id = host1x_syncpt_id(sp);
+
+	err = xa_insert(&fpriv->syncpoints, args->id, sp, GFP_KERNEL);
+	if (err) {
+		host1x_syncpt_put(sp);
+		return err;
+	}
+
+	return 0;
+}
+
+int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
+				   struct drm_file *file)
+{
+	struct tegra_drm_file *fpriv = file->driver_priv;
+	struct drm_tegra_syncpoint_allocate *args = data;
+	struct host1x_syncpt *sp;
+
+	mutex_lock(&fpriv->lock);
+	sp = xa_erase(&fpriv->syncpoints, args->id);
+	mutex_unlock(&fpriv->lock);
+
+	if (!sp)
+		return -EINVAL;
+
+	host1x_syncpt_put(sp);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/uapi.h b/drivers/gpu/drm/tegra/uapi.h
index fbef39726c29..e4e498facf61 100644
--- a/drivers/gpu/drm/tegra/uapi.h
+++ b/drivers/gpu/drm/tegra/uapi.h
@@ -21,6 +21,7 @@ struct tegra_drm_file {
 
 	/* New UAPI state */
 	struct xarray contexts;
+	struct xarray syncpoints;
 };
 
 struct tegra_drm_mapping {
@@ -44,6 +45,10 @@ int tegra_drm_ioctl_channel_unmap(struct drm_device *drm, void *data,
 				  struct drm_file *file);
 int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
 				   struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_allocate(struct drm_device *drm, void *data,
+				       struct drm_file *file);
+int tegra_drm_ioctl_syncpoint_free(struct drm_device *drm, void *data,
+				   struct drm_file *file);
 
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file);
 void tegra_drm_mapping_put(struct tegra_drm_mapping *mapping);
-- 
2.30.1

