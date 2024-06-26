Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8619189FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 19:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F0210E96E;
	Wed, 26 Jun 2024 17:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="NZjdFENZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA1B10E96E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 17:20:49 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so4484691e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1719422448; x=1720027248;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6NVC3h/r5CxQGiQoMko3UXhyNRT0ZVRT3wiwtwfZ0XI=;
 b=NZjdFENZOICCUHOCF3e4Pr+1R8bm1C5n10i37bsknN8I5SalQfKaqQ6C/DB/4OUhir
 m1kE5Em49p4g/7pn81DIg0Y/+I9OROX7Cwe9v0xZDZ95eDtPUL0JfMON5+goTmzwOM3T
 aaBICXefFaJIPgElvIzo2Mytve1GqorGxG11RqQw9Rl3mdTcMEjLVeEGJSx4XXEiEfYo
 hH5S49NThFpKP4z/bds1zZLX5I5K36+jJuEiBo3NlQlrIx+tLOGsbRIbt8Aba5lyKZKL
 j4YvqtLhe5DI1ITbETDb/6k3w/NlQtCaPWSlFIfTqSETVouruLby+46yTwpDJMYZtzIg
 51uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719422448; x=1720027248;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6NVC3h/r5CxQGiQoMko3UXhyNRT0ZVRT3wiwtwfZ0XI=;
 b=qjBkT23UV9UykoNRYRUNRGDTWFE3TxWM/RnCoW0bAnJpsIz0P2BoZPQQ3vS+UVqbCL
 21I8neWTlrCO9c6cjNV9LsgwcvQpWGG8GpGSWM+pugURDmZUDLdYPqD6W2TXrb4fg+p1
 aZjpOc5eD9Tg8fPH+PgKZOD8DYwp6vl8D7KIWkbd63W0nkYyK6Ivc9LuMn9bo+c8muGp
 n6RmxKdFtQafOKfSCHnNl77fZl6izDDcdT+XRLeQ+JpT6/PNOoFzAQLnQZXPQqFcN3z4
 qT2zTJmmw5nr3QbPg2F8ycj++ozyP/LkEilLnfcMeQQL/Ucb/dI5bAPrQqb2JDnJQtsA
 T72A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTSy+5QCz8+HZjbIGFIjlPLif7oQG381zzSQS2SxQDrWuFCHBWFyIaQ+JjCrS8nqnDNMHuyQZUY/o7jlb1L+w1EnEgcOVEJXrJmehD0m13
X-Gm-Message-State: AOJu0Yxx57XlV0kOq51jutkQcCpH78Q8kHNn442Y+iBFJ+xYOOBZLAef
 x5U66J2jexRPhYZF682EUFp63J4Us+L9ru4/3+pt9NU2xh9OCx8+MTPKfV5VTgU=
X-Google-Smtp-Source: AGHT+IH8lQXkrfaoMLO7z1BOzyFcNoXKirkCLXuh1M/JBUyRJC5bVpoJYH0Ed4faS5pI20VcoPjQlw==
X-Received: by 2002:a19:5f5e:0:b0:52c:da1b:a613 with SMTP id
 2adb3069b0e04-52ce0680acemr7217629e87.65.1719422447858; 
 Wed, 26 Jun 2024 10:20:47 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:62d6:6a12:585c:d4e1?
 ([2a01:e34:ec24:52e0:62d6:6a12:585c:d4e1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8272bd5sm31898095e9.28.2024.06.26.10.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 10:20:47 -0700 (PDT)
Message-ID: <d2012a93-911c-403e-b1c5-f01916a3200e@freebox.fr>
Date: Wed, 26 Jun 2024 19:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: add TI TDP158
To: Conor Dooley <conor@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240625-tdp158-v2-0-a3b344707fa7@freebox.fr>
 <20240625-tdp158-v2-1-a3b344707fa7@freebox.fr>
 <20240626-blah-unseated-6cab234bae61@spud>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240626-blah-unseated-6cab234bae61@spud>
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

On 26/06/2024 18:08, Conor Dooley wrote:

> On Tue, Jun 25, 2024 at 06:38:12PM +0200, Marc Gonzalez wrote:
>
>> The TI TDP158 is an HDMI to TMDS Redriver.
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  .../bindings/display/bridge/ti,tdp158.yaml         | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>> new file mode 100644
>> index 0000000000000..b687699e2ba80
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
>> @@ -0,0 +1,48 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI TDP158 HDMI to TMDS Redriver
>> +
>> +maintainers:
>> +  - Arnaud Vrac <avrac@freebox.fr>
>> +
>> +properties:
>> +  compatible:
>> +    const: ti,tdp158
>> +
>> +  reg:
>> +    description: I2C address of the device
>> +
>> +  enable-gpios:
>> +    description: GPIO controlling bridge enable
>> +
>> +  vcc-supply:
>> +    description: Power supply 3.3V
>> +
>> +  vdd-supply:
>> +    description: Power supply 1.1V
> 
> Are these supplies not also required? Surely the device needs the power
> to function?

Maybe if the hamsters spin fast enough in their wheels,
these supplies won't be required? :)

The reason I hesitated to mark them as required,
is because the HW engineer told us that on our board
they were connected to a power line that is shared
between several functional blocks.

I suppose that's not a reason?

Required means "device doesn't work if they're not connected" ?

Regards

