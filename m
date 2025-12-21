Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4155CD4308
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 17:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D3610E1F0;
	Sun, 21 Dec 2025 16:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S71b+Slh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0789B10E1E3;
 Sun, 21 Dec 2025 16:46:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB1E26001D;
 Sun, 21 Dec 2025 16:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F33C4CEFB;
 Sun, 21 Dec 2025 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766335561;
 bh=r9/xkDyHyyOz99bcJt0an5ynSeQuJ69gRxf1lMwnZNU=;
 h=From:To:Cc:Subject:Date:From;
 b=S71b+Slhl+wIyb59StFZDmcT5Is8Xv4hMaYsMMhTHNhbt6yMlTIsZntfnO1XrJwrH
 JcSgfLUvl3a+IMdgzPHDm2jmFxb0U/bgI+L4L2BgF6t9v9IFrTnDbOfwUUeOFkjAsi
 G7kyilvgKEvXJvpdbMe3ppVfcV+WfDJTD0KxrcwiUfxSec/mqmjxLl7cRH/G7XWsw4
 lact9GPRnLY92bKohG4WW1sD/qAFnQslY23Bo3RQnz1kMa8h87QcZdLJhFvQs/es70
 9HAuM7YiaSBEi3Np8D6m7p6Y9eXa9tEKLNgpqeGT8sQv/wQvRtmmWIy74KpWjZFIvu
 ThORkDpNPkaMA==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vXMZJ-000000005Cj-1auL;
 Sun, 21 Dec 2025 17:46:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
Date: Sun, 21 Dec 2025 17:45:52 +0100
Message-ID: <20251221164552.19990-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hw clock gating register sequence consists of register value pairs
that are written to the GPU during initialisation.

The a690 hwcg sequence has two GMU registers in it that used to amount
to random writes in the GPU mapping, but since commit 188db3d7fe66
("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
the updated offsets now lie outside the mapping. This in turn breaks
boot of machines like the Lenovo ThinkPad X13s.

Note that the updates of these GMU registers is already taken care of
properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
properties on a6xx too"), but for some reason these two entries were
left in the table.

Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
Cc: stable@vger.kernel.org	# 6.5
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..4c2f739ee9b7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -501,8 +501,6 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
 	{}
 };
 
-- 
2.51.2

