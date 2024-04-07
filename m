Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1E89B400
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 22:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83C710F8DD;
	Sun,  7 Apr 2024 20:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oqwLriJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78B110F8DD
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Apr 2024 20:31:58 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516ef30b16eso854654e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Apr 2024 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712521917; x=1713126717; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BC/Vp9aTo7ncwzcGpzKoHrU+RFhFC5D/RE+BHxHMCVQ=;
 b=oqwLriJpl9eTogjDuEL0YG8b7lVcLQ5bhA4Xb/AO0YivymQEBxWAlnU+WtJMBmGgmT
 uWuukklhHDuOdk2+hGvOYBFl8MhITHcLlN0R9uhGDmlEfOppFrTPFsKvi9YnW//jdLKw
 mT3OQgZ+OrmMt/EeW0Trr8pCTQ175e0WSBfSXxxopsmJSPSaoPge5wPmvC2ZSZSh7XOO
 Bf7aBXfYxRi+KurpOmBSUHNpDYpMMjf3sIvlGb2AnUnD6RNHObClSloazvpQbsm9cPFx
 JeGkHco//odhEIA7XXm5NMh8WIKs23A79Z676goFLm8HE8y/VsTQjUMYM9DD+CotreSt
 B/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712521917; x=1713126717;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BC/Vp9aTo7ncwzcGpzKoHrU+RFhFC5D/RE+BHxHMCVQ=;
 b=ABpxViPAjx7WwxyrzFGKnUWgNQPcdM0jWpyVy6ea6W13rAxhpSTn6LfzGucuko3/kZ
 t83BBIO/992ctVMBe9SQNdp91RUxMHffaaGPhIaocxCcnZG5oNdpVyoNeWcEc5xZqTPj
 rl2+xBOAZCTb8nDCtRcSRw5ZtbRuSQ5Q3Y0opbboYrzgqJ6lLGZBVHcb5jnv11ZUViyZ
 qrbjvK1me/7LRFSO2AZRvkR0WDytjivT+TLvUGGuBh2FBf+u1tM7hKfiRchn0HX5vDuK
 Z91yJHRjxyVIfTi3d6l+9fV9wx73MinEx8DL06tCeOaZ7fuO26jHOCZu8/m+QWy826Jh
 GJeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX294R8MZUCk+Ssdhy3V+ltSIuV26acCNQ/yJxHKb7L22jf8UT/lRbbdPEtrsI2lDTUiKuzgJ8CjFgb2ICJGJ0F2KvEM8HVzqq3NrN+ag+B
X-Gm-Message-State: AOJu0Yzud6XgJTKp7+VlJsUMZsoEMow/1ZTeaZypHLwpiNK72qXBUxb9
 WjQdZchTgsO6NUriwF94kfq5EVOhef0GmmhpevHXROurUyGoCbwW23f1KLmlwCY=
X-Google-Smtp-Source: AGHT+IF4DMVCMB62tkqkfik57o48lX1JfihPhY8NVWkCpw1jpdJU/hGDdnCKUtnIerJssNTIq9AzTA==
X-Received: by 2002:ac2:53bb:0:b0:513:39a0:1fec with SMTP id
 j27-20020ac253bb000000b0051339a01fecmr3969120lfh.66.1712521916570; 
 Sun, 07 Apr 2024 13:31:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 j29-20020ac2551d000000b00513a1fe7767sm919668lfk.209.2024.04.07.13.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 13:31:56 -0700 (PDT)
Date: Sun, 7 Apr 2024 23:31:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, adrien.grassein@gmail.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 stefan.eichenberger@toradex.com, 
 francesco.dolcini@toradex.com, marius.muresan@mxt.ro, irina.muresan@mxt.ro
Subject: Re: [PATCH 2/2] dt-bindings: display: bridge: lt8912b: document
 'lontium, pn-swap' property
Message-ID: <dxm3js6qpcw3n4duid4vmhnkxacmzgq4rnvpbdx62pcn34ybzc@q57pst7lyumf>
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402105925.905144-2-alex@shruggie.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402105925.905144-2-alex@shruggie.ro>
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

On Tue, Apr 02, 2024 at 01:59:25PM +0300, Alexandru Ardelean wrote:
> On some HW designs, it's easier for the layout if the P/N pins are swapped.
> The driver currently has a DT property to do that.
> 
> This change documents the 'lontium,pn-swap' property.
> 
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> index 2cef252157985..3a804926b288a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
> @@ -24,6 +24,12 @@ properties:
>      maxItems: 1
>      description: GPIO connected to active high RESET pin.
>  
> +  lontium,pn-swap:
> +    description: Swap the polarities of the P/N pins in software.
> +      On some HW designs, the layout is simplified if the P/N pins
> +      are inverted.
> +    type: boolean
> +

I'd like to point out the standard `lane-polarities` property defined at
Documentation/devicetree/bindings/media/video-interfaces.yaml. You can
define and use it for the corresponding endpoint in the lt8912b schema.

>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
