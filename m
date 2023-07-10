Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846FA74CA41
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836C210E0AE;
	Mon, 10 Jul 2023 03:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC5210E0AE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:13:55 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-76c64da0e46so122172039f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jul 2023 20:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688958834; x=1691550834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0f/movtZorEjzM+r+LRTHIo16m8aSFE9mANkKWC//k=;
 b=DCu8m6Lgc3fN0s/umvG5QaoJejb15A7VhtGNn26yIUaP9CbiHAO6VhMIjCjM/NAbYt
 soZzFtvp/tERAWjE2/CROXgSbcmahjxIWXdH59dgHCGBawCTgANsfqHUTlOnssHQgMxI
 1F0rLYp/xA4XFeD1Pu1bpB69S1z7GYvNG/XR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688958834; x=1691550834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0f/movtZorEjzM+r+LRTHIo16m8aSFE9mANkKWC//k=;
 b=IIt9Eul8HC/r/bflKzsYUYu2l16In6Lk7lbG0flEbSlTzD2PvWoaFaRSpOmZ3K9xVt
 YOXgz81zrKskIONO6GCeRu1UJSAcxrjDJoFMh4BnhGriuLo/7kCAxIv5IAlkDQfSXwju
 C3hgg+jXKnC8p4ouVpoErk2AnSaT1HMktPAwOO11gK364NJUhsNsrLjhdHF24VKRKPWG
 wu7i1JmoXz4X2xqVHhns03vI+F3VUwCZk73NGz0vgMFFejg3lXqBvy77vy/6ACkcDY+F
 c8+FtavNDEIC1nRHHkCYVP/F5/wgTuXZGgeRgd1ERYJd00oqRhrVgtoeCdr6hqWZpNEi
 /7/A==
X-Gm-Message-State: ABy/qLbw0qm4SpkGX0RiIxWAGK+Kh8ybfyXpcBh2guG4MjSC3mdzL9u8
 pUDVnFDqtXPvlIoIE3/FtovEgHx1EkH8yNwsEjg=
X-Google-Smtp-Source: APBJJlEstU8eaM8HhdRC+BBgKRH2klPl7zQgpOlxWra+fq0/Zdu4iybTB5Whl5JgJ7+ovmrDEl0ZWg==
X-Received: by 2002:a6b:7941:0:b0:766:454e:3cdd with SMTP id
 j1-20020a6b7941000000b00766454e3cddmr9862706iop.20.1688958834067; 
 Sun, 09 Jul 2023 20:13:54 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5eaa0b000000b00785cd25010esm3321961ioe.11.2023.07.09.20.13.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jul 2023 20:13:52 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7837329a00aso121502639f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jul 2023 20:13:52 -0700 (PDT)
X-Received: by 2002:a5d:8f89:0:b0:783:63d6:4c5 with SMTP id
 l9-20020a5d8f89000000b0078363d604c5mr436352iol.12.1688958832360; Sun, 09 Jul
 2023 20:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230709162641.6405-1-jason-jh.lin@mediatek.com>
 <20230709162641.6405-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20230709162641.6405-3-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 10 Jul 2023 11:13:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1njmD1+12dS5x20XLR650nkRpkyM-dKjaierSLknuTPRuw@mail.gmail.com>
Message-ID: <CAC=S1njmD1+12dS5x20XLR650nkRpkyM-dKjaierSLknuTPRuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/mediatek: Fix iommu fault during crtc enabling
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

On Mon, Jul 10, 2023 at 12:27=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> OVL layer should not be enabled before crtc is enabled.
> The plane_state of drm_atomic_state is not sync to
> the plane_state stored in mtk_crtc during crtc enabling,
> so just set all planes to disabled.
>
Please add the "Fixes" tag before your S-o-b.

Regards,
Fei
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/me=
diatek/mtk_drm_crtc.c
> index d40142842f85..51d10e65004e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -410,6 +410,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *=
mtk_crtc)
>                 unsigned int local_layer;
>
>                 plane_state =3D to_mtk_plane_state(plane->state);
> +
> +               /* should not enable layer before crtc enabled */
> +               plane_state->pending.enable =3D false;
>                 comp =3D mtk_drm_ddp_comp_for_plane(crtc, plane, &local_l=
ayer);
>                 if (comp)
>                         mtk_ddp_comp_layer_config(comp, local_layer,
> --
> 2.18.0
>
>
