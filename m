Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64390BB3B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855A510E4CC;
	Mon, 17 Jun 2024 19:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n8sxCBcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7710E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:37:22 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52c7fbad011so5553767e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718653040; x=1719257840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3lWV8I5FVI0dWCO348F+TJ6mgy6m4jexZ2TUnszYTA=;
 b=n8sxCBcbD03qC/M0iudgUqHomnzEqTHMv4CXatjPcel0dS9MVxeaeoBoB6tvq/lk9/
 sw5XFTAApYFV6dHWHvhaZJ22ZRWSm4yRYgYUz7TWeV0SSToYezX4RTpO1wCxAFc7ENeD
 kCrnmBICFVGGGHEj06x23biY13xYlzXW6zzBI4SKbIWrW9I1lXYDkeQ21kHf/h5/ySjD
 1eFNWZZVDjaStyB/AWn1PNW9f81Oc/tOik1x6WmGmVYu4hVQKNFqN9o5naPQGfv2VDbh
 hxH30EFzuWtmgiaWz7mn94ROjXS8SEkiXnWHJoHBKwzNiH/+9EvxKvVl4s7EA0ETU26+
 52ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718653040; x=1719257840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3lWV8I5FVI0dWCO348F+TJ6mgy6m4jexZ2TUnszYTA=;
 b=XfQW1ij8A1bdJ3Bv2Dsf4W7bDtpk3AnhgcHat6rJXGNXm2CwPBPvS9/897vQ4hjoZB
 geUe8KBGXcLO4OXoo+tqQZ9pYmuHqvnpjDPjWWoEMll/dCqHxtAQPHXeIveGSxJCdDDh
 amU6AJV4dpnhSa9sZxy+1gMIRs8IXb5eJ5IJ2RIJHY+2GEawaj/9s+TgiqjKKs06xx47
 qjRhDMw09VHOY0hKTy6K3U1mB/EOvscx7n3EzOVY3Kc8n3xU3PqCYH4M8e6fr27lYv1q
 Km0hg8Pi7Cl6PwTf+F15aZ1UqDRVlGtuGoTBHUQYibQbcgmvJoWzMxANgbmd6q/DS14k
 ifPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVRW2BU4PhotIDTUhKvA+nuyz+hsES4UkoUWM2wb/p20Fwlnjf1fm45vQyCGE7iBTb/XpzWa64QNStU4Pjv9clqqAP4hPtG3X1Ts4XS9Nw
X-Gm-Message-State: AOJu0Yw2Y5vP+s7L6GX4giaF+uqNHYQjSuNskf6NXTdL6TmGoB4AyVpo
 JsE/PHrRoA/f268qteZlc+lIREEb0Rqo6zaGoqK0klDzB0Y2AsXYXpige7joxv8=
X-Google-Smtp-Source: AGHT+IGJ9kb9N4Obba0CKE0vXyHy1MEihZUnPT0jtn77r0HCwMnCuvrYTGNHAYH2xsym/gKKTVXT/Q==
X-Received: by 2002:ac2:518d:0:b0:52b:839c:78dc with SMTP id
 2adb3069b0e04-52ca6e6db33mr6078522e87.29.1718653040448; 
 Mon, 17 Jun 2024 12:37:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2871f71sm1321739e87.121.2024.06.17.12.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 12:37:20 -0700 (PDT)
Date: Mon, 17 Jun 2024 22:37:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH 1/4] dt-bindings: display: simple-bridge: add ti,tdp158
Message-ID: <y37rh2uulewie3mpumlznhmvrk4ileauhk6xkoafv4zt43q5wm@ftnpqit6alth>
References: <20240617-tdp158-v1-0-df98ef7dec6d@freebox.fr>
 <20240617-tdp158-v1-1-df98ef7dec6d@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-tdp158-v1-1-df98ef7dec6d@freebox.fr>
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

On Mon, Jun 17, 2024 at 06:02:59PM GMT, Marc Gonzalez wrote:
> In default mode, this device works transparently.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> index 43cf4df9811a5..5f0c9687538bf 100644
> --- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
> @@ -31,6 +31,7 @@ properties:
>            - ti,opa362
>            - ti,ths8134
>            - ti,ths8135
> +          - ti,tdp158
>  
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
> @@ -52,6 +53,9 @@ properties:
>      maxItems: 1
>      description: GPIO controlling bridge enable
>  
> +  vcc-supply:
> +    description: Power supply for the bridge
> +
>    vdd-supply:
>      description: Power supply for the bridge

I'd suggest having a separate _bindings_ file. This way you can point
out that it's an I2C device sitting on the I2C bus. And once somebody
has to extend the bindings to support 'smarter' programming of this chip
they can edit just that file. It's still fine to use the simple-bridge
driver for the device defined in that bindings file.

-- 
With best wishes
Dmitry
