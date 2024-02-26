Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9642867AC4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00510E4A8;
	Mon, 26 Feb 2024 15:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="RAxQqA4q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C0510E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:52:01 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-3be110bbff9so1000300b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 07:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708962720; x=1709567520; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CUSSeKCNfrI8SENdwKZ8ZDRRQjwEDrUx9VFbPLeuRnM=;
 b=RAxQqA4qZ0sbOAqw8pelcsB3ce3ka2TKoZyDANgWGvCFvQN1TmKlLC463/4+eb1CCa
 tt9FNesZqyZJ5o78+x4X/fkuVD+55RJULxcKthb8gMp8UI6z0ybNtYGaEyD8l0StqsQ3
 9U4qB9diy1ABmifk+iPzmm8vKDc37Be5YrYYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708962720; x=1709567520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CUSSeKCNfrI8SENdwKZ8ZDRRQjwEDrUx9VFbPLeuRnM=;
 b=b92nK6zeyxE05NB8WZ/vMNU4KcZcniDhNkHbGsWtj3PkPDWJwiwgZ4YMtk4141UJ66
 RQegjAOje0Yk9EE0kMPsuom4jVWt2wqnr9wTjU6SELlTrCiKCNs6xWHmyQo/CjGYPcd+
 J73jNGq7npnVzxGlQF3lR89IZy9Qs0dkCu7rso2nnus6eJKieqmuFjr3+soN/VOBnkK3
 lVAHSnazyKKd1wLyuZ9/xDrHq1pz+mQvQjp8rSVT8dI3IPjf4JZWxQA26jZFanfXP7cH
 MeqzHqttrIt/RdlayQJDvFVKCgaMFdPOQuNOuYo2udwKMZgxOJZTw5l5KbRZ0/w8/s9Y
 hqUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPwITOUDtENQ60NYYW5aVLS0Y3wKgesvr4SqeSk5qiz/OGwCE6Xh5MIxtd/kbz2niZlUDXPHzF5yOVofKMaNFW/6al1MsJk2mvuqb2NTNK
X-Gm-Message-State: AOJu0YxNdRiC0vsJU/sv4NKsURfJuw6tgwZhUixjZBhnQl53+3dTkxvV
 wtP6tCCQOW6okOFHeM/sTKK8PxYKBIhPsoV8j/WoIhvgpckvG6+xllNL+5izQuGZQEqEZT7lveu
 A/+ZKnyzuqJhjFQOaj9Ttt7+7vAepakx3b6x6ug==
X-Google-Smtp-Source: AGHT+IEdiQ4U3Em4o9sDuL5RsHg1cNC4nB6yTF5zoOIg2giWwAyj6LuCUE3soBJh3R3CnQ3rPqB5bTGOiWA/ta2lfdE=
X-Received: by 2002:a05:6871:3427:b0:21e:be91:ae48 with SMTP id
 nh39-20020a056871342700b0021ebe91ae48mr8491032oac.1.1708962720214; Mon, 26
 Feb 2024 07:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20240208114411.14604-1-jirislaby@kernel.org>
In-Reply-To: <20240208114411.14604-1-jirislaby@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Feb 2024 16:51:49 +0100
Message-ID: <CAKMK7uH-22rmncSn0iP2qdeUNEsmOQgG5xHcOPTLwnwqANtvYQ@mail.gmail.com>
Subject: Re: [PATCH] fbcon: always restore the old font data in
 fbcon_do_set_font()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Ubisectech Sirius <bugreport@ubisectech.com>, 
 Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 8 Feb 2024 at 12:44, Jiri Slaby (SUSE) <jirislaby@kernel.org> wrote:
>
> Commit a5a923038d70 (fbdev: fbcon: Properly revert changes when
> vc_resize() failed) started restoring old font data upon failure (of
> vc_resize()). But it performs so only for user fonts. It means that the
> "system"/internal fonts are not restored at all. So in result, the very
> first call to fbcon_do_set_font() performs no restore at all upon
> failing vc_resize().
>
> This can be reproduced by Syzkaller to crash the system on the next
> invocation of font_get(). It's rather hard to hit the allocation failure
> in vc_resize() on the first font_set(), but not impossible. Esp. if
> fault injection is used to aid the execution/failure. It was
> demonstrated by Sirius:
>   BUG: unable to handle page fault for address: fffffffffffffff8
>   #PF: supervisor read access in kernel mode
>   #PF: error_code(0x0000) - not-present page
>   PGD cb7b067 P4D cb7b067 PUD cb7d067 PMD 0
>   Oops: 0000 [#1] PREEMPT SMP KASAN
>   CPU: 1 PID: 8007 Comm: poc Not tainted 6.7.0-g9d1694dc91ce #20
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>   RIP: 0010:fbcon_get_font+0x229/0x800 drivers/video/fbdev/core/fbcon.c:2286
>   Call Trace:
>    <TASK>
>    con_font_get drivers/tty/vt/vt.c:4558 [inline]
>    con_font_op+0x1fc/0xf20 drivers/tty/vt/vt.c:4673
>    vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
>    vt_ioctl+0x632/0x2ec0 drivers/tty/vt/vt_ioctl.c:752
>    tty_ioctl+0x6f8/0x1570 drivers/tty/tty_io.c:2803
>    vfs_ioctl fs/ioctl.c:51 [inline]
>   ...
>
> So restore the font data in any case, not only for user fonts. Note the
> later 'if' is now protected by 'old_userfont' and not 'old_data' as the
> latter is always set now. (And it is supposed to be non-NULL. Otherwise
> we would see the bug above again.)
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: a5a923038d70 ("fbdev: fbcon: Properly revert changes when vc_resize() failed")
> Cc: Ubisectech Sirius <bugreport@ubisectech.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Reviewing patches to code where assignments in if conditions are still
cool is a pain :-/

Merged to drm-misc-fixes with reported/tested-by credit tag for sirius added.

Thanks a lot!
-Sima

> ---
>  drivers/video/fbdev/core/fbcon.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 17a9fc80b4e4..98d0e2dbcd2f 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2395,11 +2395,9 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
>         struct fbcon_ops *ops = info->fbcon_par;
>         struct fbcon_display *p = &fb_display[vc->vc_num];
>         int resize, ret, old_userfont, old_width, old_height, old_charcount;
> -       char *old_data = NULL;
> +       u8 *old_data = vc->vc_font.data;
>
>         resize = (w != vc->vc_font.width) || (h != vc->vc_font.height);
> -       if (p->userfont)
> -               old_data = vc->vc_font.data;
>         vc->vc_font.data = (void *)(p->fontdata = data);
>         old_userfont = p->userfont;
>         if ((p->userfont = userfont))
> @@ -2433,13 +2431,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
>                 update_screen(vc);
>         }
>
> -       if (old_data && (--REFCOUNT(old_data) == 0))
> +       if (old_userfont && (--REFCOUNT(old_data) == 0))
>                 kfree(old_data - FONT_EXTRA_WORDS * sizeof(int));
>         return 0;
>
>  err_out:
>         p->fontdata = old_data;
> -       vc->vc_font.data = (void *)old_data;
> +       vc->vc_font.data = old_data;
>
>         if (userfont) {
>                 p->userfont = old_userfont;
> --
> 2.43.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
