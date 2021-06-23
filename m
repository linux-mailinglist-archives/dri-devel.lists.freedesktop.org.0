Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06A3B2385
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 00:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 901B96E93F;
	Wed, 23 Jun 2021 22:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21966E93F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 22:20:10 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id j6so1678679qvp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 15:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0o69ZpxKlT1ALV6x4fn+6s1AcHCCKWZKDnuPxJmTV0=;
 b=M32nuub7utJPjcnDhjTbeGhLaiYx37NognHb9zlFGO8qCxvDDxHTaeDCkfycW8V9jJ
 l2LomWfxefoSUGDPirxMjo4GLgReQ2P2qYRSoj0lm1y5X1zu1ZesG703lbfwrtAcTVv9
 cQ+dlMT0m3s2+Yg7gerWlJcWOAHGpKbzOjNgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0o69ZpxKlT1ALV6x4fn+6s1AcHCCKWZKDnuPxJmTV0=;
 b=SiXNjIgGCNBzbEx6YCrlaBEtEXKuGQ9E5F0ovycn+w2GgZvEYwdsv5qPq7D76+YgYB
 QSe4OUP2U7iTNmJ15ulMMCXFQm4Pf30NYr2kRGFsmJJtDlcTpdxYDZNgWHSY4OL4GDBj
 KRlOe2LD5LSiZrDWdspJfwYaqTkyQwDeSfsVcfCutYV8cAhAtnffmRLfq/B2rfwTRB83
 VGdosZd+yjszutmwf/GYHpTRcTNebltrfY+ioxKbn6tGwj1bDFAhnx6XC/XjmeLILf53
 5hGm7WtEStKR8wom8hnd7O7EMOXcnTUDVRvnLWc3djBq3YRgX6ifs0zY1/ZfR0kwylOT
 A15Q==
X-Gm-Message-State: AOAM532FhXsumSHkOMtF9GHiCcalgYo2vDToPqM8xRWe82iCjWVN4pkG
 c4e27KZH6NUPHf7d7pFFD7hcJa5IUPDn9g==
X-Google-Smtp-Source: ABdhPJw4Xd+F/ePpd4L3Ujr2NbChAlX6WiXuhgq9d5GwKVeDpGI1hH16MVkR7U166UGnD/VytNsagg==
X-Received: by 2002:a0c:eb8d:: with SMTP id x13mr2080261qvo.5.1624486809235;
 Wed, 23 Jun 2021 15:20:09 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
 [209.85.222.182])
 by smtp.gmail.com with ESMTPSA id y20sm811102qtv.64.2021.06.23.15.20.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 15:20:08 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id q190so9325078qkd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 15:20:07 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id u184mr393689ybb.343.1624486807505; 
 Wed, 23 Jun 2021 15:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210623032755.1170809-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210623032755.1170809-1-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Jun 2021 15:19:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbWu-zK=uuuYRBnddao4X5ELT29L=Dn_mBLG57kzuK4A@mail.gmail.com>
Message-ID: <CAD=FV=VbWu-zK=uuuYRBnddao4X5ELT29L=Dn_mBLG57kzuK4A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pwm: Introduce single-PWM of_xlate function
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: linux-pwm <linux-pwm@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 22, 2021 at 8:28 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The existing pxa driver and the upcoming addition of PWM support in the
> TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
> thereby a need for a of_xlate function with the period as its single
> argument.
>
> Introduce a common helper function in the core that can be used as
> of_xlate by such drivers and migrate the pxa driver to use this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v3:
> - None
>
> Changes since v2:
> - None
>
>  drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
>  drivers/pwm/pwm-pxa.c | 16 +---------------
>  include/linux/pwm.h   |  2 ++
>  3 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index a42999f877d2..5e9c876fccc4 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const struct of_phandle_args *args)
>  }
>  EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
>
> +struct pwm_device *
> +of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)

It's probably up to PWM folks, but to make it symmetric to
of_pwm_xlate_with_flags() I probably would have named it with the
"_with_flags" suffix.


> +{
> +       struct pwm_device *pwm;
> +
> +       if (pc->of_pwm_n_cells < 1)
> +               return ERR_PTR(-EINVAL);
> +
> +       /* validate that one cell is specified, optionally with flags */
> +       if (args->args_count != 1 && args->args_count != 2)
> +               return ERR_PTR(-EINVAL);

I don't know all the rules for attempted forward compatibility, but
unless there's a strong reason I'd expect to match the rules for
of_pwm_xlate_with_flags(). That function doesn't consider it to be an
error if either "pc->of_pwm_n_cells" or "args->args_count" is bigger
than you need. Unless there's a reason to be inconsistent, it seems
like we should be consistent between the two functions. That would
make the test:

if (args->args_count < 1)
  return ERR_PTR(-EINVAL);


> +
> +       pwm = pwm_request_from_chip(pc, 0, NULL);
> +       if (IS_ERR(pwm))
> +               return pwm;
> +
> +       pwm->args.period = args->args[0];
> +       pwm->args.polarity = PWM_POLARITY_NORMAL;
> +
> +       if (args->args_count == 2 && args->args[2] & PWM_POLARITY_INVERTED)

Similar to above, should this be ">= 2" rather than "== 2" ?

I also notice that in commit cf38c978cf1d ("pwm: Make
of_pwm_xlate_with_flags() work with #pwm-cells = <2>") Uwe added a
check for "pc->of_pwm_n_cells" in of_pwm_xlate_with_flags() right
around here. You're not checking it in your function.

I _think_ your code is fine because I can't see how "args->args_count"
could ever be greater than "pc->of_pwm_n_cells" but maybe I'm not
seeing something. Assuming your code is correct then maybe the right
thing to do is to remove the extra check from
of_pwm_xlate_with_flags() to make the two functions more similar.


-Doug
