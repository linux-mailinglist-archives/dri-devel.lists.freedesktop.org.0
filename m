Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF22F5D71
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1706E10F;
	Thu, 14 Jan 2021 09:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12296E87A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 18:33:45 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CA4AF3F211;
 Wed, 13 Jan 2021 19:33:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: robdclark@gmail.com
Subject: [PATCH v3 7/7] drm/msm/a5xx: Disable UCHE global filter
Date: Wed, 13 Jan 2021 19:33:39 +0100
Message-Id: <20210113183339.446239-8-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/adreno/a5xx.xml.h | 2 ++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx.xml.h b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
index 346cc6ff3a36..7b9fcfe95c04 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx.xml.h
@@ -2367,6 +2367,8 @@ static inline uint32_t A5XX_VSC_RESOLVE_CNTL_Y(uint32_t val)
 
 #define REG_A5XX_UCHE_ADDR_MODE_CNTL				0x00000e80
 
+#define REG_A5XX_UCHE_MODE_CNTL					0x00000e81
+
 #define REG_A5XX_UCHE_SVM_CNTL					0x00000e82
 
 #define REG_A5XX_UCHE_WRITE_THRU_BASE_LO			0x00000e87
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 23fc851756de..7e553d3efeb2 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -754,6 +754,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
+	/* Disable UCHE global filter as SP can invalidate/flush independently */
+	gpu_write(gpu, REG_A5XX_UCHE_MODE_CNTL, BIT(29));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
