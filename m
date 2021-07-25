Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85CB3D4AF0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 04:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216AE6E22B;
	Sun, 25 Jul 2021 02:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAB172D51
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 02:11:21 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t21so7456514plr.13
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 19:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b5jPra08N1jrGXye0AqIJzH6O9flfE0TslEKmsIUVKI=;
 b=tel9YPzrvYPp1Kj0jNPjd7H1ga53aW03g4oasrfak9aCK6aAIeWf0ATkYJP8pKf9Po
 0U+ElAcDv5Be7TwACzA3P/XQn4vL3oY9nCSoCjO4fqNnbRHC+57Ft1EcZL9Xn3t2FX6s
 wUF8xeCLgeKC43YMuSbgtgtCCh/JCJqbb7Rb166107xAWZP18o4ElwO60LVrpe8ctASZ
 Dz8Og8CYks0CEE0u29hMe2h65qHRbfn2KrizwoqQ/lf+UM2/HVKVlK84gnFVDdmd3MU+
 qs5NaBdFwiq5hMqAHwoJYldWPPdjor/Vhq5m4O1V52l5VtJSsoBp06C7GZR5DGaDT0GE
 lIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b5jPra08N1jrGXye0AqIJzH6O9flfE0TslEKmsIUVKI=;
 b=mIZvCJ8Nonpny7Ww9UzevpfosCuGPqADts/rPWKSM/gD6xu9ew35BGuYJu8iiBJDdl
 3qw0yWWAWN8btGD3arNH6VDZOj1IjHPDOGqAfokE20ORct2dVxRMDlnblbUzb2otnpGX
 gPXCwW8EoTnJ90QF0OS5FgjRkmw6YmQMoHmIIJmlap25ZE+anb9l8Br0oDs93D5cqu95
 tfgvLRY+GJa5YRT+wIfASOZz8FH3D+3+NjYUPu4cXyK6sqSK/nVTtgpzEaMkQQz+aJGa
 Q6cVdUNmP7kXCgg7KrmpqCiFIPSdWhPxSD0puLoV9n9u2Tts38Gp3tXQFOIhkQZveJHR
 OriQ==
X-Gm-Message-State: AOAM53294RXI5cbUtFVKPLxps/WmLIG6KXdisr9agcC5D5mnWOyK7R9v
 Cn4M3wCw+en18rD0t5DdqA==
X-Google-Smtp-Source: ABdhPJyDCY4AM99VJ/986peBSGIuC2ol9sFa7fOWfXRXJ6vHYojLh6NK7TZvEeHvIGbWMskfxUzD4Q==
X-Received: by 2002:a62:1bc7:0:b029:328:cbf5:b6b0 with SMTP id
 b190-20020a621bc70000b0290328cbf5b6b0mr11297361pfb.81.1627179081119; 
 Sat, 24 Jul 2021 19:11:21 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id y139sm12122341pfb.107.2021.07.24.19.11.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Jul 2021 19:11:20 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: adaplas@gmail.com
Subject: [PATCH 3/3] video: fbdev: asiliantfb: add a check against divide error
Date: Sun, 25 Jul 2021 02:10:54 +0000
Message-Id: <1627179054-29903-4-git-send-email-zheyuma97@gmail.com>
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
---
 drivers/video/fbdev/asiliantfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/asiliantfb.c b/drivers/video/fbdev/asiliantfb.c
index 3e006da47752..84c56f525889 100644
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
2.17.6

