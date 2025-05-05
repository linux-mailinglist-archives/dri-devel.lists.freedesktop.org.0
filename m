Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7FCAAA0DB
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC01910E50C;
	Mon,  5 May 2025 22:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LK3j2wEK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1410E50C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:40:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 631B0629C0;
 Mon,  5 May 2025 22:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09721C4CEEE;
 Mon,  5 May 2025 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484801;
 bh=acWgzjY+/uQlJhhVA40iUkpL52+iio36j0GL1qXLhSk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LK3j2wEKIL/fjEUdq7qxv5S7BgmSC8IsivhdebtwG8FdmXeIERdCQruX6SZZDG6/o
 0bctby0C2cIJwEYy4XHb7TS9/HloIY227+WSIP2rroV101HpPUBoas2fBjGsgyOCT0
 9bppahwQbtmbneWCsMhzPz+wKGaZvXA3hfELwDVar2c99BTWzilkicPK/DtBOcKVlr
 M9tNlhUdGpS3u5kI4WoCrfe1oq/2zMYEhUuQVKZbe9VcwbE0p3LEJ1pMepLhMudTz8
 q24A2A/0RfX4YpGOjare+gpJTpZeAB/G9E/egfElQz9FJi/UbZgJKyLZ7E8WdNXI1d
 3JuiYPVhFbZug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shixiong Ou <oushixiong@kylinos.cn>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, timur@kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 022/486] fbdev: fsl-diu-fb: add missing
 device_remove_file()
Date: Mon,  5 May 2025 18:31:38 -0400
Message-Id: <20250505223922.2682012-22-sashal@kernel.org>
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
index 5ac8201c35337..b71d15794ce8b 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1827,6 +1827,7 @@ static void fsl_diu_remove(struct platform_device *pdev)
 	int i;
 
 	data = dev_get_drvdata(&pdev->dev);
+	device_remove_file(&pdev->dev, &data->dev_attr);
 	disable_lcdc(&data->fsl_diu_info[0]);
 
 	free_irq(data->irq, data->diu_reg);
-- 
2.39.5

