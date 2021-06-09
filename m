Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6A23A08DA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 03:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209E86EC70;
	Wed,  9 Jun 2021 01:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484BE89EA3;
 Wed,  9 Jun 2021 01:03:24 +0000 (UTC)
IronPort-SDR: lxXJzENzzXviX+VJkNjZMA3U9SYyyD9KyEUMSsomwo0Z/cPgvOSN6rikXtKOQn0pX9LeV8eir5
 nROtKMJVv/iQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="192087743"
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="192087743"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 18:03:21 -0700
IronPort-SDR: Mo5jMusmBjVKa4dbvaWpt+T2JlkdJ21ls/yiEPpXuIUqHgZDij6i6fZlYP7/hpSQ4vZHKygJWl
 iZ9mLidg8XuQ==
X-IronPort-AV: E=Sophos;i="5.83,259,1616482800"; d="scan'208";a="449751080"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.251.140.170])
 ([10.251.140.170])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 18:03:21 -0700
Subject: Re: [PATCH 02/13] drm/i915/guc: Update MMIO based communication
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-3-matthew.brost@intel.com>
 <707a404a-c20b-39e6-af85-7ab93e9d3c5e@intel.com>
 <5dc6918e-d9ae-f435-c33f-2d6ab370224e@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <6c4cf5e3-5fe7-1c2d-7b7a-422aa203ee27@intel.com>
Date: Tue, 8 Jun 2021 18:03:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5dc6918e-d9ae-f435-c33f-2d6ab370224e@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<snip>

>>>    #endif /* _ABI_GUC_COMMUNICATION_MMIO_ABI_H */
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> index f147cb389a20..b773567cb080 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>>> @@ -376,29 +376,27 @@ void intel_guc_fini(struct intel_guc *guc)
>>>    /*
>>>     * This function implements the MMIO based host to GuC interface.
>>>     */
>>> -int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32
>>> len,
>>> +int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request,
>>> u32 len,
>>>                u32 *response_buf, u32 response_buf_size)
>>>    {
>>> +    struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>>        struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
>>> -    u32 status;
>>> +    u32 header;
>>>        int i;
>>>        int ret;
>>>          GEM_BUG_ON(!len);
>>>        GEM_BUG_ON(len > guc->send_regs.count);
>>>    -    /* We expect only action code */
>>> -    GEM_BUG_ON(*action & ~INTEL_GUC_MSG_CODE_MASK);
>>> -
>>> -    /* If CT is available, we expect to use MMIO only during
>>> init/fini */
>>> -    GEM_BUG_ON(*action !=
>>> INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER &&
>>> -           *action !=
>>> INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER);
>>> +    GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
>>> GUC_HXG_ORIGIN_HOST);
>>> +    GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
>>> GUC_HXG_TYPE_REQUEST);
>>>          mutex_lock(&guc->send_mutex);
>>>        intel_uncore_forcewake_get(uncore, guc->send_regs.fw_domains);
>>>    +retry:
>>>        for (i = 0; i < len; i++)
>>> -        intel_uncore_write(uncore, guc_send_reg(guc, i), action[i]);
>>> +        intel_uncore_write(uncore, guc_send_reg(guc, i), request[i]);
>>>          intel_uncore_posting_read(uncore, guc_send_reg(guc, i - 1));
>>>    @@ -410,30 +408,74 @@ int intel_guc_send_mmio(struct intel_guc *guc,
>>> const u32 *action, u32 len,
>>>         */
>>>        ret = __intel_wait_for_register_fw(uncore,
>>>                           guc_send_reg(guc, 0),
>>> -                       INTEL_GUC_MSG_TYPE_MASK,
>>> -                       INTEL_GUC_MSG_TYPE_RESPONSE <<
>>> -                       INTEL_GUC_MSG_TYPE_SHIFT,
>>> -                       10, 10, &status);
>>> -    /* If GuC explicitly returned an error, convert it to -EIO */
>>> -    if (!ret && !INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(status))
>>> -        ret = -EIO;
>>> +                       GUC_HXG_MSG_0_ORIGIN,
>>> +                       FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
>>> +                              GUC_HXG_ORIGIN_GUC),
>>> +                       10, 10, &header);
>>> +    if (unlikely(ret)) {
>>> +timeout:
>>> +        drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
>>> +            request[0], header);
>>> +        goto out;
>>> +    }
>>>    -    if (ret) {
>>> -        DRM_ERROR("MMIO: GuC action %#x failed with error %d %#x\n",
>>> -              action[0], ret, status);
>>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>>> GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>>> +#define done ({ header = intel_uncore_read(uncore, guc_send_reg(guc,
>>> 0)); \
>>> +        FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) != GUC_HXG_ORIGIN_GUC
>>> || \
>>> +        FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>>> GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
>>> +
>>> +        ret = wait_for(done, 1000);
>>> +        if (unlikely(ret))
>>> +            goto timeout;
>>> +        if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>>> +                       GUC_HXG_ORIGIN_GUC))
>>> +            goto proto;
>>> +#undef done
>>> +    }
>>> +
>>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>>> GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>> +        u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>>> +
>>> +        drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
>>> +            request[0], reason);
>>> +        goto retry;
>>> +    }
>>> +
>>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>>> GUC_HXG_TYPE_RESPONSE_FAILURE) {
>>> +        u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>>> +        u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>>> +
>>> +        drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
>>> +            request[0], error, hint);
>>> +        ret = -ENXIO;
>>> +        goto out;
>>> +    }
>>> +
>>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>>> GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>>> +proto:
>>> +        drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
>>> +            request[0], header);
>>> +        ret = -EPROTO;
>>>            goto out;
>>>        }
>>>          if (response_buf) {
>>> -        int count = min(response_buf_size, guc->send_regs.count - 1);
>>> +        int count = min(response_buf_size, guc->send_regs.count);
>>>    -        for (i = 0; i < count; i++)
>>> +        GEM_BUG_ON(!count);
>>> +
>>> +        response_buf[0] = header;
>>> +
>>> +        for (i = 1; i < count; i++)
>>>                response_buf[i] = intel_uncore_read(uncore,
>>> -                                guc_send_reg(guc, i + 1));
>>> -    }
>>> +                                guc_send_reg(guc, i));
>> This could use a note in the commit message to remark that we have no
>> users for the returned data yet and therefore nothing will break if we
>> change what we return through it.
> I hope this will do the work:
>
> "Since some of the new MMIO actions may use DATA0 from MMIO HXG
> response, we must update intel_guc_send_mmio() to copy full response,
> including HXG header. There will be no impact to existing users as all
> of them are only relying just on return code."

Yes it does.

Daniele

>
>> Apart from the nits, the logic looks good to me.
>> Daniele
>>
>>>    -    /* Use data from the GuC response as our return value */
>>> -    ret = INTEL_GUC_MSG_TO_DATA(status);
>>> +        /* Use number of copied dwords as our return value */
>>> +        ret = count;
>>> +    } else {
>>> +        /* Use data from the GuC response as our return value */
>>> +        ret = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
>>> +    }
>>>      out:
>>>        intel_uncore_forcewake_put(uncore, guc->send_regs.fw_domains);

