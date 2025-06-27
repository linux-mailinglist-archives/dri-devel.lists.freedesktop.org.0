Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72865AEAE4B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 07:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264210E95E;
	Fri, 27 Jun 2025 05:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U62jaqZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104E610E95E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 05:03:15 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-87f32826f22so1016164241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751000594; x=1751605394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=;
 b=U62jaqZnyyKVdldXUe2b6C/JFWpZGjeIv3nyxP7gKyHHx7HUSeOWqXpnzLs6GP4p+1
 IinFOZ6ExqItkkPIjsIoijzl21Y9AaoW9gRx2IoYca/EWICOGV//VcHMI4cDm0hYImNV
 qy0zHDxIfTc8+m4WsDx2m5K2/EY3PjuvR8zRKn4JkPkRPtEONUIroAO8zYBHMYXt5VQd
 0CJfK4coCaVX710vff8F5X6MvDHftW7ubKVDpqaUCSFmBlcWim+EY9BLV/ldzDo1pvcr
 0V7OiRHywr8g582YUKSgS6tijeP7+w/TOgnPiWkYuBWqRaNG5xUjIA57hK7TKaTHRFvB
 V1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751000594; x=1751605394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sm4hHqZdHlJKjq+/RMjrxVZ+kQH4qjoP0GpZOg4z/2c=;
 b=cSenXXn0AkLCJgV1GR9UUPClK1HL8DujIPomB0NsYd0K6PGp4oQPfQW8cKvsNlwKTb
 Irktcd7BrQwAk/FX8N6nvRVRyRzp++4D2C+RmGGI9WFwJnFJQNRDVRmE/RaAEtYK4J1R
 MGKWEvwgcALr8wgQ0yNqZkUqDQyoDJzWrCfG/FEYwcbpgP0D48eoIn035a+ruMphji2J
 /Gn0SZpkHflGmzc/oRQcXXscI05B5AsESWm7SnKhHbDzbWtAUlCpaoB4a6QJZQLj+/NY
 yXnUV8Z9lEBGzsmrGblopbK/nR26MSRzup7krv7gzRC9Eyvl1UjCoWeiaKXIZTDhVpe6
 cVqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9U1woQyk5C8mFuHhjs8WqiKoBjTvIt9FjpKFtQPCWKOnQnkl67eauhbMkaBUVNnlhFuGOEopWz0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3CSUWXN2kYxRLH8wsrnJs0oZp5Dtgoeg+l+iYGpPaJGEAsHna
 dogjTcuh4b6dKzPS8gg08lN/ua3y9ubXIx7KGvFq8NhNYVl10dVs8reexPmE+WqOiN3C9AMl5YI
 jevxrOkf8TwBoUREv99PdmRCqJKHOdhU=
X-Gm-Gg: ASbGncuu4EFwPrJMdeynNRAyoBzaXN/Ny0HbopEpyFp6eMjR//wwzIfqum7f1Iy20qO
 wYKSERDHwh8DYJZCgF7vvyEtwCVOEKSVOfM6lihZmZcF6rFo3yRiBCZI3h5YlMdawDan46jbWAs
 37Ld/KwOv3vvv6vkfw5w8GIzfMFCDbnv0BkI4WxhJ3n+3asY/6uXpk
X-Google-Smtp-Source: AGHT+IF4cUJtxH83RDJft3O2FqQ5XUKOZe1zx/Bmli/7Ru2jER/I3z6z3oYtVafld19HMBo5LW8Ej/HPfe6pAovzDOo=
X-Received: by 2002:a05:6102:2ac3:b0:4ec:e1fa:ed7b with SMTP id
 ada2fe7eead31-4ee50a67c4bmr1229948137.9.1751000593950; Thu, 26 Jun 2025
 22:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 14:02:37 +0900
X-Gm-Features: Ac12FXz2dc5tsxsGmjdAH92okDL5yeiAijcWTCVAjDOYfNAbUY5poc38568eg-s
Message-ID: <CAAQKjZPAsE8LGE00fWE1aPj03b6tu1rk9ScTDSN+HeKzVXMZvw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - May require a port connection to another block, say an MIC or a DSI
>   master.
>
> Document these bindings in the devicetree schema.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++=
++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,ex=
ynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsun=
g,exynos7-decon.yaml
> index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f0479=
0e2b64da291b78b 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-d=
econ.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-d=
econ.yaml
> @@ -80,6 +80,14 @@ properties:
>        - const: vsync
>        - const: lcd_sys
>
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Contains a port which is connected to mic or dsim node.
> +
>    power-domains:
>      maxItems: 1
>
>
> --
> 2.49.0
>
>
