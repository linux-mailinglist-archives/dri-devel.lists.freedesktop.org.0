Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BEA4D99BF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 11:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D3410E2B3;
	Tue, 15 Mar 2022 10:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA1310E2B3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 10:56:54 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6520E3F312
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647341811;
 bh=ht8KpCSDXfMeLKk1Iy9OjwDkeWKdnRpzH0Z8PU+F89M=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=LSDzC0deInfWjrGAItDnx4m/E5k6DCq6tWecLyJ4YhEooqeREvuPhb+4GYTT5NeYG
 t0tVG2+hX9U9/ytDV/AhjC/oYZFQkbKAyUTzea48+YXxlcCMJYSIoeZBoavgQNDBbP
 7dc9HdzAWeKM0RVFROooP5t3YgWV00Eh57aRbfXkzXcfyocZRDty2UxtD5muiTdxOa
 hnsQYy0NHqJAVomjhMv8RieBND6DFGRdFEpxxYKenGzKGMJn6rksDmEZN0Xw/ule0q
 r6Q1ZYtHCRngqmVDgl6Wvp1Kj8ClUcSVNfcc748Ko8aTE4A3+ZJ55sUh7OAydDiB1b
 oXlHYbvuYeO2A==
Received: by mail-ej1-f69.google.com with SMTP id
 hx13-20020a170906846d00b006db02e1a307so9471137ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 03:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ht8KpCSDXfMeLKk1Iy9OjwDkeWKdnRpzH0Z8PU+F89M=;
 b=Q79HrVfNkHpm3lVt6G3oy4lysBE5m9NaFkaoOPQ0aby1aB5CfasLGy8fuO5YA5oOQ5
 jMHn/0qLXaOd5pLGUYy3XnLYieeJIelYzgDOCn6dQ9ReyzxVVRBOfTPFZ+88DW19yLoc
 9onjz4xRQ2d2zJN16MWY6iLPlsFcMLHJoFX7GKDxvR1iq+p0w1QWogOpuHh1EVtCu3za
 uCgWY0MKSHj6D7wmLTvlpEGQ4gPm13yNYTPrX/85yLm/DOt+uZq8KPC9yOrQa+WN47Yf
 9u3yecOruLHfSaL7/6iSsghAiWn3CVc/tW2ity7GcN+KQcDJ5AW2RmFigstXdYzWHLxl
 PmGQ==
X-Gm-Message-State: AOAM5329bA1tBa/ycmDzkXXWU+ttmcpA2hqBkE/R7T4QuCtXzOBaLsce
 4UmpJkzTaT0J/0hW+TUHC+yPVSEjbkPQlVhbbxdF6h0P0G44mwRAYQsgI/nJd7QijNeoS8KeKVt
 3eJPbyS7ne8cSvFl3lQOMaJP0EqjH1hIrsv/5vHihN1ptog==
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id
 w17-20020a1709061f1100b00685d50e3bf9mr22467092ejj.275.1647341811110; 
 Tue, 15 Mar 2022 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Vc0VBi8iyHSnXP0SjQn1EF5R+EUhGiixvRk7hd4/4ka6soIYQAQL/knRyeFkxKGN4H/zyg==
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id
 w17-20020a1709061f1100b00685d50e3bf9mr22467063ejj.275.1647341810849; 
 Tue, 15 Mar 2022 03:56:50 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 e9-20020a170906c00900b006d4a45869basm8011143ejz.199.2022.03.15.03.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 03:56:50 -0700 (PDT)
Message-ID: <095b4dad-ade6-c742-1993-e5dc89f5cb93@canonical.com>
Date: Tue, 15 Mar 2022 11:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V7 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220314090033.25773-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2022 10:00, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 61f0ed1e388f..6c8c83988a24 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -23,6 +23,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - const: mediatek,mt8183-disp-aal

Use enum in previous entry. This is weird setup to have items with one
element and then duplicate it for another oneOf entry.

>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal


Best regards,
Krzysztof
