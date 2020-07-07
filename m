Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5935B2167FB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 10:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0046E20E;
	Tue,  7 Jul 2020 08:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C56089F99
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594109115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZFxjlI5sMZp++zSPQ2tEXXGIe/Pl7tWFMFOmpG1I0c=;
 b=HaVOqFYdkB3lcLoVht3h8rMKg9xi6JYbgz9Unkl3ewYGBofb71yh1TVmQp6j6iAOJln7gD
 xwC828DlAr8cjnx7ClPOIMd8Tbki54/lHfD/TtiUG06axS/pxlraL/zLr/Ssj708a+ZQy3
 jhNHJyXfcR8CpZidzcRmH1/x/GS43xs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-b4LrdAC_NjCU6WTMw6iU-w-1; Tue, 07 Jul 2020 04:05:01 -0400
X-MC-Unique: b4LrdAC_NjCU6WTMw6iU-w-1
Received: by mail-ej1-f71.google.com with SMTP id y10so32970515ejd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 01:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GB1QNbctl/Mx/SFUPpl4ypLqVQ62zsSb8czTF+T7RVk=;
 b=LXz7sS+d9SQDwR5VEinJgQnfWApQGWOENQa5r+OBDO31XE3Hs2n/8tbMrPafSpoQsl
 qvZQp99d78xi+Dy3G/7M1YupFd4IxlHWrt4v0lbK12x2hj6fXHR9GCGcZLn6tsKd1O/U
 c7kMMl0SC0Cqic71uZPa56Vz0zjL75sB2cMtti8nScJBNsHlm2wpIiLEVDG6Axn3LrBr
 R5qrfKNDQDKQ4t0Uwh9KlPowX3G8LuKtjOG/TESi9aS3NsW9ohLNmjpMFT1l8P53HiRF
 ZDrod4p+kpv+BN02DRkhrcBh7gJDQzMp8NV8XT5xLGK/yNm/LYOd5GQFLComzJP3Kf6p
 lEAw==
X-Gm-Message-State: AOAM531eR8v4g2vjiuyBhfu4Y9mjMUY6N32Wd0F1x2bSzR9zO7N4eqWc
 hWsb2r8fCIw/e20FjaEA893h68BHWwJFTcRR3XlCNu4XZhGgxO/q19JCvNnbUV95YsiL6nd6PKV
 RYfkWm9y0qDKgdipY2UBdINSTjTFN
X-Received: by 2002:a17:906:eb93:: with SMTP id
 mh19mr45243078ejb.552.1594109100149; 
 Tue, 07 Jul 2020 01:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/cLO+WZhKB2j89clcfZyc+ByS2W7nYLObC2VeM2LUr6Hq2CXhfOpetmvPhCaQwzvlD2NYng==
X-Received: by 2002:a17:906:eb93:: with SMTP id
 mh19mr45243060ejb.552.1594109099889; 
 Tue, 07 Jul 2020 01:04:59 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id s18sm18303668ejm.16.2020.07.07.01.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 01:04:59 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
 <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
 <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
 <20200707073424.w6vd6e4bhl56kosd@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c2143daa-cdc0-0a72-196f-f27d1677278f@redhat.com>
Date: Tue, 7 Jul 2020 10:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707073424.w6vd6e4bhl56kosd@pengutronix.de>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/7/20 9:34 AM, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Jul 06, 2020 at 10:53:08PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> Thank you for your review and sorry for the slow reply.
> =

> No problem for me, I didn't hold my breath :-)
>   =

>>>> diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
>>>> index 43b1fc634af1..80d0f9c64f9d 100644
>>>> --- a/drivers/pwm/pwm-lpss.c
>>>> +++ b/drivers/pwm/pwm-lpss.c
>>>> @@ -97,6 +97,9 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *l=
pwm, struct pwm_device *pwm,
>>>>    	freq *=3D base_unit_range;
>>>>    	base_unit =3D DIV_ROUND_CLOSEST_ULL(freq, c);
>>>
>>> DIV_ROUND_CLOSEST_ULL is most probably wrong, too. But I didn't spend
>>> the time to actually confirm that.
>>
>> Yes I saw your comment elsewhere that the PWM API defines rounding
>> in a certain direction, but fixing that falls outside of this patch.
> =

> Yeah, sure.
> =

>> [...]
>> I hope this helps to explain what is going on a bit.
> =

> I will try to make sense of that and reply to the patch directly when I
> succeeded.

In case it helps here is the datasheet for the LPSS PWM controller
(somewhat hard to find if you don't know what you are looking for):

https://cdrdv2.intel.com/v1/dl/getcontent/332065
https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/ato=
m-z8000-datasheet-vol-2.pdf

The first link contains a description about how the PWM controller works in
section 17.5  "SIO - Pulse Width Modulation (PWM)", the second link contains
all register definitions for the SoC and is not all that interesting other
then for verifying the existing register bits defines.

Regards,

Hans



> =

>> ###
>>
>> As for the behavior on base_unit=3D=3D0 in the get_state method,
>> as mentioned above I wrote that when I did not fully understood
>> how the controller works.
>>
>> We really should never encounter this.
>>
>> But if we do then I think closest to the truth would be:
>>
>> state->period     =3D UINT_MAX;
>> state->duty_cycle =3D 0;
> =

> I'd say state->period =3D 1 & state->duty_cycle =3D 0 is a better
> representation.
> =

> Best regards
> Uwe
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
