Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185339F082
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87306EB28;
	Tue,  8 Jun 2021 08:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B72A6EB25;
 Tue,  8 Jun 2021 08:15:14 +0000 (UTC)
IronPort-SDR: 733vAqdRG3jwnyWgHmShYqpMikt87tPv7i2RxfgpnyDBCGi7MVpFrAIiUM5TCbAK3DO4hJ95PJ
 MBj/NKb7LoSw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268650797"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268650797"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:15:11 -0700
IronPort-SDR: chfDvQ60JzmVn1CvdS4STHxboJJd2sjysY2DZUIJ5/Qb8BURxcsUBL026Bls/Sj2bIF5V7/Co5
 5BbyePA0TcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="552197397"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2021 01:15:08 -0700
Received: from [10.249.139.189] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.189])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 1588F6LV010910; Tue, 8 Jun 2021 09:15:06 +0100
Subject: Re: [PATCH 02/13] drm/i915/guc: Update MMIO based communication
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-3-matthew.brost@intel.com>
 <707a404a-c20b-39e6-af85-7ab93e9d3c5e@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <5dc6918e-d9ae-f435-c33f-2d6ab370224e@intel.com>
Date: Tue, 8 Jun 2021 10:15:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <707a404a-c20b-39e6-af85-7ab93e9d3c5e@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08.06.2021 01:06, Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/7/2021 11:03 AM, Matthew Brost wrote:
>> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>
>> The MMIO based Host-to-GuC communication protocol has been
>> updated to use unified HXG messages.
>>
>> Update our intel_guc_send_mmio() function by correctly handle
>> BUSY, RETRY and FAILURE replies. Also update our documentation.
>>
>> GuC: 55.0.0
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Michal Winiarski <michal.winiarski@intel.com> #v3
>> ---
>>   .../gt/uc/abi/guc_communication_mmio_abi.h    | 63 ++++++-------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 92 ++++++++++++++-----
>>   2 files changed, 97 insertions(+), 58 deletions(-)
>>
>> diff --git
>> a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
>> b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
>> index be066a62e9e0..3f9039e3ef9d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
>> @@ -7,46 +7,43 @@
>>   #define _ABI_GUC_COMMUNICATION_MMIO_ABI_H
>>     /**
>> - * DOC: MMIO based communication
>> + * DOC: GuC MMIO based communication
>>    *
>> - * The MMIO based communication between Host and GuC uses software
>> scratch
>> - * registers, where first register holds data treated as message header,
>> - * and other registers are used to hold message payload.
>> + * The MMIO based communication between Host and GuC relies on special
>> + * hardware registers which format could be defined by the software
>> + * (so called scratch registers).
>>    *
>> - * For Gen9+, GuC uses software scratch registers 0xC180-0xC1B8,
>> - * but no H2G command takes more than 8 parameters and the GuC FW
>> - * itself uses an 8-element array to store the H2G message.
>> - *
>> - *      +-----------+---------+---------+---------+
>> - *      |  MMIO[0]  | MMIO[1] |   ...   | MMIO[n] |
>> - *      +-----------+---------+---------+---------+
>> - *      | header    |      optional payload       |
>> - *      +======+====+=========+=========+=========+
>> - *      | 31:28|type|         |         |         |
>> - *      +------+----+         |         |         |
>> - *      | 27:16|data|         |         |         |
>> - *      +------+----+         |         |         |
>> - *      |  15:0|code|         |         |         |
>> - *      +------+----+---------+---------+---------+
>> - *
>> - * The message header consists of:
>> - *
>> - * - **type**, indicates message type
>> - * - **code**, indicates message code, is specific for **type**
>> - * - **data**, indicates message data, optional, depends on **code**
>> + * Each MMIO based message, both Host to GuC (H2G) and GuC to Host (G2H)
>> + * messages, which maximum length depends on number of available scratch
>> + * registers, is directly written into those scratch registers.
>>    *
>> - * The following message **types** are supported:
>> + * For Gen9+, there are 16 software scratch registers 0xC180-0xC1B8,
>> + * but no H2G command takes more than 8 parameters and the GuC firmware
>> + * itself uses an 8-element array to store the H2G message.
> 
> Is this statement still true? I believe no MMIO H2G is over 4 DWs (given
> the limitation of the new gen11+ scratch regs), while CTB messages can
> be longer than 8 DWs.

oops, it was just copy/past, you're correct, with new unified firmware,
all MMIO H2G are up to 4 DWs

> 
>>    *
>> - * - **REQUEST**, indicates Host-to-GuC request, requested GuC action
>> code
>> - *   must be priovided in **code** field. Optional action specific
>> parameters
>> - *   can be provided in remaining payload registers or **data** field.
>> + * For Gen11+, there are additional 4 registers 0x190240-0x19024C, which
>> + * are, regardless on lower count, preffered over legacy ones.
> 
> typo: preffered -> preferred
> 
>>    *
>> - * - **RESPONSE**, indicates GuC-to-Host response from earlier GuC
>> request,
>> - *   action response status will be provided in **code** field. Optional
>> - *   response data can be returned in remaining payload registers or
>> **data**
>> - *   field.
>> + * The MMIO based communication is mainly used during driver
>> initialization
>> + * phase to setup the `CTB based communication`_ that will be used
>> afterwards.
>>    */
>>     #define GUC_MAX_MMIO_MSG_LEN        8
> 
> See comment above. Reduce this to 4?

yes, must be reduced

> 
>>   +/**
>> + * DOC: MMIO HXG Message
>> + *
>> + * Format of the MMIO messages follows definitions of `HXG Message`_.
>> + *
>> + * 
>> +---+-------+--------------------------------------------------------------+
>>
>> + *  |   | Bits  |
>> Description                                                  |
>> + * 
>> +===+=======+==============================================================+
>>
>> + *  | 0 |  31:0 | 
>> +--------------------------------------------------------+  |
>> + *  +---+-------+ 
>> |                                                        |  |
>> + *  |...|       |  |  Embedded `HXG
>> Message`_                               |  |
>> + *  +---+-------+ 
>> |                                                        |  |
>> + *  | n |  31:0 | 
>> +--------------------------------------------------------+  |
>> + * 
>> +---+-------+--------------------------------------------------------------+
>>
>> + */
>> +
>>   #endif /* _ABI_GUC_COMMUNICATION_MMIO_ABI_H */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index f147cb389a20..b773567cb080 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -376,29 +376,27 @@ void intel_guc_fini(struct intel_guc *guc)
>>   /*
>>    * This function implements the MMIO based host to GuC interface.
>>    */
>> -int intel_guc_send_mmio(struct intel_guc *guc, const u32 *action, u32
>> len,
>> +int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request,
>> u32 len,
>>               u32 *response_buf, u32 response_buf_size)
>>   {
>> +    struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>       struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
>> -    u32 status;
>> +    u32 header;
>>       int i;
>>       int ret;
>>         GEM_BUG_ON(!len);
>>       GEM_BUG_ON(len > guc->send_regs.count);
>>   -    /* We expect only action code */
>> -    GEM_BUG_ON(*action & ~INTEL_GUC_MSG_CODE_MASK);
>> -
>> -    /* If CT is available, we expect to use MMIO only during
>> init/fini */
>> -    GEM_BUG_ON(*action !=
>> INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER &&
>> -           *action !=
>> INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER);
>> +    GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
>> GUC_HXG_ORIGIN_HOST);
>> +    GEM_BUG_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
>> GUC_HXG_TYPE_REQUEST);
>>         mutex_lock(&guc->send_mutex);
>>       intel_uncore_forcewake_get(uncore, guc->send_regs.fw_domains);
>>   +retry:
>>       for (i = 0; i < len; i++)
>> -        intel_uncore_write(uncore, guc_send_reg(guc, i), action[i]);
>> +        intel_uncore_write(uncore, guc_send_reg(guc, i), request[i]);
>>         intel_uncore_posting_read(uncore, guc_send_reg(guc, i - 1));
>>   @@ -410,30 +408,74 @@ int intel_guc_send_mmio(struct intel_guc *guc,
>> const u32 *action, u32 len,
>>        */
>>       ret = __intel_wait_for_register_fw(uncore,
>>                          guc_send_reg(guc, 0),
>> -                       INTEL_GUC_MSG_TYPE_MASK,
>> -                       INTEL_GUC_MSG_TYPE_RESPONSE <<
>> -                       INTEL_GUC_MSG_TYPE_SHIFT,
>> -                       10, 10, &status);
>> -    /* If GuC explicitly returned an error, convert it to -EIO */
>> -    if (!ret && !INTEL_GUC_MSG_IS_RESPONSE_SUCCESS(status))
>> -        ret = -EIO;
>> +                       GUC_HXG_MSG_0_ORIGIN,
>> +                       FIELD_PREP(GUC_HXG_MSG_0_ORIGIN,
>> +                              GUC_HXG_ORIGIN_GUC),
>> +                       10, 10, &header);
>> +    if (unlikely(ret)) {
>> +timeout:
>> +        drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
>> +            request[0], header);
>> +        goto out;
>> +    }
>>   -    if (ret) {
>> -        DRM_ERROR("MMIO: GuC action %#x failed with error %d %#x\n",
>> -              action[0], ret, status);
>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>> GUC_HXG_TYPE_NO_RESPONSE_BUSY) {
>> +#define done ({ header = intel_uncore_read(uncore, guc_send_reg(guc,
>> 0)); \
>> +        FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) != GUC_HXG_ORIGIN_GUC
>> || \
>> +        FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>> GUC_HXG_TYPE_NO_RESPONSE_BUSY; })
>> +
>> +        ret = wait_for(done, 1000);
>> +        if (unlikely(ret))
>> +            goto timeout;
>> +        if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
>> +                       GUC_HXG_ORIGIN_GUC))
>> +            goto proto;
>> +#undef done
>> +    }
>> +
>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>> GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>> +        u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>> +
>> +        drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
>> +            request[0], reason);
>> +        goto retry;
>> +    }
>> +
>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) ==
>> GUC_HXG_TYPE_RESPONSE_FAILURE) {
>> +        u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
>> +        u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
>> +
>> +        drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
>> +            request[0], error, hint);
>> +        ret = -ENXIO;
>> +        goto out;
>> +    }
>> +
>> +    if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>> GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>> +proto:
>> +        drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
>> +            request[0], header);
>> +        ret = -EPROTO;
>>           goto out;
>>       }
>>         if (response_buf) {
>> -        int count = min(response_buf_size, guc->send_regs.count - 1);
>> +        int count = min(response_buf_size, guc->send_regs.count);
>>   -        for (i = 0; i < count; i++)
>> +        GEM_BUG_ON(!count);
>> +
>> +        response_buf[0] = header;
>> +
>> +        for (i = 1; i < count; i++)
>>               response_buf[i] = intel_uncore_read(uncore,
>> -                                guc_send_reg(guc, i + 1));
>> -    }
>> +                                guc_send_reg(guc, i));
> 
> This could use a note in the commit message to remark that we have no
> users for the returned data yet and therefore nothing will break if we
> change what we return through it.

I hope this will do the work:

"Since some of the new MMIO actions may use DATA0 from MMIO HXG
response, we must update intel_guc_send_mmio() to copy full response,
including HXG header. There will be no impact to existing users as all
of them are only relying just on return code."

> 
> Apart from the nits, the logic looks good to me.
> Daniele
> 
>>   -    /* Use data from the GuC response as our return value */
>> -    ret = INTEL_GUC_MSG_TO_DATA(status);
>> +        /* Use number of copied dwords as our return value */
>> +        ret = count;
>> +    } else {
>> +        /* Use data from the GuC response as our return value */
>> +        ret = FIELD_GET(GUC_HXG_RESPONSE_MSG_0_DATA0, header);
>> +    }
>>     out:
>>       intel_uncore_forcewake_put(uncore, guc->send_regs.fw_domains);
> 
