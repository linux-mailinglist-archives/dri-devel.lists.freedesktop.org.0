Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07284A3DC79
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91710E97B;
	Thu, 20 Feb 2025 14:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pTQJE6OD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FE710E97B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:21:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A026614A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1E0C4CEEA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740061278;
 bh=t1YRfXHSR0r4DzbqO4O5hCHBJK6Wk9U+htitk02MAB8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pTQJE6OD2Wd1RK/TY96gGa7OLrWKjlapSJ9+hEKgspSGa7NMMEswTg4pLgf5PhESR
 01sOIB5OdAY2Ax5kGfuICyeMuo20X0kiE7bDMJxqsMWGrj3ZL/AWVoUWu2cFWi8hVJ
 a5XN0lV5TJiAtfsgShNAePZ/esyekVbL+rn/3tsFVIX1JVbfefTa6rKK1Qq1fuWcXJ
 N9sXWpJfhUWq1b8mc8pFPrdKogm1UTYmVYfJuSyKs6a+nyEg9M4nnpw9MwGappcGH/
 hXfj3IVJUVXI9OCIY3wo/BkTwBKDJjU44bCQD8iFNEDV8NRpflFHMkT6Dyu2OmVl2e
 wIaT4/Y4tTJvA==
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2fc0bd358ccso2040806a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 06:21:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoXi6wrYL6KBKzagxn3vdY+iHq/P96roPdsQ2diSWettf0dvKPRw5A9mbrDGB2Dgao26MDPg9x8Bg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVQe4S6wH7V1BEq9dNo+lw2VvlBXBEY02o3qcUs9ptoXO9Pxh/
 bXamXqpKTzLFKJKlyXxej9PAB9tuiNwNudMzTYSA1jsAqF7vQ1rmi+nI/uEM6EktLRkOugZ13eX
 KkVb/MN137d0U9hykHx7CRAL3pA==
X-Google-Smtp-Source: AGHT+IEM7TeLueuZHPQaOMtrQ+jefGLGWiXk9sVHtvUBeiE5X3S4o44Ic7KtorBRdm5c8t14xyWBYmEyM00igBUqouk=
X-Received: by 2002:a17:90b:2250:b0:2fa:b84:b31f with SMTP id
 98e67ed59e1d1-2fc41040fcemr33893917a91.25.1740061277661; Thu, 20 Feb 2025
 06:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-32-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:22:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8JLpoF4isgm-F7Z6W-tSxkdqACSaHvyARgaPo8PNdWsg@mail.gmail.com>
X-Gm-Features: AWEUYZkuEEgZl0b7vlV6l42zcGpmz08ZpO3TrJPmfidMvCivGVZgPuOu7_J_xKI
Message-ID: <CAAOTY_8JLpoF4isgm-F7Z6W-tSxkdqACSaHvyARgaPo8PNdWsg@mail.gmail.com>
Subject: Re: [PATCH v7 31/43] drm/mediatek: mtk_hdmi: Remove goto in
 mtk_hdmi_clk_enable_audio()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
 jason-jh.lin@mediatek.com
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> If the clk_prepare_enable() call for the SPDIF clock fails, just
> disable and unprepare the clock in the error check branch and
> return immediately instead of jumping to the end with a goto,
> slightly reducing code size.
>
> This commit brings no functional changes.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index bf8cf7fc8c07..2e98a8ed6cbe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1095,13 +1095,12 @@ static int mtk_hdmi_clk_enable_audio(struct mtk_h=
dmi *hdmi)
>                 return ret;
>
>         ret =3D clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
> -       if (ret)
> -               goto err;
> +       if (ret) {
> +               clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
> +               return ret;
> +       }
>
>         return 0;
> -err:
> -       clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
> -       return ret;
>  }
>
>  static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
> --
> 2.48.1
>
