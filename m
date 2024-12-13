Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE09F0965
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD96510EF9D;
	Fri, 13 Dec 2024 10:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NXz2Al3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBA610EF9D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:27:38 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3eba347aa6fso620322b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734085658; x=1734690458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=;
 b=NXz2Al3VcTdxHDLUpMU4L5ERily7TwKGWzAbzWps3KYQyP2c0dNYc3iz6YnpZtH9Nm
 JT7KOA9DT66Zuf98allpG7KHhe9rRSPQR9yqqPlDXzbTcB90My3Q9QdtDiYHf0k3CdSU
 aV0qvN+IaJOE6JUeNuYH9V78rtHNqHm+kMhKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734085658; x=1734690458;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=;
 b=UNXzUH7+ohpOAXcm12JvpeNDe5l3FWBQyGVETQHMd4SQQObgYUadCVNxrfROo+P9E0
 U/Z+EWO81FJznqxs5H3+5QLAdLzmqmenuS/JUoafn57HvCr2tWij6r+BAKZHO7HvLAsK
 //c1yHcBAcLweYCZDAbAE5cmKMS8tb8f5tyd/GuXRbtW1uQOWlTnIQ+lDSK4ul6vL5aL
 slYTyIDmAgVpRHiau+TAkeq80UmYmm3XjRrW3a7vDdYP2DW/DMCkggNPl1dQ18RYEZaT
 osvkZ/3fftWEwmzrxF4Jo9mrpmuzPjAmDSXta4qh0VgfPGKRHMGoc+UWoLEs1JD+wDzR
 Z8ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOLpu2TI4JJS9iQyFeIv2TLduS68dxyGhEnfY9CcNM4Z2GEHxF2uspOw6ee1OHUJe7mTLYQxDsF/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBcBfvca+eJhBHNJPVqZgMX74WX4xWbjWGOV/HK8eJnt1QUk1j
 FxFMqLn4+GDjZ9ioDSD0djnT/lKVVOAYHnyYC5iXNr+877n+P+RQ0yFHnUGK+MZPCCbmelWcGb/
 t6Nj5FR6aZG0D4Bm5bHd+NvZEESF8w5IE6DML
X-Gm-Gg: ASbGncvlMPxYX51hzXTg/H+QSBOnobkai2GEli56PkMjll2vynndCENCJvNQFk75rcq
 nOZZdAwol9AWODyvsyjfl9oKO64ri7gbFd7tnOZQ3KrCYcrw6M7W2neJ/Nc2a11kX
X-Google-Smtp-Source: AGHT+IESbjIDYq8Dv7WLZv3lnv+V/UUSCvVg2kJFhXxDh3T+YFv70IgQ6Vlt7dxY7YDS3GWUp1Xn0M9xXxcOalecsrs=
X-Received: by 2002:a05:6808:3447:b0:3ea:5be6:a68a with SMTP id
 5614622812f47-3eba68640b4mr591582b6e.15.1734085658025; Fri, 13 Dec 2024
 02:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com>
 <20241213095044.23757-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20241213095044.23757-4-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 18:27:27 +0800
Message-ID: <CAEXTbpfOv876s3NLTO3oMTtVi_BwBtgb-816Gt5ZjKMjTZZKQg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dts: arm64: mediatek: mt8195: Remove MT8183
 compatible for OVL
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Fei Shao <fshao@chromium.org>
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

On Fri, Dec 13, 2024 at 5:50=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to remove the MT8183 compatible for OVL.

Similar to patch 2/3, we need a:

Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for vdosys0")

>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index ade685ed2190..137ee8929e01 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3138,7 +3138,7 @@ larb20: larb@1b010000 {
>                 };
>
>                 ovl0: ovl@1c000000 {
> -                       compatible =3D "mediatek,mt8195-disp-ovl", "media=
tek,mt8183-disp-ovl";
> +                       compatible =3D "mediatek,mt8195-disp-ovl";
>                         reg =3D <0 0x1c000000 0 0x1000>;
>                         interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSY=
S0>;
> --
> 2.43.0
>

Regards,
Pin-yen
