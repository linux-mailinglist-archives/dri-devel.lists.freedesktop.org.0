Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2393D56FE
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 12:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2286F890;
	Mon, 26 Jul 2021 10:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A62E6E426
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 10:04:18 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso7433937pjf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9IV7gdTl+TfYT0PA9yJ8ntrjPmJt3GKsWmRDc9gqVXc=;
 b=DphfsOPWeNPpqpuqCnT6AFEIilapAjNXbyoL6qdfUF7KUgyQoq+A3ldM46/yvNFkU9
 KvoYMsWgCJr/jfSwrRJGpA2sgabZeo6PkOJlqsuD/As2iwWXX545RmmDB59nEJAMRMNE
 1lLPLxojQL/9oSU14Z6nobb5IdnKckle5mTFMLY6lX2ABoAOwmRR6kuhFgJddeR7Wuib
 nIOzJDSudKR84yLf0i6hcG9eQRnZloksNTE1/iE2ejQC7yRC/wLK7JFL9N6Mt10wQ4Y4
 X67b6JewXNdUdTPmJpCfdjuxtKu7nIG8FlvuWkDrC+zsD+0CEoe512gm421ebaAB23og
 jk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9IV7gdTl+TfYT0PA9yJ8ntrjPmJt3GKsWmRDc9gqVXc=;
 b=iRArL4HR/J/cWlwzVNcC3e0yO9ifBCevKArfXj2UiR38bOtdfb8ov068XyRDi9Xs7/
 vTwaaCn37eBzpKZKB4RPV++xV4WfHFuSssdUrOpFfkpPQw82cBTjFuYTARA+2/gQmVjy
 Pf7MX08lc6iGg5cF6r+X9PlCjdMpoOB7iRI8q9FcsLOhPHWYA8kHLWkaonCJ72KWNmPH
 iK1BG+lEoOglsXLnsVG8qZQ3r/IXSvQzjcj0wJm++ZiZm8XfibUCfi5UqMR1nFScBAGx
 sxLSk3aBVe24Vy1ctPZP/dU0GUizIScWS9XN81Fgz7QZ2t8FwDBJNGV2nvDRyvJ9Y/Gu
 tWxw==
X-Gm-Message-State: AOAM533PYv7Fvw76R8KuUzejKPc6Zo1EuPuWpJT5U8Xrbxq7VEkA7jzq
 5Rlsh62tsBQZl8RYBOewnLvWWGFKhGI5QkE=
X-Google-Smtp-Source: ABdhPJwA75VRTvFn2qh0CwQPNB8OAKEm3Ei7pqR0b8eUNPChgWH21i/4Mw30bXr6ohf/Q9czqni94A==
X-Received: by 2002:a17:902:968a:b029:11d:6448:1352 with SMTP id
 n10-20020a170902968ab029011d64481352mr13952026plp.59.1627293857866; 
 Mon, 26 Jul 2021 03:04:17 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id ft7sm13504530pjb.32.2021.07.26.03.04.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Jul 2021 03:04:17 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH v2 3/3] video: fbdev: riva: Error out if 'pixclock' equals zero
Date: Mon, 26 Jul 2021 10:03:55 +0000
Message-Id: <1627293835-17441-4-git-send-email-zheyuma97@gmail.com>
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
Changes in v2:
    - Make commit log more descriptive
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

