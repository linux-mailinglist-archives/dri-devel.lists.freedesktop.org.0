Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBE6AAA226
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED1A10E58D;
	Mon,  5 May 2025 22:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tcmUsprR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42FA10E58D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:55:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 402175C5B25;
 Mon,  5 May 2025 22:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1109DC4CEED;
 Mon,  5 May 2025 22:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746485758;
 bh=Di0jDpfzAMe0gROB9QY0u7czD53Zp3a46Nkp6q62GRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tcmUsprRlcoOLaZ43guQmpHunPLLRBQTDQKEElMSD5ggeGMCo0wG6NhLeMVorDCH8
 pP0u4Wni+nNCLzUS9em5EqJLjEiVQaF/X9uBKcI1/+B4RLbIuUhssLemkNMcKr5ll9
 AgY/ZEpK3mIBJc3PbNQ4ATmMzPdPC1bFpVL0LF24MUaNM8FNPdy+CWqeSysXRdbtK8
 xBO4ZCv2SP6vuxO+6Br8vq7bdrzHG5AnwDa0VWPV7mrEYk+pXP9VnZOsAZ1RB0bK3O
 FEJyfQ46df+ka+MnUUuUzgQ2BxSH30lvyBYax8sS/dv0u6jJ5cePsYQeq5CD48Zqwi
 xgGibTQTw+LUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Youssef Samir <quic_yabdulra@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Sasha Levin <sashal@kernel.org>, jeff.hugo@oss.qualcomm.com,
 ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 468/486] accel/qaic: Mask out SR-IOV PCI resources
Date: Mon,  5 May 2025 18:39:04 -0400
Message-Id: <20250505223922.2682012-468-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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

From: Youssef Samir <quic_yabdulra@quicinc.com>

[ Upstream commit 8685520474bfc0fe4be83c3cbfe3fb3e1ca1514a ]

During the initialization of the qaic device, pci_select_bars() is
used to fetch a bitmask of the BARs exposed by the device. On devices
that have Virtual Functions capabilities, the bitmask includes SR-IOV
BARs.

Use a mask to filter out SR-IOV BARs if they exist.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250117170943.2643280-6-quic_jhugo@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index f139c564eadf9..10e711c96a670 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -432,7 +432,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	int bars;
 	int ret;
 
-	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
 	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-- 
2.39.5

