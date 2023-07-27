Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A7765E02
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6514710E605;
	Thu, 27 Jul 2023 21:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6028E10E607;
 Thu, 27 Jul 2023 21:23:24 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so632443b3a.0; 
 Thu, 27 Jul 2023 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690493003; x=1691097803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vzxPx9orEtiYdI96wu70xYAMBJ5Ec6M0ljT/ybKk5qY=;
 b=SOuwg3OxDL9eL/yqduqVJiyri3lh6scadKZK+TluthrOtnJh1+9q+bTT61mmJNil2Z
 rTbJ/UkvOatsTfXTQhfkZQ4oaEAe3OtkY3gnotT434ARSL5JHUwGnXC6hQtMLCCsKijJ
 iPBPyOqN4IC4fyBGSnijFjPY32ASpQH+1/UYUQy44yrWu7RHTUQSvXzqV/7YijaNl01y
 Fkzq9AUfHKaS8F1YV0LAsvCq+j11Jz3YCH/B7kX3FJh4hyvW7VYnDmK/WGPA2GhlLE8x
 6TBDbWL7ctGXUuQCYiUo50O+gC6sFjvBs8QYWKdFhiOhLkiMIs67e5JNwyswRdHIxp2A
 Qzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690493003; x=1691097803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vzxPx9orEtiYdI96wu70xYAMBJ5Ec6M0ljT/ybKk5qY=;
 b=krwozAjuxEhaOf37LPkDsSXk9tbPxeUPKvlwdxiXeY1b6JJftGVMe2Ri4HgDtmEsNP
 UMWLfPdOfw7HeRaJmUWyklehG+Xphugr9i43XXU4j97raWP9l8GX68GnetCUuoA/uf0c
 kn9ey4gU2gPonXi8TNrUT8OwVzM0biIM35j5qCF3j9rx/yefBpjniwYTxRoGQWjafby6
 5cfYF1gaVWvd9bHKhdvfdKNW3vyYXuJXbrJiHaVM8tzbqKno10BkYdwu25AzM7oIAnrT
 gcZpkMpJH8NvbizHz6aawGZjBnPRRaiN2qZsk2+za5h3GJp0lTdVBeOb2KHg3ok60bGi
 BMng==
X-Gm-Message-State: ABy/qLYC+YSB1niWm8CzK1sj7c9lTC+fhJIkSwHwXvrAgAsyj55GMzfP
 bztni2S9A4bO/J7dFu3XwUB9VeCx0lU=
X-Google-Smtp-Source: APBJJlGfKpoPOy5/lw0UkAJ/3aNUv2nBIko4P1+aOkglehi7mbxU+rdqnlLJvsVv/b9HgDnw8/eUQg==
X-Received: by 2002:a05:6a20:431d:b0:138:1a36:4eab with SMTP id
 h29-20020a056a20431d00b001381a364eabmr654313pzk.3.1690493003261; 
 Thu, 27 Jul 2023 14:23:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 t26-20020a62ea1a000000b0064f7c56d8b7sm1860453pfh.219.2023.07.27.14.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:23:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/13] drm/msm/adreno: Add helper for formating chip-id
Date: Thu, 27 Jul 2023 14:20:15 -0700
Message-ID: <20230727212208.102501-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Guru Das Srinagesh <quic_gurus@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is used in a few places, including one that is parsed by userspace
tools.  So let's standardize it a bit better.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e014d85a60cc..7448f299b77c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -661,14 +661,12 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	info = adreno_info(config.rev);
 
 	if (!info) {
-		dev_warn(drm->dev, "Unknown GPU revision: %u.%u.%u.%u\n",
-			config.rev.core, config.rev.major,
-			config.rev.minor, config.rev.patchid);
+		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			ADRENO_CHIPID_ARGS(config.rev));
 		return -ENXIO;
 	}
 
-	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
-		config.rev.minor, config.rev.patchid);
+	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
 
 	priv->is_a2xx = info->family < ADRENO_3XX;
 	priv->has_cached_coherent =
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 1951036b2308..a775b4d82735 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -847,10 +847,9 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 	if (IS_ERR_OR_NULL(state))
 		return;
 
-	drm_printf(p, "revision: %d (%d.%d.%d.%d)\n",
-			adreno_gpu->info->revn, adreno_gpu->rev.core,
-			adreno_gpu->rev.major, adreno_gpu->rev.minor,
-			adreno_gpu->rev.patchid);
+	drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
+			adreno_gpu->info->revn,
+			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
 	/*
 	 * If this is state collected due to iova fault, so fault related info
 	 *
@@ -921,10 +920,9 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i;
 
-	printk("revision: %d (%d.%d.%d.%d)\n",
-			adreno_gpu->info->revn, adreno_gpu->rev.core,
-			adreno_gpu->rev.major, adreno_gpu->rev.minor,
-			adreno_gpu->rev.patchid);
+	printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
+			adreno_gpu->info->revn,
+			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -1106,9 +1104,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		speedbin = 0xffff;
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
 
-	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
-			rev->core, rev->major, rev->minor,
-			rev->patchid);
+	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
+			ADRENO_CHIPID_ARGS(config->rev));
 	if (!gpu_name)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 14af16080bd0..c6fd6f9016d3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -66,6 +66,12 @@ struct adreno_rev {
 #define ADRENO_REV(core, major, minor, patchid) \
 	((struct adreno_rev){ core, major, minor, patchid })
 
+/* Helper for formating the chip_id in the way that userspace tools like
+ * crashdec expect.
+ */
+#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
+#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
+
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
-- 
2.41.0

