Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7774642F6
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126EF6E85C;
	Tue, 30 Nov 2021 23:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F5B6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:14 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t26so57884711lfk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pvBnCjRebH1Ho4jqA86XCWq31CQHA17So2RdhwVkZw=;
 b=Ujwd6YKYpLhBzckFt5g4Krs4pTlirowAGoPYNPDf2o0fAysHloUiO0p6ao600ck4Fn
 Eoq4mpEscmsbun0AE1qLckBsCiX3Q3czjW00JP73Ov9jr+qjzQk1Cx337pO4kFUnng2C
 yZT+jrNRxnbB45JqN3l50+x1ZmfH4diH9rDbmgwIwZduOd9Hv0r6cmkLxIQR7c5EBQVC
 4mlD0YyYYaY1/BJqfazXMUGnXXei0kGGeZElpOBy92GOV39EK9EqJ0mo8sXuWmhsECCL
 W8W4sx3icrCtGZOpwQ1WfgyycKFpimkYYlkS2v0Irgzv9GlLGy7fesEStra6TOg94Z2/
 M1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pvBnCjRebH1Ho4jqA86XCWq31CQHA17So2RdhwVkZw=;
 b=4W6QCTW2t2vc4l/PQNLIvY+QJp/00V05iaUYO9v19xEJ32vUlI+1Y7e4F3l3M1yDyF
 djIjQjbxFIxBNNlWLSV3FVnKtVnDiugfFud5pwfGheh+WzMi5m78da3dc43+eaL0XDpx
 UPZr+ymaMd+4tqNwDZI3DpUBdRw71hF7LlwrDsBxkRopmg6Yq4yfiPaF2OLlCbi0veUq
 TBF/BFReWaJfVbNj3jcwdsvCWhocBFjt/NWtxsh/I5qNtnwPbrv+3nkbywlYm/UBMqoL
 CM3Y0rhneehdNCK8RPHRNBhuns9z+ivKZDrluICRICOvBrqJ0+kQCIxgqCu0AG8d8l4J
 QjSQ==
X-Gm-Message-State: AOAM530VjReNdXd6d/me0kiusCjZUafFovXUG2z5Asq8N6sUZerxYgvl
 9DhZcJDeBELWlAK0Ck8HHkw=
X-Google-Smtp-Source: ABdhPJxx+yLQZbPYt275snVuRgprmFVFBjIS0xZ25/qA4BhyemaOWc0LSucq5zi71yLYtB2iU/YNHQ==
X-Received: by 2002:ac2:4c52:: with SMTP id o18mr2248096lfk.372.1638314652854; 
 Tue, 30 Nov 2021 15:24:12 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:12 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v16 18/40] drm/tegra: Consolidate runtime PM management of
 older UAPI codepath
Date: Wed,  1 Dec 2021 02:23:25 +0300
Message-Id: <20211130232347.950-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move runtime PM management of older UAPI code paths into the common place.
This removes boilerplate code from client drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c   | 11 ++++++++++-
 drivers/gpu/drm/tegra/gr2d.c  | 10 +---------
 drivers/gpu/drm/tegra/gr3d.c  | 10 +---------
 drivers/gpu/drm/tegra/nvdec.c | 14 +-------------
 drivers/gpu/drm/tegra/vic.c   | 12 +-----------
 5 files changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 2e7da2a7505d..dc04ce329be3 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -10,6 +10,7 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
@@ -116,6 +117,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 static void tegra_drm_context_free(struct tegra_drm_context *context)
 {
 	context->client->ops->close_channel(context);
+	pm_runtime_put(context->client->base.dev);
 	kfree(context);
 }
 
@@ -427,13 +429,20 @@ static int tegra_client_open(struct tegra_drm_file *fpriv,
 {
 	int err;
 
+	err = pm_runtime_resume_and_get(client->base.dev);
+	if (err)
+		return err;
+
 	err = client->ops->open_channel(client, context);
-	if (err < 0)
+	if (err < 0) {
+		pm_runtime_put(client->base.dev);
 		return err;
+	}
 
 	err = idr_alloc(&fpriv->legacy_contexts, context, 1, 0, GFP_KERNEL);
 	if (err < 0) {
 		client->ops->close_channel(context);
+		pm_runtime_put(client->base.dev);
 		return err;
 	}
 
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 2382def93923..e3bb4c99ed39 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -127,17 +127,10 @@ static int gr2d_open_channel(struct tegra_drm_client *client,
 			     struct tegra_drm_context *context)
 {
 	struct gr2d *gr2d = to_gr2d(client);
-	int err;
-
-	err = pm_runtime_resume_and_get(client->base.dev);
-	if (err)
-		return err;
 
 	context->channel = host1x_channel_get(gr2d->channel);
-	if (!context->channel) {
-		pm_runtime_put(client->base.dev);
+	if (!context->channel)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
@@ -145,7 +138,6 @@ static int gr2d_open_channel(struct tegra_drm_client *client,
 static void gr2d_close_channel(struct tegra_drm_context *context)
 {
 	host1x_channel_put(context->channel);
-	pm_runtime_put(context->client->base.dev);
 }
 
 static int gr2d_is_addr_reg(struct device *dev, u32 class, u32 offset)
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 032d71365494..a1fd3113ea96 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -136,17 +136,10 @@ static int gr3d_open_channel(struct tegra_drm_client *client,
 			     struct tegra_drm_context *context)
 {
 	struct gr3d *gr3d = to_gr3d(client);
-	int err;
-
-	err = pm_runtime_resume_and_get(client->base.dev);
-	if (err)
-		return err;
 
 	context->channel = host1x_channel_get(gr3d->channel);
-	if (!context->channel) {
-		pm_runtime_put(client->base.dev);
+	if (!context->channel)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
@@ -154,7 +147,6 @@ static int gr3d_open_channel(struct tegra_drm_client *client,
 static void gr3d_close_channel(struct tegra_drm_context *context)
 {
 	host1x_channel_put(context->channel);
-	pm_runtime_put(context->client->base.dev);
 }
 
 static int gr3d_is_addr_reg(struct device *dev, u32 class, u32 offset)
diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 15f036e09e5c..79e1e88203cf 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -291,29 +291,17 @@ static int nvdec_open_channel(struct tegra_drm_client *client,
 			    struct tegra_drm_context *context)
 {
 	struct nvdec *nvdec = to_nvdec(client);
-	int err;
-
-	err = pm_runtime_get_sync(nvdec->dev);
-	if (err < 0) {
-		pm_runtime_put(nvdec->dev);
-		return err;
-	}
 
 	context->channel = host1x_channel_get(nvdec->channel);
-	if (!context->channel) {
-		pm_runtime_put(nvdec->dev);
+	if (!context->channel)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
 
 static void nvdec_close_channel(struct tegra_drm_context *context)
 {
-	struct nvdec *nvdec = to_nvdec(context->client);
-
 	host1x_channel_put(context->channel);
-	pm_runtime_put(nvdec->dev);
 }
 
 static const struct tegra_drm_client_ops nvdec_ops = {
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index 9622ca96c539..7886740bcbf2 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -344,27 +344,17 @@ static int vic_open_channel(struct tegra_drm_client *client,
 			    struct tegra_drm_context *context)
 {
 	struct vic *vic = to_vic(client);
-	int err;
-
-	err = pm_runtime_resume_and_get(vic->dev);
-	if (err < 0)
-		return err;
 
 	context->channel = host1x_channel_get(vic->channel);
-	if (!context->channel) {
-		pm_runtime_put(vic->dev);
+	if (!context->channel)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
 
 static void vic_close_channel(struct tegra_drm_context *context)
 {
-	struct vic *vic = to_vic(context->client);
-
 	host1x_channel_put(context->channel);
-	pm_runtime_put(vic->dev);
 }
 
 static const struct tegra_drm_client_ops vic_ops = {
-- 
2.33.1

