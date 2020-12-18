Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FBA2DE201
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 12:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B320F6E09C;
	Fri, 18 Dec 2020 11:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ECE6E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 11:30:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c5so1760844wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llHW0DBcsKI4xlBf5BlOjoI6hCuZnmrZ4dlRgFFGbPI=;
 b=hn0pAdnsaIXVrnwj/Tky6J7bEbs1Dk4WuING5W/EnDn+19RWSVIF2VylblcK6A5SUx
 w2gKVOsEDpjx1+iVK6Y8sBIOzqvDfWr7sljsMVxXUvKogzbJ6gye93m3jRjP5zi9EVyF
 kH9Ymlf2/OPpwFI647e+04mUG1zeLr+xGdls6EmLnB3rpgYjhSyajYgc/JDXXORyqRJw
 xkSkNXd99kDxZrmjnDTNRGDpXYSbXN9bzUb8rIGILCk5rDSYojiihMu2BXLq4nVvGdlG
 8kbaEWh0pZrf34hY1r6ivf/HDX8Qz0YrardDH9Sap1PR7mk6WIgkOBH6fDzlCxI0850L
 axEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llHW0DBcsKI4xlBf5BlOjoI6hCuZnmrZ4dlRgFFGbPI=;
 b=uaR2KpvWU4Ly6Q4UXxPgv0rGjm8W7YhvM3B7Lk2ZPi5x6G00ukNiwDaPesU+xmmSqH
 W2Eaafs35MjGPFHARhXO6wseypkxwbfbCr/cmRzVQAqJ9Id5bziFtOauwp7MQa8bXrSv
 DLJ+I8b4B12TxJIfCj/oGryZYTqJVWaYwdmRUfIWR4ipUZHKX4qzqohQD4oggJSo71IO
 dXDs9CCWax3a7589FJJniifD5acDXiELaCFHeUuC8fs070ks8yqd2cTdtiZgsOkWno0H
 TyRbiEeYI3LcqwmUOADKj9XANo5b60pPhhHGW9dV+R2TrEkNuWUjT7X4T30oTptfdFUF
 Rh/A==
X-Gm-Message-State: AOAM531lOyeMxLgJfOR66lbifkFeEfZUIKG1YYDdJJMwkCw+ajAQ6C2F
 4Pk4QkGOpxYoaiBua3OcfQisGSpfut7vi2RDlApzWw==
X-Google-Smtp-Source: ABdhPJxZF8SJF7CsKrXSTDuPSneEb5qdd88m5GlPMZHcvG8QdlWyN9NbnpjKwA6hdXbEcaT5QG19TjRA6QE8HXzoxGk=
X-Received: by 2002:adf:d18a:: with SMTP id v10mr3865608wrc.273.1608291044405; 
 Fri, 18 Dec 2020 03:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-7-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-7-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 11:30:27 +0000
Message-ID: <CAPY8ntBySziAsVk+UDP9myF-zA5bUmWcYVUGir3e=_o_DhQsjg@mail.gmail.com>
Subject: Re: [PATCH 06/15] drm/vc4: hdmi: Compute the CEC clock divider from
 the clock rate
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Jason Cooper <jason@lakedaemon.net>, David Airlie <airlied@linux.ie>,
 Marc Zyngier <maz@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 10 Dec 2020 at 13:47, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The CEC clock divider needs to output a frequency of 40kHz from the HSM
> rate on the BCM2835. The driver used to have a fixed frequency for it,
> but that changed and we now need to compute it dynamically to maintain
> the proper rate.
>
> Fixes: cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate depending on pixel rate")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

(To be a total pedant it's still a fixed frequency on vc4, but it's
configurable via the variant entry).

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index eff3bac562c6..0c53d7427d15 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1586,6 +1586,7 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>  {
>         struct cec_connector_info conn_info;
>         struct platform_device *pdev = vc4_hdmi->pdev;
> +       u16 clk_cnt;
>         u32 value;
>         int ret;
>
> @@ -1611,8 +1612,9 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
>          * divider: the hsm_clock rate and this divider setting will
>          * give a 40 kHz CEC clock.
>          */
> +       clk_cnt = clk_get_rate(vc4_hdmi->hsm_clock) / CEC_CLOCK_FREQ;
>         value |= VC4_HDMI_CEC_ADDR_MASK |
> -                (4091 << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
> +                (clk_cnt << VC4_HDMI_CEC_DIV_CLK_CNT_SHIFT);
>         HDMI_WRITE(HDMI_CEC_CNTRL_1, value);
>         ret = devm_request_threaded_irq(&pdev->dev, platform_get_irq(pdev, 0),
>                                         vc4_cec_irq_handler,
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
