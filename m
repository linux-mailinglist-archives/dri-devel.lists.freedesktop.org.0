Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E388D390D
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4810E248;
	Wed, 29 May 2024 14:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pB6IFwY3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768F310E248
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:24:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DFDFCE181E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3EFC4AF08
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716992653;
 bh=J9bXQQcn82HRK+7qW7m6UeP+djEwRqb8/xU4UMLW4M0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pB6IFwY30ztTkop+mN+gqUhlht61cokKEB+FnmtCNPjShuNzVxRoyVpUy5F+uvKSP
 LVxl6mfhl8yycI5IQnt+ao4zD1JXkVIEBuiQ4npVHhSrJDNHnKLsvNd+95NVA2X6vc
 042hAPxc5yRCbZySpu2YgdYDEEOMJn6qWjMtnbpQaojJChusEOSFIhkpPwEWKZEXBY
 vmNgpbd7bZ+2P0n/EGS69nYhCkTUce+IuWS1k0zZ2Sm6pp7JKI7InsC7tsHrYjV6bM
 uDWe89M/614xVJQiLkJWD+krYWIeXAD7nIGQgnzmyj1BEtjRT1lpmV7ep8SPH8EE6V
 BVvy0R5PycF9w==
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-62a08091c2bso22648707b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:24:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUC+ovky/wnn1umLfZ4iF0Qg5K7RLNoXjGR+QvF3sx/lZaIbJRGre/TwkjHgzUYfnuF6kIsW/fRJsOx3hWbk2BGvXBc+qpxHncRxA1E3hcL
X-Gm-Message-State: AOJu0YwSXb+VSrzVS2Wg+2X+gFNZ+IomzuJO72FSGEz5KsWkgXJu6cIk
 iEHTTGY4cSd37jS/XjKBXLOJL6TsCMbs9u3nTH/W8f/G231JIErFien+WgdnTY8i86OhZ1fOclf
 CJDzxFLbznx2UguzETRYhj26t/f9Kn2jEDpPZnw==
X-Google-Smtp-Source: AGHT+IG3NrMdq5icXclhouvhAC+oMs3JrM4oAozTU/Nw1dFbZ7HouQs7P6uoTB519YHx+t6MydzqRSiGQGYd3jr6jIg=
X-Received: by 2002:a81:af4a:0:b0:61b:3356:a679 with SMTP id
 00721157ae682-62a08da0b4bmr157789687b3.17.1716992652301; Wed, 29 May 2024
 07:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240318203925.2837689-1-l.stach@pengutronix.de>
In-Reply-To: <20240318203925.2837689-1-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 29 May 2024 16:24:01 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6obSkxwwCfUe81VMYMBeG=Nt-9mPJrZ9WPwyqVoJqthg@mail.gmail.com>
Message-ID: <CAN6tsi6obSkxwwCfUe81VMYMBeG=Nt-9mPJrZ9WPwyqVoJqthg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: analogix_dp: properly handle zero sized
 AUX transactions
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
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

On Mon, Mar 18, 2024 at 9:39=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Address only transactions without any data are valid and should not
> be flagged as short transactions. Simply return the message size when
> no transaction errors occured.
>
> CC: stable@vger.kernel.org
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 6a4f20fccf84..7b0bc9704eac 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -1027,7 +1027,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_dev=
ice *dp,
>         u32 status_reg;
>         u8 *buffer =3D msg->buffer;
>         unsigned int i;
> -       int num_transferred =3D 0;
>         int ret;
>
>         /* Buffer size of AUX CH is 16 bytes */
> @@ -1079,7 +1078,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_dev=
ice *dp,
>                         reg =3D buffer[i];
>                         writel(reg, dp->reg_base + ANALOGIX_DP_BUF_DATA_0=
 +
>                                4 * i);
> -                       num_transferred++;
>                 }
>         }
>
> @@ -1127,7 +1125,6 @@ ssize_t analogix_dp_transfer(struct analogix_dp_dev=
ice *dp,
>                         reg =3D readl(dp->reg_base + ANALOGIX_DP_BUF_DATA=
_0 +
>                                     4 * i);
>                         buffer[i] =3D (unsigned char)reg;
> -                       num_transferred++;
>                 }
>         }
>
> @@ -1144,7 +1141,7 @@ ssize_t analogix_dp_transfer(struct analogix_dp_dev=
ice *dp,
>                  (msg->request & ~DP_AUX_I2C_MOT) =3D=3D DP_AUX_NATIVE_RE=
AD)
>                 msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
>
> -       return num_transferred > 0 ? num_transferred : -EBUSY;
> +       return msg->size;
>
>  aux_error:
>         /* if aux err happen, reset aux */
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
