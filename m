Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD3231B08
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 10:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E226E478;
	Wed, 29 Jul 2020 08:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDD46E478
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 08:18:24 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id v21so9633495otj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGI4csuNiLS6fTAVR1vQNcVBEWSJTSk1oAgwrrB5NsI=;
 b=e+s6DHmgRnUm69dvY6m2+wPD1X7mXvPZP0fswGknSPRvoHeYYGhzmpEn1hRP36juI+
 V7TLksSzFpiPGZ8iBtvuXY677+7945nVOo6cGw3h1DxW9Egpg1lITwCjHofkkZSgWJco
 0eO2GF3rPRG9tVA7CqAt0TGLANGNbH2HvhkYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGI4csuNiLS6fTAVR1vQNcVBEWSJTSk1oAgwrrB5NsI=;
 b=l8tSJOcdQXAK07DWka4PbMXsLuKV8WcPyBWAuDH2AGDd+2gZAPg+9+u9YZknkmhGdn
 lHt+SPSgmoZhsgUxryU27iMI3ZNV/mV1FTq91rvZXR2469VXHe9iEMz7tUx9p5MPbrdI
 Apwg16U7zKoMVSgYf5f2x1Fp7zvXJq2/TIUNKueV+/e7ykgV+MHcVGZfEV5J1+CqR17P
 ZxAxvtTwdjjETzJ14v9qSglXD/ZLMqox9lNCZyDkM2P7jIWLHerKHP8WbbgfwjPkvwsG
 SRtSPXp50Qd20Rgb2vOiHYzzeFtH8fB5RGbIYGsHN9OE05oeSptmDXCBqp5GQ/WcFp9J
 Icmg==
X-Gm-Message-State: AOAM533SvZuikLNENK1I/80Rbai+Rya9YpU2KxRpgL9JUmnSICjjSLL0
 eRs5fS6vOG4xSkiMxjGRzwMDwEhfMcnqNLu9uCRemg==
X-Google-Smtp-Source: ABdhPJzBH+27x3ZujuEpHEVy6Gcb6DYFt6r/ynfQcsmDo5vW4q292PZiJ8/qFIUa5jgMuBmctGSCddAR2m3AVK8RCQA=
X-Received: by 2002:a9d:6052:: with SMTP id v18mr2509589otj.303.1596010704124; 
 Wed, 29 Jul 2020 01:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <1596000620-4075-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 29 Jul 2020 10:18:12 +0200
Message-ID: <CAKMK7uHeteS2+rKrZKrAM+zQO==hAX0XaVc9JfHPsdLTCtzKOw@mail.gmail.com>
Subject: Re: [PATCH] vt: Handle recursion in vc_do_resize().
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jslaby@suse.com>,
 syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 8:58 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> syzbot is reporting OOB read bug in vc_do_resize() [1] caused by memcpy()
> based on outdated old_{rows,row_size} values, for resize_screen() can
> recurse into vc_do_resize() which changes vc->vc_{cols,rows} that outdates
> old_{rows,row_size} values which were read before calling resize_screen().
>
> Minimal fix might be to read vc->vc_{rows,size_row} after resize_screen().
> A different fix might be to forbid recursive vc_do_resize() request.
> I can't tell which fix is the better.
>
> But since I guess that new_cols == vc->vc_cols && new_rows == vc->vc_rows
> check could become true after returning from resize_screen(), and I assume
> that not calling clear_selection() when resize_screen() will return error
> is harmless, let's redo the check by moving resize_screen() earlier.
>
> [1] https://syzkaller.appspot.com/bug?id=c70c88cfd16dcf6e1d3c7f0ab8648b3144b5b25e
>
> Reported-by: syzbot <syzbot+c37a14770d51a085a520@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Ok, I have actual insight on this one here, and I'm pretty sure this
isn't the fix. Looking at the syzkaller splat we have a recursion of
the form

fb_ioctl -> fb_set_var -> fbcon_update_vcs -> fbcon_resize -> fb_set_var

Which isn't supposed to be happening. I've dug around recently in
fbcon code, and this is a fairly common issue: You can update fbcon
state both from fb_ioctl, but also from the vc side. To avoid the
above recursion problems the code is using FBINFO_MISC_USEREVENT, and
should only set that from fb_ioctl entry points. That's all fairly
fragile, so I've done a bit of reworking, e.g.

commit de29ae5c092bd9a5360cfabf174b0f783248d278
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue May 28 11:02:56 2019 +0200

    fbmem: pull fbcon_fb_blanked out of fb_blank

as an example.

I think doing the same for fb_set_var, i.e. only calling
fbcon_update_vcs for the 3 callers that want it, should fix this
recursion. I think that's the much more robust fix instead of trying
to paper over the fallout of this recursion here and everywhere else.

Can you look into reworking your patch like that?

Cheers, Daniel

> ---
>  drivers/tty/vt/vt.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 42d8c67..952a067 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -1217,7 +1217,24 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
>
>         if (new_cols == vc->vc_cols && new_rows == vc->vc_rows)
>                 return 0;
> +       if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
> +               return -EINVAL;
>
> +       /*
> +        * Since fbcon_resize() from resize_screen() can recurse into
> +        * this function via fb_set_var(), handle recursion now.
> +        */
> +       err = resize_screen(vc, new_cols, new_rows, user);
> +       if (err)
> +               return err;
> +       /* Reload values in case recursion changed vc->vc_{cols,rows}. */
> +       new_cols = (cols ? cols : vc->vc_cols);
> +       new_rows = (lines ? lines : vc->vc_rows);
> +       new_row_size = new_cols << 1;
> +       new_screen_size = new_row_size * new_rows;
> +
> +       if (new_cols == vc->vc_cols && new_rows == vc->vc_rows)
> +               return 0;
>         if (new_screen_size > KMALLOC_MAX_SIZE || !new_screen_size)
>                 return -EINVAL;
>         newscreen = kzalloc(new_screen_size, GFP_USER);
> @@ -1238,13 +1255,6 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
>         old_rows = vc->vc_rows;
>         old_row_size = vc->vc_size_row;
>
> -       err = resize_screen(vc, new_cols, new_rows, user);
> -       if (err) {
> -               kfree(newscreen);
> -               vc_uniscr_free(new_uniscr);
> -               return err;
> -       }
> -
>         vc->vc_rows = new_rows;
>         vc->vc_cols = new_cols;
>         vc->vc_size_row = new_row_size;
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
