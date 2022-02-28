Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A84C66E9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1709410E27F;
	Mon, 28 Feb 2022 10:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCCB10E27F;
 Mon, 28 Feb 2022 10:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646043053; x=1677579053;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wfW/1ygdW4ocCekKsAsymLglpQ9CvgglisNmxrARh7o=;
 b=U8JuU5WvQGTKJuOIa6OcMmeHIq7kXO9pQJp1NcK9NhUDHyXBVR5XWorS
 RfHxlA4mWVqEkQZK5Whr55O1B32QCjnD9dkwCZi4D6meQvwYDAD2VjMp4
 bmkJ1TeSCtv3P5al7qmprCXK+hyI7X2s8M1N7rR8KnpSPR8cTVNTgu+s/
 chvCLzLdJKsd1TFIgsxUo7rGR/l8P9wa+/P9WCBmyK4IzZ/zqDzpNlPG7
 TVxG4rQBmGVFx4RWNL1wpfX4MAJpb9BMqpelu3EjkJL9CH50gzRCGqQBk
 Ws1rpW65q6QnPQDMPus0S33f4pmomylGWR18WwIzHpN+h5w1pXr0aVOVq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339287820"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="339287820"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 02:10:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="708594072"
Received: from jpdecker-mobl3.ger.corp.intel.com (HELO [10.213.235.138])
 ([10.213.235.138])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 02:10:50 -0800
Message-ID: <474ded6f-4fe8-8355-9a96-2254401d10fc@linux.intel.com>
Date: Mon, 28 Feb 2022 10:10:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: Depend on !PREEMPT_RT.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <YgqmfKhwU5spS069@linutronix.de> <YhlgRb1lZO38gAz5@linutronix.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YhlgRb1lZO38gAz5@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: David Airlie <airlied@linux.ie>, Thomas Gleixner <tglx@linutronix.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 25/02/2022 23:03, Sebastian Andrzej Siewior wrote:
> On 2022-02-14 19:59:08 [+0100], To intel-gfx@lists.freedesktop.org wrote:
>> There are a few sections in the driver which are not compatible with
>> PREEMPT_RT. They trigger warnings and can lead to deadlocks at runtime.
>>
>> Disable the i915 driver on a PREEMPT_RT enabled kernel. This way
>> PREEMPT_RT itself can be enabled without needing to address the i915
>> issues first. The RT related patches are still in RT queue and will be
>> handled later.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> A gentle ping ;)

Could you paste a link to the queue of i915 patches pending for a quick 
overview of how much work there is and in what areas?

Also, I assume due absence of ARCH_SUPPORTS_RT being defined by any 
arch, that something more is not yet ready?

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/i915/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
>> index a4c94dc2e2164..3aa719d5a0f0d 100644
>> --- a/drivers/gpu/drm/i915/Kconfig
>> +++ b/drivers/gpu/drm/i915/Kconfig
>> @@ -3,6 +3,7 @@ config DRM_I915
>>   	tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
>>   	depends on DRM
>>   	depends on X86 && PCI
>> +	depends on !PREEMPT_RT
>>   	select INTEL_GTT
>>   	select INTERVAL_TREE
>>   	# we need shmfs for the swappable backing store, and in particular
> 
> Sebastian
