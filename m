Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010469B83E2
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE9810E91B;
	Thu, 31 Oct 2024 19:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rcPbxb/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E4C10E91B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 19:59:30 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb49510250so14314081fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730404769; x=1731009569; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r2xSFooj3LTMdkPz8EDCzvFWM6rUJZfX8/xlhCllXOs=;
 b=rcPbxb/JS3WSKv0WjdORBl1lx5L5+9tUEsKO10+JfruDh9DGXKAyRGepoQXmrQksf0
 CwxkRt4IXCTyt0vSxwHe8K97Z/PW+QgEjUeZyos1l+GGoq4aF/v/6KvP+3Mdc2X3kS2d
 JOubAcxgBHvCc85d3gr0xLJ4IJj1flsmQevgUaQlJ7MzGK17RgNswOIq7RVn4H7wtSuT
 XqXY+Cfip/jPoXY1Yybu5JBS1/VMLa6uJ1ftj++TrTz2TOYj6Cv/2f+63XznaPGGThzc
 A2Gh04sbSxQXE5BpbMsVGba8aknvZST6d07EhoVXbXaxCuI8LOfLjhcoWaF9lGFylmKd
 sl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730404769; x=1731009569;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2xSFooj3LTMdkPz8EDCzvFWM6rUJZfX8/xlhCllXOs=;
 b=wSWbHb2Yltx0FCZ4bkUvbVtko3NeSirJYPkN2e1kxjgRVMAqgdqDgtoY3GEq7Gzcxw
 w7/npS1yRKOqz1ZDVGhZj1WwxqypZqw/6IQ/W0/fQNTXCflg8fsTCpg5qIeDmFwuN37+
 grceor7m3LN04BcbhStCDWiCPxRpyCq/k7LiKyP8fN/2iuOTl2s7bZT210Zz+tobLQET
 pZs2PMtInl3cNExnAuBH+VBMbJM52GBijjMYtzFugfdYML0S8x9gS25LC1E7V06khnRP
 292ghXF+fEaegcGRRv+yt2pEukP6WWp3hfYgNov+sFEBlwaSm/csGKPh0LgJNfXzHpoI
 YDdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr3XHYKA0Xug1uRKi5NaWgnmAlpEIfA0g8wGkegFofWgMn+CQV37cDISGvmY7uFotiOFwDU6kxt4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwClCvyxaaNNbad1I7qo2VXwD1Fqg8rD+iLvB3mNtCw/ROZPryu
 bhCWEWg2z0rVcq2+CRNMW8UJai7p+UyWX0wiXZK33Nlndfm+Nup++m5NU60ZqH8=
X-Google-Smtp-Source: AGHT+IHDY9mv/LMyrOcAiV/L1FzFmSewuJQRy7gy5xJKrH90HggjEEuq5c/C64nK+qTpVwhpZjhxzg==
X-Received: by 2002:a05:651c:556:b0:2f6:649e:bf5c with SMTP id
 38308e7fff4ca-2fdec726444mr22632061fa.17.1730404768964; 
 Thu, 31 Oct 2024 12:59:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef3b8ed5sm3238001fa.13.2024.10.31.12.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:59:27 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:59:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, 
 Robert Chiras <robert.chiras@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031194714.2398527-1-Frank.Li@nxp.com>
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

On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> property referencing video-interfaces.yaml. Allow 'data-lanes' values
> 1, 2, 3, and 4 for port@1.
> 
> Fix below CHECK_DTB warnings:
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
>  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 350fb8f400f02..5952e6448ed47 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -111,11 +111,27 @@ properties:
>          unevaluatedProperties: false
>  
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description:
>            DSI output port node to the panel or the next bridge
>            in the chain
>  
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.
> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4

Why are they indexed starting from 1?

> +
>      required:
>        - port@0
>        - port@1
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
