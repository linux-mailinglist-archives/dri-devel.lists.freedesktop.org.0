Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD3A84B5C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4382A10E385;
	Thu, 10 Apr 2025 17:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CvU0KFgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927B510E37E;
 Thu, 10 Apr 2025 17:44:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FBE64A455;
 Thu, 10 Apr 2025 17:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2542DC4CEEB;
 Thu, 10 Apr 2025 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744307049;
 bh=CnlNbg0GTKvcW+YRPLZnuFJHpm0GHl7rf8yDbGgpwaM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CvU0KFgAhYRWnt4RSrAaogf/KAlgUEadz94jRRd9zEVgxnXt3fVN0q0U08rFWxjWC
 HgQPSXQ/1nedWMJK8Hf01tyLIXA2wq3QM3ajJnMHrIolYtyxYwAYJAgFavLmOZsS4o
 uXbg0kwSTiqaqyn7FFJEYdZbctL3cPj8nMbVaZ60BDngXv69U6mfmIlHuIUzZoduTH
 1/yv5XrCSCfhf0cSwJ8hWLRanQSVJq7a2ddAzq5ba5w6ndE5OF1fFEaySJEyiYDRgz
 MPe4wvaI6iVjpq9Pd3naoSozZmYyb2SR9KmeITaUqtX2wkP03TEu2zg+tNtQEQixa4
 zTotKfgNRgQGw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 10 Apr 2025 19:43:45 +0200
Subject: [PATCH v2 2/4] drm/msm/a5xx: Get HBB dynamically, if available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-topic-smem_dramc-v2-2-dead15264714@oss.qualcomm.com>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
In-Reply-To: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744307035; l=1771;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=YfczxAg1gvCb99MHVd9R5q3+yfIUrb4PwVisI6P/MDI=;
 b=wNuZPDUuBZl27aMmDBKhYTZM+gxrJDCPDgNoBteEldD81N1TAy8HjHZNyytDuV9H0QiWdTlYt
 bXaK11m6lbRDpQy7N7EjuXqdDXaHEY/QiLiXG9+mQmYkOE1Fq+SLwx9
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
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 650e5bac225f372e819130b891f1d020b464f17f..c887d46c3a5798b7aa6813fc6e2575be1e715100 100644
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
@@ -1758,7 +1759,11 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	unsigned int nr_rings;
-	int ret;
+	int hbb, ret;
+
+	/* We need data from SMEM to retrieve HBB below */
+	if (!qcom_smem_is_available())
+		return ERR_PTR(-EPROBE_DEFER);
 
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
 	if (!a5xx_gpu)
@@ -1796,6 +1801,11 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	else
 		adreno_gpu->ubwc_config.highest_bank_bit = 14;
 
+	/* Attempt to retrieve HBB data from SMEM, keep the above defaults in case of error */
+	hbb = qcom_smem_dram_get_hbb();
+	if (hbb > 0)
+		adreno_gpu->ubwc_config.highest_bank_bit = hbb;
+
 	/* a5xx only supports UBWC 1.0, these are not configurable */
 	adreno_gpu->ubwc_config.macrotile_mode = 0;
 	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;

-- 
2.49.0

