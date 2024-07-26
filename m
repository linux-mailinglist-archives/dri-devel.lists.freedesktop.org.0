Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0C93CC16
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 02:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805BB10E8EA;
	Fri, 26 Jul 2024 00:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dHnmZNtc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EF810E8EA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 00:33:48 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-67682149265so10467887b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 17:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721954027; x=1722558827; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PGbRMFqNjqE2FGzKnJAnVl6N0locpudqp71TjSFPoRA=;
 b=dHnmZNtcCPkGqjeZOOmDqoJvH8lIORTYRcS1nX2o6Ol930PAXb9fdwUN5y6UdpqP/g
 02CXb7Tu1gGNu1mbe+Gjmk2q9nxFQKeDhigsIq9aZrhlIS35YA0Cnr0qij7bmoxlGL4E
 i4PuVaNQ4kHtR1JJiJ242ZtI8FQGo1Kf2Sx7v41ub6k82L8kOf4/WKPYIomG5bzXr019
 pISBZWUzq6k+4SVYvAZCFB+aXn5+t4n0T+b5fDy3RLSOs+4LBVDs3ezgwX6PZTUHGgP6
 ktnY1FqfIo1VraghOozS8zLyJOhRPDBzqk7wIvPQuYIurqR1OORzvhUOxmUQxbkvCc7Q
 BkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721954027; x=1722558827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PGbRMFqNjqE2FGzKnJAnVl6N0locpudqp71TjSFPoRA=;
 b=s1aXORLGRggpTW7mG/SZ6nFyxJbLxwECdqdDnxZXU/fkPtMNvaSsg52YfQHQUzw5fi
 s7QmSgCL0kDhSkfl71VMk3hsi/ylB7rlheMIh9giLvmqCtW4IIw95pj2SUeY8l/G/TVB
 k99KHVsGP8eoU+EERcCFD/5FKb3/QLB2cEkWx6OF2NcK/CAqIbRmYKoiWxlfJWR8EfqV
 g9ORWB7UsVq49JcHUHv69SKKnovW0SxO/mpzHwnGVE0baxSmd5xVeV1WHdq2uxcv0EOa
 /Ik1W0/3zX4PfJgvHk8tRaDXwUJZd6RCTUpBmiNXhzuj59qqBTa9tBo1h03WJXOIzowv
 odbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGicMiQiHhbf7CmOiH5lv0MyK/NtCZ8O+hjlYm0ZgosDUYuYc/mbY03Yi9AQCpbg4VPw+Lwlm+kr7r+Nj/avJ3UN0Z1NE0LaygDtYxe7kf
X-Gm-Message-State: AOJu0Yz4K12h8WgsxQXO5UJwEyXiEW7DzQzTqfTrWgb7VGkiTvT7IDW3
 CMWEJZChD9L7d1R9DX4cGKD83q9VM2HzEflQm79F1BW9082dSeGX
X-Google-Smtp-Source: AGHT+IGvyKLluKIWk4xhy3Z+igBHGE1XI2dKeVygogOJaSS0FOIYI1CJKYYr8IK+0PZw+U7Unncn8Q==
X-Received: by 2002:a81:bf4e:0:b0:648:3fb2:753b with SMTP id
 00721157ae682-67512028191mr51762717b3.24.1721954027486; 
 Thu, 25 Jul 2024 17:33:47 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3faea19bsm11714666d6.121.2024.07.25.17.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 17:33:46 -0700 (PDT)
Date: Thu, 25 Jul 2024 20:33:44 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <7l5jyzk4ojxtmihsnuz355x2qk632vgxdspgllxljhpzxzdhcb@aq5xyd64d2kb>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-2-lanzano.alex@gmail.com>
 <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7bf08aa-e7a0-4b60-b9fe-b43215ce3fb9@kernel.org>
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

Thank you for the review! I will address these comments in V2

On Thu, Jul 25, 2024 at 08:17:01AM GMT, Krzysztof Kozlowski wrote:
> On 25/07/2024 02:47, Alex Lanzano wrote:
> > Add device tree bindings for the monochrome Sharp Memory LCD
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> > ---
> >  .../bindings/display/sharp,sharp-memory.yaml  | 97 +++++++++++++++++++
> >  include/dt-bindings/display/sharp-memory.h    |  9 ++
> >  2 files changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
> >  create mode 100644 include/dt-bindings/display/sharp-memory.h
> > 
> > diff --git a/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml b/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
> > new file mode 100644
> > index 000000000000..a79edd97c857
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/sharp,sharp-memory.yaml
> 
> Filename based on compatible, so e.g. sharp,ls010b7dh04.yaml.
> 
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/sharp,sharp-memory.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sharp Memory LCD panels
> > +
> > +maintainers:
> > +  - Alex Lanzano <lanzano.alex@gmail.com>
> > +
> > +description:
> > +  This binding is for the Sharp Memory LCD monochrome displays.
> 
> Do not say that binding is a binding... instead describe hardware.
> 
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sharp,ls010b7dh04
> > +      - sharp,ls011b7dh03
> > +      - sharp,ls012b7dd01
> > +      - sharp,ls013b7dh03
> > +      - sharp,ls013b7dh05
> > +      - sharp,ls018b7dh02
> > +      - sharp,ls027b7dh01
> > +      - sharp,ls027b7dh01a
> > +      - sharp,ls032b7dd02
> > +      - sharp,ls044q7dh01
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  spi-cs-high: true
> 
> You can drop it.
> 
> > +
> > +  spi-max-frequency:
> > +    maximum: 2000000
> > +
> > +  vcom-mode:
> 
> Missing vendor prefix.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      VCOM is a signal that prevents DC bias from being built up in
> > +      the panel resulting in pixels being forever stuck in one state.
> > +      vcom-mode can be set to one of three modes
> > +
> > +      SHARP_MEMORY_SOFTWARE_VCOM - This method uses a kthread to periodically send a
> > +      "maintain display" message to the display, toggling the vcom
> > +      bit on and off with each message
> 
> You described Linux, this is not suitable for bindings.
> 
> > +
> > +      SHARP_MEMORY_EXTERNAL_VCOM - This method relies on an external clock to generate
> > +      the signal on the EXTCOMM pin
> > +
> > +      SHARP_MEMORY_PWM_VCOM - This method uses a pwm device to generate the signal
> > +      on the EXTCOMM pin
> 
> I don't see why do you even need this property. Just choose the best
> option based on available connections/pins.
> 

I wanted to cover most of the hardware configurations I've seen with these
displays. This property simplifies the driver implementation and allows the user
to explicitly state how the VCOM signal will be generated on their platform.

> > +
> > +    enum: [ 0, 1, 2 ]
> 
> Here 0/1/2 but above something entirely else. Just use strings.
> 
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: Enables display
> 
> Drop description and maxItems. :true is enough
> 
> > +
> > +  pwms:
> > +    maxItems: 1
> > +    description: External VCOM signal
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - spi-cs-high
> > +  - vcom-mode
> > +
> 
> allOf:
> 
> and missing ref to spi peripheral props
> 
> > +if:
> > +  properties:
> > +    vcom-mode:
> > +      # SHARP_MEMORY_PWM_VCOM
> > +      enum: [2]
> > +then:
> > +  required:
> > +    - pwms
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/display/sharp-memory.h>
> > +
> > +    spi {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> 
> Mess indentation.
> 
> Use 4 spaces for example indentation.
> 
> > +
> > +            display@0{
> > +                    compatible = "sharp,ls013b7dh03";
> > +                    reg = <0>;
> > +                    spi-cs-high;
> > +                    spi-max-frequency = <1000000>;
> > +                    vcom-mode = <SHARP_MEMORY_SOFTWARE_VCOM>;
> > +            };
> > +    };
> > +...
> > diff --git a/include/dt-bindings/display/sharp-memory.h b/include/dt-bindings/display/sharp-memory.h
> > new file mode 100644
> > index 000000000000..dea14c7bd7ec
> > --- /dev/null
> > +++ b/include/dt-bindings/display/sharp-memory.h
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +#ifndef _DT_BINDINGS_SHARP_MEMORY
> > +#define _DT_BINDINGS_SHARP_MEMORY
> > +
> > +#define SHARP_MEMORY_SOFTWARE_VCOM	0
> > +#define SHARP_MEMORY_EXTERNAL_VCOM	1
> > +#define SHARP_MEMORY_PWM_VCOM		2
> 
> Nope, drop the binding.
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Alex
