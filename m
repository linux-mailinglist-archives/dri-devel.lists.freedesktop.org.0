Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8C55BD97
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630410F2B7;
	Tue, 28 Jun 2022 02:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889C710F2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:26:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40572B81C10;
 Tue, 28 Jun 2022 02:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2894FC341CA;
 Tue, 28 Jun 2022 02:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383196;
 bh=tiXH/T7g462YrC81TWBszoTWj9vCYXtfXO+RNyErlGg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FdCD1Ei5P1D7OdFmY8UpQjyMM8NSIf5Ne2ESgHIDveLe3ao+esSGkx7XudNmDFd6e
 72Kz9UF4mZysUeK30bqMNh5QOC7P1DtWM+hljzTUyQy5hz0IqStPmFl4IVGvyFdeYA
 z6I0pRMQxWH9VAc9E1/wkxRR/k+3nPqXjLBKe5HfE8/Pezm7OikEhXoQ5jlwUb6gGb
 BJwL+K3eKAgJajlTKIzMVdEk5YLrtgxcDiYACGBLWONOi6enqdgqTx5AdPKv2YoJay
 LBgrJ2RrGTRl+ugljoL2Ul0l4ZpIr51O7wUogpOZxGpVRQc5Dma8YjxeCY95iRupda
 W2qZ2vHQJvpSA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 08/17] video: fbdev: intelfb: Use aperture size
 from pci_resource_len
Date: Mon, 27 Jun 2022 22:26:06 -0400
Message-Id: <20220628022615.596977-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022615.596977-1-sashal@kernel.org>
References: <20220628022615.596977-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, mbroemme@libmpq.org,
 dri-devel@lists.freedesktop.org, Petr Cvek <petrcvekcz@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Cvek <petrcvekcz@gmail.com>

[ Upstream commit 25c9a15fb7bbfafb94dd3b4e3165c18b8e1bd039 ]

Aperture size for i9x5 variants is determined from PCI base address.

	if (pci_resource_start(pdev, 2) & 0x08000000)
		*aperture_size = MB(128);
	...

This condition is incorrect as 128 MiB address can have the address
set as 0x?8000000 or 0x?0000000. Also the code can be simplified to just
use pci_resource_len().

The true settings of the aperture size is in the MSAC register, which
could be used instead. However the value is used only as an info message,
so it doesn't matter.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/intelfb/intelfbhw.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/intelfb/intelfbhw.c b/drivers/video/fbdev/intelfb/intelfbhw.c
index d31ed4e2c46f..3aa93565e935 100644
--- a/drivers/video/fbdev/intelfb/intelfbhw.c
+++ b/drivers/video/fbdev/intelfb/intelfbhw.c
@@ -199,13 +199,11 @@ int intelfbhw_get_memory(struct pci_dev *pdev, int *aperture_size,
 	case PCI_DEVICE_ID_INTEL_945GME:
 	case PCI_DEVICE_ID_INTEL_965G:
 	case PCI_DEVICE_ID_INTEL_965GM:
-		/* 915, 945 and 965 chipsets support a 256MB aperture.
-		   Aperture size is determined by inspected the
-		   base address of the aperture. */
-		if (pci_resource_start(pdev, 2) & 0x08000000)
-			*aperture_size = MB(128);
-		else
-			*aperture_size = MB(256);
+		/*
+		 * 915, 945 and 965 chipsets support 64MB, 128MB or 256MB
+		 * aperture. Determine size from PCI resource length.
+		 */
+		*aperture_size = pci_resource_len(pdev, 2);
 		break;
 	default:
 		if ((tmp & INTEL_GMCH_MEM_MASK) == INTEL_GMCH_MEM_64M)
-- 
2.35.1

