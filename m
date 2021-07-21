Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC33D1E85
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2B6E950;
	Thu, 22 Jul 2021 06:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B506E3F4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 12:43:56 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id y4so1733024pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hRkHCKSSN064WZq1PoAF2chWbSrhzer+ob3WlnV1ZTg=;
 b=i1ljmJ0xkOVkevu0L5R6bZJv23gy7JZLLudqY+ir1G582Mvkirwu4/WqTIRVls88U9
 loA4ae9K4+A2QhtVGK/0Y9wXhlKbiMHhI7VbEipr0/8R82RrJXyuCBEYYhSjx9MmtIqk
 d8S6GwUbQOvgSlNI/S27jARDLoLjYgq/821xXPz200VUv+WXyv/zxR+wSU/MIsRvyrCw
 MfFoj9S+6s4j6bwY0lbJGeKjJifC3FhlXqmD/1O9sJMGB4SArTcF3zO1MxsyLoiDIzX+
 jzueCOOOic+Tw38VaIhRd1p/NbyD7JV/CxzlfE8CTJdfEy4mnXCGcfxInELkYWW9REaA
 w0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hRkHCKSSN064WZq1PoAF2chWbSrhzer+ob3WlnV1ZTg=;
 b=USmWIH+5LUqZO+Po15/EGbCIaB5qi5OOs9NU3ZqTaGldh+Wjxb60Dz821venHdUw3t
 0GfnB4TVdfsdGkRKln/SqdLfJN2WP1RJXVtKSidOJZ6G2oiveLSWRHvLBa+Z8vxvUSGH
 ZBWp9gjHJ1n9jpkzjxxqVMLwLsBNeHKZrPtt0wwKR16FsNNJhXmMz1X3YMqAkUIVKMHm
 rHN3/Zk0pmbssBT++z22g+fXo4qMCw5Ljp+rpiWag1N9CNZJxN28twi/oWiDlmhhIbUD
 pIpXSnstAJhekG79q7QBlx0ldDkNCvwxzbel2rsaDdZ7sCmaR/s49mEPuM8fzb7AOqEF
 2tSQ==
X-Gm-Message-State: AOAM532OUJDAWaZl07SN4W6vRyIZfkUMls74YM8zSLrfEdIUu8jegPNU
 h5/FfDvcuwDLfzd9a/BrWg==
X-Google-Smtp-Source: ABdhPJwCa7xYvom7hwj58FEfM880ND/5npe9pPzfK0Pv9KDM5la/3pyI+/q/gplYcT3mONUnoBm2mA==
X-Received: by 2002:a62:19c9:0:b029:32a:129f:542d with SMTP id
 192-20020a6219c90000b029032a129f542dmr36137694pfz.8.1626871435789; 
 Wed, 21 Jul 2021 05:43:55 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
 by smtp.gmail.com with ESMTPSA id t3sm1877785pfd.153.2021.07.21.05.43.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jul 2021 05:43:55 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: sam@ravnborg.org,
	tzimmermann@suse.de
Subject: [PATCH] video: fbdev: neofb: add a check against divide error
Date: Wed, 21 Jul 2021 12:43:44 +0000
Message-Id: <1626871424-27708-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 22 Jul 2021 06:54:33 +0000
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
it may cause divide error because of the 'PICOS2KHZ' macro.

Fix this by checking whether 'pixclock' is zero first.

The following log reveals it:

[   53.093806] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
[   53.093838] CPU: 3 PID: 11763 Comm: hang Not tainted 5.14.0-rc2-00478-g2734d6c1b1a0 #215
[   53.093859] RIP: 0010:neofb_check_var+0x80/0xe50
[   53.093951] Call Trace:
[   53.093956]  ? neofb_setcolreg+0x2b0/0x2b0
[   53.093968]  fb_set_var+0x2e4/0xeb0
[   53.093977]  ? fb_blank+0x1a0/0x1a0
[   53.093984]  ? lock_acquire+0x1ef/0x530
[   53.093996]  ? lock_release+0x810/0x810
[   53.094005]  ? lock_is_held_type+0x100/0x140
[   53.094016]  ? ___might_sleep+0x1ee/0x2d0
[   53.094028]  ? __mutex_lock+0x620/0x1190
[   53.094036]  ? do_fb_ioctl+0x313/0x700
[   53.094044]  ? mutex_lock_io_nested+0xfa0/0xfa0
[   53.094051]  ? __this_cpu_preempt_check+0x1d/0x30
[   53.094060]  ? _raw_spin_unlock_irqrestore+0x46/0x60
[   53.094069]  ? lockdep_hardirqs_on+0x59/0x100
[   53.094076]  ? _raw_spin_unlock_irqrestore+0x46/0x60
[   53.094085]  ? trace_hardirqs_on+0x6a/0x1c0
[   53.094096]  do_fb_ioctl+0x31e/0x700

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/neofb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index c0f4f402da3f..966df2a07360 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -585,7 +585,7 @@ neofb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 
 	DBG("neofb_check_var");
 
-	if (PICOS2KHZ(var->pixclock) > par->maxClock)
+	if (var->pixclock && PICOS2KHZ(var->pixclock) > par->maxClock)
 		return -EINVAL;
 
 	/* Is the mode larger than the LCD panel? */
-- 
2.17.6

