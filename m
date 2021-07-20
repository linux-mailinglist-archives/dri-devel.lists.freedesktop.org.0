Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2173CFE3B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 17:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA486E454;
	Tue, 20 Jul 2021 15:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E810A6E454
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 15:53:22 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id g5so33351813ybu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5QQZTezScXUSK1hKxClSD7E8kmBpVieTuUYv3CsbjlM=;
 b=WS/ww1eK+o2RX3IpQkLE6g9t6uaTqhBlpFyd2xt7MAMzTeh+kU5khWou1+ghHopaX/
 L9seoBmSLQFNL5v4elpcUxFC0b0kxWxhRrX5UgDBIoW0YTnJrVqJuIeOfPRfFuCdsT8x
 7fZgc4cCQhY0sLf5hvrDv1jDgOxOFryYEM+x7jTz6TlSxqUNPyTTfU3pR9P+e08d907J
 EQYehjP31botesPdibStfkWcG6mii+YL8AV6ttiU6vM0Yn2sroiuOTthyy16kQ+K7WeV
 eigM8boPyf0q/FpGRmOFZmJPQmS1o+g6ssvmeELWqEDBrTDQP5SmLCJn3hZBoAgeYPBi
 pfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5QQZTezScXUSK1hKxClSD7E8kmBpVieTuUYv3CsbjlM=;
 b=Uyyi8ZxVHgtm8u7zinkFTINUFRNXFl49/x9ogjsYMYKhx8ivGLrbzKxbjQIy9Sprjc
 iQodOr+ZjWzrFcqzUY0qJAPtsgdkaJqdx0S/b33C5MfmSf35ZctazG8CkzH/PGpdW8Mf
 eS7kppHgxJFRexWSFOBmZ+HjMVscknQlXFikK69IHEMzDReUFMnmhLdekHhjmO6dSg0D
 pWntQ/hltTQTGxw8ilSLwGkaImjm0vEWPFij7nGF955TV+56+9K/FrOPV1Ts5K+0T6bt
 gk6Xn28dlNar4epoQR1eem7DpLTq163786gU7gnq274nz6HOAl/kkrCR/peRZUgYio+t
 ocWA==
X-Gm-Message-State: AOAM530CWmfHmrulc2KDPUeSE5jzD4MApD3cGGFMM69GFac/BMOV5zr3
 e1nXmPoqLoTauL8WixbryBzIwzcy7YPnR7fNANZeyQ==
X-Google-Smtp-Source: ABdhPJxAYGbtAYkzXf5+8WB5j6Fo7AWTmKHNX2QV8ONS5LU3nZ90C64mk/UAgcy2EboN9fBJfaRBO9EjfkS+P5usElE=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr40194337ybi.241.1626796401916; 
 Tue, 20 Jul 2021 08:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210719083534.2949348-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210719083534.2949348-1-daniel.vetter@ffwll.ch>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 20 Jul 2021 10:53:10 -0500
Message-ID: <CAOFGe95qO8Wtkw453nr9SXktBWVXg3Uepv98Nenrgr270tTwKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Check for nomodeset in i915_init() first
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 3:35 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Jason is trying to sort out the unwinding in i915_init and i915_exit,
> while reviewing those patches I noticed that we also have the
> nomodeset handling now in the middle of things.
>
> Pull that out for simplisity in unwinding - if you run selftest with
> nomodeset you get nothing, *shrug*.
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 67696d752271..6fe709ac1b4b 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1199,14 +1199,6 @@ static int __init i915_init(void)
>         bool use_kms = true;
>         int err;
>
> -       err = i915_globals_init();
> -       if (err)
> -               return err;
> -
> -       err = i915_mock_selftests();
> -       if (err)
> -               return err > 0 ? 0 : err;
> -
>         /*
>          * Enable KMS by default, unless explicitly overriden by
>          * either the i915.modeset prarameter or by the
> @@ -1225,6 +1217,14 @@ static int __init i915_init(void)
>                 return 0;
>         }
>
> +       err = i915_globals_init();
> +       if (err)
> +               return err;
> +
> +       err = i915_mock_selftests();
> +       if (err)
> +               return err > 0 ? 0 : err;
> +

Annoyingly, this actually makes i915_exit() harder because now we need
to conditionals: One for "do you have globals?" and one for "do you
have anything at all?".  It's actually easier to get right if we have

i915_globals_init()

/* Everything that can return 0 early */

fully_loaded = true

/* Everything that can fail */

>         i915_pmu_init();
>
>         err = pci_register_driver(&i915_pci_driver);
> --
> 2.32.0
>
