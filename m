Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C28D38AE
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E146113BC6;
	Wed, 29 May 2024 14:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p8HcQ16N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A141113BC9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:06:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AEA360DBC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9646DC4AF10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716991593;
 bh=xpmET28viFR3TkIrXW9pSkeAEoSPmQ/nszpOTyWdkAE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p8HcQ16NxOe8VYg0EAmIgZuY2Tr0jlUy591iQEqoUc26vWFARjUGWS1FbQ46CatfP
 M63gFnzA19JNtrBUolfrRVZ/BS2tTldalee8zalu/Hsrl9vyudAfDIOFs2rGqCwgZp
 PP+yVK0WA1dLN72Tfk7WwzPlJTWKCItQUa8ET8//rbi4ACW22q6jLz2ZwuYUIE4d8J
 MU7wWl/urjs5gaDZcfkd1TTmsoC76yRDbFML8XD51lvkW3nZMzCQR6E3ZRX534Q6/G
 h7zxnjCxWip1JzS6K8COsiS+eO5QGCMEsfjcudi7kPl7+wyK1Zw9MNnMoVN3/jxqgl
 PE0fTzONyenuw==
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-62a0c011d53so21472307b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWQmQN/zffM0ufqmuFlTz3lShBk/OJv2kePgDgHMkgnANX3hhUPWVZq7XTWzPlvcU4viH52jotLdd9h+6qs1z3ntpFkpJ5KaxI3rhU4GqfG
X-Gm-Message-State: AOJu0YyjeGVKxb3UKkj0U5uhA82CXujHz4AV4j8Y7KnZfXo0aWFpGoJj
 VFduKWlv1tpsHXwB6Vr5E3SdVdJDtxt97HOSQkclGv7nJ4AGCaBLKdypKJV+ZKSe9LXhuSVPdPe
 qOdeqP6uTghmoj98xwIhXdRE9OtYJXotVoz9Www==
X-Google-Smtp-Source: AGHT+IFBJyJ5c+nU3TDkR5W3R/2SqCf3C5wlu9+3163jsp7yhDX8h4YZLzfCDcYFu9L37VEIoGKgGbp7JBQ/pg/44OU=
X-Received: by 2002:a05:690c:802:b0:627:7871:e172 with SMTP id
 00721157ae682-62a08fdc095mr172764587b3.51.1716991592506; Wed, 29 May 2024
 07:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
 <20240516062455.106266-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240516062455.106266-4-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 29 May 2024 16:06:21 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4VCnRD7gj0c0feFdfjcRbYVGdud8M=qEit-uGHrnqyTQ@mail.gmail.com>
Message-ID: <CAN6tsi4VCnRD7gj0c0feFdfjcRbYVGdud8M=qEit-uGHrnqyTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/bridge: tc358767: Support write-only registers
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, May 16, 2024 at 8:25=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Most registers are read-writable, but some are only RO or even WO.
> regmap does not support using readable_reg and wr_table when outputting
> in debugfs, so switch to writeable_reg.
> First check for RO or WO registers and fallback tc_readable_reg() for the
> leftover RW registers.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 40 ++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 8874713bdd4a4..04c98ab1991bd 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2086,19 +2086,31 @@ static const struct regmap_access_table tc_precio=
us_table =3D {
>         .n_yes_ranges =3D ARRAY_SIZE(tc_precious_ranges),
>  };
>
> -static const struct regmap_range tc_non_writeable_ranges[] =3D {
> -       regmap_reg_range(PPI_BUSYPPI, PPI_BUSYPPI),
> -       regmap_reg_range(DSI_BUSYDSI, DSI_BUSYDSI),
> -       regmap_reg_range(DSI_LANESTATUS0, DSI_INTSTATUS),
> -       regmap_reg_range(TC_IDREG, SYSSTAT),
> -       regmap_reg_range(GPIOI, GPIOI),
> -       regmap_reg_range(DP0_LTSTAT, DP0_SNKLTCHGREQ),
> -};
> -
> -static const struct regmap_access_table tc_writeable_table =3D {
> -       .no_ranges =3D tc_non_writeable_ranges,
> -       .n_no_ranges =3D ARRAY_SIZE(tc_non_writeable_ranges),
> -};
> +static bool tc_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +       /* RO reg */
> +       switch (reg) {
> +       case PPI_BUSYPPI:
> +       case DSI_BUSYDSI:
> +       case DSI_LANESTATUS0:
> +       case DSI_LANESTATUS1:
> +       case DSI_INTSTATUS:
> +       case TC_IDREG:
> +       case SYSBOOT:
> +       case SYSSTAT:
> +       case GPIOI:
> +       case DP0_LTSTAT:
> +       case DP0_SNKLTCHGREQ:
> +               return false;
> +       }
> +       /* WO reg */
> +       switch (reg) {
> +       case DSI_STARTDSI:
> +       case DSI_INTCLR:
> +               return true;
> +       }
> +       return tc_readable_reg(dev, reg);
> +}
>
>  static const struct regmap_config tc_regmap_config =3D {
>         .name =3D "tc358767",
> @@ -2108,9 +2120,9 @@ static const struct regmap_config tc_regmap_config =
=3D {
>         .max_register =3D PLL_DBG,
>         .cache_type =3D REGCACHE_MAPLE,
>         .readable_reg =3D tc_readable_reg,
> +       .writeable_reg =3D tc_writeable_reg,
>         .volatile_table =3D &tc_volatile_table,
>         .precious_table =3D &tc_precious_table,
> -       .wr_table =3D &tc_writeable_table,
>         .reg_format_endian =3D REGMAP_ENDIAN_BIG,
>         .val_format_endian =3D REGMAP_ENDIAN_LITTLE,
>  };
> --
> 2.34.1
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
