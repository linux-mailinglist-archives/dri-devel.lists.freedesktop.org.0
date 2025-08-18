Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25355B2B0ED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 20:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CBE10E4B4;
	Mon, 18 Aug 2025 18:57:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="BpgbAlog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16F610E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=JNzSJeGA2KVxjQ7TVG5iBiBWJP0Ic6o9XHWVyDGQ9O4=; b=BpgbAlogHLKVjgwCEw/QM0WqT6
 FVgoewGQvCQyGv3QE+E9kNg3AGrJEmVaBCieK17JVP1JFDLl80xi7WryocB/hmIj+hxaHw+UjtEoc
 AcHZjUhWol7ofNpV9z2Jd06w+fbRReyOseVeyKDsr/kS9i+gBNmw2tuBeIDcNjZp0TYhrjMwU53Ti
 mI36yh2vjcsv351JTCiyhEYvg94GaqCX+6/V/nd8VvJnXXDJJp7lVnlJntRNbJ8kkS9q5qZMupsoZ
 U+6KOdRPExCw00aRJxWvxPQyr5s15y5BEjihuYqdyEgFx3Nwxav4gEaT4py0NDzz7xRN8cKI3y4T+
 uJOle4sA==;
Received: from i53875ad4.versanet.de ([83.135.90.212] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uo52T-0000l0-Bf; Mon, 18 Aug 2025 20:57:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: [PATCH] accel/rocket: Check the correct DMA irq status to warn about
Date: Mon, 18 Aug 2025 20:56:58 +0200
Message-ID: <20250818185658.2585696-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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

Right now, the code checks the DMA_READ_ERROR state 2 times, while
I guess it was supposed to warn about both read and write errors.

Change the 2nd check to look at the write-error flag.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 5d4afd692306..3440b862e749 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -422,7 +422,7 @@ static irqreturn_t rocket_job_irq_handler(int irq, void *data)
 	u32 raw_status = rocket_pc_readl(core, INTERRUPT_RAW_STATUS);
 
 	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
-	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_READ_ERROR);
+	WARN_ON(raw_status & PC_INTERRUPT_RAW_STATUS_DMA_WRITE_ERROR);
 
 	if (!(raw_status & PC_INTERRUPT_RAW_STATUS_DPU_0 ||
 	      raw_status & PC_INTERRUPT_RAW_STATUS_DPU_1))
-- 
2.47.2

