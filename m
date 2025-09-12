Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76436B5584F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 23:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5A10ECDC;
	Fri, 12 Sep 2025 21:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b9TmTaOX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com
 [74.125.224.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD68B10ECDC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 21:23:24 +0000 (UTC)
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-6296f6ce5ddso464280d50.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757712203; x=1758317003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RS6dsPYFszHuSjK7qI4StyWMs+p9b5Aa8Uii6eXeOJk=;
 b=b9TmTaOXcHPyCHndpxX2VCT5GAES3dUuZHSwJ7M0xjGjAS5ZM67EiSjv7yUkng+l+V
 x8DVn2caUdSWa8FeTgT6HD7Fpk6QOI1sXdRqk5kT+cCerYUx899180iFaot5UighMt1R
 WN3lnYt6lpfiM6N1cjG6jluIEvZi8yqfPparNAkhfoRVBtXlIrpA54haVsfvTrMVco8/
 PTjqF11WrMWd+vEvUFg3om/5h25DIsd8EE/bhiVm4uIZ8EguWtULjh5iXLElkTwc7Lmb
 sSK2Y1V0yP+subNegnN262/Eo+KLXsRjbPF3eZxmLxsfAeKP0shUK6kJ8B6o+JPlaB2q
 puew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757712203; x=1758317003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RS6dsPYFszHuSjK7qI4StyWMs+p9b5Aa8Uii6eXeOJk=;
 b=Yu8YeQvMZvIhVP5c7cdmYgMHona+vEwj4asiByZ4MNgokvNFW1LcVe32pVsNEGKY41
 N5JezPy7K+HPWvEoDG4q5Y/NTxdbZsGjQig4y2j/HJTOrL4KqOt2MF8XgdZHlGZkdCt1
 HRSDh21fQUG+w4XbQCVL6v9AiF+o++EvulBHKrCHEtUKEtLysjv4KAMot5fmHx1Uiajt
 Es5xXK1S36x24DGlZemtxviT+Fq2HgnKuaRg6EEewYCM4z9Pu0ucU+ORGgyr91tLVwc3
 j2pIxFa/4eqH9WHX/LfRR0jKkQNWEoXFmzqtxFWKs8aL3Reu5hlOT8aAfvvcXRP17PhU
 n4Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNr93oAIx+fxPXlI+g0ByFyw/DBliY5d3coHBUZeuGau06xpx9MS5oj9coHM4GDm9KqbgshWQJeUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEk8qLL0uLiUj8AXC0LcQmlWYz/LA641qneBll/0ZAHuivtnDY
 z3LbMkp5WeCxVHQULAyfus9ZwqpKGFTjlIQqJXjrYfjUMtf1gGWZHvpx/7rvERNMz4aRRtxeAS5
 O1J0mmq35WuUaAajC8p5TXGSKyx7eVSg=
X-Gm-Gg: ASbGncsXUyqo9jEHKklPFbWVlB4B/HjBvOx3Uc+hP7NbxMQf7KU9tLjZcWcMLQtZXCE
 DcfVyw30AMRHOy29VgMlFIg7e7V7uHSRO29sFYPmq1Bq7hJvdsPzIrvEagQiBVHcKU45vhCct39
 Tz6M4tjoo0BayAbJQxKPV8YjqSgGMwFoY3HL/RuhZwQIeY6kGwEApZsWZ1Ga2EETEFLRJaSB0Jc
 pgOUOLrBm7DRirqi/2JCaCBXtC1VJqYyq9sedt7yYqK7cLAVzsVoFXvrozerbhZkEszm7YwzAE3
 72/auiY=
X-Google-Smtp-Source: AGHT+IF7mDTFFlP90HyM2PZ2wkzJy8r0oa/XBSPUCOPlO84anhWl4cv9qCVo9H3l//gvGB0W4EvLmw5CX6m3/WXwn74=
X-Received: by 2002:a53:d6c8:0:b0:5f3:317c:cba3 with SMTP id
 956f58d0204a3-627235eb229mr3125344d50.36.1757712203491; Fri, 12 Sep 2025
 14:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 14:23:12 -0700
X-Gm-Features: AS18NWAF1_rOqs1uHHRFV3uK_QeI_BESdlTq94oWPQCIUjh-7p1xsAHQtKCd0Gw
Message-ID: <CAPaKu7SnopwdGpzZYNQ0GaQmHzL7ES7ZD5sOPPBUMiznXiA+8Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-hardening@vger.kernel.org
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

On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> control the power and frequency of the GPU.
>
> It lets us omit the OPP tables from the device tree, as those can now be
> enumerated at runtime from the MCU.
>
> Add the mediatek,mt8196-mali compatible, and a performance-domains
> property which points to the MCU's device tree node in this case. It's
> required on mt8196 devices.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 ++++++++++++++++=
+++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.y=
aml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index a5b4e00217587c5d1f889094e2fff7b76e6148eb..163b4457f7f25dcdd509c5585=
58a73694521c96d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3588-mali
> +              - mediatek,mt8196-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revis=
ion is fully discoverable
>
>    reg:
> @@ -53,6 +54,9 @@ properties:
>    opp-table:
>      type: object
>
> +  performance-domains:
> +    maxItems: 1
> +
>    power-domains:
>      minItems: 1
>      maxItems: 5
> @@ -91,7 +95,6 @@ required:
>    - interrupts
>    - interrupt-names
>    - clocks
> -  - mali-supply
>
>  additionalProperties: false
>
> @@ -105,9 +108,24 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> +        performance-domains: false
>          power-domains:
>            maxItems: 1
>          power-domain-names: false
> +      required:
> +        - mali-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8196-mali
> +    then:
> +      properties:
> +        mali-supply: false
> +        sram-supply: false
> +        operating-points-v2: false
> +      required:
> +        - performance-domains
>
>  examples:
>    - |
> @@ -143,5 +161,17 @@ examples:
>              };
>          };
>      };
> +  - |
> +    gpu@48000000 {
> +        compatible =3D "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> +        reg =3D <0x48000000 0x480000>;
> +        clocks =3D <&mfgpll 0>;
This seems to be an input to the performance domain, not to the gpu.
The rule says

  clocks:
    minItems: 1
  power-domains:
    minItems: 1

but neither is needed on mt8196. Should we set both to 0 (and update
panthor to treat core clock as optional)?

> +        clock-names =3D "core";
> +        interrupts =3D <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names =3D "job", "mmu", "gpu";
> +        performance-domains =3D <&gpufreq>;
> +    };
>
>  ...
>
> --
> 2.51.0
>
