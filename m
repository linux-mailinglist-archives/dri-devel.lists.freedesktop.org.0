Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D307E55BD98
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9743010F2C6;
	Tue, 28 Jun 2022 02:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B175910F2CA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:26:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26F4D61932;
 Tue, 28 Jun 2022 02:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95125C341CA;
 Tue, 28 Jun 2022 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383199;
 bh=92fFTPRFNTND3nJTApvLJMW5rsvprlN7lwWNNkwEsws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N3yWM4skIJGsnD+y2jul7k3OuUuHk7w+8B98hZRx5E6pZGf50MU8ZD1ApWEIsl9Yx
 IWnLc7cWuCvBW0VoaeRGTvzgFn0t66CMBSr4vQzvn9O8P8+/rsuASjgZgIuQNozolx
 Zd+ORb4IxDwgla5Z6RJW+5GANHLLRB3m0sfqu5d0VlypazBLrP5WrH4HqWaMGIQIa0
 YVNqIGrY1KFkAm7czSL74S5lJ1GYeiDAD1/6oUr6xM3ilViq/GK4Y84LPnvICF/sxw
 jrZ6iZMuce42PDgEgxrqYl/Ws69n2msguHM/B/21krovI3dEpaI4n6YiYlmetKsgeq
 13PzmDEt4up8A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/17] video: fbdev: pxa3xx-gcu: Fix integer
 overflow in pxa3xx_gcu_write
Date: Mon, 27 Jun 2022 22:26:07 -0400
Message-Id: <20220628022615.596977-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022615.596977-1-sashal@kernel.org>
References: <20220628022615.596977-1-sashal@kernel.org>
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
 dri-devel@lists.freedesktop.org, yang.lee@linux.alibaba.com,
 yangyingliang@huawei.com, cai.huoqing@linux.dev
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
index 4febbe21b9b5..db861bb39150 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -391,7 +391,7 @@ pxa3xx_gcu_write(struct file *file, const char *buff,
 	struct pxa3xx_gcu_batch	*buffer;
 	struct pxa3xx_gcu_priv *priv = to_pxa3xx_gcu_priv(file);
 
-	int words = count / 4;
+	size_t words = count / 4;
 
 	/* Does not need to be atomic. There's a lock in user space,
 	 * but anyhow, this is just for statistics. */
-- 
2.35.1

