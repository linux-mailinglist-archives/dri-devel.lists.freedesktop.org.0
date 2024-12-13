Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFCA9F0330
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 04:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED3F10E17D;
	Fri, 13 Dec 2024 03:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZQ6TkmAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788F210E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 03:41:53 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-71e22b2387cso987030a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 19:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734061312; x=1734666112;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+sYwNsJPJUz8rFWIUY4qzq/70dIz9Ru6YrTek2NORE=;
 b=ZQ6TkmApEPuENrw+ppO4POIhk8BnW0R50R4V/oDcT+zj63zzh3bko7CS5/C7Z9LaEA
 a8KaX2+0F/DnKp7SrhvExeLynXjqdu+41R4gQFdsO5rHHjCJUxzPIwm9itSUhSCJUwwq
 VcY6OsKCwjbgjNtsn8dYrEMpV36RYH1l46QiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734061312; x=1734666112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+sYwNsJPJUz8rFWIUY4qzq/70dIz9Ru6YrTek2NORE=;
 b=p6a5WO2ZgeHDW4iu2OZig9Tdd/1ack9Cv5FQeqwgqp/Ov5cOIDMcR9SufdtTFJ0myZ
 TxD8h85O8oXA1oydubwptR4dBvG/SvlBXMHoe2FuzNrrsvW3WUqFddBdXFNMR1XXVAsv
 1uf289fkj/GUvQlKmj5/+FNDeLZya+AhM8puPk+8TS11/jmToYOSpHiN2E73umkljBtY
 ljux2uN0nFbdIAxN5cxhK5XC/NXkfDcSgOXeG0Jd/LGLtZEWY9y/O6H7SU4mUg2FGDhZ
 6ZLnfGvcByBPrxhiWPn2f28HOzimD1zzHBzXYELwvRy/Qq0wf0FfuMN/7tAAlyjCb5qn
 13ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZIlRkJpQGEhGzWUieXrk0RdRAc5Sj3lncrchbsORHmTu7ndrGWkAcGglh2bdnKiS5YNFXRCs6Cms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT/a2LIGZQrEcW1kL72ZWM9CYWNRuOK2YR4MwnjWu/FE++K4RF
 cKaz6BYTJ1ATR/3kwddYUVIo7p+zvo6i9fth47iD7oKfnV8stqYGYjUR6EGDPs6JKoUBndyDyj1
 UdRd188XKZz6edj3FBPu2EPmZdDd9NJ0FBe7r
X-Gm-Gg: ASbGncuP9lQzxsWO/dK4gFwkwIfvTeA2yas+chn2cCncYU8L/5fMzMpVuWOGCeMSzmB
 vQY/kdTGplN/qM99Nn4WT+hcb/RBHUGOwGy+r9hca3Zo2gYqGRITgCTuW+JIPidMW
X-Google-Smtp-Source: AGHT+IGb90yBCnvxG+Hi9Pwd10WdldUyRYAIXkWApYl0He7r8e3m4xh8APMlHNhOCG/vLZzWYNxtLLt1WvD3XZbbN2w=
X-Received: by 2002:a05:6830:6619:b0:71d:54cd:5289 with SMTP id
 46e09a7af769-71e3ba9bef9mr613276a34.21.1734061312077; Thu, 12 Dec 2024
 19:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20241212153344.27408-1-jason-jh.lin@mediatek.com>
 <20241212153344.27408-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20241212153344.27408-2-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 11:41:41 +0800
Message-ID: <CAEXTbpfc0ybrvMCuJkKAUwXXTtpZ=vU9MLfU=4CzgdTd-ck4qw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: ovl: Modify rules for
 MT8195/MT8188
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, 
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Hi Jason,

On Thu, Dec 12, 2024 at 11:33=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediate=
k.com> wrote:
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,ovl.yaml           | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.=
yaml
> index 9ea796a033b2..0ace12bbb623 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yam=
l
> @@ -36,16 +36,14 @@ properties:
>            - enum:
>                - mediatek,mt6795-disp-ovl
>            - const: mediatek,mt8173-disp-ovl
> -      - items:
> -          - enum:
> -              - mediatek,mt8188-disp-ovl
> -              - mediatek,mt8195-disp-ovl
> -          - const: mediatek,mt8183-disp-ovl

This breaks the schema check for mt8195.dtsi, which is currently using
`compatible =3D "mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl";`

IIUC this is supposed to be a RESEND of [1], which actually added a
binding for "mediatek,mt8195-disp-ovl". However [1] still breaks
mt8195.dtsi because it only allows `compatible =3D
"mediatek,mt8195-disp-ovl"` But not `compatible =3D
"mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl"`.

If "mediatek,mt8183-disp-ovl" is a reasonable fallback for
"mediatek,mt8195-disp-ovl", please keep a binding like:

      - items:
          - const: mediatek,mt8195-disp-ovl
          - const: mediatek,mt8183-disp-ovl

Or, fix mt8195.dtsi instead in the same series.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/202312121219=
57.19231-4-shawn.sung@mediatek.com/
>        - items:
>            - enum:
>                - mediatek,mt8186-disp-ovl
>                - mediatek,mt8365-disp-ovl
>            - const: mediatek,mt8192-disp-ovl
> +      - items:
> +          - const: mediatek,mt8188-disp-ovl
> +          - const: mediatek,mt8195-disp-ovl
>
>    reg:
>      maxItems: 1

Regards,
Pin-yen
