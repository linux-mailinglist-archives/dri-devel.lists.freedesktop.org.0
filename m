Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF53D56FA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACDE6EABC;
	Mon, 26 Jul 2021 10:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850AC6E913
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:04:15 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id ch6so3192926pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oLqmAGPc4SVQoWTmixoeM0OSXPTGLwR/vf6mA6ujJrw=;
 b=jDEhCV0MesJWmyfwARGKqSlkU4IvJEiOkkMs5Q6tTIZ/2yHUxRb+ayd29hH316o3RE
 XPMvLlYnOu8Jb8aW6QcpAwDmlYpvPuz+A/Of4LFLj7aXEw3GhTlY8aDIGdU6DKaLtv5S
 i9p7+tmhWAZwR/mH2fpbCG+J10goLVPzkC4lsNqafvEiU2U7MgevQ9R2TO+nXb/9+c/w
 vNJkToMzgq7noG4CEeFyQOXxmBD1Fm/eymn8+1ryAgRcJXqEbzGu2NWyw6Pvdr8o+1N6
 gb7cgoLEsqPAK58pyr/SNYIexpwOUdbikB0jgimEvz8u/XGakGebts7PMqQ0MSTMJNos
 KRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oLqmAGPc4SVQoWTmixoeM0OSXPTGLwR/vf6mA6ujJrw=;
 b=JRWXmWQPotiiBSf4lNd7o8vLyliIXzRbX0iIAUUlIX4q7706IRcd+qMmvg0GoshcuV
 qRxE4sUFz/ZQh84Et8pSZcJe4YNR6rIZ5Z137LaB0CyAuQWzJ7c+YNzJSFOargqllCkP
 2T1Y9EsMuoPE8Zku1sOJsPjqZZI1KTE9kuqHnd0AfYmwThkkQM8gE/E+bqFtST/WJ9+I
 BBEyWcNGbGEEKjYNBKqL+RbgMyOP92PkXiDOo0KLLhMSklFyqVY9HYS6kQSTCxYPjEiZ
 Ya4eNCROOiNu0EFUDEAQupkWL7Bc0LNDLJG/Pql5LGD5wdjtQBB53uAYfydw5F22bejk
 S9cQ==
X-Gm-Message-State: AOAM530yPhGNJzJm3IrDDKili+bvghMXA+580K1IuhTS6JMFEuPvC20K
 j9oSh1UXF2BZBdXtMEuPXw==
X-Google-Smtp-Source: ABdhPJwbnGkQtNU75HgbhJkdcgiC7P3ABNH4BW4RXUmVbmLYQFMJrXBHBUSds9DZntWqWMXHdnU4uw==
X-Received: by 2002:a17:902:684a:b029:12b:8d3e:68dc with SMTP id
 f10-20020a170902684ab029012b8d3e68dcmr14110881pln.79.1627293855175; 
 Mon, 26 Jul 2021 03:04:15 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id ft7sm13504530pjb.32.2021.07.26.03.04.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Jul 2021 03:04:14 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH v2 2/3] video: fbdev: kyro: Error out if 'pixclock' equals zero
Date: Mon, 26 Jul 2021 10:03:54 +0000
Message-Id: <1627293835-17441-3-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627293835-17441-1-git-send-email-zheyuma97@gmail.com>
References: <1627293835-17441-1-git-send-email-zheyuma97@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
---
Changes in v2:
    - Make commmit log more descriptive
---
 drivers/video/fbdev/kyro/fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index 8fbde92ae8b9..6db7e5e83f11 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -394,6 +394,9 @@ static int kyrofb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
 	struct kyrofb_info *par = info->par;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	if (var->bits_per_pixel != 16 && var->bits_per_pixel != 32) {
 		printk(KERN_WARNING "kyrofb: depth not supported: %u\n", var->bits_per_pixel);
 		return -EINVAL;
-- 
2.17.6

