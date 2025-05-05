Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FFAAAA2F1
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 01:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5781410E5E0;
	Mon,  5 May 2025 23:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Aqo9dOhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0235810E5E4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 23:06:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48A225C5B50;
 Mon,  5 May 2025 23:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4287FC4CEE4;
 Mon,  5 May 2025 23:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746486407;
 bh=dGzUyxuhzvfEM3R/PhIaZ3ZpTDVIzR52pu2g+3tx7Rw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Aqo9dOhOI9BTrAv2m7BCfIkkwvO6v2+Mz6A8Xo9PDkw9aue2mzBbEiT+OjXCTffDN
 XMF2wmsUKuSAKhh2uweD2Y2Fp8U3tuNPSLp76DoJQJJggBd72qay/G2zBJWRkOTrtU
 C9NdfIJbm/VkJYJw7P9MSX1bM/ioGTHRNwMBDrDZ8xv8cdVRf/w/UFXP68U5zTLtSX
 HKe16RX1V/6yA3ovlqenW0GkY3Fr3Xpi4GLHhu5fQvwurU/x4HkqCCDElUV+gTLhGE
 86g5nrEQmloJgD2hjxdHI26ZO5BbTcveqhgY/GjLLXcAaZ7PVX+HU3mJOx+GnykGBT
 PaUIcPkErkujQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shixiong Ou <oushixiong@kylinos.cn>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, timur@kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 013/212] fbdev: fsl-diu-fb: add missing
 device_remove_file()
Date: Mon,  5 May 2025 19:03:05 -0400
Message-Id: <20250505230624.2692522-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
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

From: Shixiong Ou <oushixiong@kylinos.cn>

[ Upstream commit 86d16cd12efa547ed43d16ba7a782c1251c80ea8 ]

Call device_remove_file() when driver remove.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/fsl-diu-fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index ce3c5b0b8f4ef..53be4ab374cc3 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1829,6 +1829,7 @@ static int fsl_diu_remove(struct platform_device *pdev)
 	int i;
 
 	data = dev_get_drvdata(&pdev->dev);
+	device_remove_file(&pdev->dev, &data->dev_attr);
 	disable_lcdc(&data->fsl_diu_info[0]);
 
 	free_irq(data->irq, data->diu_reg);
-- 
2.39.5

