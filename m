Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E53D4AEE
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 04:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C726E219;
	Sun, 25 Jul 2021 02:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3636E219
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 02:11:15 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d17so7551858plh.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 19:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b/OEsk6C6w6Zrlw/A1blJOuhRgRs2bWr4qvLtVX6Yaw=;
 b=VF+6WypIJ219D3ErcRt+55xDp5CnDQpLJ0INrkSHdLJWHcY4yRh+CtPTYwvn+rWQPm
 odrffpGRkK0z1WQgoknRI5J58CvlObU3tF5xi7B1tqsumOlu9qJQil43HX5Nwh6+iPKn
 VRkOKiqq3d+5oCBhd5qePBaqO99drQdIwEQuU2cO7m9Ityd7zvZ4KI/5YXJWP+mc8K3C
 8vRCa12MUSBm7MiB5p/0s0ZiYSz6zIGxDUQGfFPrUHG8cm9nI6DgxdgbFWS1qD6jkMQL
 MaEneCk7ihdab5ZFrxumRiH0x+BeZBBAM918E2u0B/OudUEuv1n9wJARgSr6RTdRfmgj
 1X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b/OEsk6C6w6Zrlw/A1blJOuhRgRs2bWr4qvLtVX6Yaw=;
 b=dFIVV4bekecsGuWcu4r1FqKYPe2VOqPoCEAGZSTmn6Pqb7/dtRhU6aWyfV/iXfqmLM
 YUbOBFQayp1oypUP4x3Q1LRjpxZxsIsLDYF3Nl5i/1Xux+UEyT+83u5Xw1E5QrSBALHp
 UAPtrUC/VPFALaGg0z62U1N/PYoiiM4rTVRserrm7JlRjXKwnZV465nABvm7YBCaZ6uk
 cKqq/5lfHd0ATEzK5iVUQYFg1KHPtzmQ7bHxkqUYP/dT3FhEYpUWWVpDeF2uJEJXXDVU
 4S0cjFiLhG1AtJu9gLR6LGj4/NZos6y3R3wFL++jEliIURmXXDqnvnadD56Np5bjeUWG
 u70w==
X-Gm-Message-State: AOAM532t4VqiKHxzGTqb3irBbHUYVh97LOXYtKqJrFuAVDBjprh2irQY
 YPGpaNMy6AHwKb2lhU1hfQ==
X-Google-Smtp-Source: ABdhPJxsr1atNL2UD1RigkvWK7SlpRoxjrxAidI3+GrwUiicBHcXEJz+KdzLTgdUHYh1tHdkQtgjvQ==
X-Received: by 2002:a17:90a:f293:: with SMTP id
 fs19mr10480977pjb.212.1627179075387; 
 Sat, 24 Jul 2021 19:11:15 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id y139sm12122341pfb.107.2021.07.24.19.11.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Jul 2021 19:11:15 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH 1/3] video: fbdev: kyro: add a check against divide error
Date: Sun, 25 Jul 2021 02:10:52 +0000
Message-Id: <1627179054-29903-2-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627179054-29903-1-git-send-email-zheyuma97@gmail.com>
References: <1627179054-29903-1-git-send-email-zheyuma97@gmail.com>
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
ioctl() interface. If the driver doesn't check the value of 'pixclock',
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

