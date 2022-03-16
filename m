Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434AF4DB4BA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E1710E6BE;
	Wed, 16 Mar 2022 15:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DFD10E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:19:12 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 909393F1B3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443949;
 bh=n1R86AH40JMDGlhsJXdbdtccHR5xtuigPuTWuYsB7aU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=UJuuWIeYpKlkSRWZdfyhkgTgFFjXz3peZ0FKAA7w4xF0tqNVoiEyMVZHYhMxp9p9u
 3XSNNtSRpnmda9d8Oy1SFzSZO0t975j2d/eoBKsSDCk/E+aDMJP95XSxed3SRw7HdA
 tz6VHZWOwK9/Lnq8jjUIzQYZq3lwWF/HYmP23+fvIPHs6+C7yFWk12VqtgA5DpED+a
 Cz7F7XLfdYOfFGE52p50wQV99adWZ+ztQnuFhZBdB6iZDunnCS9gPL336rXXdFGKhb
 vYT70Ylhp20XZWFwTGUZ+e2DkodqT70am2un482Kxo8zrs3moj+38RRZygFhxGmJWj
 VIJh6aPB0PaCA==
Received: by mail-wr1-f72.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso663572wrm.18
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 08:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n1R86AH40JMDGlhsJXdbdtccHR5xtuigPuTWuYsB7aU=;
 b=0e3PAMO6lk89W06YZYTYoNtO5207qo/HlTyLarIl92deQDF8t5hgNvOQJrIyZ9/sxw
 5iTL/3UCA3SJKAnbVbXIIoGqvOXGprxt2wzmjLmOsUpSdrOZj6oGrDEQpZc1tNOEdyxq
 Kvl2mkqUxDk5ir4DnXlbQNCkBuJhXlbCj5Ri8tXCxizGDsQe3PWRYMArZ+Hdk4Z+B3rD
 Mu2HwhCmIQrZTaBNXCsT7coheKx5zwypZDjrLnNjQwji9Yy8i9Ht9hLRJG2Lay2fSzvt
 Ow7DCAZVglqyallkSzrbbOp4XBZY0cuG5Bv3TuejJQ+vQPIfVe9448heyZvuXTbkbkU4
 pMuQ==
X-Gm-Message-State: AOAM531qR770Xead7sFR81jQTvuhZogD1D2SrZD7ArIP3ZinBzb5UkwX
 0ZTm3CGbN+kPQzwMuYb3tcRTAhdYFVoIlhz18AtSXdBhmIVHW25n11n2S4E0bf74g4VvMQLFw1s
 gyHP0Qk8KdK5JTMwt0wVfxdo2qxDhRVNC5FVLefhXsvBd3w==
X-Received: by 2002:adf:fe81:0:b0:1f0:246e:ae5 with SMTP id
 l1-20020adffe81000000b001f0246e0ae5mr353624wrr.652.1647443949231; 
 Wed, 16 Mar 2022 08:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7KtAfQn8O30h7vKxDeRV7uri401Yg0lHLAU4i8wtnkZBBAptCPe0PeY+wSBS+LC5ypMwvEw==
X-Received: by 2002:adf:fe81:0:b0:1f0:246e:ae5 with SMTP id
 l1-20020adffe81000000b001f0246e0ae5mr353605wrr.652.1647443948978; 
 Wed, 16 Mar 2022 08:19:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 v10-20020a056000144a00b00203df06cf9bsm1821028wrx.106.2022.03.16.08.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 08:18:41 -0700 (PDT)
Message-ID: <cf765199-30c3-f963-4d9b-8f225efd5b32@canonical.com>
Date: Wed, 16 Mar 2022 16:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V8 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20220316115155.17834-1-rex-bc.chen@mediatek.com>
 <20220316115155.17834-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316115155.17834-2-rex-bc.chen@mediatek.com>
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

On 16/03/2022 12:51, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 61f0ed1e388f..eb0299b80522 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -22,7 +22,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: mediatek,mt8173-disp-aal
> +          - enum:
> +              - mediatek,mt8173-disp-aal
> +              - mediatek,mt8183-disp-aal

This should not be under items. You have just one element here, so
directly "enum" under oneOf.


Best regards,
Krzysztof
