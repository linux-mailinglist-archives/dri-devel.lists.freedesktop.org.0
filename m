Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB282352C0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 16:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA196EB8F;
	Sat,  1 Aug 2020 14:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2676EB8D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596292412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2AffMbTZZ0aELZ/3Ad5ZjJ2PXQeVzg4uG2LtDDO4mtY=;
 b=hxYDiAwhEt+XENd//q8AvuCUzkiKO76gX2xfwB8k17kor/xpkbZQu+WF8VQjQNhdMcm33t
 VSa4ojS9L65UkXrvxwPHuPhl9YUbEwfANNVD20D1+jqXbVFDL3lT+r0YCRtKl19uTBmizj
 0BKeHrVy+0o4N+zUgHiEPyYlHfAanFY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-YxG00_5nNv-tPMvBI6aqhw-1; Sat, 01 Aug 2020 10:33:31 -0400
X-MC-Unique: YxG00_5nNv-tPMvBI6aqhw-1
Received: by mail-ej1-f71.google.com with SMTP id sd23so4341961ejb.14
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 07:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2AffMbTZZ0aELZ/3Ad5ZjJ2PXQeVzg4uG2LtDDO4mtY=;
 b=kA42vaCoeCS00rtXSBmNHWBv6vxzhzdPYyqpE+SqR9JLzjjBNth5nm7xnGWVmCmTqH
 yiwfdZ5MzI6NUN6zJXg03H9489iA92HOk8n2gS5tSiC+44FTfMeY3Zy+LlvzhdsZ9eZi
 ZmTItSwV0FgtnhYCAFUyhT02k7YZGR3sDusSB6XpwF62yGndDHk7B513QQFHV48wcjTP
 t1F6xBTlX61rAeG5gR7Djq77U70ItJ0Iii7SfTKBEiCaxbmEZR/00UjrXFw2Ym4+EIqn
 EWTHCNU+LhwX0Iitg4LUaSDYdzEPdOn2Ogi2WN5LEADvySjeVrRRG6zxBe99s7GMdlrX
 aaEw==
X-Gm-Message-State: AOAM531lERcQRx4nzLXCLMuScsyYtHA8p9DCowaReuWL+fZ27hqEneCc
 2h6X5bMCahfKmmCHdmA8StEiSaST4z1E8Lw9XW5YJvBZai96DSwY1FPd3EttX9uXyVWZoHyULA0
 F4f856CobwaxsrVI3D3ebHZZSrfLs
X-Received: by 2002:a50:935a:: with SMTP id n26mr8506306eda.107.1596292409693; 
 Sat, 01 Aug 2020 07:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIr5NWOJG+AluNDTd4Hf+xtn0Jb6y6EJa9qUrFaYzrqWOWWUlJfVdGJJvxCEXcVp1kWgRzbA==
X-Received: by 2002:a50:935a:: with SMTP id n26mr8506264eda.107.1596292409213; 
 Sat, 01 Aug 2020 07:33:29 -0700 (PDT)
Received: from x1.localdomain ([109.38.137.213])
 by smtp.gmail.com with ESMTPSA id ce12sm11849828edb.4.2020.08.01.07.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Aug 2020 07:33:28 -0700 (PDT)
Subject: Re: [PATCH v5 00/16] acpi/pwm/i915: Convert pwm-crc and i915 driver's
 PWM code to use the atomic PWM API
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200727074120.GB2781612@ulmo> <20200729082305.GK3703480@smile.fi.intel.com>
 <b87c535a-022f-2894-1e38-5be035c6fbfc@redhat.com>
 <20200730092650.GA4077384@ulmo>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <36891235-95ef-5ac7-cb56-77b548d77778@redhat.com>
Date: Sat, 1 Aug 2020 16:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730092650.GA4077384@ulmo>
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
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,

On 7/30/20 11:26 AM, Thierry Reding wrote:
> On Wed, Jul 29, 2020 at 11:32:28AM +0200, Hans de Goede wrote:
>> cHi,
>>
>> On 7/29/20 10:23 AM, Andy Shevchenko wrote:
>>> On Mon, Jul 27, 2020 at 09:41:20AM +0200, Thierry Reding wrote:
>>>> On Fri, Jul 17, 2020 at 03:37:37PM +0200, Hans de Goede wrote:
>>>
>>>> I've applied patches 3 through 12 to the PWM tree. I thought it was a
>>>> bit odd that only a handful of these patches had been reviewed and there
>>>> were no Tested-bys, but I'm going to trust that you know what you're
>>>> doing. =) If this breaks things for anyone I'm sure they'll complain.
>>
>> Thank you for picking up these patches, but ...
>>
>>> Can we postpone a bit?
>>
>> I have to agree with Andy here, as mentioned my plan was to push the
>> entire series through drm-intel-next-queued once the last few PWM
>> patches are reviewed.
>>
>> There are some fixes, to the pwm-crc driver which change behavior in
>> a possibly undesirable way, unless combined with the i915 changes.
>>
>> E.g. there is a fix which makes the pwm-crc driver actually honor
>> the requested output frequency (it was not doing this due to a bug)
>> and before the i915 changes, the i915 driver was hardcoding an output
>> freq, rather then looking at the video-bios-tables as it should.
>>
>> So having just the pwm-crc fix, will change the output frequency
>> which some LCD panels might not like.
>>
>> Note things are probably fine with the hardcoded output freq, but I
>> would like to play it safe here.
>>
>> Also Andy was still reviewing some of the PWM patches, and has requested
>> changes to 1 patch, nothing functional just some code-reshuffling for
>> cleaner code, so we could alternatively fix this up with a follow-up patch.
>>
>> Either way please let us know how you want to proceed.
> 
> Okay, that's fine, I'll drop them again.

Great, thank you.

>>>> That said I see that Rafael has acked patches 1-2 and Jani did so for
>>>> patches 13-16. I'm not sure if you expect me to pick those patches up as
>>>> well. As far as I can tell the ACPI, PWM and DRM parts are all
>>>> independent, so these patches could be applied to the corresponding
>>>> subsystem trees.
>>>>
>>>> Anyway, if you want me to pick those all up into the PWM tree, I suppose
>>>> that's something I can do as well.
>>
>> drm-intel-next-queued is usually seeing quite a bit of churn, so the i915
>> patches really should go upstream through that branch.
> 
> During my build tests I ran into a small issue caused by this series
> interacting with the conversion of period and duty-cycle to u64 that
> I've queued for v5.9. This causes a build failure on x86.
> 
> I have this local diff to fix that:
> 
> --- >8 ---
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 370ab826a20b..92e838797733 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -76,7 +76,9 @@ static int crc_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>   
>   	if (pwm_get_duty_cycle(pwm) != state->duty_cycle ||
>   	    pwm_get_period(pwm) != state->period) {
> -		int level = state->duty_cycle * PWM_MAX_LEVEL / state->period;
> +		u64 level = state->duty_cycle * PWM_MAX_LEVEL;
> +
> +		do_div(level, state->period);
>   
>   		err = regmap_write(crc_pwm->regmap, PWM0_DUTY_CYCLE, level);
>   		if (err) {
> @@ -141,10 +143,9 @@ static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>   
>   	clk_div = (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
>   
> -	state->period =
> -		DIV_ROUND_UP(clk_div * NSEC_PER_USEC * 256, PWM_BASE_CLK_MHZ);
> -	state->duty_cycle =
> -		DIV_ROUND_UP(duty_cycle_reg * state->period, PWM_MAX_LEVEL);
> +	state->period = DIV_ROUND_UP(clk_div * NSEC_PER_USEC * 256, PWM_BASE_CLK_MHZ);
> +	state->duty_cycle = duty_cycle_reg * state->period + PWM_MAX_LEVEL - 1;
> +	do_div(state->duty_cycle, PWM_MAX_LEVEL);
>   	state->polarity = PWM_POLARITY_NORMAL;
>   	state->enabled = !!(clk_div_reg & PWM_OUTPUT_ENABLE);
>   }
> --- >8 ---
> 
> So perhaps you want to integrate that or something equivalent into your
> series.

Ack, thank you for letting me know.

> Also this could result in a tricky dependency between PWM and drm-misc,
> although if you're targetting drm-misc it's too late for v5.9 anyway. In
> that case you should be able to rebase your series on v5.9-rc1 when it's
> out and then you'll get the prerequisite PWM changes for the u64
> conversion as part of that. No need to track the dependency explicitly.

Right, I agree that this is too late for this cycle, so I will rebase it
on top of v5.9-rc1 once that is out, making sure to take the u64 changes
into account.

As said my plan is to merge this all through the drm tree, the assumption
there was that the pwm-crc and pwm-lpss drivers normally do not see a whole
lot of chsnges. Rebasing on top of 5.9-rc1 should take care of the u64
changes. So unless there are more pwm-core changes planned for the 5.10
cycle, I would like to queue this in the drm-intel tree for 5.10.
By thta time Andy and I should have also wrapped up the review process
(it is as good as wrapped up now already).

Thierry, is merging these through the drm-intel tree for 5.10 ok with
you? And if this is ok with you may I add your Acked-by to the PWM
patches to indicate this ?

Regards,

Hans


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
