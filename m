Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B4DAAA2E3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EB110E5D5;
	Mon,  5 May 2025 23:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KsGDBRcX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD1F10E5D5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 23:06:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9485F43B0F;
 Mon,  5 May 2025 23:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD12C4CEEF;
 Mon,  5 May 2025 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486369;
 bh=ZzlkLV6bGsWUlKi8pMT/sDQcez3HbCFLJUcDhrtzXvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KsGDBRcXaGbNgEnOtHUM+Hnsq5SuO18jCC8JKRpGOpgMc15yIh7A5IA1dnPm+nsJD
 glHysEvWHhSxRJ+eUGbtNQAGEUs6M3tNFYDE77gY9pMiOyt4aL1e9ykJ1u7G5vaynJ
 0Ig/LNyi2i6W2N0nSHMK7V9XaVy/ihTvYkU+2mKFksRaDPfhK7awfXD+NQYId/2ixn
 B4EoDYI5SRk0i57AVXao1Knhi5pxOzXR081I3HMmPXyIJKh2NZu9pCWUVTlEAr7Rn3
 n3OmaXohrc8RW1OChob5qwUddSvHTAPq0uWANuuev2zTKY8tWQEhTOF1BSiR7LZ0HF
 GO3xTeDukUmQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Youssef Samir <quic_yabdulra@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Sasha Levin <sashal@kernel.org>, jeff.hugo@oss.qualcomm.com,
 ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 287/294] accel/qaic: Mask out SR-IOV PCI resources
Date: Mon,  5 May 2025 18:56:27 -0400
Message-Id: <20250505225634.2688578-287-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index b5de82e6eb4d5..e69bfb30b44e0 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -400,7 +400,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	int bars;
 	int ret;
 
-	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
 	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-- 
2.39.5

