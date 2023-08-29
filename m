Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA5478C56F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 15:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0762B10E32E;
	Tue, 29 Aug 2023 13:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55A10E32E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 13:32:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37A7965762;
 Tue, 29 Aug 2023 13:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E552DC433C9;
 Tue, 29 Aug 2023 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693315958;
 bh=VPzsTuzuRVs4PH5orOjSLTMnSeozDKlpRLSI7sv5Nmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BKkUWTjt2PIJob3VBPcg9ewE6mDETO7xCLvsRqK5PmtW8mNJYZWFxxidDuxlWEnGP
 LWfBL+wP3z0UPrN3FsCL6EWAegwNrpi1KsM+I8nKcVP/Gvz8bjA5w/HeYiue0v88+U
 0gNRQ/RxiAcLtQ0SDcZS9h6+i5V+K2iZP9zH77G4dS27NuE6+WbdSZgmz8Zta5OgWx
 vGnzcOlMvChYxtaMf2jk1EN/vzP2XRWI3J8wL+ZnlN+5RhDkeKDj7uo7lMarQVWPqb
 qDGs7a+ocR8QV2+LeEfDpprGx6MA2hcYBnc+QukhJlTd+lFVweSqes2Rs0Tx3IrWd1
 zUOj4ImoIITZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 14/17] fbdev: goldfishfb: Do not check 0 for
 platform_get_irq()
Date: Tue, 29 Aug 2023 09:32:01 -0400
Message-Id: <20230829133211.519957-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829133211.519957-1-sashal@kernel.org>
References: <20230829133211.519957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.12
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
Cc: Sasha Levin <sashal@kernel.org>, Zhu Wang <wangzhu9@huawei.com>,
 dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhu Wang <wangzhu9@huawei.com>

[ Upstream commit 0650d5098f8b6b232cd5ea0e15437fc38f7d63ba ]

Since platform_get_irq() never returned zero, so it need not to check
whether it returned zero, and we use the return error code of
platform_get_irq() to replace the current return error code.

Please refer to the commit a85a6c86c25b ("driver core: platform: Clarify
that IRQ 0 is invalid") to get that platform_get_irq() never returned
zero.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/goldfishfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index 6fa2108fd912d..e41c9fef4a3b6 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -203,8 +203,8 @@ static int goldfish_fb_probe(struct platform_device *pdev)
 	}
 
 	fb->irq = platform_get_irq(pdev, 0);
-	if (fb->irq <= 0) {
-		ret = -ENODEV;
+	if (fb->irq < 0) {
+		ret = fb->irq;
 		goto err_no_irq;
 	}
 
-- 
2.40.1

