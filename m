Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5CC8D711C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 18:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2E10E18F;
	Sat,  1 Jun 2024 16:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tDzhyso7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70C710E18F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 16:28:02 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5295e488248so3226653e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Jun 2024 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717259281; x=1717864081; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8dCetMXBNsdnzLsPwECOfBM/mDQHWqh8OSO5TH9kB2E=;
 b=tDzhyso7QXptXiDAuIEz/cwRanHVqLJof4o8/9dbCPnvAtowHqTRmuSMx7X21QOeIW
 LaqYknFuOlFhtlchSa3VSk570v6QxRFxVC4m2gRaVgp+qY29IHRB5lGE9XygL/mmHnaq
 tqHBswfiCy32lplLG3D/4nJxZrZYjAB6XFn4wmSwPkIU9Z79it3jZCoDsrxWvFbIIfbb
 iuhswKnRrnEO0HfLl68rG4Iy+4LUUlop0AXV27bKMY+uicDP2dYW9i/MYhYKhab8e7s+
 whriioWPFht0cZYGoD8qp57avwcf7EQ3YcgjBrxZR2xN8eo5hq01YfF9TidKESxH7mtK
 zPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717259281; x=1717864081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dCetMXBNsdnzLsPwECOfBM/mDQHWqh8OSO5TH9kB2E=;
 b=ppSv0ZMd9s0GjXvW8w4bJSYDk4OqbnnKr2zDC9XzeVQ/VVzPmlimHs9EE3WtC4aF9c
 Ny33ZLNRxxckXWEcjmy89el7eqcn8i8hmBejSPToAhjMm1endU5u3kAKibl6P5j0UssU
 ALgLnmxjZNKOWzllQ6gfevKsboQFdpxrfr0SwneGzEXy5DM9zQ9PVRHF3S2Hfl96O1kD
 Zus0v39RIDWADWUfeZNj77/y9XAeYpZBDlpPq7PBtME3CvCCKy+5VzlqjUKH3jT1YML7
 nH2W5uAYT9Ad+YuTm8iDC3pQssP2CiNyww4I5RJBkFG1fQIiVru1v+UuLsNlDJ45xfAs
 dhqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsT+cGI7oSx0OjzaXIC9WjJ7fa7xDgGIle8l79L/87nFPejl8XoEi3icHN9mXVf6Ensqv3LVGQ7jgKzfKyeX4LNTsRep/4b2iui6kCSPQ9
X-Gm-Message-State: AOJu0YwFrr/g93HsjdledAPixVuULsho6W5I5Yuu9CouxBO3p0zZ3GAf
 H2WNl1WXadS6rzmccVRysrIvbkZpceyDmilAcmhXwS4ke4r2r1LYWtb05yiVty8=
X-Google-Smtp-Source: AGHT+IFZK15yzRbt5D2yDEHSiUdr/2IUT19M7aJMN/lyCgBX92vgdTniZ1S91kTimZ/n6owI25KOJg==
X-Received: by 2002:ac2:5626:0:b0:52b:8342:e0fc with SMTP id
 2adb3069b0e04-52b896c672fmr2853711e87.54.1717259280607; 
 Sat, 01 Jun 2024 09:28:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f1c7sm697442e87.91.2024.06.01.09.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jun 2024 09:28:00 -0700 (PDT)
Date: Sat, 1 Jun 2024 19:27:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: Add KD101NE3-40TI
 support
Message-ID: <oo6gggt2kpufvbwg6emoblg4opj2izdfjad4hzojbe7ddp57rp@a5vf23zrk22o>
References: <20240601084528.22502-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com>
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

On Sat, Jun 01, 2024 at 04:45:25PM +0800, Zhaoxiong Lv wrote:
> Create a new dt-scheam for the kd101ne3-40ti.
> The bias IC of this kindisplay-kd101ne3 panel is placed
> on the panel side, so when the panel is powered on,
> there is no need to control AVDD and AVEE in the driver.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> 
> Chage since V2:
> 
> -  Drop some properties that have already been defined in panel-common.
> -  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it
> 
> V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> ---
>  .../panel/kingdisplay,kd101ne3-40ti.yaml      | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
> new file mode 100644
> index 000000000000..b0cf12bb727d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd101ne3-40ti.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd101ne3-40ti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kingdisplay KD101NE3-40TI based MIPI-DSI panels
> +
> +maintainers:
> +  - Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Any reason for using a separate bindings instead of extending
panel-simple-dsi.yaml ?

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - kingdisplay,kd101ne3-40ti
> +
> +  reg:
> +    description: the virtual channel number of a DSI peripheral
> +
> +  pp3300-supply:
> +    description: core voltage supply
> +
> +required:
> +  - compatible
> +  - reg
> +  - pp3300-supply
> +  - enable-gpios
> +  - backlight
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel: panel@0 {
> +            compatible = "kingdisplay,kd101ne3-40ti";
> +            reg = <0>;
> +            enable-gpios = <&pio 98 0>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&panel_pins_default>;
> +            pp3300-supply = <&en_pp6000_mipi_disp>;
> +            backlight = <&backlight_lcd0>;
> +            rotation = <90>;
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
