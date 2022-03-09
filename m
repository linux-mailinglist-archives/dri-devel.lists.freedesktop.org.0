Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F54D2C2F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 10:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D6A10E3DD;
	Wed,  9 Mar 2022 09:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716ED10E11B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 09:36:17 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 00A2740338
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646818575;
 bh=vgJXPJxV0L+vAaGNHZUa0pyZRilCw3Wji1ihg6t2p5g=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=QSUS619q3xKFpJwumBUy3HradU6cCrB0aSs9kVGprCj1fUf3g9iY/5JirVwtKfETa
 fzisywWCbnKZrN60jWoUyWvUMLzDyeqvrB12k65bV9MOdpp5+3Nto8x5ry6lcbr3lH
 PzOnYzOd++XJGxd8fcD54VEAFTCU6CURgdS9GpX4aE9fiwRa6sfVd/gs3ej4lkv3MH
 2jTViK5MfpBzAVsMUYjLGC9C9A8bu9zr/0sfk+6htPmKu+jEvQLBVP4BcO2a7tWlpY
 XEjuoQNlU1rAsGCZMPOZCv7ITMHf4xLsIC6joAwzoBIS4CGbMoGLK5Bh+Mmkuh4FTT
 ffzlNIzDzf4dw==
Received: by mail-ej1-f71.google.com with SMTP id
 ey18-20020a1709070b9200b006da9614af58so988878ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 01:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vgJXPJxV0L+vAaGNHZUa0pyZRilCw3Wji1ihg6t2p5g=;
 b=zaD67/IxX9lPJfPkLMkR+W98EyLxphpcWQECLiGYx5A6iYNnYjif5pJt1fIUzZABbe
 Rpe24Mkca9Hj79rbysMnRv7yAy4V211M5gsIqj2M9CTpRNWQGYbpDGsrGq5xM6UjG5Ya
 EiCXho8s8GZYwK5t+HKcMaaR5E6ZMezcaCUeIFODWRCeKUH2sg4Zhf+VLAxntiDbZm3V
 FctHiMWrDROIt0zlY0cfhuSRuhglcwgSj9K3NGU7NIw1sYGhAH8IUmBjcT9eE+B/F9NQ
 0MOcKD9TfIA/OxUmhFstLC/U9Y60LkqIC6ugENx58Kb/v4HpAtD7g3LNeOj/0TF0GdXI
 FiPA==
X-Gm-Message-State: AOAM532ybCp3BhnddlPvgdEoZVId0+98U/BHRdpYWdBESIRbCtAmX4SO
 8G9D+fcb5v6DFtO0dt279HVTQY1sk5sw0J7wCXozPdJ2MlvulznmIY4GY7OV2cqMJMdzF/+t3Fu
 RH73eTA2O08LlD2lZ6tu5XLW4s/8+DDVzjFbQ2a1SBFnZnw==
X-Received: by 2002:a17:906:f41:b0:6d5:c6bc:fbc7 with SMTP id
 h1-20020a1709060f4100b006d5c6bcfbc7mr16234674ejj.541.1646818573803; 
 Wed, 09 Mar 2022 01:36:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqJfkq2ncyoyHFJqrP5yMmZhK6ZJIwjOk5HnVSwV0BZkhtpkJH5FaPNRu22hHODgSjQwGtxA==
X-Received: by 2002:a17:906:f41:b0:6d5:c6bc:fbc7 with SMTP id
 h1-20020a1709060f4100b006d5c6bcfbc7mr16234652ejj.541.1646818573591; 
 Wed, 09 Mar 2022 01:36:13 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 a7-20020a170906468700b006da636fdbe3sm496370ejr.105.2022.03.09.01.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 01:36:13 -0800 (PST)
Message-ID: <a96004cf-155f-22e7-8b1d-7168f3187598@canonical.com>
Date: Wed, 9 Mar 2022 10:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: gpu: mali-bifrost: Document RZ/V2L SoC
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2022 22:15, Lad Prabhakar wrote:
> The Renesas RZ/V2L SoC (a.k.a R9A07G054) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
