Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBEA82889
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 16:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E399210E925;
	Wed,  9 Apr 2025 14:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXNTaMPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF4310E92D;
 Wed,  9 Apr 2025 14:48:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 80927A499C5;
 Wed,  9 Apr 2025 14:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28FCC4CEE2;
 Wed,  9 Apr 2025 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744210077;
 bh=gjO0NaznG9wTOn+3bPa2NMeREAW0lMGcxML0LiXoBjo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lXNTaMPfMrFX/JCwtUU5LzJTKzUJ2HS2Hc/TQetb/56/h1u5VjhtK69Y++X8sszc2
 3erh/LXq6zsLhVOh7V3ljKs1v32DylvITDFRHEAqsiEdzhCHAiu3mrXpUNkZYKegAD
 M6Q7s6olcfL4C7A9RpgwMcQzrWF8EDEWnFu6qeB2QPHJJ2sG58dnvDoW+29lyLJlZf
 jSnmBow5kcBAEg/2v+otZGChvXT5ONueM2iN0qSZQhx24fQ+E68ydzJycIlsZHmCjl
 4pxtjcZ0jn7Z2rSM+sTOtmG2bJxg2ST9aGf7BBq98gaooD/FzLsgZbloKRYgxcmvZy
 1a8rQ2ch+9piQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 09 Apr 2025 16:47:30 +0200
Subject: [PATCH 2/4] drm/msm/a5xx: Get HBB dynamically, if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-smem_dramc-v1-2-94d505cd5593@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
In-Reply-To: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744210063; l=1739;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wZrd8KgkiIAJ3vhwmoEtKzY8+3Bdh36AfHtErS5fuR4=;
 b=ajABwCpUBCbbhJhYu+gP0O8SYysgaD51y8xuMbha9rLTNbcWcsb8xXkxOQnUy+olHQLFnNSLd
 UMq1wLUvhGmAu8sQW3N6V9L3/oHIufpehofcH9uY7UGhuoNUi4OWZlG
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Highest Bank address Bit value can change based on memory type used.

Attempt to retrieve it dynamically, and fall back to a reasonable
default (the one used prior to this change) on error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..b6a8a7a03e2cbdde5983061d2dfc0c8106840672 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -9,6 +9,7 @@
 #include <linux/pm_opp.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "a5xx_gpu.h"
@@ -833,8 +834,12 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
 
-	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
-	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb < 0)
+		hbb = adreno_gpu->ubwc_config.highest_bank_bit;
+
+	hbb -= 13;
+	BUG_ON(hbb < 0);
 
 	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
 	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
@@ -1760,6 +1765,10 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	unsigned int nr_rings;
 	int ret;
 
+	/* We need data from SMEM to retrieve HBB in set_ubwc_config() */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
+
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
 		return ERR_PTR(-ENOMEM);

-- 
2.49.0

