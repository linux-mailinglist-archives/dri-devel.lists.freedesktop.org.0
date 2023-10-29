Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1FC7DAF46
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 23:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9798A10E1B1;
	Sun, 29 Oct 2023 22:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61ECF10E1B1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 22:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B2FE3CE11B1;
 Sun, 29 Oct 2023 22:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4FAC116B1;
 Sun, 29 Oct 2023 22:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698620296;
 bh=YqgL3JlI9PcctTEnavZMjyjn+ScP9k7hZzFJc+ccac8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mFl7Lqx0k2aC/oRAKXBNmSZeRxxUFK7Z9zDu3Uh/JnxFqMQs795Liene1saaFvPuy
 EDipw9LFZvwYvKtcJNhnsKS5ZgC02nS2v1q5gkGiq0ybMNY4qoRpc/7/ZrX0GrNq+z
 0kwWiGp32+kqo4N+qmAZl2CcdMS8igaO4EzfAjO3YezEf0N5cyBybg881KtNeP4eEm
 1zQJAfF7l8tORzbbKSmI3lBwiy+T0IMZEXuJpaOll3zLdtgm1PkTBtufyiSP8LRZYY
 xT7ymzdCgo87KVtajddzSrNKhgH5LfzJotXU58wIjh3pDO+U7MF8eoLcGWY0XMelPH
 LojzMDs3O7mKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 23/39] fbdev: omapfb: fix some error codes
Date: Sun, 29 Oct 2023 18:56:55 -0400
Message-ID: <20231029225740.790936-23-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
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
index 17cda57656838..5ea7c52baa5a8 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1643,13 +1643,13 @@ static int omapfb_do_probe(struct platform_device *pdev,
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

