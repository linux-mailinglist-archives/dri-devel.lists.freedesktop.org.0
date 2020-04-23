Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FCC1B6720
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892C06EA23;
	Thu, 23 Apr 2020 22:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56DB6E9E7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:54 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id o19so8079795qkk.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cp480AXn6BYf8tn1IEyvGoLuimotRsbCnt5LAroxAjI=;
 b=neVBJTxFFkAouaSXp/YhH+cIbCEOk71zTANtGkrdW4jRvPPzD9j0vDYWmK3qbzbbO9
 SHf/pATweVJ7CYeOrpMwS1L44/kgJne99f37fsaMKQvYjrgx/VfsMkbcaXPoY8+1uV3X
 Ad85SQnr85UOioZkfRcuvHo/E2LBZjJ/QKHZsh9z0vebOf2J4tn5fdACz+j1NWAxobZs
 QvwMRCAPXIzldtHe9yMGED6HO3Oe9yxCVieE/OZaWKZZPHkaJxO9/K0wIIAmMvPqd2DW
 pBJIjcDs8oY12YMkrSaSqowWzdPHdapLMItWlt/NkkiCTK1SMI8+SLvM9rv3gEsGm4Er
 HThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cp480AXn6BYf8tn1IEyvGoLuimotRsbCnt5LAroxAjI=;
 b=ILPDi6eEiDJTrxdvUoNuEVi/sPnxpkymWf2pDM6A7coxknVaCSmkzp/qY2eTHLdY3d
 L1cSGY42psXedYoUvlFaHlEaOjIGR7JjavyOYSFSyaKcdGYvFSL3Nkr6dETNvumkzDuM
 6WgyP8pOVXIdd7XbVHCDOd54vtHQVjKwppPy1WZLbK+AK0sdPV1rtHV4gNXwl0DyHKxC
 x6M3MRwfy/Iq5sUoPRRaHmYejdJ5cvrQdPIsaqaqdPOeHVyadIS177zs07p94UWibbNg
 t/fpeA3wBicMi9HAvyPF/Xvk8hb0guvvwMun+rGxv8nCHMKe74cxn2Kt9RSewj6Rpt3J
 NgnA==
X-Gm-Message-State: AGi0PuZGh6AErIp7vp0FEdvRjowSvaOR2KtariqBJ40W2YK/VSxx2yOS
 31D69xp1yzYcXRn7mmPG9it77Vc/sOoxyw==
X-Google-Smtp-Source: APiQypKjtj0vh80vokk0e2giIvPZ3zkRKeST16VCfGuBHW3G8znEUfWcn6JxVcwixNYh5pulGHK5TA==
X-Received: by 2002:a05:620a:13ab:: with SMTP id
 m11mr5660024qki.88.1587676254079; 
 Thu, 23 Apr 2020 14:10:54 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:53 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 8/9] drm/msm/a6xx: enable GMU log
Date: Thu, 23 Apr 2020 17:09:20 -0400
Message-Id: <20200423210946.28867-9-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c6fce994194d..aec54cde8534 100644
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
@@ -744,6 +750,9 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 
 	gmu_write(gmu, REG_A6XX_GMU_HFI_SFR_ADDR, chipid);
 
+	gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG,
+		  gmu->log.iova | (gmu->log.size / SZ_4K - 1));
+
 	/* Set up the lowest idle level on the GMU */
 	a6xx_gmu_power_config(gmu);
 
@@ -1049,6 +1058,7 @@ static void a6xx_gmu_memory_free(struct a6xx_gmu *gmu)
 	msm_gem_kernel_put(gmu->icache.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->dcache.obj, gmu->aspace, false);
 	msm_gem_kernel_put(gmu->dummy.obj, gmu->aspace, false);
+	msm_gem_kernel_put(gmu->log.obj, gmu->aspace, false);
 
 	gmu->aspace->mmu->funcs->detach(gmu->aspace->mmu);
 	msm_gem_address_space_put(gmu->aspace);
@@ -1453,6 +1463,11 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
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
index e16c16bb65bf..47df4745db50 100644
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
