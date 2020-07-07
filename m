Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF0E217535
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 19:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C3E6E2F3;
	Tue,  7 Jul 2020 17:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556C6E21E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 17:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594143096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ngIsaVrgE6cWX9Wfc7B2KiuqrZPEc+gF9Rrn9/xaTM=;
 b=CxxR4rG7ooBrzOST93IBm0nIIJcbzmqkV2OPAlueO+CMGZTVn14N5LRNP8ITj2IPXhfd8o
 oIYjUxG21sysEAvXNMPMIf42BIr/HbC8aW6fSW7sN5Icnyfjmg1D7zSAd4Rf8V6tjz6Z+p
 ve2eXfdWuasx6Co8ti44Oi3ByoMlCsY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-FD_rd7TEOuqHRe24paOjOQ-1; Tue, 07 Jul 2020 13:31:32 -0400
X-MC-Unique: FD_rd7TEOuqHRe24paOjOQ-1
Received: by mail-ed1-f69.google.com with SMTP id k25so18868734edx.23
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 10:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZkpZ9ksQd7iWxIlvtNfzO9EHx1DMJN1+3vOo10sqsHI=;
 b=huF0Ee7zU17+SeZILb9V/zdpC5Kp2B9PO/TSF40pS8yOZQ3c0b3/mI/3Qr+gAqgBb5
 dsrdhCy2glbKdv7PRSEzvhWzUhtprGK+SLkFN3hsyopdgeqTdmBT/+cbh9tnJulLaOmv
 yG1cDoo1yqwsp3XAfXqmktvR2fTBJ7A4qyvaadb3e7L2Iirmdd5t76xlZ+BfvmTT5nMi
 RXcLDXA5VxknMf9bQC3NOB7oMqp9loNGK4XWulFH00d7pf/5qNqa7FpNHPizgAbzdzTf
 YcShcBc78JydLdDI90AvsdyvQyIfD7fRiE5t4VGfdaVsfktvV+E4uHv23UQdNqBVeoV2
 g/Zw==
X-Gm-Message-State: AOAM531YXw1WfONnO3ZYvoDin5sfS0fMVT2Frj/rk56a9mfCrP5nF4iF
 ns1EPpVazD15m+ayF0BloM7gferQIo2pRr1SfS/MjgN2+pnEJnxENzxkfzjnv6/S3ABXNtFMbQG
 ZH8a1ruiwkZXjQWS86CxHVFU2Ejbl
X-Received: by 2002:a05:6402:1777:: with SMTP id
 da23mr61480147edb.260.1594143091333; 
 Tue, 07 Jul 2020 10:31:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9VwVc3j4Gj9BryDzoyTih9enqH0U2nPjxRT5SbM/g3/dUXuTaZu6s6ggKNVhBmkisFGZCNA==
X-Received: by 2002:a05:6402:1777:: with SMTP id
 da23mr61480119edb.260.1594143091129; 
 Tue, 07 Jul 2020 10:31:31 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id n16sm650173ejo.54.2020.07.07.10.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 10:31:30 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
 <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
 <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
 <20200707073424.w6vd6e4bhl56kosd@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1496178b-ce39-9285-ff75-cd39bc0e9aa7@redhat.com>
Date: Tue, 7 Jul 2020 19:31:29 +0200
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

But that would suggest the output is configured for an
infinitely high output frequency, but the frequency is
actually 0, the reason why get_state needs to treat a
base_unit val of 0 special at all is to avoid a division
by 0, and in math dividing by 0 gives infinite, isn't
UINT_MAX a better way to represent infinity ?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
