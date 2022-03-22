Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6FC4E3B15
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 09:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD9310E52A;
	Tue, 22 Mar 2022 08:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F7E10E52A;
 Tue, 22 Mar 2022 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647938834; x=1679474834;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=je8i5ZAFtkJo2/kNJ6eS3V7UKsT2QZhCJJlsj5KZJuE=;
 b=SsB2OnEcjEcqyd7Fy9uskfP5IPiq6GUbdRioEYGA6y95NUEZjC8+tK53
 WPmGc2h9PgjH4vVot6R6FiOcqcwCRQxfu8LjIx+zddlTNZu8zd1fhquth
 8ZZW9TXeGlY298LzoNum6ehin5Twmx0kjPKNX37kbR8Ysb97FlISB2DhC
 sLyzHLkbQtqiIEJL9ztYiM2YfmBkxlKF7psbcnt7isDy/12uJhdqPY4jQ
 8NLQa99H+MrEUi1+KPrk8E6fKZxyN53Caxsb+kTiaugsXRZJNijjAFMR8
 ljKMsEoICpnhyyO+aH7aux7P6y4hnpdl1jf76whPxraTzEPzLCPVGwdpb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="320964261"
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="320964261"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 01:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,201,1643702400"; d="scan'208";a="646941586"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2022 01:47:11 -0700
Received: from [10.249.136.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.136.231])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 22M8l9oE010088; Tue, 22 Mar 2022 08:47:10 GMT
Message-ID: <715ee64f-3b32-4741-f0b8-3426149b6fb9@intel.com>
Date: Tue, 22 Mar 2022 09:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/7] drm/i915/guc: use the memcpy_from_wc call from the
 drm
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
References: <20220303180013.512219-1-balasubramani.vivekanandan@intel.com>
 <20220303180013.512219-5-balasubramani.vivekanandan@intel.com>
 <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220321211407.ujlokc44jx4kbtvo@ldmartin-desk2>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com,
 intel-gfx@lists.freedesktop.org, casey.g.bowman@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.03.2022 22:14, Lucas De Marchi wrote:
> On Thu, Mar 03, 2022 at 11:30:10PM +0530, Balasubramani Vivekanandan wrote:
>> memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>> by the implementation in drm_cache.c.
>> Updated to use the functions provided by drm_cache.c.
>>
>> v2: Check if the log object allocated from local memory or system memory
>>    and according setup the iosys_map (Lucas)
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Signed-off-by: Balasubramani Vivekanandan
>> <balasubramani.vivekanandan@intel.com>
>> ---
>> drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 15 ++++++++++++---
>> 1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index a24dc6441872..b9db765627ea 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -3,6 +3,7 @@
>>  * Copyright © 2014-2019 Intel Corporation
>>  */
>>
>> +#include <drm/drm_cache.h>
>> #include <linux/debugfs.h>
>> #include <linux/string_helpers.h>
>>
>> @@ -206,6 +207,7 @@ static void guc_read_update_log_buffer(struct
>> intel_guc_log *log)
>>     enum guc_log_buffer_type type;
>>     void *src_data, *dst_data;
>>     bool new_overflow;
>> +    struct iosys_map src_map;
>>
>>     mutex_lock(&log->relay.lock);
>>
>> @@ -282,14 +284,21 @@ static void guc_read_update_log_buffer(struct
>> intel_guc_log *log)
>>         }
>>
>>         /* Just copy the newly written data */
>> +        if (i915_gem_object_is_lmem(log->vma->obj))
>> +            iosys_map_set_vaddr_iomem(&src_map, (void __iomem
>> *)src_data);
>> +        else
>> +            iosys_map_set_vaddr(&src_map, src_data);
> 
> It would be better to keep this outside of the loop. So inside the loop
> we can use only iosys_map_incr(&src_map, buffer_size). However you'd
> also have to handle the read_offset. The iosys_map_ API has both a
> src_offset and dst_offset due to situations like that. Maybe this is
> missing in the new drm_memcpy_* function you're adding?
> 
> This function was not correct wrt to IO memory access with the other
> 2 places in this function doing plain memcpy(). Since we are starting to
> use iosys_map here, we probably should handle this commit as "migrate to
> iosys_map", and convert those. In your current final state
> we have 3 variables aliasing the same memory location. IMO it will be
> error prone to keep it like that
> 
> +Michal, some questions:

@Lucas, better to ask Alan who is making some changes around GuC log

@Alan, can you help answer below questions?

thanks,
Michal

> 
> - I'm not very familiar with the relayfs API. Is the `dst_data +=
> PAGE_SIZE;`
> really correct?
> 
> - Could you double check this patch and ack if ok?
> 
> Heads up that since the log buffer is potentially in lmem, we will need
> to convert this function to take that into account. All those accesses
> to log_buf_state need to use the proper kernel abstraction for system vs
> I/O memory.
> 
> thanks
> Lucas De Marchi
> 
>> +
>>         if (read_offset > write_offset) {
>> -            i915_memcpy_from_wc(dst_data, src_data, write_offset);
>> +            drm_memcpy_from_wc_vaddr(dst_data, &src_map,
>> +                         write_offset);
>>             bytes_to_copy = buffer_size - read_offset;
>>         } else {
>>             bytes_to_copy = write_offset - read_offset;
>>         }
>> -        i915_memcpy_from_wc(dst_data + read_offset,
>> -                    src_data + read_offset, bytes_to_copy);
>> +        iosys_map_incr(&src_map, read_offset);
>> +        drm_memcpy_from_wc_vaddr(dst_data + read_offset, &src_map,
>> +                     bytes_to_copy);
>>
>>         src_data += buffer_size;
>>         dst_data += buffer_size;
>> -- 
>> 2.25.1
>>
