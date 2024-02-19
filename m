Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4685A26D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B148210E145;
	Mon, 19 Feb 2024 11:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTAYxurw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27B210E145
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708343367; x=1739879367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=42XZ7hX+wU9FWriVYFFf2JlaTu+LTLTxliJ/DxOsXJg=;
 b=lTAYxurw1DHGf8WCWL4ZxY0/nj8sQjesuuEMengKraNYJpFNuybyzpGL
 +FAmWoPt3Qizk2SaztKl73IoC/X5urISnNPwuj43mcG8kuosOvqQ3CVeO
 iGRvwsGJmp/qCgbZB2M19m3bEgR9/tkxa4snR4yqsVKPFs3KBiAVRtgK6
 +6dU4eHuLzqpE/MgvDP8WyYKBK4He1w4LLUhttFx6HBHbUpzfgxaVYfPn
 iUvA+5ZAOxGNXqIbQiZv7yDAyUfAEHCEd+bolJTVZ/ER8d4KZWiRESAQA
 As60izrah1gXuxsEn1Q02nD2f4rvRRqG2+CJ9jrFSCWPQoKJjaSa0ejdd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2282130"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2282130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9139099"
Received: from proe-mobl.ger.corp.intel.com (HELO [10.252.22.52])
 ([10.252.22.52])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 03:49:23 -0800
Message-ID: <124a084e-9f8e-4b38-a0e3-9dfac0312e97@intel.com>
Date: Mon, 19 Feb 2024 11:49:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests/drm_buddy: avoid 64-bit calculation
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240216202442.2493031-1-arnd@kernel.org>
 <745e156e-c3ec-427f-98ad-bfc7d3cfd846@infradead.org>
 <4cdc5b58-11c1-490d-8c3b-6352d8f1b8cb@amd.com>
 <fbd0426c-fdd2-4b7f-a13e-072ed5f973de@app.fastmail.com>
 <a293460f-6a40-427f-b5d2-2e701d1af229@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <a293460f-6a40-427f-b5d2-2e701d1af229@amd.com>
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

On 19/02/2024 11:41, Christian König wrote:
> Am 19.02.24 um 12:29 schrieb Arnd Bergmann:
>> On Mon, Feb 19, 2024, at 12:22, Christian König wrote:
>>> Am 17.02.24 um 02:31 schrieb Randy Dunlap:
>>>> On 2/16/24 12:24, Arnd Bergmann wrote:
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> The newly added drm_test_buddy_alloc_contiguous() test fails to 
>>>>> link on
>>>>> 32-bit targets because of inadvertent 64-bit calculations:
>>>>>
>>>>> ERROR: modpost: "__aeabi_uldivmod" 
>>>>> [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
>>>>> ERROR: modpost: "__aeabi_ldivmod" 
>>>>> [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
>>>>>
>>>>> >From what I can tell, the numbers cannot possibly overflow a 
>>>>> 32-bit size,
>>>>> so use different types for these.
>>>>>
>>>>> I noticed that the function has another possible flaw in that is mixes
>>>>> what it calls pages with 4KB units. This is a big confusing at best,
>>>>> or possibly broken when built on machines with larger pages.
>>>>>
>>>>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>>> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>>> I've just pushed a similar patch Mathew came up a bit earlier to
>>> drm-misc-fixes.
>>>
>>> Sorry for the noise, I have to catch up on picking up patches for
>>> misc-fixes and misc-next.
>> Ok, thanks.
>>
>> Have you looked at how this code works for larger values of PAGE_SIZE?
>> Is there any need to change other things or will this work with the
>> hardcoded 4KB chunks?
> 
> I haven't looked into the details, but I've pointed out before that 
> using PAGE_SIZE in the buddy or its test cases would be incorrect.
> 
> Background is that the buddy allocator is for devices and those work 
> independent of the CPU PAGE_SIZE. So it can be that on a CPU with 64k 
> pages the buddy still needs to work with 4k.
> 
> Could be that this is work, but could as well be that this is completely 
> broken. Arun and Mathew needs to answer this, I haven't tested it nor 
> reviewed the code.

Yeah, we should not be using PAGE_SIZE or PAGE_SHIFT in drm_buddy.[ch] 
and tests/drm_buddy_test.c. The smallest default page size is SZ_4K for 
drm_buddy. A patch to fix that would be very welcome. If no takers I can 
send something.

> 
> Regards,
> Christian.
> 
>>
>>       Arnd
> 
