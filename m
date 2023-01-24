Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE06795E6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FA410E051;
	Tue, 24 Jan 2023 10:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943410E051;
 Tue, 24 Jan 2023 10:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674557978; x=1706093978;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GkcwlpyITj6Vnmb2x04YswOB2c5oPNTjTKKoDdSn6DU=;
 b=nYZalKNXcABcaJZq2SKqFp8icTabnnCVQqX+BEVrj6PPCPTal0KBGpMs
 1ZmHOiyTf+RAa77oDOGyo5A2AmLCtoV3GWIOVUYjIAvpvJ1TOJUpaNJnS
 XdSJWX0q+PpqVm207ygAPsjoXjjb5W3ChaWrlSS25yNKQITJ26Ng+THbv
 wv4qseCjVoeUVmGvFmjR5UweRSZXTvbKGhUlGHzXNYnmju/QHoUprrpaf
 j1V8czJ8wqv1GJQlWNNo23IgcP2n1av7ChwhyMgLlNSxY57iJBz83miYC
 Y8tPHXvxaD0ckSJv1rBvD7NOXJY860qBXvDQw4heKz19/gCK/TP1UUJEv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327527713"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="327527713"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 02:59:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="725427048"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="725427048"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2023 02:59:35 -0800
Received: from [10.249.147.192] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CDC6C37858;
 Tue, 24 Jan 2023 10:59:34 +0000 (GMT)
Message-ID: <bda5fcd9-f003-001a-4822-c269a59595cd@intel.com>
Date: Tue, 24 Jan 2023 11:59:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 1/8] drm/i915/guc: Add GuC oriented print macros
To: John Harrison <john.c.harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-2-michal.wajdeczko@intel.com>
 <a2530bef-9c49-45cd-8849-50ea9f97b0f7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a2530bef-9c49-45cd-8849-50ea9f97b0f7@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.01.2023 00:27, John Harrison wrote:
> On 1/20/2023 08:40, Michal Wajdeczko wrote:
>> While we do have GT oriented print macros, add few more GuC
>> specific to have common look and feel across all messages
>> related to the GuC and to avoid chasing the gt pointer.
>>
>> We will use these macros shortly in upcoming patches.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_print.h | 48 ++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
>> new file mode 100644
>> index 000000000000..e75989d4ba06
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
>> @@ -0,0 +1,48 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __INTEL_GUC_PRINT__
>> +#define __INTEL_GUC_PRINT__
>> +
>> +#include "gt/intel_gt.h"
> This necessary only for the guc_to_gt() accessor? Hmm. Maybe it is worth
> moving that to intel_guc.h? I know Jani for one would like to see all of
> that cleaned up. But maybe that's a follow up patch.

we can't move it easily without creating new intel_guc_types.h file for
all struct definitions, so definitely separate follow up series would be
needed

Michal

> 
> John.
> 
>> +#include "gt/intel_gt_print.h"
>> +
>> +#define guc_printk(_guc, _level, _fmt, ...) \
>> +    gt_##_level(guc_to_gt(_guc), "GUC: " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_err(_guc, _fmt, ...) \
>> +    guc_printk((_guc), err, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_warn(_guc, _fmt, ...) \
>> +    guc_printk((_guc), warn, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_notice(_guc, _fmt, ...) \
>> +    guc_printk((_guc), notice, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_info(_guc, _fmt, ...) \
>> +    guc_printk((_guc), info, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_dbg(_guc, _fmt, ...) \
>> +    guc_printk((_guc), dbg, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_err_ratelimited(_guc, _fmt, ...) \
>> +    guc_printk((_guc), err_ratelimited, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_probe_error(_guc, _fmt, ...) \
>> +    guc_printk((_guc), probe_error, _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_WARN(_guc, _cond, _fmt, ...) \
>> +    gt_WARN(guc_to_gt(_guc), _cond, "GUC: " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_WARN_ONCE(_guc, _cond, _fmt, ...) \
>> +    gt_WARN_ONCE(guc_to_gt(_guc), _cond, "GUC: " _fmt, ##__VA_ARGS__)
>> +
>> +#define guc_WARN_ON(_guc, _cond) \
>> +    gt_WARN(guc_to_gt(_guc), _cond, "%s(%s)", "guc_WARN_ON",
>> __stringify(_cond))
>> +
>> +#define guc_WARN_ON_ONCE(_guc, _cond) \
>> +    gt_WARN_ONCE(guc_to_gt(_guc), _cond, "%s(%s)",
>> "guc_WARN_ON_ONCE", __stringify(_cond))
>> +
>> +#endif /* __INTEL_GUC_PRINT__ */
> 
