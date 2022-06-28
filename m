Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48455BD7D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4156210F1A9;
	Tue, 28 Jun 2022 02:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4AA10EE23
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:24:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5194FB81C19;
 Tue, 28 Jun 2022 02:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24D6C341CA;
 Tue, 28 Jun 2022 02:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656383088;
 bh=Kqi3E0HjV/M/rUHNNJDAxMFwMxUuQgRy5Fn4G8zuY/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G1rapj8TbhPkB2BZAY1Mtu18fnlkg+ylqHBazgwT6nS8ii2nufMKJFVVgZWrSeXaB
 uGyFj3521afEiD0yasQ3vOxyHX9wuAYkVAoQLwctbqyVZ5SItb35mXQUzCXsuvLg7k
 /3mMU26qu2XP+W9WfEBj6hvEETfVXpaGWlw1JQl+Rt5GIeaiDL5obzdhgEQ1M7+kcz
 5HZOdaLisa13M2vD1BxK4BdpBcAIbI0bv5WxNjFyYNtmeAvPrWXxKiZ+plSmpvvB+Q
 Isf1aCdTfELgFlHPhbEAssDfw1V/MPPVz2q/5kynEEPhWcGsD5BUaT7siktTfJQvV/
 v/jITPq6fAC5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 13/27] video: fbdev: pxa3xx-gcu: Fix integer
 overflow in pxa3xx_gcu_write
Date: Mon, 27 Jun 2022 22:23:59 -0400
Message-Id: <20220628022413.596341-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022413.596341-1-sashal@kernel.org>
References: <20220628022413.596341-1-sashal@kernel.org>
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
index 7c4694d70dac..15162b37f302 100644
--- a/drivers/video/fbdev/pxa3xx-gcu.c
+++ b/drivers/video/fbdev/pxa3xx-gcu.c
@@ -382,7 +382,7 @@ pxa3xx_gcu_write(struct file *file, const char *buff,
 	struct pxa3xx_gcu_batch	*buffer;
 	struct pxa3xx_gcu_priv *priv = to_pxa3xx_gcu_priv(file);
 
-	int words = count / 4;
+	size_t words = count / 4;
 
 	/* Does not need to be atomic. There's a lock in user space,
 	 * but anyhow, this is just for statistics. */
-- 
2.35.1

