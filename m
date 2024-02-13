Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBD852323
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B4E10E483;
	Tue, 13 Feb 2024 00:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jNxlG2KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884B110E483
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 00:19:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BACB4CE188B;
 Tue, 13 Feb 2024 00:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE94C433C7;
 Tue, 13 Feb 2024 00:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783590;
 bh=QGj5j0oEDjjnBXJCwY1815nVn1vrlL+NkbYjRzcy7qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jNxlG2KBDhk9ksqueWhPLERSUO+PHPUuA68K0IlRtp8J2sHryz6nFryDhPrxohAZ/
 JtihtLlXnCBTzRbCTh813v61R7/Jk9+FgzVNR5AgL498/41YgO8syMUOTrGcGoCLoV
 rertq50f0qP3HUKVzW8lK0U9jWYLa1yKPsiNCBLiUvJXMXl5aLrpeZlK5a2+DMdPBR
 UADq8u6CdwykSLPDK0hFvPdoMmcc8ua/98EYTEgksRfMvCW0fdoG4i7FST3SG+jiBd
 7DfNbL+85MmivRFb4fWws9eC/Kx5tS7BCk8R1IEhhMNwoQLAw0LwQq5MDnSeKoFiVM
 Vhg+1cEHXkUsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>,
	Wachowski@freedesktop.org,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Sasha Levin <sashal@kernel.org>, stanislaw.gruszka@linux.intel.com,
	ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.7 43/58] accel/ivpu: Force snooping for MMU writes
Date: Mon, 12 Feb 2024 19:17:49 -0500
Message-ID: <20240213001837.668862-43-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

[ Upstream commit c9da9a1f17bf4fa96b115950fd389c917b583c1c ]

Set AW_SNOOP_OVERRIDE bit in VPU_37/40XX_HOST_IF_TCU_PTW_OVERRIDES
to force snooping for MMU write accesses (setting event queue events).

MMU event queue buffer is the only buffer written by MMU and
mapped as write-back which break cache coherency. Force write
transactions to be snooped solving the problem.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240126122804.2169129-2-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_hw_37xx.c | 2 +-
 drivers/accel/ivpu/ivpu_hw_40xx.c | 2 +-
 drivers/accel/ivpu/ivpu_mmu.c     | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
index d530384f8d60..e658fcf849f7 100644
--- a/drivers/accel/ivpu/ivpu_hw_37xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
@@ -523,7 +523,7 @@ static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 	u32 val = REGV_RD32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES);
 
 	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, NOSNOOP_OVERRIDE_EN, val);
-	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AW_NOSNOOP_OVERRIDE, val);
+	val = REG_CLR_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AW_NOSNOOP_OVERRIDE, val);
 	val = REG_SET_FLD(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, AR_NOSNOOP_OVERRIDE, val);
 
 	REGV_WR32(VPU_37XX_HOST_IF_TCU_PTW_OVERRIDES, val);
diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
index e691c49c9841..8a7440bcd6df 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx.c
+++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
@@ -526,7 +526,7 @@ static void ivpu_boot_no_snoop_enable(struct ivpu_device *vdev)
 	u32 val = REGV_RD32(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES);
 
 	val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, SNOOP_OVERRIDE_EN, val);
-	val = REG_CLR_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AW_SNOOP_OVERRIDE, val);
+	val = REG_SET_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AW_SNOOP_OVERRIDE, val);
 	val = REG_CLR_FLD(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, AR_SNOOP_OVERRIDE, val);
 
 	REGV_WR32(VPU_40XX_HOST_IF_TCU_PTW_OVERRIDES, val);
diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 2538c78fbebe..9898946174fd 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -533,7 +533,6 @@ static int ivpu_mmu_reset(struct ivpu_device *vdev)
 	mmu->cmdq.cons = 0;
 
 	memset(mmu->evtq.base, 0, IVPU_MMU_EVTQ_SIZE);
-	clflush_cache_range(mmu->evtq.base, IVPU_MMU_EVTQ_SIZE);
 	mmu->evtq.prod = 0;
 	mmu->evtq.cons = 0;
 
@@ -847,8 +846,6 @@ static u32 *ivpu_mmu_get_event(struct ivpu_device *vdev)
 	if (!CIRC_CNT(IVPU_MMU_Q_IDX(evtq->prod), IVPU_MMU_Q_IDX(evtq->cons), IVPU_MMU_Q_COUNT))
 		return NULL;
 
-	clflush_cache_range(evt, IVPU_MMU_EVTQ_CMD_SIZE);
-
 	evtq->cons = (evtq->cons + 1) & IVPU_MMU_Q_WRAP_MASK;
 	REGV_WR32(IVPU_MMU_REG_EVTQ_CONS_SEC, evtq->cons);
 
-- 
2.43.0

