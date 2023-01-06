Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353365FE98
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:15:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AD410E855;
	Fri,  6 Jan 2023 10:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7414710E854;
 Fri,  6 Jan 2023 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673000117; x=1704536117;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=/eoMdymTEkpMW13UmQ6manSwCHMYpdQ0iAtJu9006UE=;
 b=e5ITLM8Yyulq0PH3CFUbntx9RRzj4xv/UdmFamVnAo17Fnrj/GSWE2DH
 fYYthmXDVDTKuuPZpdP50+f04CS30oeuEpLynydGJH5sTZ6zWaylL8A9f
 V+jE5zFtROx4V2gSamxO0m+hoaY4Gpy0U1K9Q3YMu7DFiVNaaNgML5Xce
 OY6j7njVO0ZOiXLnmB1bj87kT4v8OojwvPt43hfT4eKifw4wq5DGSMlJS
 c3h0IDN0FiIF2kWDC439IRb2HFeK8887U3xa4UXYdX2ajUsMOTYa088zH
 ET0IeLuBjk4WMTo4xrG/YV39DfMWYoTdfcBksMNVBVz5k8xoMa8kWXq7y g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="305966429"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="305966429"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 02:15:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="829860777"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="829860777"
Received: from mjervis-mobl1.ger.corp.intel.com (HELO [10.213.209.50])
 ([10.213.209.50])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 02:15:12 -0800
Message-ID: <69c2f2bd-e9de-b8ec-8790-055f4cc1d834@linux.intel.com>
Date: Fri, 6 Jan 2023 10:15:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915: Fix potential context UAFs
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Rob Clark <robdclark@gmail.com>
References: <20230103234948.1218393-1-robdclark@gmail.com>
 <Y7byJa9VZyKO2gnT@ashyti-mobl2.lan>
 <b1aea77b-ba55-61a2-2c33-f7754e0ca586@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b1aea77b-ba55-61a2-2c33-f7754e0ca586@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Matthew Brost <matthew.brost@intel.com>,
 katrinzhou <katrinzhou@tencent.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/01/2023 16:00, Tvrtko Ursulin wrote:
> 
> On 05/01/2023 15:52, Andi Shyti wrote:
>> Hi Rob,
>>
>> On Tue, Jan 03, 2023 at 03:49:46PM -0800, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> gem_context_register() makes the context visible to userspace, and which
>>> point a separate thread can trigger the I915_GEM_CONTEXT_DESTROY ioctl.
>>> So we need to ensure that nothing uses the ctx ptr after this.  And we
>>> need to ensure that adding the ctx to the xarray is the *last* thing
>>> that gem_context_register() does with the ctx pointer.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> I also agree with Tvrtko that we should add Stable: and Fixes:.
> 
> Yeah I'll add them all when merging. Just waiting for full CI results. 
> It will be like this:
> 
> Fixes: eb4dedae920a ("drm/i915/gem: Delay tracking the GEM context until 
> it is registered")
> Fixes: a4c1cdd34e2c ("drm/i915/gem: Delay context creation (v3)")
> Fixes: 49bd54b390c2 ("drm/i915: Track all user contexts per client")
> Cc: <stable@vger.kernel.org> # v5.10+

Pushed to drm-intel-gt-next - thanks for the fix and reviews.

Regards,

Tvrtko

> 
> Regards,
> 
> Tvrtko
> 
>> One little thing, "user after free" is clearer that UAF :)
>>
>> Thanks,
>> Andi
>>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++------
>>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index 7f2831efc798..6250de9b9196 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -1688,6 +1688,10 @@ void i915_gem_init__contexts(struct 
>>> drm_i915_private *i915)
>>>       init_contexts(&i915->gem.contexts);
>>>   }
>>> +/*
>>> + * Note that this implicitly consumes the ctx reference, by placing
>>> + * the ctx in the context_xa.
>>> + */
>>>   static void gem_context_register(struct i915_gem_context *ctx,
>>>                    struct drm_i915_file_private *fpriv,
>>>                    u32 id)
>>> @@ -1703,10 +1707,6 @@ static void gem_context_register(struct 
>>> i915_gem_context *ctx,
>>>       snprintf(ctx->name, sizeof(ctx->name), "%s[%d]",
>>>            current->comm, pid_nr(ctx->pid));
>>> -    /* And finally expose ourselves to userspace via the idr */
>>> -    old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
>>> -    WARN_ON(old);
>>> -
>>>       spin_lock(&ctx->client->ctx_lock);
>>>       list_add_tail_rcu(&ctx->client_link, &ctx->client->ctx_list);
>>>       spin_unlock(&ctx->client->ctx_lock);
>>> @@ -1714,6 +1714,10 @@ static void gem_context_register(struct 
>>> i915_gem_context *ctx,
>>>       spin_lock(&i915->gem.contexts.lock);
>>>       list_add_tail(&ctx->link, &i915->gem.contexts.list);
>>>       spin_unlock(&i915->gem.contexts.lock);
>>> +
>>> +    /* And finally expose ourselves to userspace via the idr */
>>> +    old = xa_store(&fpriv->context_xa, id, ctx, GFP_KERNEL);
>>> +    WARN_ON(old);
>>>   }
>>>   int i915_gem_context_open(struct drm_i915_private *i915,
>>> @@ -2199,14 +2203,22 @@ finalize_create_context_locked(struct 
>>> drm_i915_file_private *file_priv,
>>>       if (IS_ERR(ctx))
>>>           return ctx;
>>> +    /*
>>> +     * One for the xarray and one for the caller.  We need to grab
>>> +     * the reference *prior* to making the ctx visble to userspace
>>> +     * in gem_context_register(), as at any point after that
>>> +     * userspace can try to race us with another thread destroying
>>> +     * the context under our feet.
>>> +     */
>>> +    i915_gem_context_get(ctx);
>>> +
>>>       gem_context_register(ctx, file_priv, id);
>>>       old = xa_erase(&file_priv->proto_context_xa, id);
>>>       GEM_BUG_ON(old != pc);
>>>       proto_context_close(file_priv->dev_priv, pc);
>>> -    /* One for the xarray and one for the caller */
>>> -    return i915_gem_context_get(ctx);
>>> +    return ctx;
>>>   }
>>>   struct i915_gem_context *
>>> -- 
>>> 2.38.1
