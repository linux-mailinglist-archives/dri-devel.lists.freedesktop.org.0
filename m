Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D6AA9ED7
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9103A10E33E;
	Mon,  5 May 2025 22:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MHXVjgWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82610E33C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:15:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B89EE61138;
 Mon,  5 May 2025 22:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FC4C4CEEE;
 Mon,  5 May 2025 22:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746483303;
 bh=acWgzjY+/uQlJhhVA40iUkpL52+iio36j0GL1qXLhSk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MHXVjgWGpIcEDBqYnuXGsSbHCiQyP8E8zBYWofaNzGnkxfSr/wbEWZR5/gvdwTN1T
 oJkxu65cvVFke8I1uRFnwd2UDlsUXSHDqf0EzUAplC7CUcdsLgv1ZgGqlq9CyL4bwA
 hmftXLuCQy+Izy88hWOG4UaZWjHHadOBjNJFwJ0m6wQ6DDB7cn85VAD7wFt2q6LA4/
 pBlhFt4rVgc9EqfcaNM78U5YRMnD/59uLwiG/WLp6ek9CRoPTdWEaotmNvlloumKLs
 VHETSlSaGHdKaE7Q3h98g/yBXUTQt+dmnCrufw8+ZY6ZBqhFhDdEechMkfvrABkap4
 XymoUcUqGLrCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shixiong Ou <oushixiong@kylinos.cn>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, timur@kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 024/642] fbdev: fsl-diu-fb: add missing
 device_remove_file()
Date: Mon,  5 May 2025 18:04:00 -0400
Message-Id: <20250505221419.2672473-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

