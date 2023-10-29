Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF437DAF0D
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23E10E0CC;
	Sun, 29 Oct 2023 22:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BD410E0CC
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 22:55:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C137BB8074D;
 Sun, 29 Oct 2023 22:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB375C433CB;
 Sun, 29 Oct 2023 22:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620154;
 bh=92atpQovPf8dUEyPgtOqbb4csWrmpJaDoIHvo6WYpNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e2l269XNEiRwoZ1blLTJ38RxlqH9ZnG4UnyybdO/8l3fV60TUoNvRc7zda65thKIU
 +3TDqMuLbVIfwM5h7dqpX3Km7ySo6YWNoVutSHY4jFSkcMmiAeEkyDUJ1Bra9eiMqj
 aeEuVe66RmfRj7UtoZDElDWWdAYxcpJbsb3BJ9rWpR+qmSnXETRxn8cDqkRLHS0raH
 g3uFRqBuyCi2W9LmM90dzlslkUCT5/TjbyiMSe7hKND+vZF8Bi6Ca46XdnGh+yn/AD
 wS1upwby3h7FgMnOMsFCDHXQgYToHEt+hwdGaCkJDPgfT2NOU+jWMMxeFYLYHl8VFm
 K8AfssMMnwJkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 32/52] fbdev: omapfb: fix some error codes
Date: Sun, 29 Oct 2023 18:53:19 -0400
Message-ID: <20231029225441.789781-32-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225441.789781-1-sashal@kernel.org>
References: <20231029225441.789781-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.9
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 xu.panda@zte.com.cn, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 u.kleine-koenig@pengutronix.de, linux-omap@vger.kernel.org, sam@ravnborg.org,
 mielkesteven@icloud.com, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@linaro.org>

[ Upstream commit dc608db793731426938baa2f0e75a4a3cce5f5cf ]

Return negative -ENXIO instead of positive ENXIO.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index ad65554b33c35..0be95b4e14fdb 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1648,13 +1648,13 @@ static int omapfb_do_probe(struct platform_device *pdev,
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
 	if (fbdev->int_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
 	if (fbdev->ext_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
-- 
2.42.0

