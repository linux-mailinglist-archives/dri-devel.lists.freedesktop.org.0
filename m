Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50244851240
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 12:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16DA10EC8E;
	Mon, 12 Feb 2024 11:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y4HBa9Ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919A10EC82
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 11:30:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-411a5a8653aso96945e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 03:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707737415; x=1708342215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uxlapuek86W8/QXmwsjsmNOho8DTbK1Ty9+zFOy1tAQ=;
 b=Y4HBa9WskufWeaNAW++dx8BRMacewisjxlFaxWClNzwDaqXmExhD4m7/ohf4IxdJRV
 lyjj2nvEYPSxDCfEMlBPmDhy2FzZUL2HKzPXfxroWg0aXGr6qTDlDt+O8FzBJPtxS6wz
 cil7R+h0l5zbXCQfV9mKfmAa4R++Ot8FTHm7grDDt8Fqs05BidhZpJ5QddpzKpdB9IVl
 X2xwM0wn+Sw1WrUQdfTlQY5dcFUPRHMrOJWPtdQQiy9xG0EKnPT0RtskIXtC7qm+wAg/
 DMaRYToJj1ziVErPoaGYOhGGhQl/IIkpNh7trlGZ5UiipD3l6azPKrIS84K7e/FprXll
 ZtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707737415; x=1708342215;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uxlapuek86W8/QXmwsjsmNOho8DTbK1Ty9+zFOy1tAQ=;
 b=bxD5Z4/LbWjJo/crjNX/F62HYjBsylWvVLdRAY9J4DI5/4vlojEv5WxtkLjhGNX3H3
 YS+8XopAz74aX2UUjwXVNDLFJt5ll/GtFYft8nZf3t2mbExdK3WXrBpPzc5pBzLBP9gS
 EJjGfo0VrlPqZZdNhpDSrCh82X0PCMwquU5Emzen6kas+biD02B0A/lVrqQ2vcuBj8Ad
 GtijBzVjq7VPxRCpKRp1l1xystZ5hn151M+9a6XaqBjNrmaVmuODKvDtp+xZIDTq/VXv
 XPSmFzA2szTEkWH1WAtEzxOlnziTREpxoixw/Gbyt2r89KtEVcw9iJOb7GL2Jd2l0xVg
 L86A==
X-Gm-Message-State: AOJu0YwtvjtM0mhBkU5LlFtpTGneAHDXN4lWf/Xw8mv4lXjYyQdq3xxy
 SrXhg5bBS6BM9klYi3WfVnDcgdMsAJQnREV3FgPBEN1Tyk2fSA47aEWbEkl98IU=
X-Google-Smtp-Source: AGHT+IEfKLuLIfmv3xTAaNaH2Lc7dj+hd7wrkuABr7TaMAYdEoI3jbw6o+WR8PO0UM2K6JvhHnVM/Q==
X-Received: by 2002:a05:600c:4f8e:b0:410:7897:6c68 with SMTP id
 n14-20020a05600c4f8e00b0041078976c68mr5287185wmq.3.1707737415301; 
 Mon, 12 Feb 2024 03:30:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7UfSCmLO/NnenfQwExOgJBtlEPCtR3iy28XqvihDZ/Pr1H0dFWyvckXzje+yQp3wk2+i74YqR6F8pPSmQy5lzvWoOQXhWcRqrtkokZINPnKZ5OWfrj6cr01AGvUjdVPJ0mUJO4MxwxVONCJqHPV8YU3ywOq56ZOT4cfeMCxZ9zrCfs0s0x7PmCYkr89QG9iCFOM/w16+nB+HwkQj4VZhLMsvha9C5UE26EBb24VtmJcVSD7R1Wm4aP+x/B2CuKz9YVWCzO/PKf0xDDQr5enZMS3K2CpANjdDorTRK34BIhGZecjiJo1QdaaTxa+XxWo0rFEs2gUu+x1XQvZu6HIDkyxPCqH10/y2SLTiQdHpzWBTMy1hECVsgL+gPG8EEoSOsA3b8hNvA8HbM9dRrh5egC1TwzIiNj7JWZCXuk5d5stYrihabVJByqDeLl15IqEpGKwE0QIcfHudkOHnYKGbvPP5aiIk+FYdscXjqh57hxlFa+GHrRvl0dwoh4bYFSLBBtevrtOAMhjbcDjFDxWrw+r/myVSp+y2ZEWBECHfL70yNHpuXJVlEvJRbOI3odfI+5RRHmfL4tj9LKoeDZ59KxJgqzhx3OgK65CBPCL8kqHZJEltw3uLMZHdjgZ8NGCRgpFHIOF7XwKg15qlYXMP7R19AwqBjPW0=
Received: from [192.168.1.20] ([178.197.223.6])
 by smtp.gmail.com with ESMTPSA id
 dx9-20020a05600c63c900b0040d5ae2906esm8284156wmb.30.2024.02.12.03.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 03:30:14 -0800 (PST)
Message-ID: <d6ecc1aa-419d-4f3c-8ba2-b124e5423293@linaro.org>
Date: Mon, 12 Feb 2024 12:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] dt-bindings: display: bridge: tc358775: Add
 support for tc358765
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20240211095144.2589-1-tony@atomide.com>
 <20240211095144.2589-4-tony@atomide.com>
 <adeb3ebb-76ed-4f00-8b46-a1b9c36cfc64@linaro.org>
 <20240212081744.GE5299@atomide.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212081744.GE5299@atomide.com>
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

On 12/02/2024 09:17, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [240212 08:06]:
>> On 11/02/2024 10:51, Tony Lindgren wrote:
>>> The tc358765 is similar to tc358775. The tc358765 just an earlier version
>>> of the hardware, and it's pin and register compatible with tc358775 for
>>> most part.
>>>
>>> From the binding point of view the only difference is that the tc358765
>>> does not have stdby-gpios.
>>>
>>> Signed-off-by: Tony Lindgren <tony@atomide.com>
>>> ---
>>
>> It does not look like you tested the bindings, at least after quick
>> look. Please run `make dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>> Maybe you need to update your dtschema and yamllint.
> 
> I did.. But I did not notice that this no longer works:
> 
> $ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
>   LINT    Documentation/devicetree/bindings
> usage: yamllint [-h] [-] [-c CONFIG_FILE | -d CONFIG_DATA] [--list-files] [-f {parsable,standard,colored,github,auto}] [-s] [--no-warnings] [-v] [FILE_OR_DIR ...]
> yamllint: error: one of the arguments FILE_OR_DIR - is required
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> 
> After removing the ">2&1" from the Makefile, there's some more info:
> 
> yamllint: error: one of the arguments FILE_OR_DIR - is required
> 
> Where DT_SCHEMA_FILES ends up empty. I guess dt_binding_check needs
> to be now run with just:
> 
> $ make dt_binding_check DT_SCHEMA_FILES=toshiba,tc358775.yaml
> 

Yes, since June last year. Rob later brought (in July) backwards
compatible way, but apparently something changed now in Makefile.

Anyway full Linux path should be considered deprecated. The same for
dtbs_check.

Best regards,
Krzysztof

