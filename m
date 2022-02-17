Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D8D4B9F50
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 12:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F5610E61D;
	Thu, 17 Feb 2022 11:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E2110E61D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:43:36 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC5214060E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645098214;
 bh=3aXOIs5DNsSKgW4lPlRH0E+Ngbbzp4EOvtZ59naGoig=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=cjQ6fzIwRzlwVd91PhJZeRn+6TBH9gUF1RtPgvZbSshGgFVuAJZRp85V+zIGK7Oz0
 aVXnbrFLUe6ng6E9yKX4MBZ8EC5a6ZpxBW1zAbmWN4gL5rXdv4U5tLGOTE4YaNluqe
 Kp6/c604HBSQ8uL1FgfXADdGN5ov6HyoOcHCQt6tl9QjX3N7P+yrgxH/k2V3amDoHl
 76kWQGgf+rFNprIK14+X5e5njxkiS/SloRbbH9OoMl9IkCf0nJMOLJQDC0U3bpOfXV
 +QVoo2atdlAKPO+1wq/wwc4WhWjMXFxyV3nsq2g7MB6EZKUw5AkgfwK1Uq8TBHyirT
 NaMkgbrn5Yv2g==
Received: by mail-ed1-f72.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so3379518eda.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3aXOIs5DNsSKgW4lPlRH0E+Ngbbzp4EOvtZ59naGoig=;
 b=eP+/2kkzvzEEAk2SRjNNN26+2Yzn0Xna+IrX81Etapnb5GxL7VgBeTahj/DpNkE7Yh
 oOzdMZVKJPvSTW5dV1fR38A700ry2LITGyqAk/HFbkAiMsB588XutOOqJVsMyqNxrAuE
 ExYMhmeSh+d75+5FcWPkDWYnHAnQdZV7KyiMn4KTnWv7vzzI9Xa9OyuU0tcYkfHUBk+z
 wrAqg+8uo+yTs9pz7YOg1dDL7H75O6zKRLfuzqpWUIdPco7mRAo61mNEzU5GA5XE9Zrh
 GYV0+KeiJqr32IQV7Hj6/tflhktAVN4kl5Xzra+RCTXh6QoDEr6sgWWtUfIkHzips/Ye
 iPVg==
X-Gm-Message-State: AOAM531P3pmUecs8ZZne98qWi1G3WRhwb7sIOgvTD20zmN7Ruof6AdbK
 T+pbvfSiHNIOWeo0YXbrRc/dg/oj5XiV64cA5s5Ax2PS82zPdRe1KhYc6Ct8a2oRNZlEGJGnXzN
 NW5UQzr8Ytm3CT5fw1hyqbpGOc00Iy7wPCrLsLeA+qsWYhw==
X-Received: by 2002:a17:906:6158:b0:6ce:61d6:f243 with SMTP id
 p24-20020a170906615800b006ce61d6f243mr1988819ejl.268.1645098214313; 
 Thu, 17 Feb 2022 03:43:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnueVtVPrDA18T6no1BS6n/l07Q8n/Fr3Su2uWY+sD+U260MD/MJML+fbL+MqaXEB6RoP9ig==
X-Received: by 2002:a17:906:6158:b0:6ce:61d6:f243 with SMTP id
 p24-20020a170906615800b006ce61d6f243mr1988803ejl.268.1645098214033; 
 Thu, 17 Feb 2022 03:43:34 -0800 (PST)
Received: from [192.168.0.111] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id e27sm1130144ejm.18.2022.02.17.03.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 03:43:33 -0800 (PST)
Message-ID: <4c1c1a36-2e6f-a061-5c2b-f2aac31b2d0e@canonical.com>
Date: Thu, 17 Feb 2022 12:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/6] dt-bindings: display: imx: Add EPDC
Content-Language: en-US
To: Andreas Kemnade <andreas@kemnade.info>
References: <20220206080016.796556-1-andreas@kemnade.info>
 <20220206080016.796556-2-andreas@kemnade.info>
 <36445c86-036e-0942-a9a4-919595886c67@canonical.com>
 <20220217123112.3ba70000@aktux>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220217123112.3ba70000@aktux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, tzimmermann@suse.de, samuel@sholland.org,
 airlied@linux.ie, s.hauer@pengutronix.de, alistair@alistair23.me,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com,
 josua.mayer@jm0.eu, shawnguo@kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 12:31, Andreas Kemnade wrote:
> On Thu, 17 Feb 2022 10:21:15 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> 
>> On 06/02/2022 09:00, Andreas Kemnade wrote:
>>> Add a binding for the Electrophoretic Display Controller found at least
>>> in the i.MX6.
>>> The timing subnode is directly here to avoid having display parameters
>>> spread all over the plate.
>>>
>>> Supplies are organized the same way as in the fbdev driver in the
>>> NXP/Freescale kernel forks. The regulators used for that purpose,
>>> like the TPS65185, the SY7636A and MAX17135 have typically a single bit to
>>> start a bunch of regulators of higher or negative voltage with a
>>> well-defined timing. VCOM can be handled separately, but can also be
>>> incorporated into that single bit.
>>>
>>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>>> ---
>>>  .../bindings/display/imx/fsl,mxc-epdc.yaml    | 159 ++++++++++++++++++
>>>  1 file changed, 159 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mxc-epdc.yaml
>>>
> [..]
> 
>>> +
>>> +  DISPLAY-supply:
>>> +    description:
>>> +      A couple of +/- voltages automatically powered on in a defintive order  
>>
>> Typo, definitive?
>>
> yes, of course.
> 
>>> +
>>> +  VCOM-supply:
>>> +    description: compensation voltage
>>> +
>>> +  V3P3-supply:  
>>
>> All of supplies names - lowercase.
>>
>>> +    description: V3P3 supply
>>> +
>>> +  epd-thermal-zone:
>>> +    description:
>>> +      Zone to get temperature of the EPD from, practically ambient temperature.  
>>
>> Is it a phandle?
>>
> a string used in
>        of_property_read_string(priv->drm.dev->of_node,
>                                 "epd-thermal-zone", &thermal);
>         if (thermal) {
>                 priv->thermal = thermal_zone_get_zone_by_name(thermal);
>                 if (IS_ERR(priv->thermal))
>                         return dev_err_probe(priv->drm.dev, PTR_ERR(priv->thermal),
>                                              "unable to get thermal");
>         }

OK, then:
$ref: /schemas/types.yaml#/definitions/string

> 
> [...]
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/imx6sl-clock.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +    epdc: epdc@20f4000 {  
>>
>> Generic node name, e.g. display-controller
>>
> hmm, does IHMO not make too much sense here. E.g. in the imx6sll.dtsi
> we have lcd-controller next to it. So having epd-controller? But that
> is exactly what epdc stands for.

Still we have "lcd-controller", not "lcdc". Since this is only for epd,
then "epd-controller" seems reasonable. The same as we use
"interrupt-controller" (not "ic"), "dma-controller" (not "dmac" or "dc")
and so on. See also list of recommended generic names from DT specification.

Best regards,
Krzysztof
