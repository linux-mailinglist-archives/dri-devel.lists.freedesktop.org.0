Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3870A43380
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 04:18:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B027C10E534;
	Tue, 25 Feb 2025 03:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ShjVpeL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A8E10E534
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 03:18:05 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso4369919e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740453484; x=1741058284; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FCZchhqLX8uUjPFWnCBXbymsSao+hh9E/o3hFTKGn1Q=;
 b=ShjVpeL4DOQlJNcJ3/WWxsbWOidW6RUeSdF1YZ5XXOeV5PbuK5mxYpGWZLq3B/VeIH
 EH/q53BrB5GnEGpEcPz7H5Okfm9cTpiZpc0HK+YipsMy3PrUg0lrS52H4INtbUXAClCI
 jFUpT0DZrcz+BuLPsluoWrm727/VFH2sS46Hms0htecChFblhfsNGCytEycWHw8rOdsT
 6wmySSVeSEEewdKXFSofzG9pu6OIn8ofcUVjXdis+eEqJyecdQ0T9lzAvCp7sYxYnlWu
 dACszyQOTWQDghvcAhKgng/biBBVATTR4EWs7P6nlLXMDbesbf1nt4t29BWpJX7gTBzC
 UPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740453484; x=1741058284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCZchhqLX8uUjPFWnCBXbymsSao+hh9E/o3hFTKGn1Q=;
 b=g6q+zstdZyTE0S/tEoCdYKKRd06PaA90cEMiAG6sYvVtDKbYaQoV+kFJYz3BbFzPoI
 nBD7VBvl2QqUtCkNbakOp7mcqGtwSyBqzhi9WeBNnE4EzGo6AaHQBrlzxCRoBup/kMjv
 wJDz0IHx62G9a4CUgw4t27ih7yUymn4NaqdjWUXJOLsb/mlv9KtoCuXjQK35jYwtQVkY
 YkrsbUftJw+Jzyuv+xOjt16uqndY5ABHEPIQrlPwZynFqo35iocm0Uf5+aF4/a64RhHZ
 JXv1n4CiCLrFOfrcKG1CyZjx1RdbDorsdfgeB3BIZznx+Wfx+9jmi1os6/da++cNtu1S
 Mxdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjd69JCHKPzjgVtTrt1mUHT8utVG9fAIDAAp+WoVV1bWhEIuzL903iqZGDI/IoMmlJnvWQ2H8NQzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw59aoGxK8ImtkFt/JlpMwu9nP/+s8MaZNUNBFsAyb/W5ud3lFQ
 5d/xGAo8d3lezjH+vLbzBfgsSEcFz9ujDZUyVQDUWZZNKrJZeMJ/GCzj5ED0BTo=
X-Gm-Gg: ASbGncul+HyUQU+YYMVKrT4AXeZsf1eCxXiV7DWQY6uxgbMYgACTsoIr7G66Ti2W8K9
 +h1H4ZElKtPo/WNSfK7LQdL8XcWKVnraBr+UHuIy1HkbaysChEDfqrfHntD0N/Yvd7tL026F6ur
 TQXIe4bM4Rg4sOrDS34F/ZglS+9DxgEhEp6ApkoaLgAASbCZKoh/y9PrC3j84MMhOfKnSjC7KfG
 TjpaEGQms3Qv1Td14LNxskkH1+4EGBNu/N+/MY3sa59KYvyFbFnmfHaGBPwVed2fE9CQK8stz6Y
 zt6QRqUzdRfGkFKzrIf5Oe0dGeEmyE8lC7rsCJfmJW8TxO/ww1Rq8UFCTBrjk5kHW4pZuHiRNr2
 hrl2cFQ==
X-Google-Smtp-Source: AGHT+IFxB2QxizMw9nvjOf5qWvU6eGEcTycsMPv7lmMYbeJIpZO5aid9mAqXGRvFMkad/0CFLKqMhQ==
X-Received: by 2002:a05:6512:e97:b0:545:c1e:6603 with SMTP id
 2adb3069b0e04-54838f7ad45mr5175824e87.50.1740453483664; 
 Mon, 24 Feb 2025 19:18:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514fa0c4sm60528e87.225.2025.02.24.19.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 19:18:02 -0800 (PST)
Date: Tue, 25 Feb 2025 05:17:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <wo7ws3nfpniavprg55e3qchgxj4v7shra526ag7nuab57s2lxz@n6jef2ljd46t>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
 <77wat26ggsfqwssgt5wfq6yz6w3ccqz3pmn727a4aphqv4ljhx@vrzneg2rvzfj>
 <8b67cea3-82f7-47f8-b026-fd26cfbf94b4@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b67cea3-82f7-47f8-b026-fd26cfbf94b4@lucaweiss.eu>
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

On Mon, Feb 24, 2025 at 09:40:23PM +0100, Luca Weiss wrote:
> On 23-02-2025 7:25 p.m., Dmitry Baryshkov wrote:
> > On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> > > Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> > > Describe it and the Fairphone 3 panel from DJN using it.
> > > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >   .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
> > >   1 file changed, 75 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> > > @@ -0,0 +1,75 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Himax HX83112B-based DSI display panels
> > > +
> > > +maintainers:
> > > +  - Luca Weiss <luca@lucaweiss.eu>
> > > +
> > > +description:
> > > +  The Himax HX83112B is a generic DSI Panel IC used to control
> > > +  LCD panels.
> > > +
> > > +allOf:
> > > +  - $ref: panel-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    contains:
> > > +      const: djn,fairphone-fp3-panel
> > 
> > Would you know a better name or ID for a panel?
> 
> Initially no, as mentioned on the cover letter.
> 
> But I dug a bit more in some other documents and found this number now:
> "98-03057-6598B-I"
> 
> This also somewhat matches the format of the Fairphone 4 panel from DJN:
> ("djn,9a-3r063-1102b").
> 
> So I'll change the compatible to "djn,98-03057-6598b-i" in the next
> revision.

Thanks!

> 
> Regards
> Luca
> 
> > 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  iovcc-supply:
> > > +    description: I/O voltage rail
> > > +
> > > +  vsn-supply:
> > > +    description: Positive source voltage rail
> > > +
> > > +  vsp-supply:
> > > +    description: Negative source voltage rail
> > > +
> > > +  port: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - reset-gpios
> > > +  - iovcc-supply
> > > +  - vsn-supply
> > > +  - vsp-supply
> > > +  - port
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    dsi {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        panel@0 {
> > > +            compatible = "djn,fairphone-fp3-panel";
> > > +            reg = <0>;
> > > +
> > > +            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> > > +
> > > +            iovcc-supply = <&pm8953_l6>;
> > > +            vsn-supply = <&pmi632_lcdb_ncp>;
> > > +            vsp-supply = <&pmi632_lcdb_ldo>;
> > > +
> > > +            port {
> > > +                panel_in_0: endpoint {
> > > +                    remote-endpoint = <&dsi0_out>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +
> > > +...
> > > 
> > > -- 
> > > 2.48.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
