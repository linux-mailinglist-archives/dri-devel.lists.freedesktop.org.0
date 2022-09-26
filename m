Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D685EAC7F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 18:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB6210E713;
	Mon, 26 Sep 2022 16:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EB310E713;
 Mon, 26 Sep 2022 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664209765; x=1695745765;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RGELlHn/5ZnBIcUvqCJh6HPfV0AK8GqzLHz1xWuJViE=;
 b=WI/s97Qydue/cbfU6Qa/UWGzjwDdAl/hVvrzghYrEXLKu5GtiBW9R3r1
 OHHlLyFfX+GvPnypsuneQygtw+hNXDSM4GlRR50GqbqICwZ1ZhFz05c5z
 jYikZMjk0IbITFJmTxi4syKMB8zfllz6i4vimXicDuz6orzTQvKaWMHPU
 32CSTXjIvh+M639lcJEK6xOOHp6iPjczAc8r0Ok6e/z3AaRkc3fPKmXmC
 xVy7cybvgxgxaUXoEdnEBxNcby++W2DMbTU0x+uvElUHyvj676zGYCCiM
 MGvRyAfxRzXeT0EsFyxSofh22lCz98k7ZBA/tT3ztTZkEy7rNSPJfoHrR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="284192320"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="284192320"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:29:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="710181863"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="710181863"
Received: from tahirmuh-mobl1.ger.corp.intel.com (HELO [10.213.192.246])
 ([10.213.192.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 09:29:23 -0700
Message-ID: <0bca216d-8142-cce7-5d8c-cade4d2a8055@linux.intel.com>
Date: Mon, 26 Sep 2022 17:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/i915: Stop using flush_scheduled_work on driver remove
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220923142934.29528-1-tvrtko.ursulin@linux.intel.com>
 <Yy3byxFrfAfQL9xK@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yy3byxFrfAfQL9xK@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/09/2022 17:16, Ville Syrjälä wrote:
> On Fri, Sep 23, 2022 at 03:29:34PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Kernel is trying to eliminate callers of flush_scheduled_work so lets
>> try to accommodate.
>>
>> We currently call it from intel_modeset_driver_remove_noirq on the driver
>> remove path but the comment next to it does not tell me what exact work it
>> wants to flush.
>>
>> I can spot three (or four) works using the system_wq:
>>
>>    ..hotplug.reenable_work
>>    ..hotplug.hotplug_work
> 
> Looks like we at least try to shoot those down via
> intel_irq_uninstall()
>   ->intel_hpd_cancel_work()
>    ->cancel_delayed_work_sync()
> 
> But I'm not sure how broken the hpd disable path is here.
> I know hpd cancel vs. irq disable has some known ordering
> issues during suspend at least, some of which I think may
> have gotten fixed recently. But hpd cancel is still a bit
> of a mess in general.
> 
> Here we at least do cancel all the hpd works after irqs
> have been disabled, so I don't think any further flushing
> should help with whatever races we have left in there.
> 
>>    ..psr.dc3co_work
> 
> I think the whole dc3co thing should be disabled atm,
> so nothing should ever schedule this. We should
> probably garbage collect the whole thing...
> 
>>    ..crtc->drrs.work
> 
> That one should have been killed in
> intel_display_driver_unregister()
>   ->drm_atomic_helper_shutdown()
>    ->...
>     ->intel_drrs_deactivate()
>      ->cancel_delayed_work_sync()
> 
>> So if I replace it with intel_hpd_cancel_work() that appears would handle
>> the first two. What about the other two?
> 
> Other stuff that comes to mind is the pps vdd_off work.
> But looks like that should get taken down in the
> encoder->destroy() hook at the latest (via
> intel_mode_config_cleanup()).
> 
> psr.work at least has a cancel_work_sync() in intel_psr_disable(),
> so should hopefully get killed the same way as drrs.
> 
> opregion.asle_work seems to get cancelled from the unregister path.
> 
> The ones that look broken to me are dmc.work and fbc underrun_work.

Right, so I missed some and things are a bit more complicated. Okay to 
leave this with you, even if on a backlog?

Regards,

Tvrtko

> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> ---
>> I am clueless about the display paths and only send this because Jani
>> convinced me to send a patch to kick off the discussion. No expectations
>> whatsoever this is correct or complete.
>> ---
>>   drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 2d0018ae34b1..0eb72530a003 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -8980,7 +8980,7 @@ void intel_modeset_driver_remove_noirq(struct drm_i915_private *i915)
>>   	intel_unregister_dsm_handler();
>>   
>>   	/* flush any delayed tasks or pending work */
>> -	flush_scheduled_work();
>> +	intel_hpd_cancel_work(i915);
>>   
>>   	intel_hdcp_component_fini(i915);
>>   
>> -- 
>> 2.34.1
> 
