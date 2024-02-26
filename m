Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF438672EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F7810F096;
	Mon, 26 Feb 2024 11:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGw+l9fw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7F810F096;
 Mon, 26 Feb 2024 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708946494; x=1740482494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WLaaa9FNkYtE987XLlar4G18RF+/r/Aa+/az8OOyJKk=;
 b=dGw+l9fwN30HIT6SkJk3hjXmMlihdNW/xnTasgo4IobyHYt6q9n9Yx8K
 VIk2d6gcgBdtUxZwYvkrRC/Jv+1v+t655Bz4YWUhUzNp6GfDlopkeKwMH
 FIsAfxLLnqnAdZ5ie9mEyA/i08AHE2L6k/pfnkYfsGeWomuWUW4d85+X8
 uLG8o18a0ch5yF8fm8b551KUeZ9xJXZAplzul3OIdXw/OBgwKMbVRiztW
 5/FDjt7MDiBzmvPFuXUfxlSXbyaF99hbVAZFh0660lll2pP3l64BIxBQN
 QOU9s6LnfHz3peu83xFT/r3ybhuve60Fn2S/btT6nU1HEOuGqIK5S3LNx w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3770100"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3770100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11232552"
Received: from gtobin-mobl.ger.corp.intel.com (HELO [10.252.23.74])
 ([10.252.23.74])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:21:32 -0800
Message-ID: <29a24cb1-233a-45f9-ac0a-0a78ce2dbb9d@intel.com>
Date: Mon, 26 Feb 2024 11:21:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/tests/drm_buddy: fix 32b build
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Maxime Ripard <mripard@redhat.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
 <96bb6e97-34d9-4e4a-b618-85c17e809738@intel.com>
 <5a9e1f30-19fc-486f-b7f5-016d82580d2f@amd.com>
 <4aea62d4-8c2a-4406-b81e-240dca772da4@intel.com>
 <45059d66-6e80-406b-aae2-72f8b8d142cb@amd.com>
 <dc8c7d2b-4c2f-41dd-9812-3699444d5273@intel.com>
 <94afe80c-9e4f-47a7-a758-17ab26eb4c00@intel.com>
 <58e423e8-316e-40e0-b622-136ca6cc0189@intel.com>
 <CAMuHMdUjwXS=Ow+DccWbcee9+vbkdD7dWp5M9FrnC-nFRZcwTw@mail.gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CAMuHMdUjwXS=Ow+DccWbcee9+vbkdD7dWp5M9FrnC-nFRZcwTw@mail.gmail.com>
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

Hi,

On 26/02/2024 10:38, Geert Uytterhoeven wrote:
> Hi Matthew,
> 
> On Mon, Feb 26, 2024 at 10:58 AM Matthew Auld <matthew.auld@intel.com> wrote:
>> On 19/02/2024 12:24, Matthew Auld wrote:
>>> On 19/02/2024 10:48, Matthew Auld wrote:
>>>> On 19/02/2024 10:30, Christian König wrote:
>>>>> Am 19.02.24 um 11:28 schrieb Matthew Auld:
>>>>>> On 19/02/2024 09:53, Christian König wrote:
>>>>>>> Am 19.02.24 um 10:42 schrieb Matthew Auld:
>>>>>>>> On 15/02/2024 17:44, Matthew Auld wrote:
>>>>>>>>> Doesn't seem to compile on 32b, presumably due to u64 mod/division.
>>>>>>>>> Simplest is to just switch over to u32 here. Also make print
>>>>>>>>> modifiers
>>>>>>>>> consistent with that.
>>>>>>>>>
>>>>>>>>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous
>>>>>>>>> test")
>>>>>>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>>> Cc: Maxime Ripard <mripard@redhat.com>
>>>>>>>>
>>>>>>>> Any chance someone can push just this single patch here, since it
>>>>>>>> fixes 32b build? It already has an r-b from Arun.
>>>>>>>
>>>>>>> Already working on this. Just give me a few more minutes.
>>>>>>
>>>>>> Thanks.
>>>>>
>>>>> No, problem. I would have pushed this earlier, but my build server
>>>>> doesn't want to work any more. Looks like the SSD has passed its
>>>>> warranty :(
>>>>>
>>>>> Should I push the other three patches to drm-misc-fixes as well? I
>>>>> currently can't even build test them.
>>>>
>>>> Need to send a v2 for that. One minor change in the test just to be
>>>> consistent with using u32. Thanks.
>>>
>>> Sent v2. If you could push that when you get a chance. Thanks.
>>>
>>> https://patchwork.freedesktop.org/series/130075/
>>
>> Gentle ping on merging v2.
> 
> Your v1 and a fix from Linus already made it upstream:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/gpu/drm/tests?h=v6.8-rc6

Ah, right. I meant v2 for the remaining drm_buddy patches in this series:
https://patchwork.freedesktop.org/series/130075/

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
