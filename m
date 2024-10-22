Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F0D9AA298
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 14:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204B410E693;
	Tue, 22 Oct 2024 12:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8u4EqJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101A510E68E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:59:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2C255C5B37
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD85C4CEE9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729601957;
 bh=mIEKpBgOrB0FNODaNUzKqQ4blGh+DPNU0es/6NTXQLM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y8u4EqJC2Ld6+xAmGmsDoevkZ9GV8jsXHyWhzMkQuCPUlVgGwGW3IkhegUZ8qmDFg
 KJklfC25WYGR2pyDl7Kf1Fi1crOKTBdmqkCIeQwSI06Dqw04h535xUpSZ9/Vn5QjWL
 jUhspehnN9f9d3z4X+3I7TD8KQXReTvtuIR6aX+glkBIHKyolHebOLS4kogHDwv88g
 JGhdQDKYEsCybYz6/EromjgQZ7oRA/5CAD6Rf+jbV6NdI94MWGmSIxynsJ6vBe1j4p
 J+Se9/fwrv+ANF4TYCPRIBiwlj0laBV4KdlMCztK3NS3algYSWMiwdxtG9evOv9WSq
 juXDqpOoIVijg==
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2e2ed2230d8so4126806a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 05:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjT7Ym/SfXy6w426x7CPdbQc1Zr0A4dtKJMfp5Cat93AMjDGWo4sHlZEnY3t+Robn5Sy4DTKMiUwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPK/2i26hKThsDiVcDcT++2kx1RleSbO+rz/94xYZT6OwcfROb
 baXtmDrNVYB8UrMvkqCmcMCNHtnVI/xY/Leje6FW+GXC7B67kh++1S72U41QLPQ5hLqwMZbSEDm
 XwPk56hZltooNPTN+i7ZVSX9J7w==
X-Google-Smtp-Source: AGHT+IEz/fNKcgr+pPCPCQ70QsyRbpxSrHWljw6enWHdqVQbK33wZ/ouEzLGpZFmchdgpySyLi47Yl8GmCTU0qpkJZM=
X-Received: by 2002:a17:90a:a615:b0:2cf:c9ab:e747 with SMTP id
 98e67ed59e1d1-2e5616c4300mr17536808a91.1.1729601957323; Tue, 22 Oct 2024
 05:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
In-Reply-To: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 22 Oct 2024 20:59:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9O9BPz0jhd4xM=vMmKZyhYdyOMi2mVhU41Ch2y9pmibg@mail.gmail.com>
Message-ID: <CAAOTY_9O9BPz0jhd4xM=vMmKZyhYdyOMi2mVhU41Ch2y9pmibg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org
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

Hi, Hsin-te:

Hsin-Te Yuan <yuanhsinte@chromium.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:17=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v3:
> - Add missing Reviewed-by tag
> - Link to v2: https://lore.kernel.org/r/20241016-color-v2-1-46db5c78a54f@=
chromium.org
>
> Changes in v2:
> - Clarify that the commit get fixed was intended to be a no-op cleanup
> - Fix the typo in tag
> - Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@=
chromium.org
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9=
cf7864728dcb63b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -65,8 +65,8 @@
>  #define OVL_CON_CLRFMT_RGB     (1 << 12)
>  #define OVL_CON_CLRFMT_ARGB8888        (2 << 12)
>  #define OVL_CON_CLRFMT_RGBA8888        (3 << 12)
> -#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
>  #define OVL_CON_CLRFMT_UYVY    (4 << 12)
>  #define OVL_CON_CLRFMT_YUYV    (5 << 12)
>  #define OVL_CON_MTX_YUV_TO_RGB (6 << 16)
>
> ---
> base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
> change-id: 20241015-color-e205e75b64aa
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
