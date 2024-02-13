Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850F85233D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 01:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464AC10E4EA;
	Tue, 13 Feb 2024 00:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S49AixcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3202F10E4EA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 00:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A52D3611D8;
 Tue, 13 Feb 2024 00:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E18CC43399;
 Tue, 13 Feb 2024 00:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783711;
 bh=vldSKRNTJjwJ6UGBGCtx5oArb3tRvtDaR38H6SWACvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S49AixcSLf68OKtavkvutiUeZbPrfa/wWBtHopT0vUEC9mMJXptdO3k0wuP4Z7VJ6
 JWWaq1XxX7srLgyXLg4iep3M/99cTMXnUCd7rkK1R3gNKENIP2yJELiBi+qozJUfVI
 dRhCc4knLD8D5ymOPZdep2IrjxGMBAe6pQzUbDal/rUyRMUVLHamx7MVDlsEunrvcg
 X7Nuj6GqiMx9SECDwhevQZcMaNFrwjAUxGY8NRCF1dO6tUoCdGrCrkHi8Noo9amiyy
 TsZe8T0epMg89wRPDoW52cpX1rQZz7SfW7ajVETDhMue4Ep3p0qHPTXCqap59S9g4G
 HqCZJsntCuVGQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Sasha Levin <sashal@kernel.org>,
 stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 38/51] accel/ivpu: Disable d3hot_delay on all NPU
 generations
Date: Mon, 12 Feb 2024 19:20:15 -0500
Message-ID: <20240213002052.670571-38-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213002052.670571-1-sashal@kernel.org>
References: <20240213002052.670571-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.16
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

[ Upstream commit a7f31091ddf457352e3dd7ac183fdbd26b4dcd04 ]

NPU does not require this delay regardless of the generation.
All generations are integrated into the SOC.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240126122804.2169129-4-jacek.lawrynowicz@linux.intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/ivpu/ivpu_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 7e9359611d69..8fb70e3c7b9c 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -467,9 +467,8 @@ static int ivpu_pci_init(struct ivpu_device *vdev)
 	/* Clear any pending errors */
 	pcie_capability_clear_word(pdev, PCI_EXP_DEVSTA, 0x3f);
 
-	/* VPU 37XX does not require 10m D3hot delay */
-	if (ivpu_hw_gen(vdev) == IVPU_HW_37XX)
-		pdev->d3hot_delay = 0;
+	/* NPU does not require 10m D3hot delay */
+	pdev->d3hot_delay = 0;
 
 	ret = pcim_enable_device(pdev);
 	if (ret) {
-- 
2.43.0

