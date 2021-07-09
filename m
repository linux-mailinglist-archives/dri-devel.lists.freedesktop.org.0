Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520A43C29AB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A0A6EA6E;
	Fri,  9 Jul 2021 19:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3D46EA6E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id l7so12629175wrv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fleDkTlpZCnkAhAKVFvno1InuM+Dhrnib08wE4hr/VE=;
 b=ahNE4pzYVKxUy5kYAdYGrmDRiXtYKG8+n/QkPjISNglNBPwhedxhJceud0S53OCDvk
 45/UouVs/lLKpxLH06WEr7N8oGyQHAuISGa4yxLGJouAX8J109dwt8abgTslDz7BM4nU
 2NYomJOCCBymOI85A7m9qk4Hr+/StRKUqjdz5nUEClkuGbpvMI2gBolcqVYx77d6xM8j
 Fa3bnmssnut4WOh+j9eTdaNDVeuyJRgPujoFef3AuXJXvLGy8SISoSMtXxhoJTtxwR2l
 RmL2FzDT6CSbL093KoKrzvSEO0niCMZxO8+6SIFhuIs0b6Q9zjtokVyL5aPbeWy8GF6c
 oB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fleDkTlpZCnkAhAKVFvno1InuM+Dhrnib08wE4hr/VE=;
 b=J/dN3DbEqhRUqdKOsvbxjkYlIcMG8h+Kp8niVdXQC15LhHggd+nWVrxaFzeLy4qr5P
 7+aehH9uoKJ/1vt6BXAKlBaR+/216iqBDUcAXyJqCn1beAZUHswG5LD0YDuOXWv6llR5
 35DuJV/7G74sOkjMMTC1vx22goXyjR3uN+4NfeJL4KfnqeEh9l+yms0JD28lH6mHq9EX
 V9vLho3CLQ9D7Sh9lo7TECOlYm5nd1ObrOALNuxdsUpBm/21xUXhd/Of8KH7jhXHJVVi
 Js+WfgUSQZnOGPmfq6CLyX/aXUZjUj/+c3m3fTEqm3kxm4DwXq3CyOeo1kQfjZza9rBx
 r8Ig==
X-Gm-Message-State: AOAM533e0NSspAvT9f2Xa52wV6jYG7E5IaPP4k5183cI9RtEqjijID/U
 Vxc6S+nWW7j8tCYkSAZ4erc=
X-Google-Smtp-Source: ABdhPJwwp2qzAkEDPdrGaHdEuk1+ij56XzDLU6J2OkRvUXUHJiMq7oJ8Bx+sSgrrTYeHduW/xdbasw==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr37346415wrz.111.1625858977406; 
 Fri, 09 Jul 2021 12:29:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id b12sm6096749wrx.60.2021.07.09.12.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:36 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 10/14] drm/tegra: Implement syncpoint management UAPI
Date: Fri,  9 Jul 2021 21:31:42 +0200
Message-Id: <20210709193146.2859516-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Implement TegraDRM IOCTLs for allocating and freeing syncpoints.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c  |  5 ++++
 drivers/gpu/drm/tegra/uapi.c | 52 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/uapi.h |  5 ++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 6ee08e49ec57..18aee825a1ff 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -92,6 +92,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 
 	idr_init_base(&fpriv->legacy_contexts, 1);
 	xa_init_flags(&fpriv->contexts, XA_FLAGS_ALLOC1);
+	xa_init(&fpriv->syncpoints);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
@@ -727,6 +728,10 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
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
index 48e872c768a9..e91394e7264e 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -49,12 +49,17 @@ static void tegra_drm_channel_context_close(struct tegra_drm_context *context)
 void tegra_drm_uapi_close_file(struct tegra_drm_file *file)
 {
 	struct tegra_drm_context *context;
+	struct host1x_syncpt *sp;
 	unsigned long id;
 
 	xa_for_each(&file->contexts, id, context)
 		tegra_drm_channel_context_close(context);
 
+	xa_for_each(&file->syncpoints, id, sp)
+		host1x_syncpt_put(sp);
+
 	xa_destroy(&file->contexts);
+	xa_destroy(&file->syncpoints);
 }
 
 static struct tegra_drm_client *tegra_drm_find_client(struct tegra_drm *tegra,
@@ -311,3 +316,50 @@ int tegra_drm_ioctl_gem_mmap(struct drm_device *drm, void *data,
 
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
2.32.0

