Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C93D36C5D2
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8C6E94B;
	Tue, 27 Apr 2021 12:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4516E94B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 12:10:31 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id p2so26738831pgh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFns5/VsmEuhW6BFWribM/FHEmMkehdcNDcB3HXxuuw=;
 b=HNETH0OLfLiShq7AcW+L88ywPZDO8cU6Y6ThAvLx4MoB+YWrRf4Pq3xMYOjS9nJaXc
 xBlPQl402XFA9l/GEHmI6/aO7otQIMfCwyOr7vmJqqrDEq6txh7URe5y1rslCUt0zxlb
 0wXm1NL3Xfk5BgOArWcqNvWYkI3cXlvm1+02gz0SAOaAH2HtLpUMNYj8MDgci0ReAMzd
 k92/kisjqNKvdGAu8ElYjtP4vzwCT+B5O4oZBfPvw+2NqKWiv/fjvJsiXjm+3o4ng0Ow
 KC9niJ3R00A0lG9mwUg0Y1cX8PXFBgdA10W5FciKCTemu4pRML51RMcREDN1+IIt1fde
 blYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFns5/VsmEuhW6BFWribM/FHEmMkehdcNDcB3HXxuuw=;
 b=tqeON3fLKEeT/Wt5w+9PjfbtuQCj2gG5GFpdpgW1TMipo4dZN8RG67g5MtvQxS/nBf
 jr1+2OTlYhA0UabzS4lW9c2arSlyFM0sjczQ62Ilk8uj4xN0Bphqp2g8FN20skB8qILZ
 lv90WAECCaZyqwv9/2O8jAmjxAUwGRmN6Q1ZBYcTWq1tKlDKv77liZ4SkOK5a8cq55H0
 fCC4XEYu0EURCgvEfKfAaSJcjNIk78+M/LBrI3F06ewsPshpjqgBnujGhb22GKaGBgGS
 AdEJP5xZq89Y80WuhWCLpSEqwgbM2TVstQeCz7DIySdJiYB20uVY/mc5uxxcBiEL8Hvd
 PzCg==
X-Gm-Message-State: AOAM532CGhD1NI1Qcj+gYUBFx6Yqdln4b2rtTfBDFc+S/BcAi4zY9SES
 ViYbLgXvgSgsmmXtlg1aiCxH+tZjGZieGNnZy2s=
X-Google-Smtp-Source: ABdhPJzxZgX8TOkf06ULjK9UhatMG6bwCZGoTYAzSH7DAex31IQ5gsrlyM/5e/vVr5Nvm8eb9Y29b5AE65ZU6gtJ7wU=
X-Received: by 2002:a63:a847:: with SMTP id i7mr21248455pgp.203.1619525431391; 
 Tue, 27 Apr 2021 05:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>
 <YIfwZ/oPVB9splQq@kroah.com>
In-Reply-To: <YIfwZ/oPVB9splQq@kroah.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Apr 2021 15:10:14 +0300
Message-ID: <CAHp75VdkPWKVSYmYqerMs=6BpkS81KcL9DnYGL5XbkMm-rrW9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] fbtft: Replace custom ->reset() with generic one
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: linux-staging@lists.linux.dev,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 2:09 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Apr 16, 2021 at 05:20:41PM +0300, Andy Shevchenko wrote:
> > The custom ->reset() repeats the generic one, replace it.
> >
> > Note, in newer kernels the context of the function is a sleeping one,
> > it's fine to switch over to the sleeping functions. Keeping the reset
> > line asserted longer than 20 microseconds is also okay, it's an idling
> > state of the hardware.
> >
> > Fixes: b2ebd4be6fa1 ("staging: fbtft: add fb_agm1264k-fl driver")
>
> What does this "fix"?  A bug or just a "it shouldn't have been done this
> way"?

There is nothing to fix actually, it's rather a pointer where this
change has been missed for some reason. I'll remove the tag.

> And as others pointed out, if you could put "staging: fbtft:" as a
> prefix here, that would be much better.

Got it, thanks!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
