Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A993A3C0E8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E7710E030;
	Wed, 19 Feb 2025 14:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zi+Bfg1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A297A10E030
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:00:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 160FEA427FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8702DC4CED6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739973646;
 bh=vEn5X9s0X03RZNsX/FehVn8bFO/GVsoqwmgLAKeThTI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Zi+Bfg1RQd+Lf4yEh810Okdlgu/zmfqteq1iKlGjV9u6OXEOJYhII6NBAn/0gE3Ko
 Tp+I7eItZ1itdf1igTj06pEtoiaNFTC9GdT7liBCY4EcBlQqGN86HY55MJ8vC4tN4M
 NxB/NzKIgvkECDBDfxMfrRAi7cmnW27+ZG3qRhWiwtBm0W7wcL6HxQg3E+eQQsbbwh
 LlFBXQwsdwum316iPRaOS5tvYqQCvlaancOvovw8ETCIOeXpm6CbYF3bo5BhoYcbqk
 oLAIJn87TSOQKwLfHisNbXuZYeUDcF9jaWTtPO6iIezEpSh5/+hNrisapP0/MshpnS
 bImhpaceohLZg==
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2fc4418c0b9so5902473a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 06:00:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZkvRZ/EZmnMgCNaoJc+0D9I7e7mii6QxYr3AMfRyvzY6p1SECx6nFYqvk5mbxyBlJB10IPt1JB8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzm3mbdR7CEv5N5mAygO6kWXM9zUfOk6fOj20HJqZWXues1Wzt
 jgcdkDiAlrHgqH2/S9xOXRrCqphTnpvqakisj1+FXli/IIL9y4+8Hda9orJOqEMluoe877ap2vP
 ZweQDJGwjQXOeMBe7mJXuUJTfHg==
X-Google-Smtp-Source: AGHT+IHRoKXGmXM1paDFNeCBXkKPPbaMW6fIKItj9hAqnwjEMJdKy4fDjEc43FMEaHHNLq0oBSEC7WyHzl/u9EJNtqg=
X-Received: by 2002:a17:90b:1a89:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-2fcb5a9db51mr5836056a91.25.1739973646106; Wed, 19 Feb 2025
 06:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com>
 <20250217154836.108895-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-18-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 Feb 2025 22:01:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__d2A6BiegTqX+eXAk5LYAtRexnwLvkbje94ax05jOMug@mail.gmail.com>
X-Gm-Features: AWEUYZn3pFp_1IYzIW4DyIvJ63JD27HTlx-6jN1bSkLAtPngd4i98FCr_lIubC4
Message-ID: <CAAOTY__d2A6BiegTqX+eXAk5LYAtRexnwLvkbje94ax05jOMug@mail.gmail.com>
Subject: Re: [PATCH v7 17/43] drm/mediatek: mtk_hdmi: Unregister audio
 platform device on failure
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
49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The probe function of this driver may fail after registering the
> audio platform device: in that case, the state is not getting
> cleaned up, leaving this device registered.
>
> Adding up to the mix, should the probe function of this driver
> return a probe deferral for N times, we're registering up to N
> audio platform devices and, again, never freeing them up.
>
> To fix this, add a pointer to the audio platform device in the
> mtk_hdmi structure, and add a devm action to unregister it upon
> driver removal or probe failure.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index be71105ba81d..b9f4f06edde6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -172,6 +172,7 @@ struct mtk_hdmi {
>         unsigned int sys_offset;
>         void __iomem *regs;
>         enum hdmi_colorspace csp;
> +       struct platform_device *audio_pdev;
>         struct hdmi_audio_param aud_param;
>         bool audio_enable;
>         bool powered;
> @@ -1661,6 +1662,11 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_=
codec_ops =3D {
>         .hook_plugged_cb =3D mtk_hdmi_audio_hook_plugged_cb,
>  };
>
> +static void mtk_hdmi_unregister_audio_driver(void *data)
> +{
> +       platform_device_unregister(data);
> +}
> +
>  static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
> @@ -1671,13 +1677,20 @@ static int mtk_hdmi_register_audio_driver(struct =
device *dev)
>                 .data =3D hdmi,
>                 .no_capture_mute =3D 1,
>         };
> -       struct platform_device *pdev;
> +       int ret;
>
> -       pdev =3D platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> -                                            PLATFORM_DEVID_AUTO, &codec_=
data,
> -                                            sizeof(codec_data));
> -       if (IS_ERR(pdev))
> -               return PTR_ERR(pdev);
> +       hdmi->audio_pdev =3D platform_device_register_data(dev,
> +                                                        HDMI_CODEC_DRV_N=
AME,
> +                                                        PLATFORM_DEVID_A=
UTO,
> +                                                        &codec_data,
> +                                                        sizeof(codec_dat=
a));
> +       if (IS_ERR(hdmi->audio_pdev))
> +               return PTR_ERR(hdmi->audio_pdev);
> +
> +       ret =3D devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_d=
river,
> +                                      hdmi->audio_pdev);
> +       if (ret)
> +               return ret;
>
>         DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
>         return 0;
> --
> 2.48.1
>
