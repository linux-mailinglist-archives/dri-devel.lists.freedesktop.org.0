Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE333950F3
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 14:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CC56E3EF;
	Sun, 30 May 2021 12:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFF96E3F0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v9gIvMa/8xbweULtMsO9D80XPLQ6GQz5QOywOgfJsS0=; b=RgmLdNBF+ryqYHmKT3oF4bQ/uX
 XAzUa6i56zouC2IN14aM0QvzI2G8AJgOUfViEk7KnR1OXm995ste2MfP146AKU1rZF1izPJ+GGiug
 MouqZ76eMnCqMMHbxk/6AtaOeqBHxVckmKltNYYPDkW6YswiTFetmSZtBshK6D2imdSzw3IqZnNyM
 pnbEUrkE1uQ6aZh+6Abr1l/zG3t1L51ng5Zk2hV2jEuyPKrdDsi20+JZLTprBkOVdPRv1WJDDIWZs
 E3lPtlNZkecT0quZR0gCY0kanSZ8q2E2vZwWqnAbvxVFe7ovWZ2vhMNXtdXvYtIrJyNr4EAtqrXTY
 X1C0lUsQ==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1lnKSQ-000775-09; Sun, 30 May 2021 15:22:18 +0300
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v6 05/14] drm/tegra: Extract tegra_gem_lookup
Date: Sun, 30 May 2021 15:21:47 +0300
Message-Id: <20210530122156.3292479-6-mperttunen@nvidia.com>
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

The static function host1x_bo_lookup in drm.c is also useful
elsewhere. Extract it as tegra_gem_lookup in gem.c.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v6:
- New patch
---
 drivers/gpu/drm/tegra/drm.c | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c | 13 +++++++++++++
 drivers/gpu/drm/tegra/gem.h |  2 ++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 992aa5cde510..c9a35c1dc970 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -106,20 +106,6 @@ static void tegra_drm_context_free(struct tegra_drm_context *context)
 	kfree(context);
 }
 
-static struct host1x_bo *
-host1x_bo_lookup(struct drm_file *file, u32 handle)
-{
-	struct drm_gem_object *gem;
-	struct tegra_bo *bo;
-
-	gem = drm_gem_object_lookup(file, handle);
-	if (!gem)
-		return NULL;
-
-	bo = to_tegra_bo(gem);
-	return &bo->base;
-}
-
 static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
 				       struct drm_tegra_reloc __user *src,
 				       struct drm_device *drm,
@@ -150,11 +136,11 @@ static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
 
 	dest->flags = HOST1X_RELOC_READ | HOST1X_RELOC_WRITE;
 
-	dest->cmdbuf.bo = host1x_bo_lookup(file, cmdbuf);
+	dest->cmdbuf.bo = tegra_gem_lookup(file, cmdbuf);
 	if (!dest->cmdbuf.bo)
 		return -ENOENT;
 
-	dest->target.bo = host1x_bo_lookup(file, target);
+	dest->target.bo = tegra_gem_lookup(file, target);
 	if (!dest->target.bo)
 		return -ENOENT;
 
@@ -237,7 +223,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
 			goto fail;
 		}
 
-		bo = host1x_bo_lookup(file, cmdbuf.handle);
+		bo = tegra_gem_lookup(file, cmdbuf.handle);
 		if (!bo) {
 			err = -ENOENT;
 			goto fail;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 26af8daa9a16..6ec598f5d5b3 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -707,3 +707,16 @@ struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 
 	return &bo->gem;
 }
+
+struct host1x_bo *tegra_gem_lookup(struct drm_file *file, u32 handle)
+{
+	struct drm_gem_object *gem;
+	struct tegra_bo *bo;
+
+	gem = drm_gem_object_lookup(file, handle);
+	if (!gem)
+		return NULL;
+
+	bo = to_tegra_bo(gem);
+	return &bo->base;
+}
diff --git a/drivers/gpu/drm/tegra/gem.h b/drivers/gpu/drm/tegra/gem.h
index fafb5724499b..2752c66e129c 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -74,4 +74,6 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 					      struct dma_buf *buf);
 
+struct host1x_bo *tegra_gem_lookup(struct drm_file *file, u32 handle);
+
 #endif
-- 
2.30.1

