Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC35C0961A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E341210E30D;
	Sat, 25 Oct 2025 16:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQgzPrfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EE210E30C;
 Sat, 25 Oct 2025 16:23:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D7A76117A;
 Sat, 25 Oct 2025 16:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DC4C4CEFB;
 Sat, 25 Oct 2025 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409419;
 bh=w+Yb1zq/T6QaZ+E3dZcl4J0WUk+rco4X4LfmrcEqh/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WQgzPrfE9sWXOh4yAcOqcpQHgDoUJqA0m6grExIqwl9+VXCPK4P4zEvE5oT7dcUWo
 QkJwuYhbuWlEGVfZWg1pMKNFt0/vtVodJQqddsCY/5yUW6mdnR3tIMrPmSfAPzvGEh
 eNNWVN4c+SbBIIAhelwawJ2MuXQs8NXS9UvZOP/sKi0CW4N9paJMrbzZr4MH5Sg6IK
 qij5TxRz8cfpWrpzj80FHskJZs504KqLMA5FSF5dU8JU06a6epLDQVraHDUXlNv9ml
 Q9TzPROjAaheMY6xq/blmcKBWT4aQCv1lIoOBNjoBYtErVUhFZeR+NXiEPFCNr4dE9
 etamquf8MDXeg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm/adreno: Add speedbins for A663 GPU
Date: Sat, 25 Oct 2025 11:59:07 -0400
Message-ID: <20251025160905.3857885-316-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

[ Upstream commit 0c5300343d0c622f7852145a763c570fbaf68a48 ]

Add speedbin mappings for A663 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/670096/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Why this should be backported
- Fixes incorrect OPP selection for A663: The change adds `.speedbins`
  for the A663 entry so the driver can translate hardware fuse values to
  the correct speed-bin bit used for OPP filtering. Without this
  mapping, the driver logs “missing support for speed-bin” and falls
  back to bin 0, which can lead to selecting the wrong OPPs or even no
  OPPs for some boards. New mapping added at
  drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1032:
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1032
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1033
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1034
  - drivers/gpu/drm/msm/adreno/a6xx_catalog.c:1035
- Directly addresses the code path that depends on speedbins:
  `a6xx_set_supported_hw()` reads the fuse via `adreno_read_speedbin()`,
  maps it with `fuse_to_supp_hw()`, and programs the mask via
  `devm_pm_opp_set_supported_hw()`. If the mapping is missing, it warns
  and defaults to `BIT(0)`, potentially mismatching the board’s OPP
  table:
  - Mapping lookup: drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2483
  - Missing mapping fallback and OPP mask set:
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2516,
    drivers/gpu/drm/msm/adreno/a6xx_gpu.c:2523
- Minimal, data-only change: No architectural changes; it only adds a
  speedbin table for one GPU ID. The macro and field already exist and
  are used elsewhere:
  - Speedbin field docs: drivers/gpu/drm/msm/adreno/adreno_gpu.h:111
  - Speedbin helper macro: drivers/gpu/drm/msm/adreno/adreno_gpu.h:148
- User impact: On A663 devices where the fuse reads 113 (now mapped to
  speedbin 1), the previous default to bin 0 could underclock the GPU or
  make the OPP table unusable if the DT only defines bin-1 OPPs. This
  change ensures correct and safe OPP filtering for real hardware
  configurations.
- Stable criteria fit: Important functional fix for existing hardware;
  small, isolated change; no new features; low regression risk; limited
  to the msm/adreno driver.

Risk and scope
- Scope: Only the A663 GPU entry is touched, mapping fuses `{0,0}`,
  `{169,0}`, `{113,1}`. Devices with fuse 169 see no behavioral change
  versus fallback; devices with fuse 113 now correctly use bin 1 instead
  of incorrectly defaulting to bin 0.
- Regression risk: Very low. The OPP filter machinery and speedbin
  infrastructure are already in place. This commit simply supplies the
  missing mapping data for one GPU variant.

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b815..2b1c41f6cfeee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,
-- 
2.51.0

