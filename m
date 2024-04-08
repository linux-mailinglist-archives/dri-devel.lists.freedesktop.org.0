Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53F89BB27
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D42112310;
	Mon,  8 Apr 2024 09:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="mC7Ub3I/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FEA112310
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:03:35 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-78d44fc73c5so96292585a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712567014; x=1713171814;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2IC/HIheh5QVM3Z0m3XyNIldq+Pet/IJYQah2gajnbg=;
 b=mC7Ub3I/vjXW6vGaU7eaToKE1mL2MXPiQdChdpbZAjiCuEfnZW5pVLWvgtMQLLqKg+
 6DvG6VLzXJ0BHJ8UrSo2QuGaqW2fm5EkS+YdaUqw5eRXvs3fRYu07AZ1vAQlLzZsq5K+
 Ds8nBqhXrLohLsfk6uR9V1CjjCAgrmaI+Tj0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712567014; x=1713171814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2IC/HIheh5QVM3Z0m3XyNIldq+Pet/IJYQah2gajnbg=;
 b=vdv0k3WagFtLFG7vuCIuM39tstszEd1KYm0Q/shJEl/I/ZvjzZ+bAX6a3BQkSPCA0o
 PeW2eQnIqTu3G94KucNhWqgvAhxgGXcQsCVHk14q903Rheix7c3zLTpRPDN5qS/CLFur
 7W3mKnYRLOj5ZISuvxQNRn3Qboj2C3yKBHoDMUO7ToPtmYz6l1xvjhOytuRFZAXacobm
 lChjcw+L+CNSppezlZipsICgodWJJE+UVtvsnMwVavUswzxD26UbVfTuEOoDdeQDDOSj
 7tEiVbzOIeJWq02iXsI0sUtYEIUdvRBNy7lTxmZM33ibbHoSKSyYOnBSV+qQHPSdMvEr
 s46Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs7ke1F8jkovwdz0bH/hcPPN2balYcbuizAjEEXqC+SIHkH/LtUy35q1O2JaJYSrIGlgTe+Rqf+R+f2nyVNScmkGMvThAwfAyToF+94V0z
X-Gm-Message-State: AOJu0YzwTQqTDUMuVQHpVtPVuu05CgnI3qmDOoMbnc40s8Hm4DwkA9ov
 liRvsJguoGbDLmaCk+OpCdQI/FZbxvbB2TmcAnNVQY77toS2EnLs1gfDExnXT3MB25AX4w8Vz6W
 57g==
X-Google-Smtp-Source: AGHT+IHznT1Z/+MIPHOspbhZiftF2ookw1Rrxt4bfpcNP04RCz9l4XNcDG3DVmaQ2SANKBLJmROImQ==
X-Received: by 2002:a05:620a:91d:b0:78b:e922:c38 with SMTP id
 v29-20020a05620a091d00b0078be9220c38mr8281530qkv.64.1712567013726; 
 Mon, 08 Apr 2024 02:03:33 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 j4-20020a37ef04000000b0078bcc4b72adsm3032391qkk.124.2024.04.08.02.03.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:03:33 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43477091797so287421cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:03:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8uCwucMfh/7slrRkVeoSwbOUS+pzsd8UAZKVDdU3b+Zsvsi1DeYsciiqxtcSwS9/DUd5uzh/Rcwc0yKO2RmwrYF2eG9mA3VinE5fxI+Ld
X-Received: by 2002:a05:622a:4812:b0:434:7bb9:f231 with SMTP id
 fb18-20020a05622a481200b004347bb9f231mr289728qtb.12.1712567012530; Mon, 08
 Apr 2024 02:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240408073623.186489-1-j-choudhary@ti.com>
In-Reply-To: <20240408073623.186489-1-j-choudhary@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Apr 2024 02:03:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V6vUgcPn0zhA+9k4cHVpqqeSVCSJG23XEE5KMAHUCCoQ@mail.gmail.com>
Message-ID: <CAD=FV=V6vUgcPn0zhA+9k4cHVpqqeSVCSJG23XEE5KMAHUCCoQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix ti_sn_bridge_set_dsi_rate
 function
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, mripard@kernel.org, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, andersson@kernel.org, 
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 8, 2024 at 12:36=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Due to integer calculations, the rounding off can cause errors in the fin=
al
> value propagated in the registers.
> Considering the example of 1080p (very common resolution), the mode->cloc=
k
> is 148500, dsi->lanes =3D 4, and bpp =3D 24, with the previous logic, the=
 DSI
> clock frequency would come as 444 when we are expecting the value 445.5
> which would reflect in SN_DSIA_CLK_FREQ_REG.
> So move the division to be the last operation where rounding off will not
> impact the register value.

Given that this driver is used on a whole pile of shipping Chromebooks
and those devices have been working just fine (with 1080p resolution)
for years, I'm curious how you noticed this. Was it actually causing
real problems for you, or did you notice it just from code inspection?
You should include this information in the commit message.

I'm travelling for the next two weeks so I can't actually check on a
device to see if your patch makes any difference on hardware I have,
but I'd presume that things were working "well enough" with the old
value and they'll still work with the new value?


> Also according to the SN65DSI86 datasheet[0], the minimum value for that
> reg is 0x08 (inclusive) and the maximum value is 0x97 (exclusive). So add
> check for that.

Maybe the range checking should be a separate patch?


> [0]: <https://www.ti.com/lit/gpn/sn65dsi86>
>
> Fixes: ca1b885cbe9e ("drm/bridge: ti-sn65dsi86: Split the setting of the =
dp and dsi rates")

Are you sure that's the commit you're fixing? In the commit text of
that commit I wrote that it was supposed to "have zero functional
change". Looking back at the change I still believe it had zero
functional change. The rounding error looks like it predates the
patch.

As far as I can tell the rounding error has been there since commit
a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver").


> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

It's great to see a TI engineer contributing to this driver! Awesome!


> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 48 +++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 84698a0b27a8..f9cf6b14d85e 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -111,7 +111,14 @@
>  #define  AUX_IRQ_STATUS_AUX_SHORT              BIT(5)
>  #define  AUX_IRQ_STATUS_NAT_I2C_FAIL           BIT(6)
>
> -#define MIN_DSI_CLK_FREQ_MHZ   40
> +/*
> + * NOTE: DSI clock frequency range: [40MHz,755MHz)
> + * DSI clock frequency range is in 5-MHz increments
> + * So minimum frequency 40MHz translates to 0x08
> + * And maximum frequency 755MHz translates to 0x97
> + */
> +#define MIN_DSI_CLK_RANGE      0x8
> +#define MAX_DSI_CLK_RANGE      0x97

It's a little weird to call this min/max and have one be inclusive and
one be exclusive. Be consistent and say that this is the minimum legal
value and the maximum legal value. I think that means the MAX should
be 0x96.


>  /* fudge factor required to account for 8b/10b encoding */
>  #define DP_CLK_FUDGE_NUM       10
> @@ -820,22 +827,37 @@ static void ti_sn_bridge_atomic_disable(struct drm_=
bridge *bridge,
>         regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABL=
E, 0);
>  }
>
> -static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  {
> -       unsigned int bit_rate_mhz, clk_freq_mhz;
> +       unsigned int bit_rate_khz;
>         unsigned int val;
>         struct drm_display_mode *mode =3D
>                 &pdata->bridge.encoder->crtc->state->adjusted_mode;
>
> -       /* set DSIA clk frequency */
> -       bit_rate_mhz =3D (mode->clock / 1000) *
> -                       mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> -       clk_freq_mhz =3D bit_rate_mhz / (pdata->dsi->lanes * 2);
> +       /*
> +        * Set DSIA clk frequency
> +        * Maximum supported value of bit_rate_khz turns out to be
> +        * 6040000 which can be put in 32-bit variable so no overflow
> +        * possible in this calculation.

The way you've written this comment makes me worried. You're saying
that the only supported result of the math has to fit in 32-bits so
we're OK. ...and then _after_ you do the math you check to see if the
clock rate is within the supported range. It makes me feel like you
could still overflow.

I think your comment here should say something like:

The maximum value returned by mipi_dsi_pixel_format_to_bpp() is 24.
That means that as long as "mode->clock" is less than 178,956,971 kHz
then the calculation can't overflow and can fit in 32-bits.

If you wanted to be really good you could even put a check earlier in
the function to make sure that mode->clock wasn't something totally
crazy (could confirm it's < 100GHz maybe?) so you absolutely knew it
couldn't overflow.

> +        */
> +       bit_rate_khz =3D mode->clock *
> +                      mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
> +
> +       /*
> +        * For each increment in val, frequency increases by 5MHz
> +        * and the factor of 1000 comes from kHz to MHz conversion
> +        */
> +       val =3D (bit_rate_khz / (pdata->dsi->lanes * 2 * 1000 * 5)) & 0xF=
F;
> +
> +       if (val >=3D MAX_DSI_CLK_RANGE || val < MIN_DSI_CLK_RANGE) {
> +               drm_err(pdata->bridge.dev,
> +                       "DSI clock frequency not in the supported range\n=
");
> +               return -EINVAL;
> +       }

Shouldn't the above be in atomic_check()? There's a reason why
atomic_enable() can't return error codes.

-Doug
