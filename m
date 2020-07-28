Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56CF231332
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B336E3DF;
	Tue, 28 Jul 2020 19:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTP id 670726E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595966127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SH5q26piEln6+brQgUs5QwIsRcXrNMf3SmQsNLqi3Vo=;
 b=UYfilLVKDrhPFkwbUjbUwKB9dHYCcNO6POKlj2HYzhXK7f1PKt6J2Y6YS4mAruYoOblLRH
 zXcfeWtJ0gI+YCwpSNQB9CmyRRa54pxTsGrNOFuot94XTPHC41WPZlepFw39zHiHgM3yNP
 U/xw2+DJbsvVBjv70oC2Or7eAIbMxHs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-nSIbsDkyPSqxoZwnuCwdPQ-1; Tue, 28 Jul 2020 15:55:25 -0400
X-MC-Unique: nSIbsDkyPSqxoZwnuCwdPQ-1
Received: by mail-ej1-f72.google.com with SMTP id d24so926310ejb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 12:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SH5q26piEln6+brQgUs5QwIsRcXrNMf3SmQsNLqi3Vo=;
 b=m6WMJrcD/7UdpmsLjPzH5qlq17JTQDAMHtBd03h1n+FAKd4vzQllXNGBygzlbRu3ty
 jVTm2+s/nhZqj1AnsPv9zj3IIQ/MpUGuXILJauYfYfwc+vl0An5KFog054oEKRspjUK5
 /Cch5dgIvKyetyF2WrzmQtM0a4wPiDQUZCKv6r9957FhIyKYNkqIcTu4DI3rvj9k7Lou
 TbtR2rCfUPLRXO3Tce0EyBeRkA+BbXb3NzZ14lWkoTDgJoSdwyCB9FIch8fEH+LvKc0t
 x02hBJlF881dSyYdoOSyrzac7YaRasKcPU+ofEHRZxIg+cCtTPYXV80JOLA1g3WeC2/J
 +kfQ==
X-Gm-Message-State: AOAM532Rg5nYaayuHasC7na3xBdVJOrY5y5KWqJceHj55UCrxFoqWQnk
 zu2DwVUXh5jXHjhNFIMHHeX0wpTNVpc4DRvMHzHUJP/jrwmrr7WG2h47bTa/+o6utsdOGmUcbnw
 J9sblHijUfU6RHPjV6teEwPZWyedV
X-Received: by 2002:aa7:c655:: with SMTP id z21mr27771981edr.330.1595966123729; 
 Tue, 28 Jul 2020 12:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwya90PeANkl56GbLL/sAAQgT++JcBuCdnZPXxsUt2lGBGTS4oefB9O+jlvr2TwUYPoNeYaw==
X-Received: by 2002:aa7:c655:: with SMTP id z21mr27771962edr.330.1595966123458; 
 Tue, 28 Jul 2020 12:55:23 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id gh25sm4295031ejb.109.2020.07.28.12.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 12:55:22 -0700 (PDT)
Subject: Re: [PATCH v5 06/16] pwm: lpss: Use pwm_lpss_apply() when restoring
 state on resume
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-7-hdegoede@redhat.com>
 <20200728185703.GA3703480@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1e19e31f-cf68-5607-3027-3b963ce53c39@redhat.com>
Date: Tue, 28 Jul 2020 21:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200728185703.GA3703480@smile.fi.intel.com>
Content-Language: en-US
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/28/20 8:57 PM, Andy Shevchenko wrote:
> On Fri, Jul 17, 2020 at 03:37:43PM +0200, Hans de Goede wrote:
>> Before this commit a suspend + resume of the LPSS PWM controller
>> would result in the controller being reset to its defaults of
>> output-freq = clock/256, duty-cycle=100%, until someone changes
>> to the output-freq and/or duty-cycle are made.
>>
>> This problem has been masked so far because the main consumer
>> (the i915 driver) was always making duty-cycle changes on resume.
>> With the conversion of the i915 driver to the atomic PWM API the
>> driver now only disables/enables the PWM on suspend/resume leaving
>> the output-freq and duty as is, triggering this problem.
>>
>> The LPSS PWM controller has a mechanism where the ctrl register value
>> and the actual base-unit and on-time-div values used are latched. When
>> software sets the SW_UPDATE bit then at the end of the current PWM cycle,
>> the new values from the ctrl-register will be latched into the actual
>> registers, and the SW_UPDATE bit will be cleared.
>>
>> The problem is that before this commit our suspend/resume handling
>> consisted of simply saving the PWM ctrl register on suspend and
>> restoring it on resume, without setting the PWM_SW_UPDATE bit.
>> When the controller has lost its state over a suspend/resume and thus
>> has been reset to the defaults, just restoring the register is not
>> enough. We must also set the SW_UPDATE bit to tell the controller to
>> latch the restored values into the actual registers.
>>
>> Fixing this problem is not as simple as just or-ing in the value which
>> is being restored with SW_UPDATE. If the PWM was enabled before we must
>> write the new settings + PWM_SW_UPDATE before setting PWM_ENABLE.
>> We must also wait for PWM_SW_UPDATE to become 0 again and depending on the
>> model we must do this either before or after the setting of PWM_ENABLE.
>>
>> All the necessary logic for doing this is already present inside
>> pwm_lpss_apply(), so instead of duplicating this inside the resume
>> handler, this commit makes the resume handler use pwm_lpss_apply() to
>> restore the settings when necessary. This fixes the output-freq and
>> duty-cycle being reset to their defaults on resume.
> 
> ...
> 
>> -static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>> -			  const struct pwm_state *state)
>> +static int __pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>> +			    const struct pwm_state *state, bool from_resume)
>>   {
>>   	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
>>   	int ret = 0;
>>   
>>   	if (state->enabled) {
>>   		if (!pwm_is_enabled(pwm)) {
>> -			pm_runtime_get_sync(chip->dev);
>> +			if (!from_resume)
>> +				pm_runtime_get_sync(chip->dev);
>> +
>>   			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, true);
>> -			if (ret)
>> +			if (ret && !from_resume)
>>   				pm_runtime_put(chip->dev);
>>   		} else {
>>   			ret = pwm_lpss_prepare_enable(lpwm, pwm, state, false);
>>   		}
>>   	} else if (pwm_is_enabled(pwm)) {
>>   		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
>> -		pm_runtime_put(chip->dev);
>> +
>> +		if (!from_resume)
>> +			pm_runtime_put(chip->dev);
>>   	}
>>   
>>   	return ret;
>>   }
> 
> Maybe I'm too picky, but I would go even further and split apply to two versions
> 
> static int pwm_lpss_apply_on_resume(struct pwm_chip *chip, struct pwm_device *pwm,
> 			  const struct pwm_state *state)
>>   {
>>   	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
>>   
>>   	if (state->enabled)
>>   		return pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
>>   	if (pwm_is_enabled(pwm)) {
>>   		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
>>   	return 0;
>>   }
> 
> and another one for !from_resume.

It is a bit picky :) But that is actually not a bad idea, although I would write
it like this for more symmetry with the normal (not on_resume) apply version,
while at it I also renamed the function:

/*
  * This is a mirror of pwm_lpss_apply() without pm_runtime reference handling
  * for restoring the PWM state on resume.
  */
static int pwm_lpss_restore_state(struct pwm_chip *chip, struct pwm_device *pwm,
                                   const struct pwm_state *state)
{
    	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
	int ret = 0;

    	if (state->enabled)
    		ret = pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
    	else if (pwm_is_enabled(pwm))
    		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);

    	return ret;
}

Would that work for you?

>> +static int pwm_lpss_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>> +			  const struct pwm_state *state)
>> +{
>> +	return __pwm_lpss_apply(chip, pwm, state, false);
>> +}
> 
> ...
> 
>> +		ret = __pwm_lpss_apply(&lpwm->chip, pwm, &saved_state, true);
>> +		if (ret)
>> +			dev_err(dev, "Error restoring state on resume\n");
> 
> I'm wondering if it's a real error why we do not bail out?
> Otherwise dev_warn() ?

It is a real error, but a single PWM chip might have multiple controllers
and bailing out early would mean not even trying to restore the state on
the other controllers.  As for propagating the error, AFAIK the pm framework
does not do anything with resume errors other then log an extra error.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
