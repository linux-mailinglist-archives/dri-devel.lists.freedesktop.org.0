Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 155811B3840
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221D06E9C2;
	Wed, 22 Apr 2020 06:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABDC6E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 23:42:19 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id v38so62770qvf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rn5GB7Sv7pnmyprLYLd6lgRwcMO9YoyEu1xC0k/IR6I=;
 b=vy41DKo2NKG3DfIeTodwjZBvmUMWAn5OttqBaBPBCqer1hPEUMCJhuG+vZluctM6ZM
 gyEB50lR4G55ttfXv9hiGuYkGXuGr87Zz/JlDqOQVn4Cd6YcYv3OY0vqpsdZiE7/MWHA
 2Q1fAb4K4lgQLemnanq+w8560DTqPKQKYbp14vkbbRkc0/oezMvnvOnsKYwdb3RDd/h2
 XSMqZyvtJ8NMcAqs0NypkJikOEZP77vOQqFeKOB4cjIZQXGtzItyF2165ck6f4Kmfs9e
 hAGB0BCEiPHPlnHf2+hYc5dcqsMH4qUzdpKq8Jufc25fshk3kRj1Fx0CI13IDTzuZb0z
 RmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rn5GB7Sv7pnmyprLYLd6lgRwcMO9YoyEu1xC0k/IR6I=;
 b=B1MII1qX1Cuks2V0TTzwF4yXm8UOVYaZhGSwIqRAtarsusS7ZqSbaa4x0NUl1kNVP/
 9tnij8JcF/1GnxUIytPTB6+AFjmC0hlnyT7jPz4rCin9N6maZdzEUdGaEy70RLT4rf6K
 oGgxDYpPxjrdi9UrjpSK6LfTGc4pXr+8Sx1YAQ4ZAQfQX1J+p8TnWdnBj5gSQwYuUyoB
 9hvELpStS9BhwvgoiiDs5c6sEKTmX/NP4XMV+KOEPP86NWLZxWg3bHSurBk6Vry+yva3
 gfteGBJynp1CAAta2+zynZRGWHVfXaCL14Wt53aFtyAdKGNj8dylbnhZCRy1CT2gh6J6
 sghw==
X-Gm-Message-State: AGi0PuYjvOFt2+Wt/SsNO891ugeRK+7uk1O8+c5lmZ2F3FyH/OgmpUBw
 F9XPGiUe3yTtj4v+HLhJireFUg==
X-Google-Smtp-Source: APiQypL88cq+jV5buT6b1XRyf84WWEC3KNwKm+2jGvEafA5gtLFP86YA+XjtVEPt7v6P6APpiboppw==
X-Received: by 2002:a05:6214:108a:: with SMTP id
 o10mr12103730qvr.213.1587512538751; 
 Tue, 21 Apr 2020 16:42:18 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id y17sm2664010qky.33.2020.04.21.16.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 16:42:18 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/msm/a6xx: enable GMU log
Date: Tue, 21 Apr 2020 19:41:26 -0400
Message-Id: <20200421234127.27965-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200421234127.27965-1-jonathan@marek.ca>
References: <20200421234127.27965-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is required for a650 to work.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 60ed5360fd8a..f24e436daafe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -201,6 +201,12 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	u32 val;
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
+
+	/* Set the log wptr index
+	 * note: downstream saves the value in poweroff and restores it here
+	 */
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP, 0);
+
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
@@ -740,6 +746,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 
 	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
 
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
+		  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
@@ -1046,6 +1055,7 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->log.obj, gmu->aspace, false);
 
 	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
 	msm_gem_address_space_put(gmu->aspace);
@@ -1450,6 +1460,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_memory;
 
+	/* Allocate memory for the GMU log region */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0);
+	if (ret)
+		goto err_memory;
+
 	/* Map the GMU registers */
 	gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
 	if (IS_ERR(gmu->mmio)) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index aed02b2b7659..be65720f32cf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -61,6 +61,7 @@ struct a6xx_gmu {
 	struct a6xx_gmu_bo icache;
 	struct a6xx_gmu_bo dcache;
 	struct a6xx_gmu_bo dummy;
+	struct a6xx_gmu_bo log;
 
 	int nr_clocks;
 	struct clk_bulk_data *clocks;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index b4357ea550ec..176ae94d9fe6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -205,6 +205,10 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
 
+#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
+
+#define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
+
 #define REG_A6XX_GMU_BOOT_KMD_LM_HANDSHAKE			0x000051f0
 
 #define REG_A6XX_GMU_LLM_GLM_SLEEP_CTRL				0x00005157
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
