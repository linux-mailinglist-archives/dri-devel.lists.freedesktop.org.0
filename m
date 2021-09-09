Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A14049BE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A87B6E517;
	Thu,  9 Sep 2021 11:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED336E517
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:42:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C338561186;
 Thu,  9 Sep 2021 11:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187755;
 bh=M/TrmTe3ciJOP0PBC3RLTmAUzusLs0iiYOrZz9bKWK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eWmNj/AAIPqUx3WbBu5TYKDU/1dcNERvzTeLVxgouyPyz0rSmtEpS3UY6s3fn48aU
 6grq82TzVmOGIyLIa4E9/Ludip9+OzZdZgmYLOu3w16hTAzqO38aqVKI5w33s6vf4X
 +Cn5NS/RqyZIGG3FNGlNsTSBDAP2sbAOVNVlhMqm8X0YLiQkTY5sIt0E4gHz1/+6ve
 XVKukHQQjtc5Ac2o3mj/CH8kVihJooJrOLz3RMjRw9iCQH4E8FWZuQ4fT7waf5j2tS
 oXGfceBRccV/1FXqelZgFWtEVFgztjqlT5GffosdWjWQmjIbQ+MpDcCmbslVnygn8i
 sVHvCAVHQOXvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 069/252] video: fbdev: kyro: Error out if
 'pixclock' equals zero
Date: Thu,  9 Sep 2021 07:38:03 -0400
Message-Id: <20210909114106.141462-69-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
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

[ Upstream commit 1520b4b7ba964f8eec2e7dd14c571d50de3e5191 ]

The userspace program could pass any values to the driver through
ioctl() interface. if the driver doesn't check the value of 'pixclock',
it may cause divide error because the value of 'lineclock' and
'frameclock' will be zero.

Fix this by checking whether 'pixclock' is zero in kyrofb_check_var().

The following log reveals it:

[  103.073930] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[  103.073942] CPU: 4 PID: 12483 Comm: syz-executor Not tainted 5.14.0-rc2-00478-g2734d6c1b1a0-dirty #118
[  103.073959] RIP: 0010:kyrofb_set_par+0x316/0xc80
[  103.074045] Call Trace:
[  103.074048]  ? ___might_sleep+0x1ee/0x2d0
[  103.074060]  ? kyrofb_ioctl+0x330/0x330
[  103.074069]  fb_set_var+0x5bf/0xeb0
[  103.074078]  ? fb_blank+0x1a0/0x1a0
[  103.074085]  ? lock_acquire+0x3bd/0x530
[  103.074094]  ? lock_release+0x810/0x810
[  103.074103]  ? ___might_sleep+0x1ee/0x2d0
[  103.074114]  ? __mutex_lock+0x620/0x1190
[  103.074126]  ? trace_hardirqs_on+0x6a/0x1c0
[  103.074137]  do_fb_ioctl+0x31e/0x700
[  103.074144]  ? fb_getput_cmap+0x280/0x280
[  103.074152]  ? rcu_read_lock_sched_held+0x11/0x80
[  103.074162]  ? rcu_read_lock_sched_held+0x11/0x80
[  103.074171]  ? __sanitizer_cov_trace_switch+0x67/0xf0
[  103.074181]  ? __sanitizer_cov_trace_const_cmp2+0x20/0x80
[  103.074191]  ? do_vfs_ioctl+0x14b/0x16c0
[  103.074199]  ? vfs_fileattr_set+0xb60/0xb60
[  103.074207]  ? rcu_read_lock_sched_held+0x11/0x80
[  103.074216]  ? lock_release+0x483/0x810
[  103.074224]  ? __fget_files+0x217/0x3d0
[  103.074234]  ? __fget_files+0x239/0x3d0
[  103.074243]  ? do_fb_ioctl+0x700/0x700
[  103.074250]  fb_ioctl+0xe6/0x130

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1627293835-17441-3-git-send-email-zheyuma97@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/kyro/fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 4b8c7c16b1df..25801e8e3f74 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -399,6 +399,9 @@ static int kyrofb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct kyrofb_info *par = info->par;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (var->bits_per_pixel != 16 && var->bits_per_pixel != 32) {
 		printk(KERN_WARNING "kyrofb: depth not supported: %u\n", var->bits_per_pixel);
 		return -EINVAL;
-- 
2.30.2

