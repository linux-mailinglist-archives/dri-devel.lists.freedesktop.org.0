Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BC67F0FE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 23:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A7710E1C1;
	Fri, 27 Jan 2023 22:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE1510E1CA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 22:14:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9344F61DC0;
 Fri, 27 Jan 2023 22:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024A6C433D2;
 Fri, 27 Jan 2023 22:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674857663;
 bh=o/wZZ1uzmJ7qFEw1pt+mcU/ptJZ13hgGGF/CULyoMJ4=;
 h=From:To:Cc:Subject:Date:From;
 b=mLoGepRJuyf4fEgFO26waiEfOSuAf6TdWVpNp3P2k9Gc2tm2E3uR46Xo/hjAvRSet
 3/zhelAgl+1nCivDb+TKA7OZqmbagmtWbCHwESGfWG3n6+6mPt3Y41FkJzxMH/y4i6
 7R5cvH3+cCuaZFsIzs9zYOaayHTfpDbb3GGIAmlyJNQ4Nu3GmPEnSL1vSMF3yZt5Ca
 PFtEYg4t2SqqTqfrm/8ZNtyys6xN4qqm3mQZN6v75bG26CdYnVl2TeLfkTZjvXrvJc
 giocRsVf3XzUHNtQbHmKuK8DvM1Ek1/x5K0wyYtasolTEg7/2qB6aGjQp00vFKNL5Y
 zt+Sp8L7RVdGg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] gpu: host1x: fix uninitialized variable use
Date: Fri, 27 Jan 2023 23:14:00 +0100
Message-Id: <20230127221418.2522612-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Nathan Chancellor <nathan@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The error handling for platform_get_irq() failing no longer
works after a recent change, clang now points this out with
a warning:

drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
        if (syncpt_irq < 0)
            ^~~~~~~~~~

Fix this by removing the variable and checking the correct
error status.

Fixes: 625d4ffb438c ("gpu: host1x: Rewrite syncpoint interrupt handling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/host1x/dev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 4872d183d860..aae2efeef503 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -487,7 +487,6 @@ static int host1x_get_resets(struct host1x *host)
 static int host1x_probe(struct platform_device *pdev)
 {
 	struct host1x *host;
-	int syncpt_irq;
 	int err;
 
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
@@ -517,8 +516,8 @@ static int host1x_probe(struct platform_device *pdev)
 	}
 
 	host->syncpt_irq = platform_get_irq(pdev, 0);
-	if (syncpt_irq < 0)
-		return syncpt_irq;
+	if (host->syncpt_irq < 0)
+		return host->syncpt_irq;
 
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
-- 
2.39.0

