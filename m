Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB18C6A517
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 16:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651A410E4E9;
	Tue, 18 Nov 2025 15:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rBJUZfaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B850810E4E9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:32:09 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-787ff3f462bso64849107b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763479928; x=1764084728; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IxHLXotX/VR/smtmuGtjLAN5l6lgr5iFZlYRIN9JEyQ=;
 b=rBJUZfaA2sForoLSZv8UfNoApeV3EPI01DeGS7Z0OG2O0/59xAFRFf4tLwjPb0kzDY
 Un21qTPj/+ObpTPpIWGSPXk4ROugMPZak7DYppjorto6y1PkxR4xsAdb24vj7kdI4OJn
 HCbMTp1bUUdBX1z24FJE1sgvW85/bwMKAuiiYK/jP7qUhtuwlJy3RyvcbykyzEcDvqYB
 IKGIHdSHf6r4NX79IW0B1lmCWUuAvGaybAumHPsk2H8NFEyb1Fr9IdU+YYvh5dsVEEhs
 9io2RS4ry9icfdyHIfsY7ksBzQU8sptxSO/KukSUoXdAwOGkIiMAqUPqFENh8HYNU2EJ
 Gazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763479928; x=1764084728;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxHLXotX/VR/smtmuGtjLAN5l6lgr5iFZlYRIN9JEyQ=;
 b=uEnJLH6DMlRL1araHQ0UOVBghKcnN6XGn6utXztT5pBeUMlcEgLgiDPk+vGDLfyJ9x
 ZAQt/Lfh4zPQTrWI0l08Z02ZIaZrj575uAFq18ncpRKc35tKgBy/5DsCxojKeZvGtYs9
 +7CclLbjQbS1+Yt3S+SEq6acTbzDXpisDqaVOriBMHanTxSMl4baCIkzhY05QcXRjItA
 84yoyvaMyD4HP82mkj1lQX6fbdttwWP3B9rfyF4p5ioV4JZW4lgvp1YkbLLyeP9JMq8a
 dEIThgXPCd0n2q0Vag/8YO0qnz+DTCCy251mkfhm4c+XltUTiyhj351e41ztB+MVao6f
 rDoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGmsro/XORben9Z4rFNqjVIWiF+xQ9kz1NvtszaHyCmhisZzq1D4iFXjOcu4f7Ymby6yQoHnUVNeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBk5z1riAWzLH6GF7CnOjGcmsMxzN50kMFlUjyhl8d7uHw1BlF
 nJaDheAv4OzO5C98omQkvdjyMCMjDIRlRmgsyCvL+7gDhLn/u6/rq/kE1C+2Bz0k11Vw3zfTn6g
 yHQX/vpcGWbrGXHqBicvWlp2OzzyZNjf59j7IPeuPUQ==
X-Gm-Gg: ASbGncvnc+g9KOXsW6dsVqL75mnmGWV7qZnjYcYp2SCkawZgLJmZ/ZpYSrVxwQekikR
 rtS6CzO4zZLVJ0DwRNM+Y+jIcVso+WAuzrT5Gk15umNFBvqCi3hxCFvzMZ1IhUekhMO7Xc6Mi/G
 yKPc/Q39noyZu3Wj5Hl1jIaB6foYw0Oa5SlrkQZ6TGNRCAu/9idySXxpmQthuAfqfV+z/4J/Wm/
 d9VcKaoJI9BoFjnCS1t+iSUflPI/DOLqNT0pGfeyE+ARYmB88ONQtXV/dkNg/51NQKEIVMvsLH/
 8n2+jnJ2GpgpDvl9PQ==
X-Google-Smtp-Source: AGHT+IEc8GglvCIsD6cGrALsj9LLh6N+Jx7VKw+16XtXMLh8fZV72joZEMGSMeUR4bEuhwbV7IWYBeRgua2rFcuL8iQ=
X-Received: by 2002:a05:690e:d86:b0:640:d597:4170 with SMTP id
 956f58d0204a3-642132db3f6mr2565633d50.0.1763479928233; Tue, 18 Nov 2025
 07:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20251115122120.35315-4-krzk@kernel.org>
 <20251115122120.35315-6-krzk@kernel.org>
In-Reply-To: <20251115122120.35315-6-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 16:31:32 +0100
X-Gm-Features: AWmQ_bmXlb23IcHWwlaA2kdC6A8acUsbATP4k59c9PPxA0jX-7QbyyZj3x6u5n8
Message-ID: <CAPDyKFpquaBo64eKvMPiCPdKrPkYc8fhpaOmFL9KN0UzFs0xkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: mmc: am654: Simplify dma-coherent
 property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Michal Simek <michal.simek@amd.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Harini Katakam <harini.katakam@amd.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 15 Nov 2025 at 13:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common boolean properties need to be only allowed in the binding
> (":true"), because their type is already defined by core DT schema.
> Simplify dma-coherent property to match common syntax.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> index 676a74695389..242a3c6b925c 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
> @@ -50,8 +50,7 @@ properties:
>        - const: clk_ahb
>        - const: clk_xin
>
> -  dma-coherent:
> -    type: boolean
> +  dma-coherent: true
>
>    # PHY output tap delays:
>    # Used to delay the data valid window and align it to the sampling clock.
> --
> 2.48.1
>
