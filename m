Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF071930D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 08:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820E10E218;
	Thu,  1 Jun 2023 06:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C48E10E218
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 06:15:28 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-399e9455e9fso271816b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685600126; x=1688192126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5AYAncawi2IzDVI3CwPeaA8XqKQoz8wwW+NNBZqoDbk=;
 b=RfvcL3MqvqyWTx4XNxYFRUWUKox4Zo6o/2+jRftZmuomegKEg85YBvOjivS2ML23lD
 twyfoY8d4b0DwQolDJBAPxx7rsSlFIqYLdoYfx6qqsFa5K8HlFYW+ImflewoRnaE+h+O
 rRBjDDz6EI74PRnWzHF+bmik0nOrEHG2QrBspHc56jRy+MEp4hsPaN0ipM1wgndTQvHk
 8529mCOt7KitSO5ua1kE11xcq+BiZKnbMihMAlS25XF1YMIE9LJTRF9Y5Vaga18jZR5s
 3RQnp3l4O4JdzxjtgNLKpWgXSso+4bkn+q5m8yBEpQJl6P6Ib+mmQDAkSDF2ncbeSxIH
 vXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685600126; x=1688192126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5AYAncawi2IzDVI3CwPeaA8XqKQoz8wwW+NNBZqoDbk=;
 b=B77zOvIKCndqHo4uZxSpw5A/sfczriWdBlLc/Vd9EQpieu/RpiYJ8laLj8t71X/7nW
 /RzEdHbrGoDRYN5k32Sjz1+/7rL5oeqJ3asX5niPLLY0saOxr93vTwuhhS97Qc6/mPxY
 gTjQ/Zo0ZbJAcrlBeu7MKgYTqTQYrr/ukRT37bTzMpDvO/PualICmXYUeXTnN1nh1z8w
 TJYPCcbfLFEeSK3PVKb2pq4TD2IKBg5XRbp0ErYARVsUc8noeUbZyYLpPKzrtvFBkoik
 rXZLCD/scR3qKl6Tunt1jyehLwSZ/IHHpko1TRVgUA+/Cq8eNXqMqENJobBUsgHg+IG1
 Tnaw==
X-Gm-Message-State: AC+VfDxI4xwbqUXjpraLxoVnMZ/SzQGERsfy1rS9IUK1zjAX8Whex6qm
 6J7jTVt0Xl4C7jNEApekSOH4FMseIy+nNZDs91rgnUtFIOAkKA==
X-Google-Smtp-Source: ACHHUZ58v9yH0zjEx778AqLcwXr5TVngdZB8BtV08G4K/AiDaf9xodPfrzh1gSmnkIHpgxpga7+5zbw0611RDkTa3v0=
X-Received: by 2002:a05:6808:17a8:b0:38e:6cb1:298b with SMTP id
 bg40-20020a05680817a800b0038e6cb1298bmr7651815oib.53.1685600126212; Wed, 31
 May 2023 23:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230531184527.1220305-1-l.stach@pengutronix.de>
In-Reply-To: <20230531184527.1220305-1-l.stach@pengutronix.de>
From: Ying Liu <gnuiyl@gmail.com>
Date: Thu, 1 Jun 2023 14:15:14 +0800
Message-ID: <CAOcKUNWMU6tjWwtnU+COggrr--G19EvZaHrxAp0-0i5dK394jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: lcdif: move pitch setup to plane atomic update
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Marek Vasut <marex@denx.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Thu, Jun 1, 2023 at 2:45=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de>=
 wrote:
>
> The buffer pitch may change when switching the buffer on a
> atomic update. As the register is double buffered it can be
> safely changed while the display is active.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>

It seems that this patch set doesn't show up in dri-devel patchwork.
Not sure why.

> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index 262bc43b1079..bbea44ee7a66 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -314,19 +314,6 @@ static void lcdif_set_mode(struct lcdif_drm_private =
*lcdif, u32 bus_flags)
>         writel(CTRLDESCL0_1_HEIGHT(m->vdisplay) |
>                CTRLDESCL0_1_WIDTH(m->hdisplay),
>                lcdif->base + LCDC_V8_CTRLDESCL0_1);
> -
> -       /*
> -        * Undocumented P_SIZE and T_SIZE register but those written in t=
he
> -        * downstream kernel those registers control the AXI burst size. =
As of
> -        * now there are two known values:
> -        *  1 - 128Byte
> -        *  2 - 256Byte
> -        * Downstream set it to 256B burst size to improve the memory
> -        * efficiency so set it here too.
> -        */
> -       ctrl =3D CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> -              CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches=
[0]);
> -       writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
>  }
>
>  static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> @@ -502,6 +489,10 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc=
 *crtc,
>                 writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
>                        lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
>         }
> +       writel(CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> +              CTRLDESCL0_3_PITCH(new_pstate->fb->pitches[0]),
> +              lcdif->base + LCDC_V8_CTRLDESCL0_3);

The patch subject says pitch setup is moved to plane atomic update,
but it is still set in crtc atomic enable.  Care to improve the subject a b=
it?

With this patch, plane atomic update does the same to set FB address
and pitch.  It looks fine to call lcdif_plane_primary_atomic_update()
here to save some lines, doesn't it?

> +
>         lcdif_enable_controller(lcdif);
>
>         drm_crtc_vblank_on(crtc);
> @@ -611,6 +602,19 @@ static void lcdif_plane_primary_atomic_update(struct=
 drm_plane *plane,
>                 writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
>                        lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4);
>         }
> +
> +       /*
> +        * Undocumented P_SIZE and T_SIZE bitfields written in the downst=
ream
> +        * driver. Those bitfields control the AXI burst size. As of now =
there
> +        * are two known values:

The comment is updated and looks better than the one removed from
lcdif_set_mode().  I'm ok with doing that in this patch, but if it's done i=
n
a separate patch, fine too.

Regards,
Liu Ying

> +        *  1 - 128Byte
> +        *  2 - 256Byte
> +        * Downstream set it to 256B burst size to improve the memory
> +        * efficiency so set it here too.
> +        */
> +       writel(CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> +              CTRLDESCL0_3_PITCH(new_pstate->fb->pitches[0]),
> +              lcdif->base + LCDC_V8_CTRLDESCL0_3);
>  }
>
>  static bool lcdif_format_mod_supported(struct drm_plane *plane,
> --
> 2.39.2
>
