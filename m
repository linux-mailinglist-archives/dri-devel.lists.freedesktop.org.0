Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD8239C07
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 22:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB976E1B5;
	Sun,  2 Aug 2020 20:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9839B6E1B5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 20:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596401502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yX8hKPX/CQYIf2ONin/kDbvXjAGgwgT9Acxj0qQ3XvM=;
 b=Svu0Vx+5PEnXA8qLmI0l/LV9t/fcl+rgIglxwc9nOMGYl3L/QA1X+YzGmGc2DWJ6TDp7tl
 fuX7h8lT6pbRtnPzQHYvlp1xxBAXK+quTxIIUTGssxGKtJ/3mX27/t0AdtYNKXb5f2dT3w
 JpWMmcvJr87/dzkkilq+PhaHxTLQEck=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-90iqfQb0O1m3oQhhBY8HDQ-1; Sun, 02 Aug 2020 16:51:37 -0400
X-MC-Unique: 90iqfQb0O1m3oQhhBY8HDQ-1
Received: by mail-ed1-f71.google.com with SMTP id t9so10754906edw.22
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 13:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yX8hKPX/CQYIf2ONin/kDbvXjAGgwgT9Acxj0qQ3XvM=;
 b=UjKQeXvHiBimUl/nTHMa2jDLhUjFHu5D1XWP3LQqk6gfZO0yPeuTGmD2Di3iBcWEPL
 WiZoYui9ZOehp1tnF4QnkiU58LYDPwMcMtK7rdtY17h8J9gBYxaa1kq7jrorL5VRmGUc
 qG5AdHsGSgDfAu6jd6kFrJDzX/uFP9urdZS22y6t67CppZnH6FhN/cJjGaCuJeYaVWL0
 zXVGXZc0bUmQh2UbpwyN5F1J2JY2WIL3CTpEzs+ORA/iHZG5k7/EVdv37KnxMJrIAgaM
 u5lV3aP4QemejVa2KwffEXPddgB0cpA/oTLnK99F9SLCSEmhTOkynnOhuCr0VbyFq1O7
 7mIg==
X-Gm-Message-State: AOAM532ruLhKt+9zUomPVTcCHRIINNOHxQUGKxdSUwrX7Op0zpN1LrsI
 sa9604PyNs4sx04qeCZCAdxbYCHxc906mI2AsUr22AkNBRXvff20sdeYQT/LCyhEp44AIQkJfXu
 3xtuh7GwJI7khbtUJ1ce+MFM0DmUM
X-Received: by 2002:a05:6402:1218:: with SMTP id
 c24mr3149379edw.44.1596401496159; 
 Sun, 02 Aug 2020 13:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx46mtrGvwVlziZc7i8mLNxh3PKjRLEGKn0UoZqPjCeffnNqACqi3R6A5HFnWBg5JjGDLczEA==
X-Received: by 2002:a05:6402:1218:: with SMTP id
 c24mr3149364edw.44.1596401495931; 
 Sun, 02 Aug 2020 13:51:35 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d16sm13976900ejb.8.2020.08.02.13.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 13:51:35 -0700 (PDT)
Subject: Re: [PATCH v5 06/16] pwm: lpss: Use pwm_lpss_apply() when restoring
 state on resume
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-7-hdegoede@redhat.com>
 <20200728185703.GA3703480@smile.fi.intel.com>
 <1e19e31f-cf68-5607-3027-3b963ce53c39@redhat.com>
 <20200729081218.GH3703480@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e8595ff-2ebb-76a6-a43d-d670154c0352@redhat.com>
Date: Sun, 2 Aug 2020 22:51:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729081218.GH3703480@smile.fi.intel.com>
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

On 7/29/20 10:12 AM, Andy Shevchenko wrote:
> On Tue, Jul 28, 2020 at 09:55:22PM +0200, Hans de Goede wrote:
>> On 7/28/20 8:57 PM, Andy Shevchenko wrote:
>>> On Fri, Jul 17, 2020 at 03:37:43PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>> Maybe I'm too picky, but I would go even further and split apply to two versions
>>>
>>> static int pwm_lpss_apply_on_resume(struct pwm_chip *chip, struct pwm_device *pwm,
>>> 			  const struct pwm_state *state)
>>>>    {
>>>>    	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
>>>>    	if (state->enabled)
>>>>    		return pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
>>>>    	if (pwm_is_enabled(pwm)) {
>>>>    		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
>>>>    	return 0;
>>>>    }
>>>
>>> and another one for !from_resume.
>>
>> It is a bit picky :) But that is actually not a bad idea, although I would write
>> it like this for more symmetry with the normal (not on_resume) apply version,
>> while at it I also renamed the function:
>>
>> /*
>>   * This is a mirror of pwm_lpss_apply() without pm_runtime reference handling
>>   * for restoring the PWM state on resume.
>>   */
>> static int pwm_lpss_restore_state(struct pwm_chip *chip, struct pwm_device *pwm,
>>                                    const struct pwm_state *state)
>> {
>>     	struct pwm_lpss_chip *lpwm = to_lpwm(chip);
>> 	int ret = 0;
>>
>>     	if (state->enabled)
>>     		ret = pwm_lpss_prepare_enable(lpwm, pwm, state, !pwm_is_enabled(pwm));
>>     	else if (pwm_is_enabled(pwm))
>>     		pwm_lpss_write(pwm, pwm_lpss_read(pwm) & ~PWM_ENABLE);
>>
>>     	return ret;
>> }
>>
>> Would that work for you?
> 
> Yes.

Ok, I've added the suggested/discussed helper in my personal tree. Is it ok
if I add your Reviewed-by with that change in place. This is the last unreviewed
bit, so I would rather not respin the series just for this (there will be one
more respin when I rebase it on 5.9-rc1).

If you want to check out what the patch looks like now, the new version from
my personal tree is here:

https://github.com/jwrdegoede/linux-sunxi/commit/e4869830d88bb8cb8251718e0086ac189abc0f56

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
