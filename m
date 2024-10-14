Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E499C26A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC9210E3B1;
	Mon, 14 Oct 2024 08:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VIAMMZ3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22D410E3B1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:01:57 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3e5cc4ff23dso1092390b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1728892916; x=1729497716;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QU12UzpgqRbbbtAMZe9QorlWm8OXzhMHZ1TfI8T6l4g=;
 b=VIAMMZ3ovnoCxIrUe4sle6XtNeeysCQs+ROuv3jVUB1js33e5+JdG0wYxFaMM8Xakt
 bOll0Eeu6CWLh3xl8VNiOD5uzqM6WYcHF0AwT1uFLPRA/81vvKRhVOXCoATb51UpuVnX
 Yq2/Rlh6h3IGMxvGubjq/aAkhIwnqxtJvZaKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728892916; x=1729497716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QU12UzpgqRbbbtAMZe9QorlWm8OXzhMHZ1TfI8T6l4g=;
 b=IxP+ZfuN6ymCFItAY+5b8x4GS30/sVSaL/ilDyWqk/K/B+P8iHfvDIn3p28f0gx/yL
 4lHOrWS9AsC+alOcsC6NvTlixykpNnBQJlM9lr73XojX60xb3MZCN/46MvtkCDt977L1
 xZYYF1F5ZIJZnsi21JTx80whgGeIdKqM3DtFC1yeJi5/tjhtguI0IHiHflVYfQwegQv6
 8jiUeroJqVvwjMNRby+21Ut4jgJVsYSLoQCWPJ/VQfG+tbrhurFrxFjflMIKPGCuKpPX
 V79mB66/JP9nRQBFSCwIJQETjrsgVHmCrz54DWEVQJAUuzMrm7XzGX9niFp77UTrBm9g
 QsTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXykDZFuB6hpSvMT8reaaXLjebW446QQXb2wESr1CM6DEx6vcvrlh0lmjG1w2owdiaa9R4XihU5p+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywYwQRaNFwyZotQ+y0J0f+QhoROPXhjbvLssyJX4lCrwRGH0Y0
 RG+tgWsriWTiz1klds6gxQlwQttUjQI4Y1SEMl4DcAc/moO6erLSn/6td+mWJ3dwwB8HZyPO/fM
 =
X-Google-Smtp-Source: AGHT+IHA8Qi9GOC5LMvENz/5+tenFcYSgq+dG/B8HXHAjf+2c2Lib7zWqp+GEEbeX7j6MTAkdgnYHQ==
X-Received: by 2002:a05:6808:3c89:b0:3e3:ce4b:fd6d with SMTP id
 5614622812f47-3e5c90b9e72mr6792639b6e.2.1728892916525; 
 Mon, 14 Oct 2024 01:01:56 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e50a2d6f57sm1893063b6e.26.2024.10.14.01.01.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:01:56 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-716a5b9ee6fso2064631a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCyicOOW7+7BOQxIT2tvql9MIZ+4bm8eqCTMtaBcEmLoCgBc66zPZ8xhcDCPqSCZAeezH1gdOwFew=@lists.freedesktop.org
X-Received: by 2002:a05:6102:6c3:b0:4a3:ddc5:37a4 with SMTP id
 ada2fe7eead31-4a465992f5fmr6744394137.11.1728892506439; Mon, 14 Oct 2024
 00:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240923132521.22785-1-liankun.yang@mediatek.com>
In-Reply-To: <20240923132521.22785-1-liankun.yang@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 14 Oct 2024 15:54:29 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhp4DUSCTs84Rukao6=ptawaDNWokbaKXs6uZnW1bX1yQ@mail.gmail.com>
Message-ID: <CAC=S1nhp4DUSCTs84Rukao6=ptawaDNWokbaKXs6uZnW1bX1yQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
 shuijing.li@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com, 
 peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Sep 23, 2024 at 9:26=E2=80=AFPM Liankun Yang <liankun.yang@mediatek=
.com> wrote:
>
> Update efuse data for MT8188 displayport.
>
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.
>
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp functio=
n")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

Tested on MT8188-based Lenovo Chromebook Duet 11.

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>


> ---
> Changes in V5:
> - No change.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240905124041.=
3658-1-liankun.yang@mediatek.com/
>
> Changes in V4:
> - Remove excess newlines.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240903121028.=
20689-1-liankun.yang@mediatek.com/
>
> Changes in V3
> - Update change log position in commit message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240902133736.=
16461-1-liankun.yang@mediatek.com/
>
> Changes in V2
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510061716.=
31103-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index d8796a904eca..f2bee617f063 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -145,6 +145,89 @@ struct mtk_dp_data {
>         u16 audio_m_div2_bit;
>  };
>
> +static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX]=
 =3D {
> +       [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
> +               .idx =3D 0,
> +               .shift =3D 10,
> +               .mask =3D 0x1f,
> +               .min_val =3D 1,
> +               .max_val =3D 0x1e,
> +               .default_val =3D 0xf,
> +       },
> +       [MTK_DP_CAL_CLKTX_IMPSE] =3D {
> +               .idx =3D 0,
> +               .shift =3D 15,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 0,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 8,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 16,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 24,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] =3D {
> +               .idx =3D 1,
> +               .shift =3D 4,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] =3D {
> +               .idx =3D 1,
> +               .shift =3D 12,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] =3D {
> +               .idx =3D 1,
> +               .shift =3D 20,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +       [MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] =3D {
> +               .idx =3D 1,
> +               .shift =3D 28,
> +               .mask =3D 0xf,
> +               .min_val =3D 1,
> +               .max_val =3D 0xe,
> +               .default_val =3D 0x8,
> +       },
> +};
> +
>  static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX=
] =3D {
>         [MTK_DP_CAL_GLB_BIAS_TRIM] =3D {
>                 .idx =3D 3,
> @@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_susp=
end, mtk_dp_resume);
>  static const struct mtk_dp_data mt8188_dp_data =3D {
>         .bridge_type =3D DRM_MODE_CONNECTOR_DisplayPort,
>         .smc_cmd =3D MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> -       .efuse_fmt =3D mt8195_dp_efuse_fmt,
> +       .efuse_fmt =3D mt8188_dp_efuse_fmt,
>         .audio_supported =3D true,
>         .audio_pkt_in_hblank_area =3D true,
>         .audio_m_div2_bit =3D MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0=
_DIV_2,
> --
> 2.45.2
>
>
