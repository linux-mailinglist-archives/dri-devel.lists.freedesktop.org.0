Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5C9B84AF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 21:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B5D10E927;
	Thu, 31 Oct 2024 20:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rnFpZuFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30E610E927
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 20:55:34 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso1521167e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730408133; x=1731012933; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h164uvathdh9GwUZcWXqlrzCUWdwa05VF7nF2pa0Pnw=;
 b=rnFpZuFHu6q0rSfTEd9WyZ2g7QEHdw+NVLYPxcP6MqG8PTreDDSlXigTVQEjmA4VIj
 uwO7cZGv8FRDSpTYH2T9uVoqcQE6e4DwoneitXUH1TWQYgz0tWok/tT9axUdSNrbHkri
 ZNCXwAs6xZ9edlLBSGsqe9ZLXDVIEhwnT/Jr+NEgjTdfjpQ1+HRB6Da6TEP+V6HsFzth
 FRD3QVTgfs1po2zt+rAXd6myQ8k+R/Gma4ceHzmXiFpP8S4VpwrpXSUoAf+oRmz2QC0L
 SVuNFZEapgCdde3EBCsNP524vv5DAytsWu+NEl92zEWmMnQtenXkATn8IQWvrJSojfv9
 kyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730408133; x=1731012933;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h164uvathdh9GwUZcWXqlrzCUWdwa05VF7nF2pa0Pnw=;
 b=pc4Fk6sF1GYN75p7BTsTxk/Y3SwY7aOhf9pJMGkGSNYarFyQ+vfelIq/ei0USKSnRq
 4cduZupVYSGAMhOLnxATf1qdgZXdK9/tLex5OzvjCekN16OMMGDLa5lm34ofj6Pdy/eh
 KQWK1+pvZ3p6jBSMe2nc0j1FDUEN8LI2d+Fa7KLm//NBxaMBfKSibZLl+526F+cDPkE6
 z1+vXH3Ki4DfKacLMh9sP9ZxD1Zlv9geodRs7KKoC6awG9N8BDiQOi8GkaMCCEA2+Gr1
 RcUPiWSY1KlIyq1yb+wUhwe5AxdVyo3OHunYCkaQNMsA0eo2AdBDrwgEVuPBH3F2DLXL
 3f5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHLa88ugg/f7MoT6oFj3RTnfVK+RWNvh+zZWut33TvPyUSIG9i99wN6GapaOgRCX20LKmoKueo0X0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8DTIvPhGMjexyEPiBWrhWE33SdkbzyG+fIUEBAmJhcyrgaMRb
 u00wymhJT0FRTKCUeUJ9C2crituDG6JEEpGlsa6GSnfQNuCSnVLm4Ljfs2o2NnY=
X-Google-Smtp-Source: AGHT+IGJ+tWCwIEDayGEBAeK10meBPh3PGgEPOw1Qyld1seRLcMErL1vcpY7qkKPYdHBp7JrKlK46Q==
X-Received: by 2002:a05:6512:32c7:b0:539:a353:279c with SMTP id
 2adb3069b0e04-53b348d8f6cmr11419018e87.28.1730408133014; 
 Thu, 31 Oct 2024 13:55:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bdcbcf6sm320927e87.194.2024.10.31.13.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 13:55:31 -0700 (PDT)
Date: Thu, 31 Oct 2024 22:55:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <jfvvw7rnkxp4xbcmcikyxyfmisx3bmng6uqc7yqsvkzhc3hhgq@arfzqn6raxcg>
References: <20241031194714.2398527-1-Frank.Li@nxp.com>
 <gz3ifraqt7ga4isxhx6negcmfngen5jmhmcecnvy7gu7mpfffw@j65umo6arwc7>
 <ZyPmeippTU8SQLkH@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyPmeippTU8SQLkH@lizhi-Precision-Tower-5810>
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

On Thu, Oct 31, 2024 at 04:20:10PM -0400, Frank Li wrote:
> On Thu, Oct 31, 2024 at 09:59:26PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Oct 31, 2024 at 03:47:14PM -0400, Frank Li wrote:
> > > Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> > > property referencing video-interfaces.yaml. Allow 'data-lanes' values
> > > 1, 2, 3, and 4 for port@1.
> > >
> > > Fix below CHECK_DTB warnings:
> > > arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
> > >  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > index 350fb8f400f02..5952e6448ed47 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> > > @@ -111,11 +111,27 @@ properties:
> > >          unevaluatedProperties: false
> > >
> > >        port@1:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > >          description:
> > >            DSI output port node to the panel or the next bridge
> > >            in the chain
> > >
> > > +        properties:
> > > +          endpoint:
> > > +            $ref: /schemas/media/video-interfaces.yaml#
> > > +            unevaluatedProperties: false
> > > +
> > > +            properties:
> > > +              data-lanes:
> > > +                description: array of physical DSI data lane indexes.
> > > +                minItems: 1
> > > +                items:
> > > +                  - const: 1
> > > +                  - const: 2
> > > +                  - const: 3
> > > +                  - const: 4
> >
> > Why are they indexed starting from 1?
> 
> Not sure, git grep -r data-lanes Documentation/devicetree/bindings/
> Most start from 1. Not sure latest DT team's intention.

They usually start from 1, because just before the property comes
'clock-lanes = <0>'. Otherwise in most of the cases the lanes are
indexed from 0.

> 
> Frank
> 
> >
> > > +
> > >      required:
> > >        - port@0
> > >        - port@1
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
