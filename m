Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79350464214
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49626E226;
	Tue, 30 Nov 2021 23:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FAB6E2C0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:10:19 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k23so44305479lje.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERM173rnlxHrezuLhERWO1z/gEqXVXV1BN/+rag/gH0=;
 b=fT7ZcuoDV9WZYGw/uHvsPnUTdpRNLBvlyuoM8XwVN1CCP+NCv0cA+DMi5jZQ9+ipNx
 1S0oCwCpgen+11NSKf2JTa1Gg7pRz62pb2DU1AeLY6buLkpmWHl2hp3g8ItGyz7tEfZ4
 b+/iyIRZTqapPQUjrBe8/kr5+3lletoqNdk6YFV+E4a2qXjy3ChVfecrvduYkeOeSk6i
 heVrII1NQy537z8DpVMrimIjsqFdPRv1UBo1c0cRpUuh/DttCoTHoLMvK+ncfVC4+2F2
 WySy03FD82cZwTYLMPL2sNOeO5Dvg3ZrDL0o8DoIJJB6HVwPT+g9m+sRHsJwKcpye/op
 vf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERM173rnlxHrezuLhERWO1z/gEqXVXV1BN/+rag/gH0=;
 b=w05AutPZAg0nh4YWrUieDe/CK34g693HJ3QHIxK1PH9mPQdxC7T57NTySbYB9PrsDH
 q+B1ujOCcKrJCYP0rImJy1h7zLhQryYXU1yza6TLwYwU0+jnT0IWSphfFzBlIa52UkFk
 lmEMF+fTPzTz5IKTYSywKwcOlsLmd5eZJOSbRQVtrtDHsp0JQzwY+kLVDCWmBQ5Odqms
 hG34GQ1K0m4/BIzM0dm5izJM4qtJqpoav9WurRlpjSQNbnCSG1BFQ11j1ueKqmTC/3hv
 HCljw8WAfi1dns5hGFnPrleRYIrquer/3SyAkXwCmjixziyV1Kz6hVmfYPGdHtO6wj1+
 CnuA==
X-Gm-Message-State: AOAM532wXJdczB4J/v/4y1BjNEengaue6uQy8BOsdCkK9XhYaeXe+ZX5
 jWn94ERDx+ruPhklEXso2To=
X-Google-Smtp-Source: ABdhPJy8OrwAMk/4qysO8j03czL6bhwBqxpZq7ekWf8/+UlGsG4xsttvr4RZlRJiCp7oHHxgfgLsIg==
X-Received: by 2002:a2e:9708:: with SMTP id r8mr1957933lji.36.1638313817379;
 Tue, 30 Nov 2021 15:10:17 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id k14sm2099846lfu.210.2021.11.30.15.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:10:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v2 2/4] drm/tegra: Create DRM device early
Date: Wed,  1 Dec 2021 02:09:55 +0300
Message-Id: <20211130230957.30213-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230957.30213-1-digetx@gmail.com>
References: <20211130230957.30213-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM sub-drivers need to access DRM device early during first stage of
drivers' probing. Use new host1x init/deinit callbacks to create DRM
device early and destroy late.

Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 46 ++++++++++++++++++++++++++-----------
 drivers/gpu/drm/tegra/drm.h |  2 ++
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e9de91a4e7e8..e9cbcaf6e017 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1133,21 +1133,42 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
 	return domain != NULL;
 }
 
-static int host1x_drm_probe(struct host1x_device *dev)
+static struct drm_device *terga_drm_dev;
+
+struct drm_device *tegra_drm_device(void)
 {
-	struct tegra_drm *tegra;
-	struct drm_device *drm;
-	int err;
+	return terga_drm_dev;
+}
 
-	drm = drm_dev_alloc(&tegra_drm_driver, &dev->dev);
+static int host1x_drm_dev_init(struct host1x_device *dev)
+{
+	struct drm_device *drm = drm_dev_alloc(&tegra_drm_driver, &dev->dev);
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	dev_set_drvdata(&dev->dev, drm);
+	terga_drm_dev = drm;
+
+	return 0;
+}
+
+static void host1x_drm_dev_deinit(struct host1x_device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(&dev->dev);
+
+	terga_drm_dev = NULL;
+	drm_dev_put(drm);
+}
+
+static int host1x_drm_probe(struct host1x_device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(&dev->dev);
+	struct tegra_drm *tegra;
+	int err;
+
 	tegra = kzalloc(sizeof(*tegra), GFP_KERNEL);
-	if (!tegra) {
-		err = -ENOMEM;
-		goto put;
-	}
+	if (!tegra)
+		return -ENOMEM;
 
 	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
 		tegra->domain = iommu_domain_alloc(&platform_bus_type);
@@ -1164,7 +1185,6 @@ static int host1x_drm_probe(struct host1x_device *dev)
 	mutex_init(&tegra->clients_lock);
 	INIT_LIST_HEAD(&tegra->clients);
 
-	dev_set_drvdata(&dev->dev, drm);
 	drm->dev_private = tegra;
 	tegra->drm = drm;
 
@@ -1285,8 +1305,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
 		iommu_domain_free(tegra->domain);
 free:
 	kfree(tegra);
-put:
-	drm_dev_put(drm);
+
 	return err;
 }
 
@@ -1319,7 +1338,6 @@ static int host1x_drm_remove(struct host1x_device *dev)
 	}
 
 	kfree(tegra);
-	drm_dev_put(drm);
 
 	return 0;
 }
@@ -1391,6 +1409,8 @@ static struct host1x_driver host1x_drm_driver = {
 	.probe = host1x_drm_probe,
 	.remove = host1x_drm_remove,
 	.subdevs = host1x_drm_subdevs,
+	.init = host1x_drm_dev_init,
+	.deinit = host1x_drm_dev_deinit,
 };
 
 static struct platform_driver * const drivers[] = {
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index fc0a19554eac..8b7c9508070f 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -121,6 +121,8 @@ int tegra_drm_unregister_client(struct tegra_drm *tegra,
 int host1x_client_iommu_attach(struct host1x_client *client);
 void host1x_client_iommu_detach(struct host1x_client *client);
 
+struct drm_device *tegra_drm_device(void);
+
 int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
 int tegra_drm_exit(struct tegra_drm *tegra);
 
-- 
2.33.1

