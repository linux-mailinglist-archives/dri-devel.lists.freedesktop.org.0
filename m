Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561999C871
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 13:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66D510E429;
	Mon, 14 Oct 2024 11:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vU5jUnhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1210E432
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 11:15:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5398ec2f3c3so4857942e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728904506; x=1729509306; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f1bUQlHCbT2dTkZPSuiC9mud0kneaD+Pw3knr/ZeleM=;
 b=vU5jUnhwSj+lZCli5pIU03W9Vu4/pVtASCOB+92xX7MhzGU6xNrM6nLI5EsyZxhkWN
 vq+ftn0VXNCcUf3dKxxiDh7TEs3L9OGWsQFL+RY9trrAyngu3/RZ+kwsd+kS4SItc568
 SSo2hF7gylVARicqbesBtagkToA0scnYbEJkN4aSwgxUoRpp+mJfO0Z8FxK3hzXMHE5b
 tx3uZoTmuMmRsMqbt35uT7RFILflB19uJkbBmXWmjSWygxzh4GMnF6UfARGwvTvMw6J6
 Tn1nUl4F7SoQG9ehji5YvUEw3QKg3OKW/faabdtjnWw9AGIukSQix8AWmJX62CY91eIF
 REfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728904506; x=1729509306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f1bUQlHCbT2dTkZPSuiC9mud0kneaD+Pw3knr/ZeleM=;
 b=d3XUq/4W9u7vQwkkMDLwrRfIhymmXJ5P8NoPe98Dfc7gDVFgDDGPl/CHHcQNk1QXnc
 Ar7AJiMNgykCxUg7ksixRhPlyApGzBaQ92iD/HzGk+40MP15vVMzf0NraH4MrJaptBDa
 14tUVxsUPFgVkw1XhOq4Tmf7onx5JIYgdUOmoYWillx2NtcOXgHQsEM76eI+48deHh75
 9f3CK3PCz9Whl+OnkKw6niLvYO4miLFprK82OKq7ok70ctq+/gl/iDEXDx2kDJk+WRh9
 e6OK3ZDFHDr+76njcQsEbjc2OJ8L21NciX0J9WAhcx0d5ouv8jOGzlSVpoJrNjzMy5xZ
 SVvw==
X-Gm-Message-State: AOJu0YzT/QApGSkU6//XlcFwyz7yc+lZWvtHrm+aBC+Q0fWNOYoSWzf4
 /PvqdQHR8I1XzWo8mo14rM68QmzNxnrfcXHljK1nv/U90EpYOlZU4HQP4aPqpPw=
X-Google-Smtp-Source: AGHT+IFTmmVVdQwxohG9fsiP3DZsmMJAgt7EhHpkkkjFLODtZTAIQNhHKAg+QqqF6e3kl1afirCUQA==
X-Received: by 2002:a05:6512:10d1:b0:532:c197:393e with SMTP id
 2adb3069b0e04-539e54d7ba7mr2649208e87.11.1728904505982; 
 Mon, 14 Oct 2024 04:15:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8f0ea9sm1625945e87.186.2024.10.14.04.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 04:15:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 14:15:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
 quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de,
 nfraprado@collabora.com, 
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Message-ID: <wplt4txytz4fj7o6qzxualuj45rzmim3yfn6vvefrhoga6lmfk@5llfokdecuan>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
 <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
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

On Mon, Oct 14, 2024 at 06:01:49PM +0800, Liu Ying wrote:
> On 10/14/2024, Dmitry Baryshkov wrote:
> 
> [...]
> 
> >>>>> My suggestion would be to add a single root-level property which
> >>>>> specifies which port provides even pixel data.
> >>>>
> >>>> That won't work.  The LVDS source side expects the ports of
> >>>> the sink side specify dual-lvds-{odd,even}-pixels properties.
> >>>
> >>> I didn't notice that these properties are already defined.
> >>>
> >>> As these properties are common between several schema files, please
> >>> extract them to a common schema file (like lvds.yaml).
> >>
> >> I'm not sure how to do that. Is it obvious?
> >> Please shed some light. 
> >>
> >> Only two panel schema files are defining even/odd pixels now -
> >> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> >> Maybe, extract them later when more schema files(especially for
> >> bridges) try to define the same?  I'd like to keep a low profile
> >> for now.
> > 
> > I'd say, please extract those now. Adding third is more than enough and
> > should be avoided. Extracting is pretty simple. One patch to move the
> > definition and descriptions from panel-simple-lvds-dual-ports to a
> > common location (e.g. lvds-dual-ports.yaml). Leave the required
> > constrains in place. Second patch is to add oneOf constraints to the
> > ports. 
> 
> oneOf just sits below ports so that single-port and dual-port
> are documented separately?  That won't pass dt_binding_check
> as the v1 binding has proved that warnings will be generated.
> 
> > port@0 might get the same oneOf + the
> > dual-lvds-{odd,even}-pixels:false case, allowing a single-port
> > definition.
> 
> I don't catch this.
> Below snippet is a draft lvds-dual-port.yaml.
> How can it be referenced in ite,it6263.yaml?

allOf:
 - $ref: /schemas/display/lvds-dual-port.yaml

Another option might be to use $defs, define two combinations:
single-or-dual-port, dual-only-port. Reference them from the panel
bindings and from your bridge bindings by using:

 ports:
    port@0:
      $ref: /schemas/display/lvds.yaml#/#defs/single-or-dual-port

    port@1:
      $ref: /schemas/display/lvds.yaml#/#defs/dual-only-port

(the names are just an example, feel free to come with better
suggestions).

> 
> ---8<---
> allOf:                                                                           
>   - $ref: lvds.yaml#                                                             
>                                                                                  
> properties:                                                                      
>   ports:                                                                         
>     $ref: /schemas/graph.yaml#/properties/ports                                  
>                                                                                  
>     properties:                                                                  
>       port@0:                                                                    
>         $ref: /schemas/graph.yaml#/$defs/port-base                               
>         unevaluatedProperties: false                                             
>         description: the first LVDS input link                                   
>                                                                                  
>         properties:                                                              
>           dual-lvds-odd-pixels:                                                  
>             type: boolean                                                        
>             description: the first sink port for odd pixels                      
>                                                                                  
>           dual-lvds-even-pixels:                                                           
>             type: boolean                                                        
>             description: the first sink port for even pixels                     
>                                                                                  
>         oneOf:                                                                   
>           - required: [dual-lvds-even-pixels]                                    
>           - required: [dual-lvds-odd-pixels]                                     

Also under oneOf:
 - properties:
     dual-lvds-odd-pixels: false
     dual-lvds-even-pixels: false

>                                                                                  
>       port@1:                                                                    
>         $ref: /schemas/graph.yaml#/$defs/port-base                               
>         unevaluatedProperties: false                                             
>         description: the second LVDS input link                                  
>                                                                                  
>         properties:                                                              
>           dual-lvds-even-pixels:                                                 
>             type: boolean                                                        
>             description: the second sink port for even pixels                    
>                                                                                  
>           dual-lvds-odd-pixels:                                                  
>             type: boolean                                                        
>             description: the second sink port for odd pixels                     
>                                                                                  
>         oneOf:                                                                   
>           - required: [dual-lvds-even-pixels]                                    
>           - required: [dual-lvds-odd-pixels]                                     
>                                                                                  
>     required:                                                                    
>       - port@0                                                                   
>       - port@1                                                                   

You allow both single-port and dual-port configurations, so you can not
use this required statement. Please keep this part in the corresponding
panel bindings.

>                                                                                  
> unevaluatedProperties: false   
> ---8<---
> 
> -- 
> Regards,
> Liu Ying
> 

-- 
With best wishes
Dmitry
