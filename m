Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C0305616
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4897189E14;
	Wed, 27 Jan 2021 08:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE0889E14
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 08:48:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id v1so947461ott.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 00:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAKk6Yt/rmV2RLudc2xk6PS0Y1a3qymlWcwiHDkjBr8=;
 b=hpkECkevJHXSRsK8iq1sXAzKql+SxVJPbPnAJWoochSpZy/ce5KV/X8qE/LiJxPZau
 ADrXjw7mWcB9FaJGGLl9bnplLdBPeuFt8W0EeoNLh0xmTjCau/iNPWKS+FQbFHesttNG
 TWavAm7H4njlFVMB0tB25KS9C9UYtEayRwnyLfGWff7VvzFHhRqgogg7++zDy+MMejwL
 kTOs0jkAsB96A5XSJZjINg3cah5GxBVoZigjHA3NKIBtOBX5CCpUPb7B4oYQOxlnX5SP
 rZoAABDKpRFnqFCR5kASm1NImJvcjZLlMIlHQW5yYl40PNlyKKCDhfYKTGJHz7p806xD
 z9nw==
X-Gm-Message-State: AOAM530bGyYyubAynsNwxXQVQZe4rlvCAKOzoKxmH7WS0BUIq+PQlSLb
 6HRFwt5gkzLKJas2ppXRh0algmGZBYP1oGIJNWk=
X-Google-Smtp-Source: ABdhPJySkivwQpGFAZ+Grur9SYXrqqzDLD2UjmL030BacL3j7AyYhWe0zsuxjg9LQwAaq9rS0JKApCeVs56Z0mGYjzQ=
X-Received: by 2002:a05:6830:15cc:: with SMTP id
 j12mr6928590otr.145.1611737299392; 
 Wed, 27 Jan 2021 00:48:19 -0800 (PST)
MIME-Version: 1.0
References: <1611711140-68260-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127054523.GA2696@kadam> <20210127141927.00004472@gmail.com>
 <20210127064916.GD2696@kadam>
In-Reply-To: <20210127064916.GD2696@kadam>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jan 2021 09:48:08 +0100
Message-ID: <CAMuHMdVHZWz-9eA9yocTrNfZ5T_j+x5Ymqt262tCjTwQUzMDVw@mail.gmail.com>
Subject: Re: [PATCH v5] fbtft: add tearing signal detect
To: Dan Carpenter <dan.carpenter@oracle.com>, carlis <zhangxuezhi3@gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 mh12gx2825@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan, Carlis,

On Wed, Jan 27, 2021 at 9:32 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Wed, Jan 27, 2021 at 02:19:27PM +0800, carlis wrote:
> > hi,i will fix it like below:
> >       par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > GPIOD_IN); if (IS_ERR(par->gpio.te)) {
> >               rc = PTR_ERR(par->gpio.te);
> >               pr_err("Failed to request  te gpio: %d\n", rc);
> >               par->gpio.te = NULL;
> >       }
>
> I wish you would just copy and paste the code that I sent you instead,
> but this also fixes the crash...

While this fixes the crash, it does not propagate the error condition
(which may be -EPROBE_DEFER) upstream.
Same for devm_request_irq().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
