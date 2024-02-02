Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6EB8477EC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CB910E747;
	Fri,  2 Feb 2024 18:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iyD4/w0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF5910E803
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 18:42:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4979A627E4;
 Fri,  2 Feb 2024 18:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12997C43390;
 Fri,  2 Feb 2024 18:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706899355;
 bh=RDplX8i+eCVHA9vQdejr+iOAe9siIjDUJX+BZWX9FEI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iyD4/w0RLglKwcgZ51NTLdu6NUkkC2c15j+NvFGfhJKpKzSR7UO9pR3IFs6cuVT8H
 pQMtGhu9AbjbNzofsRgJhgApalTFUISrU1i/IMdpuhE/jDkeUmCIOYZqM3rG+sX2YV
 /hQP/7CxefiiwEx5CX+XauFojOqRkEXACvcfQXNojL9H6u1BMfsGrgWigb4QFEYv+1
 CLBconZuvW4EMVPVaUSaNFd8fQstuLd4l6BrO63SfaVzQ2TnrV9cs1Bujem+EeXf5k
 3nEhdASJFuXKZ/LoINoYRJEtyAPR0wPDIP6FH9jDrpWaxZMZ5lgRd5VDKNiOTE6u4u
 WqFyt56euorDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fullway Wang <fullwaywang@outlook.com>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, adaplas@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 3/5] fbdev: savage: Error out if pixclock equals
 zero
Date: Fri,  2 Feb 2024 13:42:24 -0500
Message-ID: <20240202184229.542298-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202184229.542298-1-sashal@kernel.org>
References: <20240202184229.542298-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.306
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

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 04e5eac8f3ab2ff52fa191c187a46d4fdbc1e288 ]

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of pixclock,
it may cause divide-by-zero error.

Although pixclock is checked in savagefb_decode_var(), but it is not
checked properly in savagefb_probe(). Fix this by checking whether
pixclock is zero in the function savagefb_check_var() before
info->var.pixclock is used as the divisor.

This is similar to CVE-2022-3061 in i740fb which was fixed by
commit 15cf0b8.

Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/savage/savagefb_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index c09d7426cd92..d9eafdb89cea 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -869,6 +869,9 @@ static int savagefb_check_var(struct fb_var_screeninfo   *var,
 
 	DBG("savagefb_check_var");
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	var->transp.offset = 0;
 	var->transp.length = 0;
 	switch (var->bits_per_pixel) {
-- 
2.43.0

