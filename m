Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29ADC46B35
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 13:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A3F10E2C6;
	Mon, 10 Nov 2025 12:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViKAkVmR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D65010E041;
 Mon, 10 Nov 2025 12:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762779102; x=1794315102;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gO8YPAMp07598z6KT7r+NLq+DpRtL3JAbCB78e9XC7A=;
 b=ViKAkVmRZ93KTtn36ZeswcAwRvYaDoHrc8PCx4KEPZGpJNPUY9GIM0a8
 2VpE4f1SuWnWnJrwoujGV7RRBskud0snRNFWF/SJpPvzTR3ptUxu30Kgw
 wZB7r9v6NaxFMzPQPJNEinWJ426Ks7rmo/VpvFSplZ1oNPk6CtZOppNSZ
 Fk0raLJYHzKStL4OAPfPOt4C/ZblPXTvxr3cI8sQLu3t6eX3+97srTRb0
 VMyNdQ3YobhWAUakeiqS87r6p9SSd4MR4Jv2jWB0h2+s0xzsGHdxYZAyF
 9oQ3iYcrOJxpbkaGXTsKPBCFsv9MsbRxVUJC6Of3McivaBqE3m/fhHctn Q==;
X-CSE-ConnectionGUID: 4qukIq9FQ82OKHZ1uKfTww==
X-CSE-MsgGUID: g7YKaiIERlKzg99lQo/mUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75513617"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="75513617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:51:41 -0800
X-CSE-ConnectionGUID: EgHmCz6OSau03jc1SXLbUA==
X-CSE-MsgGUID: jlz3O8BJSw2t4ZR2dj3BiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="219321566"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:51:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 2/6] drm/atomic: use drm_crtc_vblank_waitqueue()
In-Reply-To: <29b1cc39-7868-4b15-bac6-7dc97869dbdb@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762513240.git.jani.nikula@intel.com>
 <1097348197acea9110da8baebbbc189890d01660.1762513240.git.jani.nikula@intel.com>
 <29b1cc39-7868-4b15-bac6-7dc97869dbdb@suse.de>
Date: Mon, 10 Nov 2025 14:51:36 +0200
Message-ID: <a605efb1745f0d2c96ff986fed7bdeeb6226b7ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Nov 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 07.11.25 um 12:04 schrieb Jani Nikula:
>> We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
>> for a vblank. Use it instead of poking at dev->vblank[] directly.
>>
>> Due to the macro maze of wait_event_timeout() that uses the address-of
>> operator on the argument, we have to pass it in with the indirection
>> operator.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by Thomas Zimmermann <tzimmermann@suse.de>
>
> But... drm_crtc_vblank_waitqueue() is a terrible interface IMHO, as it 
> exports internal details of the vblank implementation.
>
> I wonder if the existing users at [1] and [2] couldn't be replaced with 
> a common vblank helper.
>
> And there's drm_wait_one_vblank() [3] and the waiting that's being fixed 
> here [4]. The latter looks like [3] but with multiple CRTC waiting for 
> their next vblank. I'd say this could be a single implementation within 
> the vblank code.

I don't disagree, but getting that done is a bit more involved than what
I have time for right now. Need to think.

In the mean time, pushed the drm_crtc_vblank_crtc() related patches in
the series, and left the drm_crtc_vblank_waitqueue() ones to simmer.

Thanks for the reviews.

BR,
Jani.


>
> [1] 
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/i915/display/intel_display_rps.c#L73
> [2] 
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/i915/display/intel_vblank.c#L715
> [3] 
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/drm_vblank.c#L1304
> [4] 
> https://elixir.bootlin.com/linux/v6.18-rc4/source/drivers/gpu/drm/drm_atomic_helper.c#L1837
>
> Best regards
> Thomas
>
>> ---
>>   drivers/gpu/drm/drm_atomic_helper.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
>> index 5a473a274ff0..e641fcf8c568 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -1831,10 +1831,12 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>>   	}
>>   
>>   	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
>> +		wait_queue_head_t *queue = drm_crtc_vblank_waitqueue(crtc);
>> +
>>   		if (!(crtc_mask & drm_crtc_mask(crtc)))
>>   			continue;
>>   
>> -		ret = wait_event_timeout(dev->vblank[i].queue,
>> +		ret = wait_event_timeout(*queue,
>>   					 state->crtcs[i].last_vblank_count !=
>>   						drm_crtc_vblank_count(crtc),
>>   					 msecs_to_jiffies(100));

-- 
Jani Nikula, Intel
