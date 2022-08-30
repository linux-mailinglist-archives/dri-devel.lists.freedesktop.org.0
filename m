Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975D25A6990
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCBF10E24F;
	Tue, 30 Aug 2022 17:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6A610E24F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 17:20:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7ED861799;
 Tue, 30 Aug 2022 17:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB21DC433C1;
 Tue, 30 Aug 2022 17:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880047;
 bh=150roaC0CNIdd5b+cfmwKH6lTavcFXqnMha7Lc8lO5g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NAna+t3I9XfWr8j0C6GGhKqIUB0y6GhddjSZrgtiqXrFmgBIGT83aJ1YEGsKFu8Rj
 IImmn77OwftNI1kdOKVN9Qxe1ftJE0wbK+qhhS1gAAFQ1/cPdOQTuubuMO7K2ywWtk
 9YtuRNuIchzq1IUg9YNouPpqnqlnb7xzMkSn4j5mQpJqZ/9aUBmkX5I01qtd+P6sst
 RD7Nk/DUhJpNmQ6g0yZ+fedgpEmgplp/ySqgugaQeY5JhYctSOT+9XtnJfD9DJqtGt
 w3H+IlebBDmrtwAOrTGwy5AlxKna8XbBMVjO3pk2unEPukaNMf1P2Iz9565E44rVcV
 Smqx48WusyY0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 27/33] fbdev: omapfb: Fix tests for
 platform_get_irq() failure
Date: Tue, 30 Aug 2022 13:18:18 -0400
Message-Id: <20220830171825.580603-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, jiapeng.chong@linux.alibaba.com,
 linux-fbdev@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com,
 Yu Zhe <yuzhe@nfschina.com>, Helge Deller <deller@gmx.de>,
 guozhengkui@vivo.com, gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 tony@atomide.com, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yu Zhe <yuzhe@nfschina.com>

[ Upstream commit acf4c6205e862304681234a6a4375b478af12552 ]

The platform_get_irq() returns negative error codes.  It can't actually
return zero.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 292fcb0a24fc9..6ff237cee7f87 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1643,14 +1643,14 @@ static int omapfb_do_probe(struct platform_device *pdev,
 		goto cleanup;
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
-	if (!fbdev->int_irq) {
+	if (fbdev->int_irq < 0) {
 		dev_err(&pdev->dev, "unable to get irq\n");
 		r = ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
-	if (!fbdev->ext_irq) {
+	if (fbdev->ext_irq < 0) {
 		dev_err(&pdev->dev, "unable to get irq\n");
 		r = ENXIO;
 		goto cleanup;
-- 
2.35.1

