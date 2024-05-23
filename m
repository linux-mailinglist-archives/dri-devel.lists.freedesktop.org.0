Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE158CCC40
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 08:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A99210E143;
	Thu, 23 May 2024 06:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLKAWuht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A1010E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716445764; x=1747981764;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DkeyImkNItoVz6DC0vz60wd++hgIhK2QXUuRObW2C6E=;
 b=aLKAWuhtQLIQkpyAOS1NVL9q+13wWa4pfg0o4A6GfDjH09QT31SUHayi
 fodW4FVV3P0Mgdt5ZHZ6G+JHM1Pzl5y90hrGkpbC4FCLkGUVojkgUkrBq
 /I0V9xFpk8FT+9Jk5562c4yHjRXRHqryjDD9X9Ecb5mUR9h+QoL5RuzaP
 azGfbY1rIHsSLzM7+KWysbUYh193Nn7dWTGQmcTaywHHu3qaZD54dRtt9
 5KHgp8fVcchRCpw4AydVQKnMBauDyJ2oOQHzIeGzCVTkL4W2WJLrnCM+x
 JOxrm9TRBuEkILZANaGGiuKP7dQFKY2B9pIDvffXmiCED0zjddgLdmCzA g==;
X-CSE-ConnectionGUID: YbYjbB1YRjKtd1gXXDZgwg==
X-CSE-MsgGUID: Wlc4wJGZSvOFTzKwKjbwrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12572836"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12572836"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 23:29:22 -0700
X-CSE-ConnectionGUID: uVz5PhSYQIW8DMJzIF/iuA==
X-CSE-MsgGUID: T/AAcBheQuC2pWJkGb6CMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="34021125"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.25.110])
 ([10.246.25.110])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 23:29:20 -0700
Message-ID: <6f32bf37-e239-45f9-a41e-46fef2dc2cca@linux.intel.com>
Date: Thu, 23 May 2024 08:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE,
 MAP_PRIVATE)
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Eric Anholt <eric@anholt.net>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, stable@vger.kernel.org
References: <20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com>
 <ZkyVyLVQn25taxCn@phenom.ffwll.local>
 <CAKMK7uFnOYJED0G2XJk4mf-dAD1VWrpVUvccFGz_g2sZSpTsVA@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAKMK7uFnOYJED0G2XJk4mf-dAD1VWrpVUvccFGz_g2sZSpTsVA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21.05.2024 14:58, Daniel Vetter wrote:
> On Tue, 21 May 2024 at 14:38, Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Mon, May 20, 2024 at 12:05:14PM +0200, Jacek Lawrynowicz wrote:
>>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>>
>>> Lack of check for copy-on-write (COW) mapping in drm_gem_shmem_mmap
>>> allows users to call mmap with PROT_WRITE and MAP_PRIVATE flag
>>> causing a kernel panic due to BUG_ON in vmf_insert_pfn_prot:
>>> BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
>>>
>>> Return -EINVAL early if COW mapping is detected.
>>>
>>> This bug affects all drm drivers using default shmem helpers.
>>> It can be reproduced by this simple example:
>>> void *ptr = mmap(0, size, PROT_WRITE, MAP_PRIVATE, fd, mmap_offset);
>>> ptr[0] = 0;
>>>
>>> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
>>> Cc: Noralf Trønnes <noralf@tronnes.org>
>>> Cc: Eric Anholt <eric@anholt.net>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: <stable@vger.kernel.org> # v5.2+
>>> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>
>> Excellent catch!
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> I reviewed the other helpers, and ttm/vram helpers already block this with
>> the check in ttm_bo_mmap_obj.
>>
>> But the dma helpers does not, because the remap_pfn_range that underlies
>> the various dma_mmap* function (at least on most platforms) allows some
>> limited use of cow. But it makes no sense at all to all that only for
>> gpu buffer objects backed by specific allocators.
>>
>> Would you be up for the 2nd patch that also adds this check to
>> drm_gem_dma_mmap, so that we have a consistent uapi?
>>
>> I'll go ahead and apply this one to drm-misc-fixes meanwhile.
> 
> Forgot to add: A testcase in igt would also be really lovely.
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#validating-changes-with-igt
> -Sima

OK, we will take a look at the test case.
We have no easy way to test dma helpers, so it would be best if someone using them could make a fix.


Regards,
Jacek
