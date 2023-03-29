Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA296CD641
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 11:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4DA10EA34;
	Wed, 29 Mar 2023 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B9E10E52B;
 Wed, 29 Mar 2023 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680081638; x=1711617638;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6P6pcEtEes8ruh+DwU2GE43Pr4b3BbuPa3FdWkhb1Dk=;
 b=HqaxUq5BR4mjttQLlN7gMAZl71Li1FcaBogFcyU2bJKazuJfIrSwZl5+
 kr40yApAvv30RWbdryFPDHV4VISyNrKw6WRwPKgK24W7XGWxeuJy1o+0u
 3lhM8ryOsktE3Tx8TQfFdjczXYeUCLUSYTnT2zF7UyaH/86QSHvdAHSfl
 9lJl1kakbkiap6tBpogNJ/wwuhNURw4/vcGGl2qj6ab8cJum6ocizXPRv
 aAq1l/RaXAbLaz3lVEsDMmrQht6m9G31Ruk5Eo6Thcrrs8fFcX2LyIMb4
 opKFiHzjeCNSm8JhCd8RDz5B0ve3xK8yMr29fRc4Ze14leKsDHP2vy5sh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403448632"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="403448632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 02:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="773502427"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="773502427"
Received: from jabolger-mobl2.ger.corp.intel.com (HELO [10.213.199.158])
 ([10.213.199.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 02:20:34 -0700
Message-ID: <85cc3d07-0a7f-9ba4-45f2-dc6e7befefaf@linux.intel.com>
Date: Wed, 29 Mar 2023 10:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/1] drm/i915: fix race condition UAF in
 i915_perf_add_config_ioctl
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230328093627.5067-1-lm0963hack@gmail.com>
 <e7541f73-f100-3b1f-de80-376fa55f2479@linux.intel.com>
 <ZCOKz62qE7jASyg1@orsosgc001.jf.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZCOKz62qE7jASyg1@orsosgc001.jf.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Min Li <lm0963hack@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29/03/2023 01:48, Umesh Nerlige Ramappa wrote:
> On Tue, Mar 28, 2023 at 02:08:47PM +0100, Tvrtko Ursulin wrote:
>>
>> On 28/03/2023 10:36, Min Li wrote:
>>> Userspace can guess the id value and try to race oa_config object 
>>> creation
>>> with config remove, resulting in a use-after-free if we dereference the
>>> object after unlocking the metrics_lock.  For that reason, unlocking the
>>> metrics_lock must be done after we are done dereferencing the object.
>>>
>>> Signed-off-by: Min Li <lm0963hack@gmail.com>
>>
>> Fixes: f89823c21224 ("drm/i915/perf: Implement 
>> I915_PERF_ADD/REMOVE_CONFIG interface")
>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: <stable@vger.kernel.org> # v4.14+
>>
>>> ---
>>>  drivers/gpu/drm/i915/i915_perf.c | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_perf.c 
>>> b/drivers/gpu/drm/i915/i915_perf.c
>>> index 824a34ec0b83..93748ca2c5da 100644
>>> --- a/drivers/gpu/drm/i915/i915_perf.c
>>> +++ b/drivers/gpu/drm/i915/i915_perf.c
>>> @@ -4634,13 +4634,13 @@ int i915_perf_add_config_ioctl(struct 
>>> drm_device *dev, void *data,
>>>          err = oa_config->id;
>>>          goto sysfs_err;
>>>      }
>>> -
>>> -    mutex_unlock(&perf->metrics_lock);
>>> +    id = oa_config->id;
>>>      drm_dbg(&perf->i915->drm,
>>>          "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
>>> +    mutex_unlock(&perf->metrics_lock);
>>> -    return oa_config->id;
>>> +    return id;
>>>  sysfs_err:
>>>      mutex_unlock(&perf->metrics_lock);
>>
>> LGTM.
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Umesh or Lionel could you please double check? I can merge if 
>> confirmed okay.
> 
> LGTM,
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Pushed to drm-intel-gt-next, thanks for the fix and reviews!

Regards,

Tvrtko
