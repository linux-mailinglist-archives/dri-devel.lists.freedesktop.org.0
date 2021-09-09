Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B04404C5D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20326E82C;
	Thu,  9 Sep 2021 11:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2D56E828
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:55:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDD8261C57;
 Thu,  9 Sep 2021 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188545;
 bh=lLd16bR7KFDAcQyJi/kQnKCTrzwAXDW4mmvfvqiwpbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iqGkYZNvuAAMkuVA/baFD6h3r2LhrrIlAeWjA6u6iTQZPFdCDQWYx5OdYWFWOd9vp
 v6Ovc+ub5t4a0CRXjh2vydgX8pJqDlFYXg37V3ugnsGJ4uu8q4zo3QWh/oTdiasgds
 Va3K4/cp9zHbXYFKo9lnJhMQ9NKJEAHWT6ySNpFsclXF5rzqVzReL9tO5tCP9U0igb
 POSZVK05wMeJe5qYLsRyDc1inD45oqxMJftylg6Nh+UNSk7n52EbVsqgIBAgro2o5z
 3eSr5Lg092lyhficEUrSjIR+DbKvREO80l6mmErNQAr+/D6XO4ZDKBzEguqIgDfj8K
 XydFEBwrHVuPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 030/109] video: fbdev: riva: Error out if
 'pixclock' equals zero
Date: Thu,  9 Sep 2021 07:53:47 -0400
Message-Id: <20210909115507.147917-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115507.147917-1-sashal@kernel.org>
References: <20210909115507.147917-1-sashal@kernel.org>
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

[ Upstream commit f92763cb0feba247e0939ed137b495601fd072a5 ]

The userspace program could pass any values to the driver through
ioctl() interface. If the driver doesn't check the value of 'pixclock',
it may cause divide error.

Fix this by checking whether 'pixclock' is zero first.

The following log reveals it:

[   33.396850] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   33.396864] CPU: 5 PID: 11754 Comm: i740 Not tainted 5.14.0-rc2-00513-gac532c9bbcfb-dirty #222
[   33.396883] RIP: 0010:riva_load_video_mode+0x417/0xf70
[   33.396969] Call Trace:
[   33.396973]  ? debug_smp_processor_id+0x1c/0x20
[   33.396984]  ? tick_nohz_tick_stopped+0x1a/0x90
[   33.396996]  ? rivafb_copyarea+0x3c0/0x3c0
[   33.397003]  ? wake_up_klogd.part.0+0x99/0xd0
[   33.397014]  ? vprintk_emit+0x110/0x4b0
[   33.397024]  ? vprintk_default+0x26/0x30
[   33.397033]  ? vprintk+0x9c/0x1f0
[   33.397041]  ? printk+0xba/0xed
[   33.397054]  ? record_print_text.cold+0x16/0x16
[   33.397063]  ? __kasan_check_read+0x11/0x20
[   33.397074]  ? profile_tick+0xc0/0x100
[   33.397084]  ? __sanitizer_cov_trace_const_cmp4+0x24/0x80
[   33.397094]  ? riva_set_rop_solid+0x2a0/0x2a0
[   33.397102]  rivafb_set_par+0xbe/0x610
[   33.397111]  ? riva_set_rop_solid+0x2a0/0x2a0
[   33.397119]  fb_set_var+0x5bf/0xeb0
[   33.397127]  ? fb_blank+0x1a0/0x1a0
[   33.397134]  ? lock_acquire+0x1ef/0x530
[   33.397143]  ? lock_release+0x810/0x810
[   33.397151]  ? lock_is_held_type+0x100/0x140
[   33.397159]  ? ___might_sleep+0x1ee/0x2d0
[   33.397170]  ? __mutex_lock+0x620/0x1190
[   33.397180]  ? trace_hardirqs_on+0x6a/0x1c0
[   33.397190]  do_fb_ioctl+0x31e/0x700

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1627293835-17441-4-git-send-email-zheyuma97@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/riva/fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index ca593a3e41d7..51c9d9508c0b 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1088,6 +1088,9 @@ static int rivafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	int mode_valid = 0;
 	
 	NVTRACE_ENTER();
+	if (!var->pixclock)
+		return -EINVAL;
+
 	switch (var->bits_per_pixel) {
 	case 1 ... 8:
 		var->red.offset = var->green.offset = var->blue.offset = 0;
-- 
2.30.2

