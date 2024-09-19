Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F397C812
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 12:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1C410E190;
	Thu, 19 Sep 2024 10:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rBBfeOAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9103110E171
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 10:40:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5365d3f9d34so707717e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726742423; x=1727347223; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tlp0Vtf+ppPpgYrefgR4cL8ADFuvH9H5/WfU6RLRJKw=;
 b=rBBfeOAHpc1nZEKlon9gS2q+biFG11EjHMUwK140Je2r1oa3ZoZlcV4VscjIIhU2bR
 FfJv2Ho/PJVjtHMwkahmIzsVF2tFSQiP0gsw7MQ5Q+Is2tQaiVMOsORUvJ3xS+2uAcAE
 SLjnHSuIGnLmD9lZS7gByvWFcicZZyE3ITUiNvvsrH3srBdiE4nti3C6+7IfdF+DNVWf
 OGEXKn4lgBfElgH3pUAo5RQUsbaL3cj3zTHfkoEG18RcOq02g+34imMod9SOFO2SWHUY
 5xv1OmC3ZRQ9yXe8wc/9SDSkIJClt3NWvsFHBZqyOaDUT6RMbORdlt0tDp/R60ca306k
 aykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726742423; x=1727347223;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tlp0Vtf+ppPpgYrefgR4cL8ADFuvH9H5/WfU6RLRJKw=;
 b=bli0tZzEDaUEfLLnq5e6gT89pBKutdOpmATrm958x1JiEgiwK+j8pCbHcpySbznoV0
 do88coXch9pm/ZrIR8uVuvfDFfszwmPwEszEyZ9FmFKUxHtyxJcVxFHl1E2vDJ5K1KvU
 HZHjF7nvCijSmCKPYTETaTWM/fcwgqX+k1ChpHmSB2lOz+jBjvGyS3yg9ydCAL8O6/La
 K4Cy0OQVvJfzGIHVjqQxGqDkaDJqnkBdwewIDIaKHw6KE/Z+0Fez/jpq/+2fHWJYFMwi
 l+eHsWlk7IkAsXVbcjE1F+KeH+LFVwtMMpa1GF0UNpIPahSxN27ozwQXv05kya8fUACV
 LyYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7X3Thrn18Fv4uypsR2qEieM0YOzHnSv1DWzzNSxHPQxnePoiG0Ticon7IubvaFtQsuW+F7w+WVyQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLdNq66MrIX9cqftA6icAVeThEoD3keBmJwxcyphA9oq5y6eHl
 ospLlZsBsArjl76sU+kE6d1QopY0uEZLDz3MldeLkpCHeFmL1rY1orWy+Q0UScw=
X-Google-Smtp-Source: AGHT+IFsBfQFVXZbIJ+oDVW1NrcdVcEb6a89r2YZcMp056f8arAvyaJffZux2dBaqfrkRNgZ76BvOw==
X-Received: by 2002:a05:6512:3d87:b0:535:82eb:21d1 with SMTP id
 2adb3069b0e04-5367ff329d7mr11826771e87.57.1726742422532; 
 Thu, 19 Sep 2024 03:40:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870b421esm1839803e87.254.2024.09.19.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 03:40:20 -0700 (PDT)
Date: Thu, 19 Sep 2024 13:40:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 patches@lists.linux.dev, devicetree@vger.kernel.org, 
 Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, 
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, 
 linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v4 13/18] dt-bindings: usb-switch: Extend for DisplayPort
 altmode
Message-ID: <27acewh6h2xcwp63z5o3tgrjmimf4d3mftpnmkvhdhv273zgsp@i6i5ke4btdqx>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-14-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901040658.157425-14-swboyd@chromium.org>
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

On Sat, Aug 31, 2024 at 09:06:51PM GMT, Stephen Boyd wrote:
> Extend the usb-switch binding to support DisplayPort (DP) alternate
> modes. A third port for the DP signal is necessary when a mode-switch is
> muxing USB and DP together onto a usb type-c connector. Add data-lanes
> to the usbc output node to allow a device using this binding to remap
> the data lanes on the output. Add an example to show how this new port
> can be used.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../devicetree/bindings/usb/usb-switch.yaml   | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> index f5dc7e23b134..816f295f322f 100644
> --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> @@ -52,6 +52,14 @@ properties:
>            endpoint:
>              $ref: '#/$defs/usbc-in-endpoint'
>  
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: '#/$defs/dp-endpoint'

Is it a separate port or is it an endpoint of the same upstream-facing
(non-connector-facing) SS port?

> +
>  oneOf:
>    - required:
>        - port
> @@ -65,6 +73,19 @@ $defs:
>      $ref: /schemas/graph.yaml#/$defs/endpoint-base
>      description: Super Speed (SS) output endpoint to a type-c connector
>      unevaluatedProperties: false
> +    properties:
> +      data-lanes:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: |
> +          An array of physical USB Type-C data lane indexes.
> +          - 0 is SSRX1 lane
> +          - 1 is SSTX1 lane
> +          - 2 is SSTX2 lane
> +          - 3 is SSRX2 lane
> +        minItems: 4
> +        maxItems: 4
> +        items:
> +          maximum: 3

What is the usecase to delare less than 4 lanes going to the USB-C
connector?

>  
>    usbc-in-endpoint:
>      $ref: /schemas/graph.yaml#/$defs/endpoint-base
> @@ -79,7 +100,75 @@ $defs:
>          items:
>            maximum: 8
>  
> +  dp-endpoint:
> +    $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +    description: DisplayPort (DP) input from the DP PHY
> +    unevaluatedProperties: false
> +    properties:
> +      data-lanes:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: |
> +          An array of physical DP data lane indexes
> +          - 0 is DP ML0 lane
> +          - 1 is DP ML1 lane
> +          - 2 is DP ML2 lane
> +          - 3 is DP ML3 lane
> +        oneOf:
> +          - items:
> +              - const: 0
> +              - const: 1
> +          - items:
> +              - const: 0
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +
>  examples:
> +  # A USB + DP mode and orientation switch which muxes DP altmode
> +  # and USB onto a usb-c-connector node.
> +  - |
> +    device {
> +      mode-switch;
> +      orientation-switch;
> +
> +      ports {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +          reg = <0>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          endpoint {
> +            remote-endpoint = <&usb_c_connector>;
> +            data-lanes = <0 1 2 3>;
> +          };
> +        };
> +
> +        port@1 {
> +          reg = <1>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          endpoint {
> +            remote-endpoint = <&usb_ss_phy>;
> +          };
> +        };
> +
> +        port@2 {
> +          reg = <2>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          endpoint {
> +            remote-endpoint = <&dp_phy>;
> +            data-lanes = <0 1 2 3>;
> +          };
> +        };
> +      };
> +    };
> +
>    # A USB orientation switch which flips the pin orientation
>    # for a usb-c-connector node.
>    - |
> -- 
> https://chromeos.dev
> 

-- 
With best wishes
Dmitry
