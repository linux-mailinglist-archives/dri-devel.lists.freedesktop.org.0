Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410166F885A
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 20:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D72210E050;
	Fri,  5 May 2023 18:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146AE10E050
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:03:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 917CE63FC7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB03C433AC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683309835;
 bh=6CQmJHAWv2zDJ+V7xR9gAKn2jhIg2rUcA8a989LpS1c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bGPkNtKVKiU+1j6F2yY+dwXD54ldT1TDiGkj60HMKi2Xr893dwH+9aR3dQKrQ/Ky2
 EGFOUnudWAU31098IkprQQ+jflV1seZ6anJl7ZS5NXtO5EJ9xvhkDO8cGGjvsMMl02
 p9ngwx3PzUp8UkfsPGU/EkABrp+CQ+KuDb/tjMXzgy2KCkNmkKjfhzX8od0CA2/1S5
 QgOIu9iqp/dSOTE5FfYByitMahjYhRizQRI4lCNbVd8CtgUkghZQZSluOOnoVoAzh5
 t75LwFzgZn3+EFUPoHc/tEisfR23JLb2YZZpZkpqrr+HNW13oSRgeihtqW+MV5iK/R
 A6nYiy63cBFnQ==
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-24ded4b33d7so1478810a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 11:03:55 -0700 (PDT)
X-Gm-Message-State: AC+VfDy0VefARCnCm5A6FeIdzDLUkhUgm+ZPOObUlBAGloibxO4miBXV
 MQ+a7GPXkHxd3quDPN/O/IaxG3oMUlb+gqgd1K1W8w==
X-Google-Smtp-Source: ACHHUZ6GhU4tZQ4aNyZmwtwzcljwMUMcubqi7oUVmu04qxww0SbT48JgMoCp4Jsh0NuyJYzoTY/2qec9nohy44O1dQ4=
X-Received: by 2002:a17:90a:9112:b0:24e:2d3:a404 with SMTP id
 k18-20020a17090a911200b0024e02d3a404mr2416525pjo.4.1683309834972; Fri, 05 May
 2023 11:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230427142934.55435-1-francesco@dolcini.it>
 <20230427142934.55435-8-francesco@dolcini.it>
In-Reply-To: <20230427142934.55435-8-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 5 May 2023 20:03:44 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6VuPQuH1LRMFGKs6f6NzTrFZcjtw+GUx-P2CpdbEbdxg@mail.gmail.com>
Message-ID: <CAN6tsi6VuPQuH1LRMFGKs6f6NzTrFZcjtw+GUx-P2CpdbEbdxg@mail.gmail.com>
Subject: Re: [PATCH v1 7/9] drm/bridge: tc358768: fix TXTAGOCNT computation
To: Francesco Dolcini <francesco@dolcini.it>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 4:35=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Correct computation of TXTAGOCNT register.
>
> This register must be set to a value that ensure that the
> TTA-GO period =3D (4 x TLPX)
>
> with the actual value of TTA-GO being
>
> 4 x (TXTAGOCNT + 1) x (HSByteClk cycle)
>
> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index 36e33cba59a2..854fc04f08d0 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -795,7 +795,7 @@ static void tc358768_bridge_pre_enable(struct drm_bri=
dge *bridge)
>
>         /* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
>         val =3D tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
> -       val =3D tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
> +       val =3D tc358768_ns_to_cnt(val, dsibclk_nsk) / 4 - 1;
>         val2 =3D tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibcl=
k_nsk),
>                                   dsibclk_nsk) - 2;
>         val =3D val << 16 | val2;
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
