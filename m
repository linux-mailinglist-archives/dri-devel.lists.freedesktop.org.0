Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C342F5D7A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305696E117;
	Thu, 14 Jan 2021 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FDE6EA41;
 Wed, 13 Jan 2021 18:33:44 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F24223F1E5;
 Wed, 13 Jan 2021 19:33:41 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: robdclark@gmail.com
Subject: [PATCH v3 2/7] drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from
 main branch
Date: Wed, 13 Jan 2021 19:33:34 +0100
Message-Id: <20210113183339.446239-3-angelogioacchino.delregno@somainline.org>
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

The "main" if branch where we program the other registers for the
Adreno 5xx family of GPUs should not contain the PC_DBG_ECO_CNTL
register programming because this has logical similarity
differences from all the others.

A later commit will show the entire sense of this.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 81506d2539b0..8c96fc0fc1b7 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -609,8 +609,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
-		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
-			  (0x200 << 11 | 0x200 << 22));
 	} else {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
 		if (adreno_is_a530(adreno_gpu))
@@ -619,9 +617,14 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
+	}
+
+	if (adreno_is_a510(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x200 << 11 | 0x200 << 22));
+	else
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x400 << 11 | 0x300 << 22));
-	}
 
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
