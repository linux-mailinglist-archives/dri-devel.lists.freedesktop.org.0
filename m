Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCusCKGkjGlhrwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:47:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A42125D56
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018E810E087;
	Wed, 11 Feb 2026 15:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nMTrgsj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E0010E087
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 15:47:39 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12336c0a8b6so1951215c88.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 07:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770824859; x=1771429659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=KlFHu80yx1UAJ8ZWXa9GNpflS81fuBvY+gQcHfmBFoY=;
 b=nMTrgsj94OJ4CnDpEHWAECFkkLsSoLtESxqY2Va4+K5vGx3aflBhIXtvNkmzBYARxT
 JdG2eLSEZpx845+2SjEbI3Drg1MypSIa4/7WgIBhb3uYe4Rv+UVH4Q+NSwOxSZKp3zLX
 v4wVs6oxiLMw0XkZRO9vj9Th08mNKdQJYqF34JhwhXobMVMu2MjNlnipgbZ2x+50FRe2
 Iw1XaqNoYq0QAU8OkPUcSxJTms9r+J/AxFl22Pcz/eGCStykGYkfGzrAAWRIfyki8QUl
 +rRcbPmNkjuda6tKp9Wn2swjDZEHoKrx9FXjeO+PfSJYqfX0RTJ0m20t/IPlccEjt2Yb
 cZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770824859; x=1771429659;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlFHu80yx1UAJ8ZWXa9GNpflS81fuBvY+gQcHfmBFoY=;
 b=q2NOJOHl0XBrYDFYi5Qq6DApEvuMTQejPXOtRTZetcKu4JeSxIaGqgWlwdCe4cDeNw
 1SMRkBfH6coA6Vni+999QF7brtuFzMzzeejrXna+lsvNoIrnzJj6XbwJHtXvkKXWuoJF
 25HN8DUyD05Z8cN3dErxiQzNofrvWkziZTybDjXRf/qebCD9U6btTKqW2nPupmeD0Sp+
 YwmAcQLVXjsQFtBQa/OLZA15KUqibVnQOExRTxc8Zpdf5Y5POchNtQZuShrYrxJH4xA7
 A4R6zV1q8G4Lq6Ew/O1EjU2wXToK3l1iAHAqEEOvALMK/XXac5csHALUSJWTlJjkaSLP
 Kw2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfwed1HKLUT+6nfpIpdW/JMuVDEZkl3lRl2ghGbwHHoOjg+aoR8NJkzMywaUVdwTbmigH6TYkFRso=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxuo69lCplsHCktUz+JUtBxEtroZJKIMVp9IcRMFRNb1ilo2xbs
 9QFq8iGjYA+fa1Ctq2rPLPGlI83OMVyLFADs9zNtVP5WPTlaewfrK0Ou
X-Gm-Gg: AZuq6aJtstt4bc+M6JzKa7NJE9kQlYTEq3218FIzVUMzFIl43vchfXVarzn/Mu/ZwSk
 hmdKWSmjhaAfWa9S6Q4DIkE56o/BnA8fFEwoOrSVcCX3VNIs5fbLK8kyg8kt6ZbK+fPkhvVB//v
 qX2rIfTgp2a62OkCe5Gx3tjzvPIMZWOvYHCLdiYucfXt0TLXpF8Tb/iqmPW0U1fTSpbRFW2qWaQ
 DbGpil2SM85kr/XFUIlLQucp2Z7Jqa6qtfkHjkmUDjQ0IJJfO13ykX9ESRUO9ZeC2eDBf++BWxb
 +xg6ae+ynKDz4FYpZazhZRA71zKSKPsRySuZU5olrTseVm0C6kM5YqaBxma5dQ5fhSj8JFMT2z/
 nuDMy1OMzyj13vKcVp81b2B+NX7i1sL/CPsJ8DNSXlgcFtmMFSK0bZX815t5cVZzZTSMENlDVOD
 L3JtYn5BmdPpXsJqX3sU8zvq/0Bj/DyLhGgWzWK0favAvUVkjSX9WCGCenqWrmHwWuzOTFfQCN
X-Received: by 2002:a05:7022:101:b0:121:dea2:d54d with SMTP id
 a92af1059eb24-1272a78ba3dmr1125645c88.20.1770824858900; 
 Wed, 11 Feb 2026 07:47:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1272a636095sm2349945c88.0.2026.02.11.07.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 07:47:38 -0800 (PST)
Message-ID: <e5ccfd91-9c0c-45f1-bbc8-40e93bffca43@roeck-us.net>
Date: Wed, 11 Feb 2026 07:47:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PWM implementation in HWMON and backlight
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
 DRI mailing list <dri-devel@lists.freedesktop.org>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com,
 Richard Weinberger <richard.weinberger@gmail.com>
References: <CAFLxGvyhdpQMnW6VqyXjLPKyZSQvrV-+GFdUogV4JX7DiGePyg@mail.gmail.com>
 <aYxaXmguGRk1pWpT@monoceros>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aYxaXmguGRk1pWpT@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Spamd-Result: default: False [0.39 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:richard.weinberger@gmail.com,m:richardweinberger@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@roeck-us.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,roeck-us.net:mid]
X-Rspamd-Queue-Id: 56A42125D56
X-Rspamd-Action: no action


On 2/11/26 02:46, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> On Wed, Feb 11, 2026 at 10:28:55AM +0100, Richard Weinberger wrote:
>> The backlight of a board I am working with is controlled via PWM.
>> Naturally, I thought this would be a straightforward task using the
>> pwm-backlight driver.
>>
>> However, the PWM in question is implemented using an NCT6106D chip.
>> The associated HWMON driver, nct6775-core.c, does not implement a
>> standard PWM device interface but rather its own custom one.
> 
> Looking around in drivers/hwmon made me a sad. There are four drivers
> that handle parsing #pwm-cells:
> 
> 	$ git grep pwm-cell drivers/hwmon/
> 	drivers/hwmon/adt7475.c:        ret = fwnode_property_get_reference_args(fwnode, "pwms", "#pwm-cells", 0, 0, &rargs);
> 	drivers/hwmon/amc6821.c:        if (of_parse_phandle_with_args(fan_np, "pwms", "#pwm-cells", 0, &args))
> 	drivers/hwmon/emc2305.c:        ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
> 	drivers/hwmon/nct7363.c:        ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells",
> 
> instead of using the pwm subsystem. Also the driver mentioned by Richard
> above has some self-made PWM handling including a set of driver specific
> sysfs files to control the PWMs. I stopped looking at the output of
> 
> 	git grep pwm drivers/hwmon/
> 
> after finding some more sad things. (My "favourite" so far was:
> 
> 	dev_dbg(dev, "chmod -w pwm%d failed\n", nr + 1);
>   

That code is from 2006. Are you serious ? Did you bother to read
the context ? Did you bother considering that this was possibly the
best means available at the time to control visibility of an
attribute file ?

If calls to sysfs_chmod_file() bother you, I would suggest to send
patches updating affected drivers and to drop the API function from
the kernel.

> .)
> 
>> I am a bit puzzled, is there a specific reason why HWMON does not
>> utilize the standard PWM framework in this case?
> 
> Yes please!
> 
> I think that the PWM waveform API that exists since v6.13-rc1 is
> flexible enough that hwmon chips should be able to both implement and
> use it properly.
> 
> Can you please make sure that the next hardware driver for a pwm capable
> chip uses a proper PWM chip? Feel free to send patch authors in my
> direction for that.
> 
> And if I'm wrong and using the pwm subsystem in these cases is a burden,
> I want to hear about that and discuss how this can be made better.
> 

For the most part the pwm implementation in hwmon chips is tied to supporting
pwm output for fans and isn't usable for anything else. This gets worse for
chips where pwm vs. voltage control on the output signal can be selected.

Unless there is an actual use case for utilizing the pwm subsystem for a
given chip, doing so would just create overhead. _If_ there is a proven
use case, I don't mind if people submit patches to add generic support
for the the pwm subsystem to such drivers. Keep in mind though that support
for the ability to switch between pwm and voltage control (as is very common
for fans) is mandatory for chips with that capability.

Talking about this specific driver, it has been in the upstream kernel since v3.10
(2013). Almost all hwmon drivers supporting pwm fan control are much older than
v6.13. While many of those would benefit from a modernization update, supporting
the pwm subsystem just because it exists would, from my perspective, be a waste
of time. I most certainly won't do it.

In my opinion calling it "sad" that drivers are not re-implemented to use a
newly available out-of-subsystem API is close to being an insult to those
who would have to do that work.

Sorry, you folks really got me on the wrong foot. If there is anything sad,
it is people complaining about 20 year old code without doing anything about
it themselves. I by now spent months if not years of my time modernizing hwmon
drivers. Did you ?

Guenter

