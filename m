Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D77FB93B5DC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768CE10E76A;
	Wed, 24 Jul 2024 17:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Zpmhjnjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2538310E76A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:25:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so697435e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721841904; x=1722446704;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G2wtHxCFXvugNWOKb66peE9MjXsIEe2eqVX4SkDkj8s=;
 b=ZpmhjnjojULQRmMjjMJi8v7JUqBywCxYGX7bwP0J7PNZgDD4Nm58EV/Fs4Aflpyf72
 tAKOJ3u7W16lhfp+RpyqbbsAELGP+fUarPz8V51JGaWhmnlmAyLhv7qklAtyrzHl/E8L
 8S7m7+cor/Jh/XbcqYzJsPTQ+kAIRUOu+WJQ7roSKdgy5J3h/K56BAMSTDB+Ca0lC4ZJ
 5wY0gpNLjuvKr+aJSli6Fd5bPZyIooWtrg83piAFLtPfIsO6GSmBCzVzBwfOkM+g7Csx
 NJuggJuYWDZ1NUERpdgvJUFep8KO7Rcp7WnR8dWhsxzvbOWtMRAIfoWKTpVsgghCWQXq
 69FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721841904; x=1722446704;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G2wtHxCFXvugNWOKb66peE9MjXsIEe2eqVX4SkDkj8s=;
 b=m+xYDCNyFnxn2J7tx2+OOATBTorPLCqziEO7Rbp8Iza5GVHImxsYlzl+gDBdJMqjRR
 l4ltOTPFcCfk3LA7BUtuqOwxBh5vWftPk+j1dbXT14/K4eVQB14jrsYGWRNEKu5USWCU
 r4jJQGkd8ox+ml/iQE6CLika2AXcg7Lr6y3B6EdbNu3i0ffqsUFWSLMs/QI73CRshWh1
 cQVmf74w9rt5/GbiecPCeWnWTwUpGoKaqJ96D2oWXgN2SYMXahXEk0YYkFsevGPgWFTc
 xAy5k+cYRyVi2eRMtZQj9pZb90LPrnR8aJgdG8kweW8gvJ9JFgyshwY/6bQnb21sqOeA
 iEAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjlggv0jtY2or3vbyFIiplOwrzooRS9cZN3L/1Edpe6AehAHVpZISG5kxovYLMSZ7mwSXMauoQ4rBdrHiOy78Y05CjYM6v908qCRs1mopg
X-Gm-Message-State: AOJu0YwFeN+Jx+KvTyezk9v9GRXqEmewl7osgdeWZrm0oBxSs+JS/uEd
 OP1Vx/V5GyGS/3nJHLpLTjdsSAo287BPgFc7v2t4FQ2Dj0RB1yPe6m+DqWpRjKE=
X-Google-Smtp-Source: AGHT+IGucX8zWd1R5wP66+MoCWL850t2U9ri5dLuxKlMp67ML3npni0StBvhucvdoshOd+rhecnyVw==
X-Received: by 2002:a05:600c:45d2:b0:426:5fa7:b495 with SMTP id
 5b1f17b1804b1-42803b58877mr2098995e9.15.1721841904331; 
 Wed, 24 Jul 2024 10:25:04 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8?
 ([2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f940e62dsm39430005e9.39.2024.07.24.10.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 10:25:04 -0700 (PDT)
Message-ID: <c9fe193e-c577-4678-afd1-89d6b39b4dae@freebox.fr>
Date: Wed, 24 Jul 2024 19:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
 <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
 <20240716-exuberant-diligent-beagle-c43ffc@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240716-exuberant-diligent-beagle-c43ffc@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/07/2024 11:24, Maxime Ripard wrote:
> On Mon, Jul 15, 2024 at 07:38:34PM GMT, Dmitry Baryshkov wrote:
>> On Mon, 15 Jul 2024 at 17:42, Maxime Ripard <mripard@kernel.org> wrote:
>>> On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
>>>> On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
>>>>> On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
>>>>>> On 01/07/2024 15:50, Maxime Ripard wrote:
>>>>>>> On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
>>>>>>>
>>>>>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
>>>>>>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
>>>>>>>> It supports 4 TMDS channels, HPD, and a DDC interface.
>>>>>>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
>>>>>>>> for power reduction. Several methods of power management are
>>>>>>>> implemented to reduce overall power consumption.
>>>>>>>> It supports fixed receiver EQ gain using I2C or pin strap to
>>>>>>>> compensate for different lengths input cable or board traces.
>>>>>>>>
>>>>>>>> Features
>>>>>>>>
>>>>>>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
>>>>>>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
>>>>>>>> data rate, compatible with HDMI 2.0b electrical parameters
>>>>>>>> - DisplayPort dual-mode standard version 1.1
>>>>>>>> - Programmable fixed receiver equalizer up to 15.5dB
>>>>>>>> - Global or independent high speed lane control, pre-emphasis
>>>>>>>> and transmit swing, and slew rate control
>>>>>>>> - I2C or pin strap programmable
>>>>>>>> - Configurable as a DisplayPort redriver through I2C
>>>>>>>> - Full lane swap on main lanes
>>>>>>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
>>>>>>>>
>>>>>>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
>>>>>>>>
>>>>>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>>>>>>> ---
>>>>>>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
>>>>>>>>  1 file changed, 51 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000000000..21c8585c3bb2d
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>>>>>>>> @@ -0,0 +1,51 @@
>>>>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: TI TDP158 HDMI to TMDS Redriver
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Arnaud Vrac <avrac@freebox.fr>
>>>>>>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    const: ti,tdp158
>>>>>>>> +
>>>>>>>> +  reg:
>>>>>>>> +    description: I2C address of the device
>>>>>>>> +
>>>>>>>> +  enable-gpios:
>>>>>>>> +    description: GPIO controlling bridge enable
>>>>>>>> +
>>>>>>>> +  vcc-supply:
>>>>>>>> +    description: Power supply 3.3V
>>>>>>>> +
>>>>>>>> +  vdd-supply:
>>>>>>>> +    description: Power supply 1.1V
>>>>>>>> +
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: Bridge input
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: Bridge output
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - port@0
>>>>>>>> +      - port@1
>>>>>>>
>>>>>>> The device supports DVI, HDMI or DP input, with various requirements and
>>>>>>> capabilities depending on the input. Your binding doesn't address that.
>>>>>>>
>>>>>>> Similarly, it can do lane-swapping, so we should probably have a
>>>>>>> property to describe what mapping we want to use.
>>>>>>>
>>>>>>> The i2c register access (and the whole behaviour of the device) is
>>>>>>> constrained on the I2C_EN pin status, and you can't read it from the
>>>>>>> device, so it's also something we need to have in the DT.
>>>>>>
>>>>>> We are using the device in its default configuration.
>>>>>> (Power on via OE, then it works as expected)
>>>>>
>>>>> I know, but that doesn't really matter for a binding.
>>>>>
>>>>>> Can we leave any additional properties to be defined by whomever needs
>>>>>> them in the future?
>>>>>
>>>>> If you can guarantee that doing so would be backward compatible, sure.
>>>>> But that means being able to answer those questions with a reasonable
>>>>> plan.
>>>>
>>>> I think proposed bindings are generic enough to cover other possible
>>>> usecases in future.
>>>
>>> I don't think it is. The current binding is for a I2C device that
>>> shouldn't be accessed through I2C.
>>>
>>> It's working for now because the driver doesn't do any access, so it's
>>> all great, but as soon as we add support for the other case, then we'll
>>> have to add a property that states that while it's an i2c device, it
>>> shouldn't be accessed.
>>>
>>> And adding such a property is a compatibility-breaking change.
>>
>> Please correct me if I'm wrong. We have following usecases.
>>
>> 1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
>> connected to the I2C bus. A0, A1, SDA and SCL pins are used for
>> strapping the settings.
>>     board DT file should describe the bridge as a platform device
>> sitting directly under the root node.
> 
> DT maintainers have required that reg is always present in the other
> sub-thread.
> 
>> 2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
>> the I2C bus, A0/A1 pins set the I2C bus address. The device is
>> controlled over the I2C bus
>>
>> 2.a. The same as 2, but the device is not controlled at all, default
>> settings are fine.
>>
>> The driver covers usecase 2.a. The bindings allow extending the driver
>> to the usecase 2 (e.g. via optional properties which specify
>> bord-specific settings)
>>
>> The usecase 1 is a completely separate topic, it requires a different
>> schema file, specifying no i2c address, only voltages supplies and
>> enable-gpios.
> 
> I could have mis-unnderstood, but my understanding was that they were
> running it with I2C_EN tied low.
> 
> Of course, that's one of the thing that is completely missing from the
> commit log, so who knows.

On our board, the device is sitting on I2C bus blsp2_i2c1.
Therefore, I2C_EN is hard-wired to HIGH.
(As it must be for I2C to function.)

&blsp2_i2c1 {
	status = "okay";

	tdp158@5e {
		compatible = "ti,tdp158";
		reg = <0x5e>;
		enable-gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
		pinctrl-0 = <&hdmi_en>;
		pinctrl-names = "default";
		ports {
			#address-cells = <1>;
			#size-cells = <0>;

			port@0 {
				reg = <0>;

				tdp158_in: endpoint {
					remote-endpoint = <&hdmi_out>;
				};
			};

			port@1 {
				reg = <1>;

				tdp158_out: endpoint {
					remote-endpoint = <&hdmi_con>;
				};
			};
		};
	};
};

