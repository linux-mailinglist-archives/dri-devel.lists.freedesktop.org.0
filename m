Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E68990B8C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:30:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D0F10EA7D;
	Fri,  4 Oct 2024 18:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hx7XDP1o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFB310EA7D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 18:30:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D84845C56D8;
 Fri,  4 Oct 2024 18:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C33C4CECD;
 Fri,  4 Oct 2024 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728066655;
 bh=SlTiofh6GvA83e6B+/3V1JTA83H07z8RLKI7m6SY/ZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hx7XDP1osCCF+pPjJ3qetVqpJr2mAm6AQlp71PnvmI3mVKmIRl2XCqW0PYRNVtzqi
 /WetJ4K3yLCu3AY8Hl+bEi/SLBCIqAjLBeiC+R2WxKPOP84K3c30Aco2Tiku5jv/9x
 q8fd7FeptBM8DfUszwWqEkOSr542gLP9gpiHDaqQYVsDnyM+dteNzgcjFqQ4C98i9U
 XcqGLFjS71ARjTjtly9NwUKoZF3SC/TF61vkegafBBHns/Idoe9tuIpfNAeQ8kE27t
 s1PZrzdFOTxqhTPhfZPpgOtjgYmTBQ6Od4aUPTLJHQU/FPq3QlvZXbHCZPFVfo7oj3
 S4XfsOxvSdsCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrey Shumilin <shum.sdl@nppct.ru>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, tzimmermann@suse.de, javierm@redhat.com,
 fullwaywang@outlook.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 26/26] fbdev: sisfb: Fix strbuf array overflow
Date: Fri,  4 Oct 2024 14:29:52 -0400
Message-ID: <20241004183005.3675332-26-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183005.3675332-1-sashal@kernel.org>
References: <20241004183005.3675332-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.226
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

From: Andrey Shumilin <shum.sdl@nppct.ru>

[ Upstream commit 9cf14f5a2746c19455ce9cb44341b5527b5e19c3 ]

The values of the variables xres and yres are placed in strbuf.
These variables are obtained from strbuf1.
The strbuf1 array contains digit characters
and a space if the array contains non-digit characters.
Then, when executing sprintf(strbuf, "%ux%ux8", xres, yres);
more than 16 bytes will be written to strbuf.
It is suggested to increase the size of the strbuf array to 24.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index e540cb0c51726..7787fd21932cb 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -183,7 +183,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 {
 	unsigned int j = 0, xres = 0, yres = 0, depth = 0, rate = 0;
 	int i = 0;
-	char strbuf[16], strbuf1[20];
+	char strbuf[24], strbuf1[20];
 	char *nameptr = name;
 
 	/* We don't know the hardware specs yet and there is no ivideo */
-- 
2.43.0

