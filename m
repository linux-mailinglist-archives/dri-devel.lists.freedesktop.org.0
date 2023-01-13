Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6030F669663
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 13:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D591210E9F9;
	Fri, 13 Jan 2023 12:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0122610E9F8;
 Fri, 13 Jan 2023 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673611678; x=1705147678;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uVLNVffUzNe/VZhePZaGixen1oFIrJWLypcqdqurN4U=;
 b=TtWe4DyWROZtp3hT2z0oKMBCA/g1F/rR1lxEB7pNCEACkk5+a6fp4o7Q
 2THMvN4/5fPvhTWbi7Xh+I9dFeOsMwFoHloPnaa4/BOlDZ29xA8+vRu4m
 zdfrNCPMLXoBKOS6YczpgfKCmxPIjVVmR1HzuARki969MHgt/AiPFHlWA
 kXIbggsv/NQ3l7L5ozF7civXbQuWJLX7poYEzLC/cjnJkbWveJh51SpXX
 6ENGLzb3IMjq/i90d2vT/77B06b7ZFUOKpPNcgaaaw4MLZQUo6PO0WVKV
 eK6nsfU3j1HhReT435LZWuA8h3dc346t5yxd7FE45smWRQskPzq3o3NZU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="304357134"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="304357134"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:07:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="660194805"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="660194805"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.222.27])
 ([10.251.222.27])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:07:55 -0800
Message-ID: <7a8ad9f3-326d-3f84-0671-ce0ee1a732ea@linux.intel.com>
Date: Fri, 13 Jan 2023 13:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on
 error
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-gfx@lists.freedesktop.org
References: <20230113114903.7824-1-nirmoy.das@intel.com>
 <f691df00-a1b3-a6e1-3ed8-cdb4eb7a5a56@intel.com>
 <28a2aa02-b62c-9666-6b1f-11bd33b50c23@linux.intel.com>
 <e2c3f194-8122-5fe1-c6e4-25d8af867f64@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <e2c3f194-8122-5fe1-c6e4-25d8af867f64@intel.com>
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
Cc: chris.p.wilson@linux.intel.com, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/2023 1:05 PM, Matthew Auld wrote:
> On 13/01/2023 12:02, Das, Nirmoy wrote:
>> Thanks Matt, I missed the Fixes tag so resent it with fixes and Cc to 
>> stable.
>
> I don't think kernel selftests are really stable material. AFAIK it's 
> not something normal users care about.


True, in that case please ignore the latest copy of this patch!.


Thanks,

Nirmoy

>
>>
>> On 1/13/2023 12:51 PM, Matthew Auld wrote:
>>> On 13/01/2023 11:49, Nirmoy Das wrote:
>>>> From: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>>
>>>> Make sure that upon error after we have acquired the wakeref we do
>>>> release it again.
>>>>
>>>> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
