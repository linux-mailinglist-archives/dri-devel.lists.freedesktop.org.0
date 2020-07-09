Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920321A401
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 17:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E826EAB2;
	Thu,  9 Jul 2020 15:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B076EAB2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594309683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kOxnlG8KI3xPEqow6g4YLIn7sm4skGyEPtPky2pJiSs=;
 b=DH5ZsaSqpDMUiQEcGpIPd4F3g3JnyTG8eVCOEjqAFG9xOx2AWnYbhTb0wzb5h7OoMQZByH
 BuDScMzlMltocUGQq3910G3wtOEzwxJY8zfdBL3dyDREErEa2YIncCMrafh/8m/PMZcLGH
 QV7LPYpzT4axDIlVMafQiEMZ/EsW2bA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-8hq4Fn_TN2GcVivWRcc6GA-1; Thu, 09 Jul 2020 11:48:02 -0400
X-MC-Unique: 8hq4Fn_TN2GcVivWRcc6GA-1
Received: by mail-wr1-f72.google.com with SMTP id y16so2267134wrr.20
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 08:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kOxnlG8KI3xPEqow6g4YLIn7sm4skGyEPtPky2pJiSs=;
 b=JcSC38cu1Ll8GatLNNG0H1V7ftWdV4L3q227EG3vTuPXDLwRbI5UZV0m/8bNa/LH9c
 prlhj0pLjZxoGmdNcMZzlCG19AEx/mYwOwdRaxvADwXTirYWKCEU+a48iQsLgbJYW+it
 dF2+3hFj10tnr72syOn1KiSC2mQri8WyouH+ircoJTHKAkefVUKXGBqrENdlvS5ly8P8
 Q1UPTaL/M9OpQnSJlj5t7aS26tjAesipPG6sQSNQbJZLikxQjYg3HOHKn19+o3cxWRMP
 9QZ3FIwXuYTx6TgTDZ+HkouXiji3CLjq5JDIejNCnIURlO7Fg+4GzU1q5Xl2Jub/LYF8
 YzTw==
X-Gm-Message-State: AOAM531Y4N8Is9b0jcUrTkcxZJX9ccORyTdTk5mtCR7ohD2oBGD96pcg
 e5I1E9pRRiTTeLPPHb5sOlzUxidyVW8leZB7uoDUbJJcllWNvWS9VcU/PX4BV2jKEApftkB6F9Z
 9rDJZlMGTk7hF612dW2zYtbI5CIcl
X-Received: by 2002:a1c:3954:: with SMTP id g81mr628326wma.73.1594309681192;
 Thu, 09 Jul 2020 08:48:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4y2IzEii9YOA5nS+ZHsnfXytiSmWTStGmkEq37GvHGpqpwSSNWVeWnQtjd9K2u/5bw2gGAQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr628315wma.73.1594309680971;
 Thu, 09 Jul 2020 08:48:00 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
 by smtp.gmail.com with ESMTPSA id z8sm5484573wmg.39.2020.07.09.08.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2020 08:48:00 -0700 (PDT)
Subject: Re: [PATCH v4 06/16] pwm: lpss: Correct get_state result for
 base_unit == 0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200708211432.28612-1-hdegoede@redhat.com>
 <20200708211432.28612-7-hdegoede@redhat.com>
 <20200709145013.GA3703480@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <af7158c5-02bb-38ce-4b22-e469079dcccf@redhat.com>
Date: Thu, 9 Jul 2020 17:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709145013.GA3703480@smile.fi.intel.com>
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

On 7/9/20 4:50 PM, Andy Shevchenko wrote:
> On Wed, Jul 08, 2020 at 11:14:22PM +0200, Hans de Goede wrote:
>> The datasheet specifies that programming the base_unit part of the
>> ctrl register to 0 results in a contineous low signal.
>>
>> Adjust the get_state method to reflect this by setting pwm_state.period
>> to 1 and duty_cycle to 0.
> 
> ...
> 
>> +	if (freq == 0) {
>> +		/* In this case the PWM outputs a continous low signal */
> 
>> +		state->period = 1;
> 
> I guess this should be something like half of the range (so base unit calc
> will give 128). Because with period = 1 (too small) it will give too small
> base unit (if apply) and as a result we get high frequency pulses.

You are right, that if after this the user only changes the duty-cycle
things will work very poorly, we will end up with a base_unit value of
e.g 65535 and then have almost no duty-cycle resolution at all.

How about using a value here which results in a base_unit value of
256 (for 16 bit base-unit registers), that is the highest frequency we
can do while still having full duty-cycle resolution and it also
is the power-on-reset value, so using a higher period which translates
to a base_unit value of 256 (the por calue) seems like a sensible thing to do.

Uwe what do you think about this?

Regards,

Hans



> 
>> +		state->duty_cycle = 0;
>> +	} else {
>>   		state->period = NSEC_PER_SEC / (unsigned long)freq;
>> +		on_time_div *= state->period;
>> +		do_div(on_time_div, 255);
>> +		state->duty_cycle = on_time_div;
>> +	}
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
