Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4299E39919A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C363B6EDFE;
	Wed,  2 Jun 2021 17:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0316EDFE;
 Wed,  2 Jun 2021 17:26:26 +0000 (UTC)
IronPort-SDR: LBD+9/qIzTTH2G/IJj2piDU1/1Bn4nwLbcZ9ZWeS9aiQmICqTiXAnnFNh2xFFWhXy3FAERyVQ5
 tAWLwMyUsKtw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="225137803"
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="225137803"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:26:19 -0700
IronPort-SDR: KUFRNQXDD1R05k4vmLhCKg1eragC0zRUVZD2rxPeTkQgQWHfpMSNQcxX9YSHNSxjaYMaczbqbw
 1RJnC2gRHjXQ==
X-IronPort-AV: E=Sophos;i="5.83,242,1616482800"; d="scan'208";a="399811505"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 10:26:18 -0700
Subject: Re: [PATCH v9 07/15] drm: Add a prefetching memcpy_from_wc
To: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210601074654.3103-1-thomas.hellstrom@linux.intel.com>
 <20210601074654.3103-8-thomas.hellstrom@linux.intel.com>
 <87im2xrcqu.fsf@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <1aa312f7-2c02-c92b-7a71-335a6baea796@linux.intel.com>
Date: Wed, 2 Jun 2021 19:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87im2xrcqu.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/1/21 2:27 PM, Jani Nikula wrote:
> On Tue, 01 Jun 2021, Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>> Reading out of write-combining mapped memory is typically very slow
>> since the CPU doesn't prefetch. However some archs have special
>> instructions to do this.
>>
>> So add a best-effort memcpy_from_wc taking dma-buf-map pointer
>> arguments that attempts to use a fast prefetching memcpy and
>> otherwise falls back to ordinary memcopies, taking the iomem tagging
>> into account.
>>
>> The code is largely copied from i915_memcpy_from_wc.
>>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Christian König <christian.koenig@amd.com>
>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Acked-by: Daniel Vetter <daniel@ffwll.ch>
>> ---
>> v7:
>> - Perform a memcpy even if warning with in_interrupt(). Suggested by
>>    Christian König.
>> - Fix compilation failure on !X86 (Reported by kernel test robot
>>    lkp@intel.com)
>> v8:
>> - Skip kerneldoc for drm_memcpy_init_early()
>> - Export drm_memcpy_from_wc() also for non-x86.
>> ---
>>   Documentation/gpu/drm-mm.rst |   2 +-
>>   drivers/gpu/drm/drm_cache.c  | 148 +++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_drv.c    |   2 +
>>   include/drm/drm_cache.h      |   7 ++
>>   4 files changed, 158 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index 21be6deadc12..c66058c5bce7 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -469,7 +469,7 @@ DRM MM Range Allocator Function References
>>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>>      :export:
>>   
>> -DRM Cache Handling
>> +DRM Cache Handling and Fast WC memcpy()
>>   ==================
> The title underline needs to be as long as the title.
>
> BR,
> Jani.

Thanks, Jani.

I think Daniel was trying to point this out to me as well with limited 
success. It's fixed now.

/Thomas


