Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A771F0D9E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 20:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26E06E145;
	Sun,  7 Jun 2020 18:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EB46E145
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591553666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4hkbuWXt1gMcvwbZmzxZzrHlzH0I7g/lXRGBEMCUoU=;
 b=FTgzUG9nvCPUS2XxSpHYNh8lvD+h7nLjWDkE7wxr8CH+CtLoihdKLepoHv0RkQIeYUFjyV
 WvYbAiqpCMrKi3O8MJylRDRabtJBf/RMArjfDv9K6M4AosYZvRbJ3Z0mhJMXtZTt8jhYmW
 OeMdi4cnvRrICurvA8rlxedoYCxps+E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-U85A6XUcONS3dk2FiCBHrg-1; Sun, 07 Jun 2020 14:14:24 -0400
X-MC-Unique: U85A6XUcONS3dk2FiCBHrg-1
Received: by mail-wr1-f72.google.com with SMTP id r5so6200717wrt.9
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z4hkbuWXt1gMcvwbZmzxZzrHlzH0I7g/lXRGBEMCUoU=;
 b=FcCC1IorQpf1mc0udRGfVm77aU2NRlbU8NcwGt50c+nX/XfdKqd/bJCLLp7bQJ/pgQ
 3UC6p5130N8TmciqQimNKUw52hgiJm4uGBNu0+oplKbYxJvcYZMbtP2AUq+A61xEbcAx
 Akq9P8Xk52Nlwkpoj0DJg2Rp87FHO9PkP2R3AgTg/qERsd2SjYttlVjLO6AZmDpt/U4k
 Lo+yQvUA87GZiB8XviSEAYoBpKUPHiOadQqVxLr/QZLs4rnr9RHy/dG+LdnfMjvX9WsZ
 5v/QGrA+qGFCHOGZQnKp/bQ1maj59YYCkZEgtsWQpprprfVrHviiEAWwgS5g+NFTp4cB
 eZ2Q==
X-Gm-Message-State: AOAM533iUhjkaZ/UA+78rDF2TEzSkoSfFstrYGGn3Z6XxlGoEodyJesy
 URoY8VPKtTsCewMwN1rdIC+ara1Lx4Fg/+SBdtDcMl6mbHuZvGFElZP84DFTX5RivOlSmYzrFZm
 dIf6eYXd6JFvvsPNKI1eQEHo1rbdl
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr19852467wrx.61.1591553663365; 
 Sun, 07 Jun 2020 11:14:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCESg+PSmAmw0dlkhuP8dhjRw2bmGnPif2KdKjpZUxSGxE2flXxbFtAJnvOzlC8pCqkLphTA==
X-Received: by 2002:a5d:6b8c:: with SMTP id n12mr19852447wrx.61.1591553662996; 
 Sun, 07 Jun 2020 11:14:22 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id o20sm21596873wra.29.2020.06.07.11.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jun 2020 11:14:22 -0700 (PDT)
Subject: Re: [PATCH 02/16] ACPI / LPSS: Save Cherry Trail PWM ctx registers
 only once (at activation)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200606202601.48410-1-hdegoede@redhat.com>
 <20200606202601.48410-3-hdegoede@redhat.com>
 <20200607170337.GY2428291@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <56c5bc07-0b44-82a2-3cd5-e325546c538f@redhat.com>
Date: Sun, 7 Jun 2020 20:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200607170337.GY2428291@smile.fi.intel.com>
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
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/7/20 7:03 PM, Andy Shevchenko wrote:
> On Sat, Jun 06, 2020 at 10:25:47PM +0200, Hans de Goede wrote:
>> The DSDTs on most Cherry Trail devices have an ugly clutch where the PWM
>> controller gets turned off from the _PS3 method of the graphics-card dev:
>>
>>              Method (_PS3, 0, Serialized)  // _PS3: Power State 3
>>              {
>>                  ...
>>                              PWMB = PWMC /* \_SB_.PCI0.GFX0.PWMC */
>>                              PSAT |= 0x03
>>                              Local0 = PSAT /* \_SB_.PCI0.GFX0.PSAT */
>>                  ...
>>              }
>>
>> Where PSAT is the power-status register of the PWM controller.
>>
>> Since the i915 driver will do a pwm_get on the pwm device as it uses it to
>> control the LCD panel backlight, there is a device-link marking the i915
>> device as a consumer of the pwm device. So that the PWM controller will
>> always be suspended after the i915 driver suspends (which is the right
>> thing to do). This causes the above GFX0 PS3 AML code to run before
>> acpi_lpss.c calls acpi_lpss_save_ctx().
>>
>> So on these devices the PWM controller will already be off when
>> acpi_lpss_save_ctx() runs. This causes it to read/save all 1-s (0xffffffff)
>> as ctx register values.
>>
>> When these bogus values get restored on resume the PWM controller actually
>> keeps working, since most bits are reserved, but this does set bit 3 of
>> the LPSS General purpose register, which for the PWM controller has the
>> following function: "This bit is re-used to support 32kHz slow mode.
>> Default is 19.2MHz as PWM source clock".
>>
>> This causes the clock of the PWM controller to switch from 19.2MHz to
>> 32KHz, which is a slow-down of a factor 600. Suprisingly enough so far
>> there have been few bug reports about this. This is likely because the
>> i915 driver was hardcoding the PWM frequency to 46 KHz, which divided
>> by 600 would result in a PWM frequency of approx. 78 Hz, which mostly
>> still works fine. There are some bug reports about the LCD backlight
>> flickering after suspend/resume which are likely caused by this issue.
>>
>> But with the upcoming patch-series to finally switch the i915 drivers
>> code for external PWM controllers to use the atomic API and to honor
>> the PWM frequency specified in the video BIOS (VBT), this becomes a much
>> bigger problem. On most cases the VBT specifies either 200 Hz or 20
>> KHz as PWM frequency, which with the mentioned issue ends up being either
>> 1/3 Hz, where the backlight actually visible blinks on and off every 3s,
>> or in 33 Hz and horrible flickering of the backlight.
>>
>> There are a number of possible solutions to this problem:
>>
>> 1. Make acpi_lpss_save_ctx() run before GFX0._PS3
>>   Pro: Clean solution from pov of not medling with save/restore ctx code
>>   Con: As mentioned the current ordering is the right thing to do
>>   Con: Requires assymmetry in at what suspend/resume phase we do the save vs
>>        restore, requiring more suspend/resume ordering hacks in already
>>        convoluted acpi_lpss.c suspend/resume code.
>> 2. Do some sort of save once mode for the LPSS ctx
>>   Pro: Reasonably clean
>>   Con: Needs a new LPSS flag + code changes to handle the flag
>> 3. Detect we have failed to save the ctx registers and do not restore them
>>   Pro: Not PWM specific, might help with issues on other LPSS devices too
>>   Con: If we can get away with not restoring the ctx why bother with it at
>>        all?
>> 4. Do not save the ctx for CHT PWM controllers
>>   Pro: Clean, as simple as dropping a flag?
>>   Con: Not so simple as dropping a flag, needs a new flag to ensure that
>>        we still do lpss_deassert_reset() on device activation.
>> 5. Make the pwm-lpss code fixup the LPSS-context registers
>>   Pro: Keeps acpi_lpss.c code clean
>>   Con: Moves knowledge of LPSS-context into the pwm-lpss.c code
>>
>> 1 and 5 both do not seem to be a desirable way forward.
>>
>> 3 and 4 seem ok, but they both assume that restoring the LPSS-context
>> registers is not necessary. I have done a couple of test and those do
>> show that restoring the LPSS-context indeed does not seem to be necessary
>> on devices using s2idle suspend (and successfully reaching S0i3). But I
>> have no hardware to test deep / S3 suspend. So I'm not sure that not
>> restoring the context is safe.
>>
>> That leaves solution 2, which is about as simple / clean as 3 and 4,
>> so this commit fixes the described problem by implementing a new
>> LPSS_SAVE_CTX_ONCE flag and setting that for the CHT PWM controllers.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/acpi/acpi_lpss.c | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
>> index 67892fc0b822..26933e6b7b8c 100644
>> --- a/drivers/acpi/acpi_lpss.c
>> +++ b/drivers/acpi/acpi_lpss.c
>> @@ -68,6 +68,14 @@ ACPI_MODULE_NAME("acpi_lpss");
>>   #define LPSS_LTR			BIT(3)
>>   #define LPSS_SAVE_CTX			BIT(4)
>>   #define LPSS_NO_D3_DELAY		BIT(5)
>> +/*
>> + * For some devices the DSDT AML code for another device turns off the device
>> + * before our suspend handler runs, causing us to read/save all 1-s (0xffffffff)
>> + * as ctx register values.
>> + * Luckily these devices always use the same ctx register values, so we can
>> + * work around this by saving the ctx registers once on activation.
>> + */
>> +#define LPSS_SAVE_CTX_ONCE		BIT(6)
> 
> A nit: I would group SAVE_CTX and CTX_ONCE in the list, i.e. make this BIT(5)
> and move NO_D3_DELAY to BIT(6).

Ok, I've fixed this for v2 which I will send out shortly, as I needed to do
a v2 anyways because I accidentally left a debugging patch in the v1 series.

Regards,

Hans



> 
>>   struct lpss_private_data;
>>   
>> @@ -254,7 +262,7 @@ static const struct lpss_device_desc byt_pwm_dev_desc = {
>>   };
>>   
>>   static const struct lpss_device_desc bsw_pwm_dev_desc = {
>> -	.flags = LPSS_SAVE_CTX | LPSS_NO_D3_DELAY,
>> +	.flags = LPSS_SAVE_CTX_ONCE | LPSS_NO_D3_DELAY,
>>   	.prv_offset = 0x800,
>>   	.setup = bsw_pwm_setup,
>>   	.resume_from_noirq = true,
>> @@ -885,9 +893,14 @@ static int acpi_lpss_activate(struct device *dev)
>>   	 * we have to deassert reset line to be sure that ->probe() will
>>   	 * recognize the device.
>>   	 */
>> -	if (pdata->dev_desc->flags & LPSS_SAVE_CTX)
>> +	if (pdata->dev_desc->flags & (LPSS_SAVE_CTX | LPSS_SAVE_CTX_ONCE))
>>   		lpss_deassert_reset(pdata);
>>   
>> +#ifdef CONFIG_PM
>> +	if (pdata->dev_desc->flags & LPSS_SAVE_CTX_ONCE)
>> +		acpi_lpss_save_ctx(dev, pdata);
>> +#endif
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1031,7 +1044,7 @@ static int acpi_lpss_resume(struct device *dev)
>>   
>>   	acpi_lpss_d3_to_d0_delay(pdata);
>>   
>> -	if (pdata->dev_desc->flags & LPSS_SAVE_CTX)
>> +	if (pdata->dev_desc->flags & (LPSS_SAVE_CTX | LPSS_SAVE_CTX_ONCE))
>>   		acpi_lpss_restore_ctx(dev, pdata);
>>   
>>   	return 0;
>> -- 
>> 2.26.2
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
