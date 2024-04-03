Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA4389764B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 19:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DD0112DCD;
	Wed,  3 Apr 2024 17:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XsA9JWnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C0C112DCC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 17:20:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8096F612AE;
 Wed,  3 Apr 2024 17:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B7AC43394;
 Wed,  3 Apr 2024 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712164816;
 bh=KGum2UiFM/XeeIttcKMIY9uAmatsd+1YLL7DOdMp7+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XsA9JWnIt38BQ1V1Z82DSwbssq4w3UDVfbA+tdwV4U7mcyN1hsjBXjnK0we3LNbgp
 IhhBPYrGqNpAI30jeFhTziRj+Ww+Dc/2OI3SdQjKlT1AMDyhgsFYHyanVEXvUDjFeI
 KnUvB+szNdMOQXGhaXIG+uuc2WAx7RFOsNFptH5Yy0xFoLUxgZJjWaXNGC2jmJ1Lfb
 E7boOvJ/CUiL69Qxqe28Xvd+4XWdHATj0XAW2uBTt9BcMyviqIvf6QPF203bQYnEC1
 oBO4oxCCOjBxNh3HE90En9XCD0/DBooGYA4qGbKjZO8MKsQzkV3Chdjd0hPcxIzuS9
 zDYuDgSz/UOJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aleksandr Burakov <a.burakov@rosalinux.ru>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, FlorianSchandinat@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 6/8] fbdev: viafb: fix typo in hw_bitblt_1 and
 hw_bitblt_2
Date: Wed,  3 Apr 2024 13:20:00 -0400
Message-ID: <20240403172006.353022-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403172006.353022-1-sashal@kernel.org>
References: <20240403172006.353022-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.214
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

From: Aleksandr Burakov <a.burakov@rosalinux.ru>

[ Upstream commit bc87bb342f106a0402186bcb588fcbe945dced4b ]

There are some actions with value 'tmp' but 'dst_addr' is checked instead.
It is obvious that a copy-paste error was made here and the value
of variable 'tmp' should be checked here.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/via/accel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/via/accel.c b/drivers/video/fbdev/via/accel.c
index 0a1bc7a4d7853..1e04026f08091 100644
--- a/drivers/video/fbdev/via/accel.c
+++ b/drivers/video/fbdev/via/accel.c
@@ -115,7 +115,7 @@ static int hw_bitblt_1(void __iomem *engine, u8 op, u32 width, u32 height,
 
 	if (op != VIA_BITBLT_FILL) {
 		tmp = src_mem ? 0 : src_addr;
-		if (dst_addr & 0xE0000007) {
+		if (tmp & 0xE0000007) {
 			printk(KERN_WARNING "hw_bitblt_1: Unsupported source "
 				"address %X\n", tmp);
 			return -EINVAL;
@@ -260,7 +260,7 @@ static int hw_bitblt_2(void __iomem *engine, u8 op, u32 width, u32 height,
 		writel(tmp, engine + 0x18);
 
 		tmp = src_mem ? 0 : src_addr;
-		if (dst_addr & 0xE0000007) {
+		if (tmp & 0xE0000007) {
 			printk(KERN_WARNING "hw_bitblt_2: Unsupported source "
 				"address %X\n", tmp);
 			return -EINVAL;
-- 
2.43.0

