Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBmtJP/yemmXAAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 06:41:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFFABFB0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 06:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDB210E15F;
	Thu, 29 Jan 2026 05:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c/oVuxsy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C4310E15F
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 05:41:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso5349895ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 21:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769665274; x=1770270074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RW4PLSqQ5HtXaekEHkGIndldtB+Y8vvs+MZLayxhY8Y=;
 b=c/oVuxsyD/Xo8DzxIwVud9j+2O3IQVcjF4OEVV4BHjl4gslfNXHUszpMkfv2RGX1cl
 917fhnF/8B2j7UbvxiJoDU/nPyejpQu62h45rwZyKT31d0EpzRzcQaPrJkzCztnYeCPj
 CNPvJSZUcp3NGJVtBzbIGlrFBDakEpv8W7u1pzVi8VA7W7z3b4M36tjwWW8iu8cSKpsK
 lPjlYDTrRPOIXokWKFryed4d6nvDClWDbDMzWIxpg/Zf3He6yblspeDUhYKfQpKlcqXb
 Ubvxq7UJuHvciYAtEgbUccy9zb0nEwMj9N8FNHP4DdMO1CmGBSbB9QTpAz8vTUc4x+fR
 oh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769665274; x=1770270074;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RW4PLSqQ5HtXaekEHkGIndldtB+Y8vvs+MZLayxhY8Y=;
 b=PFZuimLnlAXWXIJ/o/6SaSDvEoSSb1LJF3+e7yFlZdNo1qNgVQgnFZtrl6Bstbnd9W
 KSl9PuUhzuGUb+FNM3HVZqVh0m+pH+eczYyDe4zjsphN4HAdjWQAZDDZ5B7oWVip2XKi
 9fM3Sa6G2Dtv0FhWL6MylVcoWlUg46XFxZEcDVtO5oh6VuJVPyUMrAHAC603A/ouQqLo
 nVSrQ/VQ6zJBqthFpefaveZW9okUDAggCTNmXp4d3GQPuL5z0wZezSx4lGuIJ4j3Mhy6
 BU7QkXD1bMxolo+H2HBagrSWYMnRjYX4Ttmoq4vkGW5mBv2gLJIjNee6O34D89L4rLNP
 sVsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbT/LEN0DPMikYEzv7AnRKUpEJX6O0lvjRdt/f1rmVoN/oqr7fqHV4dzsVLTP/Ib1YuYWacNmEcJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD9D3aWVqSpU+AGP8K8EqrwGdaeTM2m9Vn7GN1dScPtnM1Pvaq
 1f1PbMUdVg/Y/HVIG9k6LyVhLivmnv36Yk/jqJMJORmbe8QKNyIT7ARa
X-Gm-Gg: AZuq6aJgt3RmI0/VZTcnZOTxLZzrBM95EhAt+QBr01EVFR/87nUVj4iYP4r7gxqpcnN
 Y91GzUo/pZpIGfvO3Tj0KvgQKRybb1kGpS3NpCL9f6IH2xqa2dCM0DonwahJt0sNIfNP7Hpd6F8
 KM4PfDQiO7eFFh3BJg5oE9uT61y6UT26/oKq7sHLUkL8EinECsJzB3VSMtBsLUj4HZ0+lSigVwW
 QZCYYd1pMLkFAqP7yV3YD2pf2YyCwpzFuwTq0bcVx6Ie0GcKE9qsi4wLr4kDhUaZ3wrti4l4q7u
 Q3cbu16Fbyp0KM3Og/QLKE6wyg+sL+up+d9eRznYjsEX7y+wxROIAWAPXHqP5nbY1mJOVIzDiIB
 CVX9GdfVNDG1bzseMs9ozg0eKV1k7AbYF9I5wQxV1/M5l84E+mQviver/XTEGm07oV1sx8GfHNz
 ckuqZb5ityo5C2qIJKJg8GWSoIuG4uIOmY+g==
X-Received: by 2002:a17:903:2c6:b0:24b:270e:56c7 with SMTP id
 d9443c01a7336-2a870d7a907mr79567955ad.7.1769665273978; 
 Wed, 28 Jan 2026 21:41:13 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b7f7caasm38795695ad.101.2026.01.28.21.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 21:41:13 -0800 (PST)
Message-ID: <304ef935-e82b-4556-be3c-6ec4f57cf68c@gmail.com>
Date: Thu, 29 Jan 2026 11:11:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Daniel Thompson <daniel@riscstar.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
 <500b603d-5abc-4c45-8d56-bbc88fc85b83@kernel.org>
 <aXnxGPNtk5BwoJOu@aspen.lan>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <aXnxGPNtk5BwoJOu@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:krzk@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CBEFFABFB0
X-Rspamd-Action: no action



On 28-01-2026 16:50, Daniel Thompson wrote:
> On Wed, Jan 28, 2026 at 11:11:33AM +0100, Krzysztof Kozlowski wrote:
>> On 23/01/2026 12:11, tessolveupstream@gmail.com wrote:
>>>
>>>
>>> On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
>>>> On 20/01/2026 13:50, Sudarshan Shetty wrote:
>>>>> Update the gpio-backlight binding to support configurations that require
>>>>> more than one GPIO for enabling/disabling the backlight.
>>>>
>>>>
>>>> Why? Which devices need it? How a backlight would have three enable
>>>> GPIOs? I really do not believe, so you need to write proper hardware
>>>> justification.
>>>>
>>>
>>> To clarify our hardware setup:
>>> the panel requires one GPIO for the backlight enable signal, and it
>>> also has a PWM input. Since the QCS615 does not provide a PWM controller
>>> for this use case, the PWM input is connected to a GPIO that is driven
>>> high to provide a constant 100% duty cycle, as explained in the link
>>> below.
>>> https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
>>
>> That's not an enable gpio, but PWM.
>>
>> You write bindings for this device, not for something else - like your
>> board.
> 
> Sudarshan: I believe at one point the intent was to model this hardware
> as a pwm-backlight (using enables GPIOs to drive the enable pin)
> attached to a pwm-gpio (to drive the PWM pin). Did this approach work?
> 

Yes, the original plan was to model this using pwm‑gpio, and that 
setup worked. But on the SOC there’s no actual PWM controller available 
for this path— the LED_PWM line is just tied to a GPIO that’s driven 
high (effectively a fixed 100% duty cycle). Because of that, describing 
it as a PWM in DT was flagged as incorrect.

As pointed out during the SoC DTS review, the correct path forward is 
to extend gpio‑backlight to handle multiple GPIOs, rather than 
representing them as multiple separate backlight devices.

> 
> Daniel.

