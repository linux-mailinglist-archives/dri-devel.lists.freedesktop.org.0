Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D9404CB6
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 14:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B0F6E843;
	Thu,  9 Sep 2021 12:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB76E843
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 12:00:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 679A7632B4;
 Thu,  9 Sep 2021 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188835;
 bh=UDiClydY6tObt0PZNd1SZt9G8hnhTbLPunilXpDsPXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b0KCao/z9srIPiEILqMjORyLAlnV6Iy6cDvhqgMTNlQKGe1QZ8k50g+y02M+jWL66
 scOgHRDyFFAB7W3kiG2F+qd2ArLhVhSLSVoK0sFwh7+CwiHCB6HC4vVblo2KZpgfvB
 UQMUe0CY+ONUAkZ4ISdlHXtHPIgc9HlFNO+Ogw1eTS1eu6GGfC2Te++KC4EeL0KpwK
 S4Tg0J3Em6P4L1c6pCqjrEbxcpdzptxYCzpHDEPqZH8i4fuLaxAqk1fHYR9xFJ4mEY
 koyzY7kmqykldUCjY7q3GYzwmXi5aGHDxBRK3rLb6Lq/fADnUMTvjGEqF6ajbpmN9V
 yGksNfIxtAc7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 15/48] video: fbdev: asiliantfb: Error out if
 'pixclock' equals zero
Date: Thu,  9 Sep 2021 07:59:42 -0400
Message-Id: <20210909120015.150411-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909120015.150411-1-sashal@kernel.org>
References: <20210909120015.150411-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zheyu Ma <zheyuma97@gmail.com>

[ Upstream commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09 ]

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of 'pixclock',
it may cause divide error.

Fix this by checking whether 'pixclock' is zero first.

The following log reveals it:

[   43.861711] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   43.861737] CPU: 2 PID: 11764 Comm: i740 Not tainted 5.14.0-rc2-00513-gac532c9bbcfb-dirty #224
[   43.861756] RIP: 0010:asiliantfb_check_var+0x4e/0x730
[   43.861843] Call Trace:
[   43.861848]  ? asiliantfb_remove+0x190/0x190
[   43.861858]  fb_set_var+0x2e4/0xeb0
[   43.861866]  ? fb_blank+0x1a0/0x1a0
[   43.861873]  ? lock_acquire+0x1ef/0x530
[   43.861884]  ? lock_release+0x810/0x810
[   43.861892]  ? lock_is_held_type+0x100/0x140
[   43.861903]  ? ___might_sleep+0x1ee/0x2d0
[   43.861914]  ? __mutex_lock+0x620/0x1190
[   43.861921]  ? do_fb_ioctl+0x313/0x700
[   43.861929]  ? mutex_lock_io_nested+0xfa0/0xfa0
[   43.861936]  ? __this_cpu_preempt_check+0x1d/0x30
[   43.861944]  ? _raw_spin_unlock_irqrestore+0x46/0x60
[   43.861952]  ? lockdep_hardirqs_on+0x59/0x100
[   43.861959]  ? _raw_spin_unlock_irqrestore+0x46/0x60
[   43.861967]  ? trace_hardirqs_on+0x6a/0x1c0
[   43.861978]  do_fb_ioctl+0x31e/0x700

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1627293835-17441-2-git-send-email-zheyuma97@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/asiliantfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 91eea4583382..ceb579eff1ea 100644
--- a/drivers/video/fbdev/asiliantfb.c
+++ b/drivers/video/fbdev/asiliantfb.c
@@ -227,6 +227,9 @@ static int asiliantfb_check_var(struct fb_var_screeninfo *var,
 {
 	unsigned long Ftarget, ratio, remainder;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	ratio = 1000000 / var->pixclock;
 	remainder = 1000000 % var->pixclock;
 	Ftarget = 1000000 * ratio + (1000000 * remainder) / var->pixclock;
-- 
2.30.2

