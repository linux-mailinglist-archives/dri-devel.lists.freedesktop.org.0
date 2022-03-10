Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63CE4D47AE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 14:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBB710E31E;
	Thu, 10 Mar 2022 13:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0410E31E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:05:53 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C7663F202
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646917551;
 bh=FKB4VlQOufpKotMV20xHpYkdGltyIjnCzZMMtH1boRQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=a0pk3jR9hLq6KRt29/yCUKm0vGEJB+dBrzngQpQUEMi4DRb2rg8Jg+LtV7Kg3Q2tE
 4fA4gr9WqCMVEajtw7KOYlwvjKUt11NL2k8ge5NH0rERWfLTHbOGqdJ55Mnv3uvHau
 eJf0qH+GvjODMMVrq0z2GKB20kDe7zdaydDMPP0l7eQPLBdPTsiIf1psjCZf4DcJ3y
 OdngFWkgmtCVTucppiCAk365Do1Eym9C/kIxUg0EfGwfx7bOhdcuzijulBq4GnlkYr
 5yG6VqLZV0JK61G4DXBa/h2X5rbrICxB2w8cfNLGi+nI/RvvE2GBxC0gHF2RtlJA0h
 g2orhncxyzteA==
Received: by mail-ej1-f71.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so3072999ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 05:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FKB4VlQOufpKotMV20xHpYkdGltyIjnCzZMMtH1boRQ=;
 b=aOnEIGnxblCDRKXRttKbql+WtN76BG4DkxRZXHTzb/YhL28/uSfW1vrSO1ICgdQ/HO
 48V2fwyA4cDGfB6Zwuq/u/6inaLfmNkVcrjjafnqElFJnBl1Y4kcm1CbtkWE1FnHMlpo
 bNEssLTZ20FggbmJrtyDb7J3lm/hiMdlofG9885Iz84WHODU/GRd+wlk89RuhaR2Sjmn
 CyYjOZdEMWeVFfLHXU1Gy19LazxHMtHXC01Om6bukAK87FHsFOaiQC22HGzUDT4Aykg6
 59yDXxF9ndPyL2DLIeOwYKDdjKpqOr0vEYCxSLI0dsZigmmuC6iwQgc8NMWh18fAbYRr
 r/Ww==
X-Gm-Message-State: AOAM530P8+2RzoxvEb9OtNNr2HtlbksQBYzEF3GjA0u714+JUzwqvJ+E
 /SxgdGwnwDB/I5Fktz823f7z1+5Ctny5gH0S10uVfSh6fdRXTHrkWfx/s8ij+HJL5Q1nvEK0iTw
 RjQ8YMkb6/nbfbDcQ6TC7QgOOfZZbMGrMFZ58ayYYkhOqcg==
X-Received: by 2002:a17:906:6144:b0:6cf:bb2e:a2e1 with SMTP id
 p4-20020a170906614400b006cfbb2ea2e1mr4221142ejl.299.1646917551165; 
 Thu, 10 Mar 2022 05:05:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiRc5O0Gtppn95CAjgppoU5NcKydy5dEEbUl0JLUUdM1jWq9BY0CaVuFjFQ/Gd7ZN8/q87Xg==
X-Received: by 2002:a17:906:6144:b0:6cf:bb2e:a2e1 with SMTP id
 p4-20020a170906614400b006cfbb2ea2e1mr4221113ejl.299.1646917550899; 
 Thu, 10 Mar 2022 05:05:50 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 g9-20020aa7c849000000b00412fc6bf26dsm2032975edt.80.2022.03.10.05.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 05:05:50 -0800 (PST)
Message-ID: <e1d09845-d543-b826-b833-4fabe2967f59@canonical.com>
Date: Thu, 10 Mar 2022 14:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document
 adi,disable-lanes-override property
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
References: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2022 16:11, Biju Das wrote:
> On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
> lower frequencies causes display instability. On such platforms, it
> is better to avoid switching lanes from 4 to 3 as it needs different
> set of PLL parameter constraints to make the display stable with 3
> lanes.
> 
> This patch introduces 'adi,disable-lanes-override' property to disable
> lane switching at lower frequencies.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> index f36209137c8a..2dc378039d21 100644
> --- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
> @@ -84,6 +84,11 @@ properties:
>        timings for HDMI output.
>      type: boolean
>  
> +  adi,disable-lanes-override:
> +    description:
> +      Disables the overriding lanes at lower frequencies.
> +    type: boolean

The bindings should not focus on desired feature/functionality of
driver, but hardware. You are now encoding the driver behavior in the
bindings.

Best regards,
Krzysztof
