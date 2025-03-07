Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E976A56090
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 07:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31B10EAE0;
	Fri,  7 Mar 2025 06:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v07kRZ4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736610EADF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 06:01:56 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so1800060e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 22:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741327315; x=1741932115; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=C65djOqhcGETcHae7N1a5CM3xNJNRB9w9qhV4EN153M=;
 b=v07kRZ4xFkMsYcQXyVc5RTRm+PHod1stYKY3epwLnbB/9iouI6anv9tJn1Vaw2i01R
 dx30ITpoYN/6JZuSdg1sUgmbOGT+5B66S4BMY25f3jlHxe+iqVxkTvcu7keSWAJ5B6/O
 SwYR3x/mX1p8LJW+tj44aherEXADCjcUIIjsR+5M96BxvfhmVNl2rROGKSL/0Oa5qzft
 U3meq3cEFzIDeIp3vGJyqyiyfyGsyI5mYjllVzU7ohlgVn4UJd75P8rMKnUAa8sLD5Wr
 r2dPuHMAhveH5+wHZAjdmmK440FEsdnRBFdgCfYetG/R7o3g8q1WJrJ058RlJATZBbEA
 IQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741327315; x=1741932115;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C65djOqhcGETcHae7N1a5CM3xNJNRB9w9qhV4EN153M=;
 b=Z1a/Lf7k3Vi5BhDHVV9Wl6iCzIqM6T5AFXmG4lMWuLmtbhWntV+U0icgka2FwSHfjQ
 Y7AYXC/slSlCWYTzbCZudApBjHfS8r/jM5wITpfvZ51XR4HJSbjWuyp+kIgzf4WIIVtr
 vXjA8yLqiICLgqb2xUbgCBfiLbjZE0irOPfUMyHXyOgQPfgdP8MKCwiNV1a/Zp1cYXmN
 Pc5TGTJ6WmT19KtKlfizdqtC5k4aon/Ia6WrM6kkCl/fX4pd2tx91JjfMZiSY5p9SoRS
 ax0zSetp8WX508Njgta8CS0oDIiaZtWDVyo2mlD1ij4pqAqhMiE5T3ON4GVa3jGlh4sA
 RdNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWypjqeL4IBZP/n2X0CrUXftKomdCA3Wnk+RyEc7KKu7GF0/EjuiJ7pLkOEX4VI02AMuBL1lFjembw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy31N2fRg9DMkPvXdgXyjc6sRYyXy5cxmxkj++RxFU/X9dlh7oV
 BXZk5EmrLhSaGXjgQG0v1Sxj9VcAvK6kxdyFmZuojumtumHnay5tWhsppvGl+GE=
X-Gm-Gg: ASbGncv6YlmCGB5ggiZPd6YaXlUYhpqDeDLQBEHSeJRt4BKP2ZL8jRn/aUFfcoMLZA1
 GbcJZYZMXOBjiLug2uhMkWjTh67edGBVAqXsBrtsKc+rz4yMN2WyNzF02VjQDTrK314+GewwxVq
 gegfB7FI8TeFeAAZt9y45/Q7HdXu2x4BRbynbJK+WNAjwJZ9Ra0rvVZkcrcrCQ2IwxZ4fndM/FQ
 CoM8pOQ+xN51/4L7z/ziBd0ILkjiYOTl1gdeWHFXkHljTEXLyTlrDj86jiiFjYjPb/FBH486Uii
 9LOmAO+EbmpDnEmcnVV8rAmt/eAWY56LCtBFuqUq0Et7JnBDt8twjJVE1v5qFb3K0+w016penpD
 q+IQ7PihjHnoNWThpsGDIEq+t
X-Google-Smtp-Source: AGHT+IHxRUqbuLmJjQEhQlkwaTO0qnaC2w02vtcpYT9p+yxaWvOQd3yxzCKNzTNRLOOam4AsBVyDMA==
X-Received: by 2002:a05:6512:3984:b0:545:f69:1d10 with SMTP id
 2adb3069b0e04-54990e2c082mr581760e87.8.1741327314649; 
 Thu, 06 Mar 2025 22:01:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98ec3f5sm4236181fa.28.2025.03.06.22.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 22:01:53 -0800 (PST)
Date: Fri, 7 Mar 2025 08:01:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "A. Zini" <alessandro.zini@siemens.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Marek Vasut <marex@denx.de>, 
 Andrej Picej <andrej.picej@norik.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: add
 h/vsync-disable bindings
Message-ID: <ps7s4fr3vznymp4kd6n4ovhzivbel5ueupvni2lgonxzujbr4o@zxuecu7gubdi>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
 <20250306091133.46888-2-alessandro.zini@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306091133.46888-2-alessandro.zini@siemens.com>
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

On Thu, Mar 06, 2025 at 10:11:32AM +0100, A. Zini wrote:
> From: Alessandro Zini <alessandro.zini@siemens.com>
> 
> Add hsync- and vsync-disable bindings, used to disable the generation of
> h/vsync signals.

Please describe, why this is necessary at all, instead of desribing the
contents of the patch.

> 
> Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> index 9b5f3f3eab198..ff80876d504ad 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -94,6 +94,18 @@ properties:
>        - port@0
>        - port@2
>  
> +  hsync-disable:
> +    type: boolean
> +    description: |
> +      Disable HSYNC generation on the LVDS output by setting the
> +      width in pixel clocks of the hsync pulse width to 0.
> +
> +  vsync-disable:
> +    type: boolean
> +    description: |
> +      Disable VSYNC generation on the LVDS output by setting the
> +      length in lines of the vsync pulse width to 0.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
