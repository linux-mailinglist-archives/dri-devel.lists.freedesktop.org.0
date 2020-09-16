Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9183826BF3A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 10:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943816E96F;
	Wed, 16 Sep 2020 08:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0586E375;
 Wed, 16 Sep 2020 08:27:33 +0000 (UTC)
IronPort-SDR: 5KOeHv+1dUqgRp7g4gQZIjumcLW+0pCdF/g5si4xt/4byjZzo22PB7hQsi0UZRohkArndIZbob
 CECH0nIiBp8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="156814199"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="156814199"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 01:27:32 -0700
IronPort-SDR: Fw+gtqWnFEdQNU0kZz6xbjI6o89bArnizUhlalgUJYpaNeAAQ7f3sJD9piehy5Ov/bMaEhhVYp
 kfd6CtPT7fUA==
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="483210775"
Received: from ddolberg-mobl1.ger.corp.intel.com (HELO [10.214.209.83])
 ([10.214.209.83])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 01:27:29 -0700
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915/gem: Serialise debugfs
 i915_gem_objects with ctx->mutex
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
 <20200723172119.17649-3-chris@chris-wilson.co.uk>
 <5e7f2c00-c72e-46ff-defe-404b5a847a02@linux.intel.com>
 <20200916074230.GS438822@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <911f3391-fde1-c919-7e32-12e8582c2ed8@linux.intel.com>
Date: Wed, 16 Sep 2020 09:27:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916074230.GS438822@phenom.ffwll.local>
Content-Language: en-US
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 "Nikunj A. Dadhania" <nikunj.dadhania@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/09/2020 08:42, Daniel Vetter wrote:
> On Mon, Sep 14, 2020 at 05:45:09PM +0100, Tvrtko Ursulin wrote:
>>
>> On 23/07/2020 18:21, Chris Wilson wrote:
>>> Since the debugfs may peek into the GEM contexts as the corresponding
>>> client/fd is being closed, we may try and follow a dangling pointer.
>>> However, the context closure itself is serialised with the ctx->mutex,
>>> so if we hold that mutex as we inspect the state coupled in the context,
>>> we know the pointers within the context are stable and will remain valid
>>> as we inspect their tables.
>>>
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: CQ Tang <cq.tang@intel.com>
>>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>    drivers/gpu/drm/i915/i915_debugfs.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
>>> index 784219962193..ea469168cd44 100644
>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>> @@ -326,6 +326,7 @@ static void print_context_stats(struct seq_file *m,
>>>    		}
>>>    		i915_gem_context_unlock_engines(ctx);
>>> +		mutex_lock(&ctx->mutex);
>>>    		if (!IS_ERR_OR_NULL(ctx->file_priv)) {
>>>    			struct file_stats stats = {
>>>    				.vm = rcu_access_pointer(ctx->vm),
>>> @@ -346,6 +347,7 @@ static void print_context_stats(struct seq_file *m,
>>>    			print_file_stats(m, name, stats);
>>>    		}
>>> +		mutex_unlock(&ctx->mutex);
>>>    		spin_lock(&i915->gem.contexts.lock);
>>>    		list_safe_reset_next(ctx, cn, link);
>>>
>>
>> Hm this apparently never got it's r-b and so got re-discovered in the field.
>> +Nikunj
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> I'm not super thrilled about patch 1 in this, for debugfs imo better to
> wrangle this in the driver. And without patch 1 and 2 this wont fix a
> whole lot.

I try to avoid spending too much time coming up with smart solutions for 
_debugfs_. So I was going by the fact it obviously fixes something so it 
is an improvement.

But your proposal to swith iteration to files->contexts also seems would 
work. It would be slightly semantically different where it wouldn't show 
the contexts which are active on the GPU but clients have exited, but 
its debugfs so no one should care.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
