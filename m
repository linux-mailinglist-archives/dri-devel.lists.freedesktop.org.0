Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3055BD8D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97D910F26D;
	Tue, 28 Jun 2022 02:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1324110F251
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:25:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9065661799;
 Tue, 28 Jun 2022 02:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18E3C341CA;
 Tue, 28 Jun 2022 02:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383148;
 bh=9BkiyLBsVzXzC2PyiRUjj1lfylL5hzUuyzqnpUyygY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kaajD7JwjM2hu5HPTIMsb+Sr0oQKr3vZI/hpCVnXpElO3VuKVBJRVQYk31LUL6jLl
 7e7eV88MnHI2fdB5szk4y7hm3zQF57/yOwJwg0B5FYBx4cyJOyxSMhy1EHX7I/BPpb
 rNKYsimMjpEve3t3pqpNkYf1y85+84A/6fR/tDVObvJKTdM/dv1r3kfYnsg/ufzoZ/
 0Dw2ibmHCvslJ1FvNfqQiZreamvjxvn1WG5LngNS9CCyfAN8iR/WnLgm9fny+uecAF
 /sX0mK60zZvX5wE5sMv97K8RZLe1+8n0DdGzE8NDylK1UeRl1pH3nvNX4VSXgVZxBR
 Z9ZPun2CzizYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/22] video: fbdev: pxa3xx-gcu: Fix integer
 overflow in pxa3xx_gcu_write
Date: Mon, 27 Jun 2022 22:25:06 -0400
Message-Id: <20220628022518.596687-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022518.596687-1-sashal@kernel.org>
References: <20220628022518.596687-1-sashal@kernel.org>
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
index 43695a33f062..aec0b85db5bf 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -394,7 +394,7 @@ pxa3xx_gcu_write(struct file *file, const char *buff,
 	struct pxa3xx_gcu_batch	*buffer;
 	struct pxa3xx_gcu_priv *priv = to_pxa3xx_gcu_priv(file);
 
-	int words = count / 4;
+	size_t words = count / 4;
 
 	/* Does not need to be atomic. There's a lock in user space,
 	 * but anyhow, this is just for statistics. */
-- 
2.35.1

