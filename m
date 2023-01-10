Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4907663C82
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5E410E56C;
	Tue, 10 Jan 2023 09:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93B210E56C;
 Tue, 10 Jan 2023 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673342176; x=1704878176;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RsauyLfYwdVt0ri5iI9mJ0l26Stq6AzKtTh9InExs3k=;
 b=DqePUr8+Vx6tR4amlRDIlmFKMNMr69l+L21MG/BtIYIw5VwuO3oSnSOU
 3NP884mPEZ/O441mXoWn67q9INIQHDAJEuj9qP16wf5mTMw7Y/SzsBvCb
 AkSRFl1NZ854B1w84LJLCctfEEueOWeLTuwQXGnwDjN4Ilz7aXq2vs6br
 1jAptWuyn540F2ko0RtmpAMTVrsvMOwap88gJfpd6GQP3+ggUzHkwlLsx
 A1vQIXzyHHzP70s+utTe9iPf6s3UPHbQyyuw3TaAGh77bp7zYgmlXwL2q
 wQWuXQfEh663+Yb2qzd34GccGLziWnf3QCNOHyG5+6IloUvHsc5P+/1js g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324342452"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="324342452"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 01:16:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="985706783"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="985706783"
Received: from gregoire-mobl3.amr.corp.intel.com (HELO [10.212.88.71])
 ([10.212.88.71])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 01:16:14 -0800
Message-ID: <6a861c63-39b7-e5e2-b7c5-43cf9b7130f8@linux.intel.com>
Date: Tue, 10 Jan 2023 09:16:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/i915: Do not cover all future platforms in TLB
 invalidation
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
 <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
 <ba227180-066a-8e07-9df6-a9d4e6ec2a05@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ba227180-066a-8e07-9df6-a9d4e6ec2a05@intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/01/2023 08:23, Andrzej Hajda wrote:
> 
> 
> On 09.01.2023 13:24, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Revert to the original explicit approach and document the reasoning
>> behind it.
>>
>> v2:
>>   * DG2 needs to be covered too. (Matt)
>>
>> v3:
>>   * Full version check for Gen12 to avoid catching all future platforms.
>>     (Matt)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 7eeee5a7cb33..5521fa057aab 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct 
>> intel_gt *gt)
>>       unsigned int num = 0;
>>       unsigned long flags;
>> -    if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>> +    /*
>> +     * New platforms should not be added with catch-all-newer (>=)
>> +     * condition so that any later platform added triggers the below 
>> warning
>> +     * and in turn mandates a human cross-check of whether the 
>> invalidation
>> +     * flows have compatible semantics.
>> +     *
>> +     * For instance with the 11.00 -> 12.00 transition three out of five
>> +     * respective engine registers were moved to masked type. Then 
>> after the
>> +     * 12.00 -> 12.50 transition multi cast handling is required too.
>> +     */
>> +
>> +    if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
>> +        GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
>>           regs = NULL;
>>           num = ARRAY_SIZE(xehp_regs);
>> -    } else if (GRAPHICS_VER(i915) == 12) {
>> +    } else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
>> +           GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
> 
> MTL support is lost? IP_VER(12, 70)

AFAIU Matt says MTL is still incomplete anyway, so that would be added 
in an explicit patch here.

> And again it looks for me inconsistent, some unknown platforms are 
> covered, for example 12.54, some not, for example 12.11.

.11 and .54 as hypotheticals? You suggest this instead:

	if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 50) ||
	    GRAPHICS_VER_FULL(i915) == IP_VER(12, 55)) {
		regs = NULL;
		num = ARRAY_SIZE(xehp_regs);
	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
		regs = gen12_regs;
		num = ARRAY_SIZE(gen12_regs);

?

It's fine by me if that covers all currently known platforms.

Regards,

Tvrtko
