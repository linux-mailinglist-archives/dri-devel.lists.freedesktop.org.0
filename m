Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B55F43DCA3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 10:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D5A6E92F;
	Thu, 28 Oct 2021 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC356E92F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:05:14 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id v3so9886703uam.10
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 01:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hX6YWh2Qu9VP/L6RLPs/omkiX7ZNKmtW4SWOeHX3y0=;
 b=Sci1+As9QIFkjVU4Z1s492Fx17iubwiAe0iHkeCsqXhHAEV/WbDFS0k7SgLw/CQvO7
 HHwhdZNFVbvB6qWJ2oohSaUkVzYdWbmhJxMbm3y/fyub8mhHejF9CvCOn76lhcfmgdGV
 ovOGWPIVQSgB7tZxb6AsbCP1fdLXKEix2YiyAhQ6ogMZdjmM9r6mTdHo9rEzWiqlVFzg
 s23jKUHM84vSph/oLoll9JCc7Q5N6k9qhdtx4S805HFRCswMje1XT4JdJZ9grX+NQUyx
 I90g8e1lnPZ8xDyb264khV0nb7vo5OkDM+6dG6MOsoe/jMZ1O5OXgxLqZMy1CQzkygFq
 qqjA==
X-Gm-Message-State: AOAM5337cIwmvZ8Q45mxIbr3Ikw19A5PQnY7p57hb0j0vbobkzylLki3
 nK0cFVhjuiKuhCP8yJodFVojOXOMGLXrhA==
X-Google-Smtp-Source: ABdhPJxK2GYzZL5uX6+RpwaLQLeWhGlYJml35ZFf6RTpomTe9SMVNaLWXacuiHmIfNnCUab0IOlpYA==
X-Received: by 2002:ab0:4911:: with SMTP id z17mr1068628uac.91.1635408312303; 
 Thu, 28 Oct 2021 01:05:12 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id k29sm372458vsr.14.2021.10.28.01.05.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 01:05:12 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id f126so2588357vke.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 01:05:11 -0700 (PDT)
X-Received: by 2002:a1f:1604:: with SMTP id 4mr2695337vkw.11.1635408311641;
 Thu, 28 Oct 2021 01:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <1635366613-22507-1-git-send-email-george.kennedy@oracle.com>
In-Reply-To: <1635366613-22507-1-git-send-email-george.kennedy@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Oct 2021 10:05:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXcO1K7da=4Ck2X0Rc_pfaM32dDKf0EfdDXNG0HL18h5Q@mail.gmail.com>
Message-ID: <CAMuHMdXcO1K7da=4Ck2X0Rc_pfaM32dDKf0EfdDXNG0HL18h5Q@mail.gmail.com>
Subject: Re: [PATCH v2] video: fbdev: cirrusfb: check pixclock to avoid divide
 by zero
To: George Kennedy <george.kennedy@oracle.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, Oct 27, 2021 at 10:32 PM George Kennedy
<george.kennedy@oracle.com> wrote:
> Do a sanity check on pixclock value to avoid divide by zero.
>
> If the pixclock value is zero, the cirrusfb driver will round up
> pixclock to get the derived frequency as close to maxclock as
> possible.
>
> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>
> divide error: 0000 [#1] SMP KASAN PTI
> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>
> Call Trace:
>  fb_set_var+0x398/0xf90
>  do_fb_ioctl+0x4b8/0x6f0
>  fb_ioctl+0xeb/0x130
>  __x64_sys_ioctl+0x19d/0x220
>  do_syscall_64+0x3a/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
