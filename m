Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D7ABB72F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBECC10E244;
	Mon, 19 May 2025 08:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="n+Aw+nze";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6EB10E244
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:27:43 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-70900a80907so34980177b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747643263;
 x=1748248063; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=;
 b=n+Aw+nzerTy7dX9r0Mp0lDKj0l+4qVj1ZxNdKq+OTFi97sO9GK8GhJLRhz0vv1+Xtb
 q8vDoJu1XYlPQytbjACbNg6c9FrftAtjQi9q6XGAPWtziaIkNWBv5JFv6dzvxsmYNYJA
 s9r7Jm+d9yOf09GN+pX8BYi413E15lH2o7R0O9apUV49Vfs1Iimw/BI7Donzp1Jq15uc
 D4bAx8dV2EC5s21bY5ZB738o1Elu5R5ER9CURMusIsMjzSzmSGOGNwCqoeVF6ThkhVY9
 mmN/KqFOP1cxnO/S7UckfP3jIpskJ77hLHRB6xYPI0Yf+uvh//Fe9Sh9GSj1u2iR9nR9
 g2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747643263; x=1748248063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=;
 b=Q3YP/jXCI7nt5TlZCQWVLbtRuEjpk9fO6SFF9C51i20tbKtkAib44a8hJITOJkFMmz
 41VJHFnnsYL5I9Wntu+z0gPyn0wH1gFl1yRbAZj4cvVzfHJ3s7VyZrLhirfAGyHtCE0T
 a9oAOt0NxC2ocPqUUWN5rJgq8QHSwXEYcE1KIHqxLT7jsj5ywhCmsAsV7oH60/izMrtf
 lVffug/frXKSpnZK9O6rzLMJ88XYzlquhtiFjEptQ7mgfofRkVSrZgXZF5Bhc7Bkqy3D
 YcyMGQzHFJTI34glA7R4x8YjbXx53B6Hvsi774MPlvapy5sCi3ih66rTUv829dqMdbzx
 RqBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTpVr9yH1zcDdPT7F1DmuyOXy4aU1K9kJzwfpYwMjM6S1aeM8xR43PzGKolD4/JXXfAzwmNIb32T8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf1AwP5Jz5mwkwRg4/5b8htjWdZ3MnE9WKVgLsFW0R6TYfZ5YD
 JvJqkDux60dyio9Th9Na+X1eUW1RFlTvig05E2Wr3+WtfjezvgGjLKG8NJa1KqaSN0AsfTka8pY
 WOmrQAXb5ww==
X-Gm-Gg: ASbGncu47NUcIeaV0zaTqf20gnfk9BO4A9dyepsU5omMelH6xSsLDNfhkC7MSNzLk73
 nhlUw42Na3EaNVnzkcuqiVPRb21xAXviH+Bqw++oliVgIR1Ye42526jD3drNVKlNG22VSZUBn1S
 HZP08CenGlOz61U4IxgQL+NvTBjir4yjhrILZWzQ8ByeYSoeG91G/nlWpUTeHe89XyCmD5rzjhH
 b5PdZLg+GNNjRaKLV2kmJl4nKz0sFWwnKVPt/mZUjcelMHw9JYFU2C7QoCX/AcwNDIlktuFzVyf
 qpL3O97/xLd1OcB7og6OO76p76hseq36IVhFtMHClpyfIES06j7CXBTlrdpVSRCrEMByspg3dhi
 cX9Vj2GheF2lO9mU6pU8CZS7LX+0J2A==
X-Google-Smtp-Source: AGHT+IE6Dk4gIY33OX462ta+IwZZpRsMlnPGvaQgJWM1YOqYDSj3IjBzlVJOllJuuvraY3foUh5Ojg==
X-Received: by 2002:a05:690c:6f03:b0:6fb:8461:e828 with SMTP id
 00721157ae682-70ca7c108f1mr171883837b3.30.1747643262883; 
 Mon, 19 May 2025 01:27:42 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-70ca82f0056sm16676407b3.8.2025.05.19.01.27.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 01:27:42 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e694601f624so2902253276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:27:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkL9/UQVwrdL1CoUATNJ63FsAATLfLnHFQbCYFbxRGgLPoaGT77t/nYqSnSz96pZozrI+ndOcTm74=@lists.freedesktop.org
X-Received: by 2002:a05:6902:e02:b0:e7b:96e0:68e0 with SMTP id
 3f1490d57ef6-e7b96e06d2fmr6708556276.13.1747643262000; Mon, 19 May 2025
 01:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net>
 <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
In-Reply-To: <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 10:27:30 +0200
X-Gmail-Original-Message-ID: <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
X-Gm-Features: AX0GCFuGQeY3CKRDKxmbkhGEJEzp8Ivknwdq0OVtRXBXcahkrM5jAa3oB7F__bY
Message-ID: <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

On Mon, May 19, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/05/2025 18:53, Tomeu Vizoso wrote:
> > See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
> >
> > This is a derivative of NVIDIA's NVDLA, but with its own front-end
> > processor.
> >
> > The IP is divided in three cores, programmed independently. The first
> > core though is special, requiring to be powered on before any of the
> > others can be used.
> >
> > The IOMMU of the first core is also special in that it has two subunits
> > (read/write?) that need to be programmed in sync.
> >
> > v2:
> > - Have one device for each NPU core (Sebastian Reichel)
> > - Have one device for each IOMMU (Sebastian Reichel)
> > - Correctly sort nodes (Diederik de Haas)
> > - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
> >
> > v3:
> > - Adapt to a split of the register block in the DT bindings (Nicolas
> >   Frattaroli)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++++=
++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588-base.dtsi
> > index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a703=
90fdc917a828433a9 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
> >               };
> >       };
> >
> > +     rknn_core_top: npu-core@fdab0000 {
>
> npu@
>
> > +             compatible =3D "rockchip,rk3588-rknn-core-top", "rockchip=
,rknn-core-top";
>
> You never tested this. Test before sending instead of relying on us or
> after merging.

Can you please extend on this? I have tested this series before
sending and I don't understand what you mean here.

Thanks,

Tomeu
