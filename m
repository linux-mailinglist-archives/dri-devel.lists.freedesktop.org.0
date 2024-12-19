Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8494D9F87F4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C914A10EE05;
	Thu, 19 Dec 2024 22:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gme6LWei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2FE10EE05;
 Thu, 19 Dec 2024 22:37:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 311F25C6A1A;
 Thu, 19 Dec 2024 22:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8E9C4CED0;
 Thu, 19 Dec 2024 22:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734647836;
 bh=5JceoXzU5Yg3ouAA1PCndCQY5/QheWRZBh69JeWleiE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gme6LWeigl6oKT1DbN5uIBwUrSPRg+JQRfygKX30wVuFp2ZxgrUdVyHfQAzmXi9NI
 oZj96dkAoJQ0JQYAxsecJ4ZT+OmbBqdo/xxAIZ/oIthOts91EsOc0CqQ9NfwtbNN7W
 DXy53N99DAtPzljliM0p2EDaWtN+UiDeTUC9i+IRdI3cNKsh3SBDW4+lFuYc2igQNF
 M0TvXkSkekAaJwuVO6rKA4VxDrG1UYwxtrkVnQc5cItgoejDZbGp/ZZJcJ+NLh/SKT
 vvytchuba6fUK91+OpJ7H0pI69hXxzs8Qu71juf2rjXolDsw3m1YUIyj+/ZnuOffaK
 Uo13WuDXVKBMg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Dec 2024 23:36:55 +0100
Subject: [PATCH 1/2] drm/msm: registers: Add GMU FW version register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-topic-gmu_fw_ver-v1-1-d403a70052d8@oss.qualcomm.com>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
In-Reply-To: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734647828; l=1317;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=l8e6hgJJ3wHD0AXLfem9C5MHVdg/XyBRaZCNsfY8mx0=;
 b=9otI/+RG58QIZQbBtuTG0HG3syXLlaXSrcCpwvglXgvY2gy8+JAcKWIyIXowYNskOkPkqGfZy
 nZ45p1a6bFrCe6mUHvMRRHqfks7CGWxH1mUBBBU0T18NpqSxwsbJxB8
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

Add a register that contains the GMU core firmware version on non-
legacy (non-sdm845-family) SoCs.

The name is guesstimated based on what it does downstream, but it'll
do.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 6531749d30f4e4e57ca4f7b43a28b7829504a9f3..3d2cc339b8f19c8d24b2c9144569b2364afc5ebc 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -52,6 +52,11 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x23fd" name="GMU_DCVS_PERF_SETTING"/>
 	<reg32 offset="0x23fe" name="GMU_DCVS_BW_SETTING"/>
 	<reg32 offset="0x23ff" name="GMU_DCVS_RETURN"/>
+	<reg32 offset="0x2bf8" name="GMU_CORE_FW_VERSION">
+		<bitfield name="MAJOR" low="28" high="31"/>
+		<bitfield name="MINOR" low="16" high="27"/>
+		<bitfield name="STEP" low="0" high="15"/>
+	</reg32>
 	<reg32 offset="0x4c00" name="GMU_ICACHE_CONFIG"/>
 	<reg32 offset="0x4c01" name="GMU_DCACHE_CONFIG"/>
 	<reg32 offset="0x4c0f" name="GMU_SYS_BUS_CONFIG"/>

-- 
2.47.1

