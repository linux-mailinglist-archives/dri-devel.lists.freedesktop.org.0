Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36733C29A2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03926EA67;
	Fri,  9 Jul 2021 19:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D01D6EA67
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso6950040wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35f9uUm3ArgMp1cLHX0Pf0HqrWQHxue9iozfkzujAeI=;
 b=WVFtFfqBM7xmsOGH6rhkPw2CDdjE9M7kwkiAhdNx+cmgnqqDwTlnqRwjzW7ud8zjyG
 wD9lih2wk3yQmwjFMQ/SR1+0AJ8Ci15nrelRD6hiVpl8dziOIU6ziJ9Z/uAGu1EIO6wF
 3v/G8neZ7kvFHuRhF2jIrFQlfjypNNXo9zK91m0DpzkB6Ea0P7JJvfTzHiW07kWKjUd4
 UOLlZPBJMr2qwLXF8Bj2CuoZOPXO1BKFws+3NGTUAxpSPS89mUvhYsNcIlSC43QvMnUB
 bqG0By90z9AHXy7sAbpZYb95EsV1Fb2ifbwDlFVbNNBtt/6nMh+rA9OvE1604YlFrGTY
 l5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35f9uUm3ArgMp1cLHX0Pf0HqrWQHxue9iozfkzujAeI=;
 b=tSfKsKHvHuwyyq96Yq2Z1zdCpOmjpNMhw1Er0qYVE8eGAJ2mlWTd6tUWCurTf9DPaU
 sVt0q+IwGInFZY5GR08lpXwfx+wVv6g7RQaBFeJb7cIDbemdPPfTlPjfCIqiSshfFNbX
 PEamEbzQv7E9YL+H6oRcUovFfhTymyrBOou+dqANNg+zuD5wM0ldMVGJAfvpjpvCb96u
 Cej1ZyL6qP4M29Lq4S2cvDXzkHTShQaASffSqdN3MqalvGC1/Et8kjvbOG1PCbrZrY5E
 UikY1MNGUsc8+ybyJH/QEY5OTdd2mIO0+PPSLz8VsMTvt8HJ5GSANG3sGtTwc5CCmLl5
 oL7g==
X-Gm-Message-State: AOAM532RdX6cKfXzbqHJfiiiV1iIBjpFIbHLS7kW9rqBtQbU0MVK/jK/
 6tT7BEDQdmrYOd2/lSXGEjU=
X-Google-Smtp-Source: ABdhPJybQBin29CwVDlAxvB2J6f2tMQwe/ss+S6TkbXMpAA49yLabyuNbfkYReGhISaKkmygI2pfQw==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr535392wml.140.1625858967292; 
 Fri, 09 Jul 2021 12:29:27 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p8sm5681757wre.76.2021.07.09.12.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:26 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 05/14] drm/tegra: Extract tegra_gem_lookup
Date: Fri,  9 Jul 2021 21:31:37 +0200
Message-Id: <20210709193146.2859516-6-thierry.reding@gmail.com>
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

The static function host1x_bo_lookup in drm.c is also useful
elsewhere. Extract it as tegra_gem_lookup in gem.c.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 20 +++-----------------
 drivers/gpu/drm/tegra/gem.c | 13 +++++++++++++
 drivers/gpu/drm/tegra/gem.h |  2 ++
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 739250acd498..87954e69ab6c 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -107,20 +107,6 @@ static void tegra_drm_context_free(struct tegra_drm_context *context)
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
@@ -151,11 +137,11 @@ static int host1x_reloc_copy_from_user(struct host1x_reloc *dest,
 
 	dest->flags = HOST1X_RELOC_READ | HOST1X_RELOC_WRITE;
 
-	dest->cmdbuf.bo = host1x_bo_lookup(file, cmdbuf);
+	dest->cmdbuf.bo = tegra_gem_lookup(file, cmdbuf);
 	if (!dest->cmdbuf.bo)
 		return -ENOENT;
 
-	dest->target.bo = host1x_bo_lookup(file, target);
+	dest->target.bo = tegra_gem_lookup(file, target);
 	if (!dest->target.bo)
 		return -ENOENT;
 
@@ -238,7 +224,7 @@ int tegra_drm_submit(struct tegra_drm_context *context,
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
index c15fd99d6cb2..cb5146a67668 100644
--- a/drivers/gpu/drm/tegra/gem.h
+++ b/drivers/gpu/drm/tegra/gem.h
@@ -80,4 +80,6 @@ struct dma_buf *tegra_gem_prime_export(struct drm_gem_object *gem,
 struct drm_gem_object *tegra_gem_prime_import(struct drm_device *drm,
 					      struct dma_buf *buf);
 
+struct host1x_bo *tegra_gem_lookup(struct drm_file *file, u32 handle);
+
 #endif
-- 
2.32.0

