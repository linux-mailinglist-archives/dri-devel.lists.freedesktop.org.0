Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897D62DE1E4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 12:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE2A6E0D5;
	Fri, 18 Dec 2020 11:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EE46E0D5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 11:21:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d13so1707926wrc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0NUjTMUcVO0qCGXSkD6m+wQ/vz/jVZRScuhTw7dmgyQ=;
 b=WDbuL0avnM8ZM5Ifop4nzsFT0UVBrCayTg2OQ/wcpBNbBsg2t1J4wfT+Xt1526aGMd
 lgR/Y2+eHn7iv2bKf37gYC0pfYeJPdICkURqEx1GeTmhvwvzpw9NyB4oLYf+0yWp7vyt
 awyyW4QxHEW7Cj3xRoH6zNAR8yP0XvIYU0fkgiRPQiXr7mlPh5ka9AbBFqodzi4s6wac
 nKx6MJlFJqETKBgl4BjEfl/ms6kpyG6J7D+P6qTZrORgKL3Bz14Rf2HGSjX4jAMUO5/t
 XZ5OTEz5Os+3OKO8pV/btHE0n9NBwMYefYyi6yombnfCrRHH69odnu3DXFz+s/TyBMd5
 OTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0NUjTMUcVO0qCGXSkD6m+wQ/vz/jVZRScuhTw7dmgyQ=;
 b=fxJ2OH8DeuH85eypmnwY0ipHEUn6m+NXzT2Drco5VKV1dhzEcqqEem+1OEkEA1HYXn
 ol7jwgSFvC/8/qYiHTMWJWYQh1a6ZGhM+CDX29NY8I9paUlA2oW9PXVmmAd35J6Dk30d
 8VO+uAcRBTrNEVyTRpKz1ATXhnyWqi7vUzXxnt78D/1WDVWC4j1sFW5oAT8kGD1cnpGx
 +ZWQvSsmbUT11tfviHTGG3yh5YvzxTwiYLnPnfFSKADpEedgORFF4BJKu5/sB3C3o9kO
 M2HW3H+Cfa7cDjJBL+DcZE7EJ9HMgzSrUA7MtGeu1wHeuWO6dKFVVgqZ5nbkqi16TIpu
 u+7A==
X-Gm-Message-State: AOAM530Y5XVK189d8ybYzXr8OjSnkhiWAU3tc3OhIx37kNYcCqIi3e12
 e5HjtfYH2H/NFGVx2xF1b7qt3SyEq4gOecHd8YJBnQ==
X-Google-Smtp-Source: ABdhPJybkChIZsOPvxtUy5vzSoQk4jpCJqUZ7nImjtynHuGJ03k9ybgEfmROhIcueQfPsaFyVblhAdNV8cHWX2SdHy8=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr3952897wrw.42.1608290505273; 
 Fri, 18 Dec 2020 03:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210134648.272857-1-maxime@cerno.tech>
 <20201210134648.272857-5-maxime@cerno.tech>
In-Reply-To: <20201210134648.272857-5-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 18 Dec 2020 11:21:28 +0000
Message-ID: <CAPY8ntC+SFwJNKQB==xSee_zc5UUKJSczsmy7U6gATsN8Xrvmw@mail.gmail.com>
Subject: Re: [PATCH 04/15] drm/vc4: hdmi: Fix up CEC registers
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
 Dom Cobley <popcornmix@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime & Dom

On Thu, 10 Dec 2020 at 13:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> The commit 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout
> abstraction") forgot one CEC register, and made a copy and paste mistake
> for another one. Fix those mistakes.
>
> Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> index 013fd57febd8..20a1438a72cb 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
> @@ -29,6 +29,7 @@ enum vc4_hdmi_field {
>         HDMI_CEC_CPU_MASK_SET,
>         HDMI_CEC_CPU_MASK_STATUS,
>         HDMI_CEC_CPU_STATUS,
> +       HDMI_CEC_CPU_SET,
>
>         /*
>          * Transmit data, first byte is low byte of the 32-bit reg.
> @@ -199,9 +200,10 @@ static const struct vc4_hdmi_register vc4_hdmi_fields[] = {
>         VC4_HDMI_REG(HDMI_TX_PHY_RESET_CTL, 0x02c0),
>         VC4_HDMI_REG(HDMI_TX_PHY_CTL_0, 0x02c4),
>         VC4_HDMI_REG(HDMI_CEC_CPU_STATUS, 0x0340),
> +       VC4_HDMI_REG(HDMI_CEC_CPU_SET, 0x0344),
>         VC4_HDMI_REG(HDMI_CEC_CPU_CLEAR, 0x0348),
>         VC4_HDMI_REG(HDMI_CEC_CPU_MASK_STATUS, 0x034c),
> -       VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x034c),
> +       VC4_HDMI_REG(HDMI_CEC_CPU_MASK_SET, 0x0350),
>         VC4_HDMI_REG(HDMI_CEC_CPU_MASK_CLEAR, 0x0354),
>         VC4_HDMI_REG(HDMI_RAM_PACKET_START, 0x0400),
>  };
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
