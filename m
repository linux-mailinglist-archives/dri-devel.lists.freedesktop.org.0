Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E202528D3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74EE6EA36;
	Wed, 26 Aug 2020 08:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D1B6E892
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 09:02:20 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id u24so10972481oic.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ecZcPI7/Sf2QaHnt5CgELAxXcrAGGkNqcsMqK1lVfB4=;
 b=xHKPdF2fYixOmSv2xi/QN72gXFaQ62tcmQeB1kihvvEW7ovkTOv3AxUEXQFIM/kk34
 uaNMWV6BbQQvT6tp1eU8hYpjYUAxYWbxh01HVE06HK3fvSee7t85yr3WF7sXkoADaX8s
 Bj2Lt0BhWUAf6ofcwjRW+vyB2/cPsu3Mv9C3pYe4n5tpU+mUZ/jn2SgxGWzyE9ntwcT9
 v4wxmTKXS9cRIYI9jSRzvGtGefk7QxXy9kBgvFI/i7Sd6RGYfnzHeZ2RR4xnJpz6zYnT
 JEww+u6lHVdVIX2rX5bU28FzA4DL/fCXh9ZyMCwb+dFg8Z+8dB6WPCicc2SE5cqH3h2Y
 GE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecZcPI7/Sf2QaHnt5CgELAxXcrAGGkNqcsMqK1lVfB4=;
 b=GjaMsTX7+6S5vpy6fEFDKRiS0L+CS65EWKyVBXj2uz2c5gniEJBMmdc75ETmR0YZ1A
 hXoTPqNk0RQN924Yz3zAfRv5pckKmkYAVfRK4m/6SAJZtSY//ho6NNyegjDNxr88VnuA
 QIyRjKixZAoHp8pv8TARXB/7UWy0wo6EMA4azz0rHAi9NB0JXMU67Zqc3u9SEiKHXDe1
 p3k5NaZYED6Y0puOJYqAjHjWrzTQPaA1njJY+r0Z0nUHeUF3+qHqCjAdXRMOzK/QglZR
 fjbtHtUwdjWONnEaOyuHB+iUaTUpK/KfFj5qkHoXZf2Ua+ckQ/9/iDpu41E3Qg54USCx
 oibQ==
X-Gm-Message-State: AOAM5337rlM5zFGx0d2eCFs9GFjDpx88hiEVCSmRZv0kEEAaZhHmLqU6
 y7gZkq4LSqdnWJXjG2nUTstLR9JV80Bj9oGVKd8XaA==
X-Google-Smtp-Source: ABdhPJwwiFD4pBHewOtnzV/X5MtjNH663zCRpk0ncltSp+zcIRGso9TBIJYwFINA0I6H+hJQg4l8D4OJycQ/WqLqmYs=
X-Received: by 2002:aca:d8c5:: with SMTP id p188mr422064oig.47.1598346139780; 
 Tue, 25 Aug 2020 02:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824211125.1867329-1-jhubbard@nvidia.com> <20200825083204.GA2068961@jade>
 <1f111bb4-6e93-93d5-66ff-b9d4d456140f@nvidia.com>
In-Reply-To: <1f111bb4-6e93-93d5-66ff-b9d4d456140f@nvidia.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Aug 2020 11:02:08 +0200
Message-ID: <CAHUa44FnAmK-Qm+AQ8SqqHPZSRrmp4oOichp5yO212b3y_LAJg@mail.gmail.com>
Subject: Re: [PATCH v3] tee: convert convert get_user_pages() -->
 pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 25, 2020 at 10:54 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 8/25/20 1:32 AM, Jens Wiklander wrote:
> > On Mon, Aug 24, 2020 at 02:11:25PM -0700, John Hubbard wrote:
> ...
> >> OK, one more try, this time actually handling the _USER_MAPPED vs.
> >> _KERNEL_MAPPED pages!
> >>
> >> thanks,
> >> John Hubbard
> >> NVIDIA
> >
> > Looks good and it works too! :-) I've tested it on my Hikey board with
> > the OP-TEE test suite.
> > I'm picking this up.
> >
>
> Great! I see that I have, once again, somehow doubled up on the subject line:
> "tee: convert convert ...". This particular typo just seems to stick to me. :)
>
> If you get a chance to fix that up by changing it to just a single "convert"
> I'd appreciate it.

Sure, no problem.

Cheers,
Jens
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
