Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7F46DA99
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 18:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCE272CF3;
	Wed,  8 Dec 2021 17:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D172CF3;
 Wed,  8 Dec 2021 17:58:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id D5B6F1F45986
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638986295; bh=7junxWaNxauVk2edwYKBsBqQNamq5s2lppgsWHegTX8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L8nMLADngE4kDv5fPh+tBMIsLA998RShJKDPJZvYtVY+jkZwhKcRmJAYhV2vuScPH
 sac+1ab/hdGcT86IISeqxt5TvU8fA/Ibxul0a7szAbSSvEbvB6ZVXgZVk0lScdupIx
 DYbjCEV9wbqyvwmaBfBWEg3M7Q4rBLGI4zsiRc+drwd5prp9yDMgoKmmsWdywC8Uqn
 lbRh9YqJFENixvXZVq5POrd7SxVIZZgGxcEWIZ5wkwjTHOoH240HOi5EC/6B7oEsGR
 IpBAxUCAydtA/luJOWm+n7vJlaWxrx7ydQaO+i/soMNrmk5XEfOp7JFO7O7jHCcqo/
 nJOnZMk969qqw==
Message-ID: <971555a0-6bd8-4c1c-7235-6072aaac1257@collabora.com>
Date: Wed, 8 Dec 2021 17:58:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: make GuC FW a requirement for
 Gen12 and beyond devices
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Adrian Larumbe <adrian.larumbe@collabora.com>, daniel@ffwll.ch,
 ramalingam.c@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211207175301.321119-1-adrian.larumbe@collabora.com>
 <c91e8065-56a6-d758-5089-2405c5841858@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <c91e8065-56a6-d758-5089-2405c5841858@intel.com>
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
Cc: daniels@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/12/2021 23:15, John Harrison wrote:
> On 12/7/2021 09:53, Adrian Larumbe wrote:
>> Beginning with DG2, all successive devices will require GuC FW to be
>> present and loaded at probe() time. This change alters error handling in
>> the FW init and load functions so that the driver's probe() function will
>> fail if GuC could not be loaded.
> We still need to load the i915 driver in fall back mode (display but no 
> engines) if the GuC is missing. Otherwise you may have just bricked the 
> user's device.

good point, well made.
though this still seems like an issue for gen12+ (excluding rkl and adl).

maybe a redesign of toplevel driver probe, with i915_driver_early_probe 
before i915_driver_create could work. If the GuC fw is not found, it 
could then register a new kms only version of i915_drm_driver.

or something like like that ...

> 
> Also, we do want to be able to disable the GuC via the enable_guc module 
> parameter.
> 
> John.
> 
> 
>> Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 20 ++++++++++++++++----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h |  4 ++--
>>   drivers/gpu/drm/i915/i915_gem.c       |  7 ++++++-
>>   3 files changed, 24 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 7660eba893fa..8b0778b6d9ab 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -277,14 +277,19 @@ static void guc_disable_communication(struct 
>> intel_guc *guc)
>>       drm_dbg(&i915->drm, "GuC communication disabled\n");
>>   }
>> -static void __uc_fetch_firmwares(struct intel_uc *uc)
>> +static int __uc_fetch_firmwares(struct intel_uc *uc)
>>   {
>> +    struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>       int err;
>>       GEM_BUG_ON(!intel_uc_wants_guc(uc));
>>       err = intel_uc_fw_fetch(&uc->guc.fw);
>>       if (err) {
>> +        /* GuC is mandatory on Gen12 and beyond */
>> +        if (GRAPHICS_VER(i915) >= 12)
>> +            return err;
>> +
>>           /* Make sure we transition out of transient "SELECTED" state */
>>           if (intel_uc_wants_huc(uc)) {
>>               drm_dbg(&uc_to_gt(uc)->i915->drm,
>> @@ -293,11 +298,13 @@ static void __uc_fetch_firmwares(struct intel_uc 
>> *uc)
>>                             INTEL_UC_FIRMWARE_ERROR);
>>           }
>> -        return;
>> +        return 0;
>>       }
>>       if (intel_uc_wants_huc(uc))
>>           intel_uc_fw_fetch(&uc->huc.fw);
>> +
>> +    return 0;
>>   }
>>   static void __uc_cleanup_firmwares(struct intel_uc *uc)
>> @@ -308,14 +315,19 @@ static void __uc_cleanup_firmwares(struct 
>> intel_uc *uc)
>>   static int __uc_init(struct intel_uc *uc)
>>   {
>> +    struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>       struct intel_guc *guc = &uc->guc;
>>       struct intel_huc *huc = &uc->huc;
>>       int ret;
>>       GEM_BUG_ON(!intel_uc_wants_guc(uc));
>> -    if (!intel_uc_uses_guc(uc))
>> -        return 0;
>> +    if (!intel_uc_uses_guc(uc)) {
>> +        if (GRAPHICS_VER(i915) >= 12)
>> +            return -EINVAL;
>> +        else
>> +            return 0;
>> +    }
>>       if (i915_inject_probe_failure(uc_to_gt(uc)->i915))
>>           return -ENOMEM;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index 866b462821c0..3bcd781447bc 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -17,7 +17,7 @@ struct intel_uc;
>>   struct intel_uc_ops {
>>       int (*sanitize)(struct intel_uc *uc);
>> -    void (*init_fw)(struct intel_uc *uc);
>> +    int (*init_fw)(struct intel_uc *uc);
>>       void (*fini_fw)(struct intel_uc *uc);
>>       int (*init)(struct intel_uc *uc);
>>       void (*fini)(struct intel_uc *uc);
>> @@ -104,7 +104,7 @@ static inline _TYPE intel_uc_##_NAME(struct 
>> intel_uc *uc) \
>>       return _RET; \
>>   }
>>   intel_uc_ops_function(sanitize, sanitize, int, 0);
>> -intel_uc_ops_function(fetch_firmwares, init_fw, void, );
>> +intel_uc_ops_function(fetch_firmwares, init_fw, int, 0);
>>   intel_uc_ops_function(cleanup_firmwares, fini_fw, void, );
>>   intel_uc_ops_function(init, init, int, 0);
>>   intel_uc_ops_function(fini, fini, void, );
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>> b/drivers/gpu/drm/i915/i915_gem.c
>> index 527228d4da7e..7f8204af6826 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1049,7 +1049,12 @@ int i915_gem_init(struct drm_i915_private 
>> *dev_priv)
>>       if (ret)
>>           return ret;
>> -    intel_uc_fetch_firmwares(&dev_priv->gt.uc);
>> +    ret = intel_uc_fetch_firmwares(&dev_priv->gt.uc);
>> +    if (ret) {
>> +        i915_probe_error(dev_priv, "Failed to fetch firmware\n");
>> +        return ret;
>> +    }
>> +
>>       intel_wopcm_init(&dev_priv->wopcm);
>>       ret = i915_init_ggtt(dev_priv);
> 
