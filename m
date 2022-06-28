Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6C55BD70
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0410F198;
	Tue, 28 Jun 2022 02:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1A910F10B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:23:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B7CA9CE1DCC;
 Tue, 28 Jun 2022 02:23:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBB9C34115;
 Tue, 28 Jun 2022 02:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383015;
 bh=rOos/ArnyqrU9+/UDMZ/R2BUkprdvSdRzCRG/yD/lQ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bU7fFs/KpSHyNNNqyOg8OL7cqFSSw/0AgFwfuYDVIPliLwi2/jEqcQWAUJ14xv37F
 CuX4lbvwBcZQzl8S4lVCZUE42U3uy/cjoQyoPd2TTPme9Zdh3XtRQQYiNeBRAdsMqS
 Sw5E0ezmOmxeY71QSdCfjMtX4JrUlZ0I2S1788a1XApcURA4/e+ovaWFjX6Ll+tS5Q
 QDJRS1MB4EgO2dxdYBf20RuNB4cRdQS4YHOndVgd7sqwAoCotHeb1IKYuQzbskrj08
 zi9iIpmSc55MehYdNr5nHqeNWS/TnlgttQXyI+GFrazbajeJQkIYy5yNAgdzShE6oI
 bKu91HQ8RzTYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 18/34] video: fbdev: pxa3xx-gcu: Fix integer
 overflow in pxa3xx_gcu_write
Date: Mon, 27 Jun 2022 22:22:25 -0400
Message-Id: <20220628022241.595835-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Hyunwoo Kim <imv4bel@gmail.com>,
 dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev,
 yangyingliang@huawei.com, yang.lee@linux.alibaba.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hyunwoo Kim <imv4bel@gmail.com>

[ Upstream commit a09d2d00af53b43c6f11e6ab3cb58443c2cac8a7 ]

In pxa3xx_gcu_write, a count parameter of type size_t is passed to words of
type int.  Then, copy_from_user() may cause a heap overflow because it is used
as the third argument of copy_from_user().

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/pxa3xx-gcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/pxa3xx-gcu.c b/drivers/video/fbdev/pxa3xx-gcu.c
index 9421d14d0eb0..9e9888e40c57 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -381,7 +381,7 @@ pxa3xx_gcu_write(struct file *file, const char *buff,
 	struct pxa3xx_gcu_batch	*buffer;
 	struct pxa3xx_gcu_priv *priv = to_pxa3xx_gcu_priv(file);
 
-	int words = count / 4;
+	size_t words = count / 4;
 
 	/* Does not need to be atomic. There's a lock in user space,
 	 * but anyhow, this is just for statistics. */
-- 
2.35.1

