Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1013D4AEF
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 04:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22B36E222;
	Sun, 25 Jul 2021 02:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87566E222
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 02:11:18 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b6so7861410pji.4
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 19:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PFRNnwm51Gi0GAWIv7wa+bGg79/PZT0KSdir/c8eVIM=;
 b=CHzc8Utl+VCiDiH/eQcXeH+YYQFhaKDJ9dgsuejVncP5b0SOSqj/ZVSISYUQYVXSl4
 irHD2JxaCq2Qb3+TOpXeqzjhMAIEejukUEql+GH5s7PxRhruDGoWu16rYLOO4BdrAz/D
 b+7/sM7numPO3Cqv75QJrqwSLqtIc2ZDfJl7eTJe0n9dghpxEZraeue1otpyOOMCTv8T
 Z/KaIUEqBwMCtGa5YuwWfYWu39/NLLk1J1kFjJmjoAkutys85BiYi2uWwcKKEGc5Lwt8
 KbRn8pNMhvWtEuKnW+sHSyro3XQQs9XcviUftjm+Fx8OzfJ3/V3+6KNNI9e6lBYKB+yk
 /KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PFRNnwm51Gi0GAWIv7wa+bGg79/PZT0KSdir/c8eVIM=;
 b=B/DH7N+tBe4Xf4Q5zvj/H1opwsUDXo0O/9G5yOREW4wwk64PRjROsvIMIHq3Bvc+1n
 UA9K7lPQYiJvMDTDni7F90PSa1vvVVmMCwj7uOCfNohYVp+NNnxXBhhHyNzNv1GJ4BqX
 iLxPTeRtDXmHPY+9lpvUHwr+d0sWOmt3x0Iv0Go9JYmFgSsiCAVOStA3C8T5lPsCzfqv
 F6G5Xh2Y6D4wM3XlOPwm7sNrI9n9AfDptNs0mY5qRq+dZY3c/ob08uNP0H+O2hHqw1Ck
 kTxHuFW/dGbZQrIqfucja9BIChemP+h6ZgoJcKwdsx4RzukK5MYFlzCts+FXEwKWu8dK
 8ftA==
X-Gm-Message-State: AOAM532v7vHLIT1rycFtjxcCozUfnvX1+uNJjs9bD1ig+AvNdI4z+O0s
 RRPSwzG3NvYCqE0YvmWvkA==
X-Google-Smtp-Source: ABdhPJxaTy+wtJqHTpgeaow+wyhgrl0vWWrfcR//2lyJ3z6Ame1dnzaSszwujMiT4jDchRiu2c4hTw==
X-Received: by 2002:a05:6a00:2383:b029:32d:827:1e29 with SMTP id
 f3-20020a056a002383b029032d08271e29mr11165960pfc.77.1627179078392; 
 Sat, 24 Jul 2021 19:11:18 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id y139sm12122341pfb.107.2021.07.24.19.11.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Jul 2021 19:11:18 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH 2/3] video: fbdev: riva: add a check against divide error
Date: Sun, 25 Jul 2021 02:10:53 +0000
Message-Id: <1627179054-29903-3-git-send-email-zheyuma97@gmail.com>
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
---
 drivers/video/fbdev/riva/fbdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 55554b0433cb..84d5e23ad7d3 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1084,6 +1084,9 @@ static int rivafb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 	int mode_valid = 0;
 	
 	NVTRACE_ENTER();
+	if (!var->pixclock)
+		return -EINVAL;
+
 	switch (var->bits_per_pixel) {
 	case 1 ... 8:
 		var->red.offset = var->green.offset = var->blue.offset = 0;
-- 
2.17.6

