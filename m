Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2469A616514
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 15:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8101B10E496;
	Wed,  2 Nov 2022 14:26:21 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374DF10E496;
 Wed,  2 Nov 2022 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667399178; x=1698935178;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qmyhZ9qekCAfnFNT7oi59V1tmBU1WE00heivKJi0aPw=;
 b=RmGdBM8Db/OSDwfSECHrZIqOAl1vwjGnUiY6/FhNvweUoIHvm4dJPGF4
 4o0gR+1rj4cyDXi+vlupf8ZZJuVJ7DHBI/iMMQERa2xakk3rDXhZ7zclV
 aS52MXo3mvufrfNHW54oKdIsYVwTH+beB2T3BBM94gl65oy+Rt3tXM4qr
 v9aVex4yjJq6whEcje8gg0XIGNozTk/Us9gdtoLX2cenBHdIKF2l3Iu8m
 3dAYQC3av2mddoE8xvtJf9d6PBAcVFzCGcph07iBR5F1ZUWIm/PSfQW2q
 DlEeklbCAFARn9anmtHtkdBv4vy+tAUQ3Q3+iC3GfDfZKisg1DH/f0WgI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="307034314"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="307034314"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 07:20:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="759564352"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="759564352"
Received: from dsloan-mobl.ger.corp.intel.com (HELO [10.213.207.205])
 ([10.213.207.205])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 07:20:06 -0700
Message-ID: <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
Date: Wed, 2 Nov 2022 14:20:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, John.C.Harrison@Intel.com,
 Intel-GFX@Lists.FreeDesktop.Org
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87k04d7dyn.fsf@intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/11/2022 12:12, Jani Nikula wrote:
> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> At the end of each test, IGT does a drop caches call via sysfs with
> 
> sysfs?
> 
>> special flags set. One of the possible paths waits for idle with an
>> infinite timeout. That causes problems for debugging issues when CI
>> catches a "can't go idle" test failure. Best case, the CI system times
>> out (after 90s), attempts a bunch of state dump actions and then
>> reboots the system to recover it. Worst case, the CI system can't do
>> anything at all and then times out (after 1000s) and simply reboots.
>> Sometimes a serial port log of dmesg might be available, sometimes not.
>>
>> So rather than making life hard for ourselves, change the timeout to
>> be 10s rather than infinite. Also, trigger the standard
>> wedge/reset/recover sequence so that testing can continue with a
>> working system (if possible).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>> index ae987e92251dd..9d916fbbfc27c 100644
>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>   		  DROP_RESET_ACTIVE | \
>>   		  DROP_RESET_SEQNO | \
>>   		  DROP_RCU)
>> +
>> +#define DROP_IDLE_TIMEOUT	(HZ * 10)
> 
> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only used
> here.

So move here, dropping i915 prefix, next to the newly proposed one?

> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
> gt/intel_gt.c.

Move there and rename to GT_IDLE_TIMEOUT?

> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in intel_gt_pm.c.

No action needed, maybe drop i915 prefix if wanted.

> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.

Add _MS suffix if wanted.

> My head spins.

I follow and raise that the newly proposed DROP_IDLE_TIMEOUT applies to 
DROP_ACTIVE and not only DROP_IDLE.

Things get refactored, code moves around, bits get left behind, who 
knows. No reason to get too worked up. :) As long as people are taking a 
wider view when touching the code base, and are not afraid to send 
cleanups, things should be good.

For the actual functional change at hand - it would be nice if code 
paths in question could handle SIGINT and then we could punt the 
decision on how long someone wants to wait purely to userspace. But it's 
probably hard and it's only debugfs so whatever.

Whether or not 10s is enough CI will hopefully tell us. I'd probably err 
on the side of safety and make it longer, but at most half from the test 
runner timeout.

I am not convinced that wedging is correct though. Conceptually could be 
just that the timeout is too short. What does wedging really give us, on 
top of limiting the wait, when latter AFAIU is the key factor which 
would prevent the need to reboot the machine?

Regards,

Tvrtko
