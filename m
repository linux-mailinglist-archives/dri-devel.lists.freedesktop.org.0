Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE8467CB6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 18:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13437A4CE;
	Fri,  3 Dec 2021 17:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5673FD3;
 Fri,  3 Dec 2021 17:39:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="323275781"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="323275781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:39:26 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="678172334"
Received: from ashunt-mobl2.ger.corp.intel.com (HELO [10.252.17.106])
 ([10.252.17.106])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 09:39:24 -0800
Message-ID: <4ae2cef3-553a-d8df-72dc-585a5180d81d@intel.com>
Date: Fri, 3 Dec 2021 17:39:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 4/8] drm/i915/migrate: fix offset calculation
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>
References: <20211203122426.2859679-1-matthew.auld@intel.com>
 <20211203122426.2859679-5-matthew.auld@intel.com>
 <20211203173026.GB27873@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211203173026.GB27873@intel.com>
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
Cc: bob.beckett@collabora.com,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, adrian.larumbe@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/12/2021 17:30, Ramalingam C wrote:
> On 2021-12-03 at 12:24:22 +0000, Matthew Auld wrote:
>> Ensure we add the engine base only after we calculate the qword offset
>> into the PTE window.
> 
> So we didn't hit this issue because we were always using the
> engine->instance 0!?

Yes, AFAIK.

> 
> Looks good to me
> 
> Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Ramalingam C <ramalingam.c@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> index d553b76b1168..cb0bb3b94644 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
>> @@ -284,10 +284,10 @@ static int emit_pte(struct i915_request *rq,
>>   	GEM_BUG_ON(GRAPHICS_VER(rq->engine->i915) < 8);
>>   
>>   	/* Compute the page directory offset for the target address range */
>> -	offset += (u64)rq->engine->instance << 32;
>>   	offset >>= 12;
>>   	offset *= sizeof(u64);
>>   	offset += 2 * CHUNK_SZ;
>> +	offset += (u64)rq->engine->instance << 32;
>>   
>>   	cs = intel_ring_begin(rq, 6);
>>   	if (IS_ERR(cs))
>> -- 
>> 2.31.1
>>
