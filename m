Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABBFAA4A1F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 13:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7545110E73C;
	Wed, 30 Apr 2025 11:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qebHaRJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE7110E735;
 Wed, 30 Apr 2025 11:35:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5789544CA4;
 Wed, 30 Apr 2025 11:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A3BC4CEED;
 Wed, 30 Apr 2025 11:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746012901;
 bh=yyD1cbb+bkMR/9YU0BHBwauoxKa4CcRYXmN3iuWr+yM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qebHaRJ7B3N2Wk6Z3WdDcWwCYaytcEDoHEg5eamGne/foQKk3GWCOSkrmk6wv5wt4
 pEtQEyz/F5rahR+lkuO6+K2QwVRoXThlSBzIj86ysnsjE+it1sTJYyo9M9PF6ak11f
 Mz+5UpIYPNwoUcbtoS05GcGLciOEL6Ntd927LZP+MNQ2YNlWfGBbRwqQsxY+5zlfzo
 Q8VD+eFikcPlLNHtuM56W+77zqjYbydtJEEAbFLB5DUUGwsb+wgXMQcPz381Fuz9NC
 1lw1BPkCJsO7ZhDlrlwZmhIrUgr+7VtHM+Wj6S07ScemXpyfk7/njcuSQZgldjOjJg
 1cy2rGy2cxTZg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Apr 2025 13:34:37 +0200
Subject: [PATCH RFT v6 3/5] drm/msm/adreno: Define A530 speed bins explicitly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-topic-smem_speedbin_respin-v6-3-954ff66061cf@oss.qualcomm.com>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746012880; l=930;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=vdqNF+6quxj2StOOTX7jH5Xg/VFIUIIQYh+43Msf0f4=;
 b=yj0jAj72kXnPsZI/W9i3P4rFmZ/2Sk6iFwiOZV6jRdaNjCicAgyvTKpUA9rCQpPi9PvfP29H1
 Iq85Tsqq16qAsw2qhb5cjXD4gVVrspx6gKwKmTlbLO0JPif9GxF3ZdA
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

In preparation for commonizing the speedbin handling code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 633f3153916277b34f90acc046ed2ee04a761727..105b3d14bd7592c784863346cfbcc28f000c2e8f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -129,6 +129,12 @@ static const struct adreno_info a5xx_gpus[] = {
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 2 },
+			{ 3, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
 		.family = ADRENO_5XX,

-- 
2.49.0

