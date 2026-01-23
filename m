Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGqmCEtXc2kDuwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 12:11:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AB74D41
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 12:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315F810EAC2;
	Fri, 23 Jan 2026 11:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZG/MjZCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB6F10EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 11:11:03 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-81c72659e6bso2152751b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 03:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769166663; x=1769771463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=54G7XuhdW75vYSZtlnacHikNaLX+O6Mlc4zbY7Y1Luc=;
 b=ZG/MjZCWOwH0uBQnCT37VeKwCxEwMaayi+xN6Pwytc9HUw+5jBr7AusIgpR6+FJ21T
 6CtV0wwwu9QwOjRAKlQ/kzHhZwJ0G+geUKF9c5/6kPBbvgjYLXqz/0yyrYcD8RNLq/DZ
 01aw5mm9eWqJiwjRXNshRLPKGiIMke5RL080PhChoEIqVNFp3pEMNasGwpZHwlktEkDk
 Q0QEY2ZkgSUX1jeYuAk6YL/z+F1LWdVAFbCchVeCWL3F1r63Ca9mrRGoekxF9U3m0zF6
 LiAeZjOcYjAkVnotl8XaUWcK3JCQlopMXwmevSdDSgDPRxc4p0HPz3P1qt9J4UfD8zt8
 NXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769166663; x=1769771463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=54G7XuhdW75vYSZtlnacHikNaLX+O6Mlc4zbY7Y1Luc=;
 b=q3E/3UsYvdSpYkKQyefwacHz/aV/lDxo+ITzA7QcHqJEO28ObBwWFYPGQJLFzy929G
 0w9xoIQqyTbi631yI2CF6uSRRWuGxE/orILXna0GftcW3TTDoKffj+ic2xpfcpjbFudz
 L6JCw2RbgC2AXkpVhB9hVMfF3mAg5+nt0He/5g7D9WFsPXjZVRKYEdTlafdNAp0uW1qG
 HvTKYz9zDOF7b16HlnhlaTJ56u7qYoBYwJdf90pdDCOZPzm/vdgvH2L4VbrNo/xsMwYc
 mN9O9F8kYO6tC98cFbePVBXzUwY4RbgjUwew4+fgVMC8yXMx8PITPOJLq9ZzHtFyV6md
 Zg0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNI4T738TXfp3K6w4/3khrPE/LGuvamtCMOlrPlOe5QgHU8CxCQmZ6dyUiWNff2nRrmafQB8Qqer4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf8PNOpllGJyxxz0qv2KKbwPoxkaDKnkZLlCwB8Yui/OUzQDY2
 cO2rZlOhfAOO/ALjkPnJCPvw9JvgEbCFu7JxcfOyZpfXMEcYwhXd0NX5
X-Gm-Gg: AZuq6aIPUP+xPlEk57yzSVPapAm3yplAr/0iQtKz0XgH4lmnq8LYtj6jhM9cdIBjGVv
 bfySxpjFjdPygaD/AOWeG9hqkSnzz2f9k1kZc75QZz0b0eUoe5FB+pXCerGMbD4zBWZsVGkVknw
 iUnmGMtZO2U2GqotFcclMRTo/f6EUx3UwaIjXrsSPgUnyhbU1Q4TYW/78fjr+ypxYZ3o97M0ten
 L7y3aEI6No9IBKxHGsT6PCWADz4OLhBUP8mcmoMlJ1nVlc8ITI91BhW688vcFL2NN7wAKHhVjQm
 c76hUV6ug0mScEduIuSeLqUDfEUynCnebtB0JPkCkSaA7ADrgbXmr4EJYHQ+IQV0JSHkKREYyPT
 VhpFOminy5emmGtQZTUkV2mE2E6IrWPYZ2Gvx51TLnjkuvFv9MxyeePOUISnkCpFLhSei0vIitb
 K4/6ZsMV1VeO2a3Kr06Gw5V01GvOyhyQQyvA==
X-Received: by 2002:a05:6a00:bc8c:b0:823:aa5:23f1 with SMTP id
 d2e1a72fcca58-82317eea693mr2402046b3a.57.1769166663318; 
 Fri, 23 Jan 2026 03:11:03 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8231864489csm1949221b3a.9.2026.01.23.03.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 03:11:02 -0800 (PST)
Message-ID: <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
Date: Fri, 23 Jan 2026 16:41:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
To: Krzysztof Kozlowski <krzk@kernel.org>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 854AB74D41
X-Rspamd-Action: no action



On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
> On 20/01/2026 13:50, Sudarshan Shetty wrote:
>> Update the gpio-backlight binding to support configurations that require
>> more than one GPIO for enabling/disabling the backlight.
> 
> 
> Why? Which devices need it? How a backlight would have three enable
> GPIOs? I really do not believe, so you need to write proper hardware
> justification.
>

To clarify our hardware setup: 
the panel requires one GPIO for the backlight enable signal, and it 
also has a PWM input. Since the QCS615 does not provide a PWM controller 
for this use case, the PWM input is connected to a GPIO that is driven 
high to provide a constant 100% duty cycle, as explained in the link 
below.
https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
 
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  .../leds/backlight/gpio-backlight.yaml        | 24 +++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> index 584030b6b0b9..4e4a856cbcd7 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>> @@ -16,8 +16,18 @@ properties:
>>      const: gpio-backlight
>>  
>>    gpios:
>> -    description: The gpio that is used for enabling/disabling the backlight.
>> -    maxItems: 1
>> +    description: |
>> +      The gpio that is used for enabling/disabling the backlight.
>> +      Multiple GPIOs can be specified for panels that require several
>> +      enable signals. All GPIOs are controlled together.
>> +    type: array
> 
> There is no such syntax in the bindings, from where did you get it? Type
> is already defined.
> 
> items:
>   minItems: 1
>   maxItems: 3
> 
> 
>> +    minItems: 1
>> +    items:
>> +      type: array
>> +      minItems: 3
>> +      maxItems: 3
>> +      items:
>> +        type: integer
> 
> All this is some odd stuff - just to be clear, don't send us LLM output.
> I don't want to waste my time to review microslop.
> 
> Was it done with help of Microslop?
>

I understand now that the schema changes I proposed were not correct, 
and I will address this in the next patch series. My intention was to 
check whether the gpio-backlight binding could support more than one 
enable-type GPIO. 
Could you please advise what would be an appropriate maximum number of 
GPIOs for gpio-backlight in such a scenario? For example, would allowing 
2 GPIOs be acceptable, or should this case be handled in a different way?
 
> Best regards,
> Krzysztof

