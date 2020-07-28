Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947023135D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 22:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85266E3E1;
	Tue, 28 Jul 2020 20:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8073C6E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 20:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595966431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSzFFDyUfAnXvkkVJ84iprpsx2ZHjX86onKI2woEOHU=;
 b=E4b4EP4nxELQfpL7dSv39ciNiGy88VT+AvbByrGwOOOXwLzblIz3c+9Mg/GE+/yy+fae2U
 fMTP0YyLVIuDRUxkb3T3+apO7ByUw2OaEZwzs0FLGgr+x5Yja6oJ5geE5vFeBVq5bFrm/R
 rRXRiRBCglHbl928u/9qJd+fwQULYg0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-Khnhpdf7M_Cxtitgrys89A-1; Tue, 28 Jul 2020 16:00:26 -0400
X-MC-Unique: Khnhpdf7M_Cxtitgrys89A-1
Received: by mail-ed1-f72.google.com with SMTP id i3so7399067edq.21
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSzFFDyUfAnXvkkVJ84iprpsx2ZHjX86onKI2woEOHU=;
 b=jAdDHGAPmKYfER6RjGQZ1Su2kwlkno9J2qGIkHIUS13HH28l94uYPJSefPaxxIWHqU
 3h///+rTA72ng0yUVoi7TQMkF7x1d1kZu9zKN4SruSNRIeIkIhkBTmlqjnd061qetRi9
 3rDZOqD9ETY9mqclVLPzPJBqvFkBfpHZ/ZjFaGRo2lGvPyeeUFQJB5hpbyV5LETFizDg
 5EVNz3d3fcaizLWglufZY5EmXd+i3LR+43yzadt4PSvmB7c5IOKiVzH6wnitxnlilHqt
 x8sg68FzV8rOE7qnYhAboe2WjZ1XNYR3AmrrJ5QVpINI8Bh/bZAqFkeFJs+/QIZNWfvO
 szbg==
X-Gm-Message-State: AOAM530qGFPLqb95c1NwmUJU1b21E5KoyRBRynCXW4pSXxy79Upog43O
 AD+MEQquQQ2dDTJvtzEBlKIl7gTSBF1Yq+4F+SfA22eaH7dX8eSfYcw0Bn64TPrPKx/hmRvA4Ie
 AEHxOjzDIqa18GLRTD130VdMC7lUS
X-Received: by 2002:a17:906:e46:: with SMTP id
 q6mr25991246eji.234.1595966425319; 
 Tue, 28 Jul 2020 13:00:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV14O9arRYB6XE8+8IFKAQO6S/91DQBaJNDTc1IjVEOlhbwsAm5kcJXeUo4rgsWkPdUP3wYw==
X-Received: by 2002:a17:906:e46:: with SMTP id
 q6mr25991222eji.234.1595966425063; 
 Tue, 28 Jul 2020 13:00:25 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y22sm9846217ejf.108.2020.07.28.13.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 13:00:24 -0700 (PDT)
Subject: Re: [PATCH v5 07/16] pwm: crc: Fix period / duty_cycle times being
 off by a factor of 256
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200717133753.127282-8-hdegoede@redhat.com>
 <20200728193634.GD3703480@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a05f24ec-3be5-42c7-38b8-69e8a3a2b330@redhat.com>
Date: Tue, 28 Jul 2020 22:00:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200728193634.GD3703480@smile.fi.intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/28/20 9:36 PM, Andy Shevchenko wrote:
> On Fri, Jul 17, 2020 at 03:37:44PM +0200, Hans de Goede wrote:
>> While looking into adding atomic-pwm support to the pwm-crc driver I
>> noticed something odd, there is a PWM_BASE_CLK define of 6 MHz and
>> there is a clock-divider which divides this with a value between 1-128,
>> and there are 256 duty-cycle steps.
>>
>> The pwm-crc code before this commit assumed that a clock-divider
>> setting of 1 means that the PWM output is running at 6 MHZ, if that
>> is true, where do these 256 duty-cycle steps come from?
>>
>> This would require an internal frequency of 256 * 6 MHz = 1.5 GHz, that
>> seems unlikely for a PMIC which is using a silicon process optimized for
>> power-switching transistors. It is way more likely that there is an 8
>> bit counter for the duty cycle which acts as an extra fixed divider
>> wrt the PWM output frequency.
>>
>> The main user of the pwm-crc driver is the i915 GPU driver which uses it
>> for backlight control. Lets compare the PWM register values set by the
>> video-BIOS (the GOP), assuming the extra fixed divider is present versus
>> the PWM frequency specified in the Video-BIOS-Tables:
>>
>> Device:		PWM Hz set by BIOS	PWM Hz specified in VBT
>> Asus T100TA 	200			200
>> Asus T100HA 	200			200
>> Lenovo Miix 2 8	23437			20000
>> Toshiba WT8-A	23437			20000
>>
>> So as we can see if we assume the extra division by 256 then the register
>> values set by the GOP are an exact match for the VBT values, where as
>> otherwise the values would be of by a factor of 256.
>>
>> This commit fixes the period / duty_cycle calculations to take the
>> extra division by 256 into account.
> 
> So, base clock is 6MHz, then 7 bit divisor. That's what original values
> were for. On top of that there is 8-bit duty cycle control ("divide by 256"
> whatever it means) with the output range 23.437kHz..183Hz.

Right, so that range matches with a clock div of 1*256 (6 MHz/256 = 23437.5KHz)
to 128*256 (6 MHz/(128*256) = 183.1Hz) IOW this patch is correct.

Before this patch the code assumed a clkdiv of 1-128 (*), which leads to a
very different output frequency range.

Regards,

Hans


*) 0-127 really, that is fixed in a followup patch



> 
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Use NSEC_PER_USEC instead of adding a new (non-sensical) NSEC_PER_MHZ define
>> ---
>>   drivers/pwm/pwm-crc.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
>> index 272eeb071147..c056eb9b858c 100644
>> --- a/drivers/pwm/pwm-crc.c
>> +++ b/drivers/pwm/pwm-crc.c
>> @@ -21,8 +21,8 @@
>>   
>>   #define PWM_MAX_LEVEL		0xFF
>>   
>> -#define PWM_BASE_CLK		6000000  /* 6 MHz */
>> -#define PWM_MAX_PERIOD_NS	21333    /* 46.875KHz */
>> +#define PWM_BASE_CLK_MHZ	6	/* 6 MHz */
>> +#define PWM_MAX_PERIOD_NS	5461333	/* 183 Hz */
>>   
>>   /**
>>    * struct crystalcove_pwm - Crystal Cove PWM controller
>> @@ -72,7 +72,7 @@ static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,
>>   
>>   		/* changing the clk divisor, need to disable fisrt */
>>   		crc_pwm_disable(c, pwm);
>> -		clk_div = PWM_BASE_CLK * period_ns / NSEC_PER_SEC;
>> +		clk_div = PWM_BASE_CLK_MHZ * period_ns / (256 * NSEC_PER_USEC);
>>   
>>   		regmap_write(crc_pwm->regmap, PWM0_CLK_DIV,
>>   					clk_div | PWM_OUTPUT_ENABLE);
>> -- 
>> 2.26.2
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
