Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946984E2FE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 15:18:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B09D10E7F0;
	Thu,  8 Feb 2024 14:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dq89AK+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087A210E7D3;
 Thu,  8 Feb 2024 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707401883; x=1738937883;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WZbhxtgwvgzvLOYjWQKruO6g2DeNP6fb5asAJ3G2zbs=;
 b=dq89AK+brdyiVGJrYH08CC8jwVjPa27JYkf3NB3EvnD+ymvIGo9m3qtm
 ox4GYJqRxA48K6vPj42TY/1bXsEw+5cgfH9En/ymE+PtLpKTjZx6e0xMH
 xKkWTVRAi9Y8SMQa26ek6ENZKeeMzMTtnW0UhN8TcuUfgzY3dornzH+nC
 9XZjN/jBiuRMG9YlUZuLl1EHuLUW8aY16KqvoEgbQfiSrt8OaODoF3TUj
 Fu1UQohEze+oV32nfaMu3F21lBUtC9OX67dKcpChl9Yf3RGINam5XugXJ
 qPV4ntHll/g2Z/Wod2fz+H2VK70aiLb4zNs1YwgkEdOKyJEoOGERlSxHr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1366772"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1366772"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6318682"
Received: from pkawa-mobl.ger.corp.intel.com (HELO [10.252.20.188])
 ([10.252.20.188])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 06:17:58 -0800
Message-ID: <5c6fdae4-6fb0-4735-afe6-fe35481929fb@intel.com>
Date: Thu, 8 Feb 2024 14:17:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Content-Language: en-GB
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
 <c5d75c40-7fb4-44a4-8ea5-327385f88004@intel.com>
 <ba6b433d-e672-bcb2-4d25-66b2db50d7b8@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ba6b433d-e672-bcb2-4d25-66b2db50d7b8@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/02/2024 13:47, Arunpravin Paneer Selvam wrote:
> Hi Matthew,
> 
> On 2/8/2024 7:00 PM, Matthew Auld wrote:
>> On 07/02/2024 17:44, Arunpravin Paneer Selvam wrote:
>>> Few users have observed display corruption when they boot
>>> the machine to KDE Plasma or playing games. We have root
>>> caused the problem that whenever alloc_range() couldn't
>>> find the required memory blocks the function was returning
>>> SUCCESS in some of the corner cases.
>>
>> Can you please give an example here?
>>
> In the try hard contiguous allocation, for example the requested memory 
> is 1024 pages,
> it might go and pick the highest and last block (of size 512 pages) in 
> the freelist where
> there are no more space exist in the total address range. In this kind 
> of corner case,
> alloc_range was returning success though the allocated size is less than 
> the requested size.
> Hence in try_hard_contiguous_allocation, we will not proceed to the LHS 
> allocation and
> we return only with the RHS allocation having only the 512 pages of 
> allocation. This
> leads to display corruption in many use cases (I think mainly when 
> requested for contiguous huge buffer)
> mainly on APU platforms.

Ok, I guess other thing is doing:

lhs_offset = drm_buddy_block_offset(block) - lhs_size;

I presume it's possible for block_offset < lhs_size here, which might be 
funny?

> 
> Thanks,
> Arun.
>>>
>>> The right approach would be if the total allocated size
>>> is less than the required size, the function should
>>> return -ENOSPC.
>>>
>>> Gitlab ticket link - 
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index f57e6d74fb0e..c1a99bf4dffd 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>>>       } while (1);
>>>         list_splice_tail(&allocated, blocks);
>>> +
>>> +    if (total_allocated < size) {
>>> +        err = -ENOSPC;
>>> +        goto err_free;
>>> +    }
>>> +
>>>       return 0;
>>>     err_undo:
> 
