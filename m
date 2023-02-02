Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9B687911
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB49410E4B9;
	Thu,  2 Feb 2023 09:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AEA10E4B8;
 Thu,  2 Feb 2023 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675330773; x=1706866773;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TxVncC8sDWqPcKk/0yaKgffM7cA6YOJZMIuLRp/9FCQ=;
 b=C5lg+1AtOAgaOmJ92XgTQAXVi1oD0TczsuR4uuueM+PRytMfKVaw+nN4
 qGy8GAwlS03Fv62m/7J7NaiZ5m8wCZl1zLMz0UdulWyESm4273eI9laCC
 wQav8aPu6yibDCMdie1J1PHEaH5h/hglZCbIUDSdhT1ovpozH5J4wJV2P
 7fog7METueOV+9TGFH9ZWv1qeAtusn4PpHlDLlLtPjcO2eX/e5Dt139Fu
 YMzPdHAMdEwxU3JSC56S2K5b7On7R39QQdrmN0Jzu7eGlnLNvH4KuxPsg
 tFZt1HLBcfW3iH2RpvaiFT5PGHn0y0YFAC9aZcMkVn/zG5oK+BiSjFndd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312051154"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="312051154"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:39:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658664509"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="658664509"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.4.221])
 ([10.213.4.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:39:28 -0800
Message-ID: <983c9904-e9f7-1aa2-fb8c-738ad47195a7@intel.com>
Date: Thu, 2 Feb 2023 10:39:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Consolidate TLB invalidation flow
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230201165146.4056691-1-tvrtko.ursulin@linux.intel.com>
 <f575e344-e915-c85f-49cd-28fa426bcfd6@intel.com>
 <117482b6-7baf-5b79-27ed-7c33630bd86d@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <117482b6-7baf-5b79-27ed-7c33630bd86d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 02.02.2023 09:33, Tvrtko Ursulin wrote:
> 
> On 02/02/2023 07:43, Andrzej Hajda wrote:
>> On 01.02.2023 17:51, Tvrtko Ursulin wrote:
> 
> [snip]
> 
>
> 
> Btw - do you have any idea why the test is suppressed already?! CI told 
> me BAT was a success...


Except this patch, igt@i915_selftest@live@gt_tlb always succeeds[1][2]. 
So I guess this is just CI logic which do not trust new tests, sounds 
reasonable. Lets wait few days to see if it changes.

[1]: 
http://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=d3cc1f04e52acd0f911cd54fd855a3f085a40e14
[2]: 
https://lore.kernel.org/intel-gfx/?q=igt%40i915_selftest%40live%40gt_tlb


Regards
Andrzej

> 
> Regards,
> 
> Tvrtko

