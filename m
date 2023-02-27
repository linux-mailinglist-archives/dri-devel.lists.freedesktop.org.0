Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38116A3BFF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 09:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A6310E363;
	Mon, 27 Feb 2023 08:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AD910E363;
 Mon, 27 Feb 2023 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677485367; x=1709021367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CwfXZX7kRRG1Gb3366jovp39DvEVWYCg8+THMsSxupU=;
 b=cCjerYbnD1kBw3uFpJDdYJLRdTo/DKgKp9GFPLNxIWvF4iMnH9ZITzWO
 H6qEV2zKJPIxKoeOYlzJjExsvvOAZWQzJi3rkb5VbR/40x9ljgc6UbwJc
 f9XFJO2MNBVjGPBM9r9pNcCfRn+sHoQFkOVgz8gYmOpoUIvLWqu1JGC3O
 tcrixyi1QagTNOt+1zYtkMzHHBGckDuwNvP+QtkW0+uu1zKn3PMka8XKv
 jG9mU9ClZ/81psGyE1bghKRCrHEvmqHrsIiAgsOytVHBcexvgVdBifooA
 crBC4XCURvcM7KjWw9FV6hWO1V1+hR6MfNEkhEzlJtr1qINYULQq6/1i7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314230403"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="314230403"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:09:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="703936152"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="703936152"
Received: from flayounx-mobl.ger.corp.intel.com (HELO [10.249.254.249])
 ([10.249.254.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:09:15 -0800
Message-ID: <42b04315-182d-227d-b2a8-cc09bcbe3ac3@linux.intel.com>
Date: Mon, 27 Feb 2023 09:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/1] drm: Add a gpu page-table walker
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
 <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
 <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
 <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
 <CAFCwf12vw56v64Pa=5VhAiVBf=Km9_sOWxOczSFNvLi0eL_VeQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAFCwf12vw56v64Pa=5VhAiVBf=Km9_sOWxOczSFNvLi0eL_VeQ@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Oded.

On 2/26/23 19:56, Oded Gabbay wrote:
> On Thu, Feb 23, 2023 at 8:50 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Thu, Feb 23, 2023 at 10:03 AM Thomas Hellström
>> <thomas.hellstrom@linux.intel.com> wrote:
>>> Hi, Daniel,
>>>
>>> On 2/16/23 21:18, Daniel Vetter wrote:
>>>> On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellström wrote:
>>>>> A slightly unusual cover letter for a single patch.
>>>>>
>>>>> The page table walker is currently used by the xe driver only,
>>>>> but the code is generic so we can be good citizens and add it to drm
>>>>> as a helper, for possible use by other drivers,
>>>>> If so we can merge the commit when we merge the xe driver.
>>>>>
>>>>> The question raised here is
>>>>> *) Should it be a generic drm helper or xe-specific with changed
>>>>>      prefixes?
>>>> I think if there's some other drivers interested in using this, then this
>>>> sounds like a good idea. Maybe more useful if it's also integrated into
>>>> the vm/vma helpers that are being discussed as an optional part?
>>>>
>>>> Maybe some good old sales pitching here to convince people would be good.
>>>>
>>>> Maybe one of the new accel drivers is interested in this too?
> Hi,
> As the habanalabs driver is not really a new driver, I currently don't
> see the benefit of moving
> to this code. Our pgt code is quite mature and was tested extensively
> in deployment in the
> past couple of years.
>
> Nevertheless, I'll try to offer this code for any new/future driver
> that will want to join accel.
>
> Stanislaw, I'm adding you here in case you missed this. Might be of an
> interest to you.


Thanks for taking a look. Yes, as also mentioned to Alex, I think we'll 
keep this in xe for now.

/Thomas

>
> Thanks,
> Oded
>
> - Oded
>
>
>
>>> Thanks for your thoughts on this. Yeah, I think it's a bit awkward to
>>> push for having code generic when there is only one user, and the
>>> prospect of having other drivers rewrite their page-table building code
>>> based on this helper in the near future is probably small. Perhaps more
>>> of interest to new drivers. I think what will happen otherwise is that
>>> during some future cleanup this will be pushed down to xe claiming it's
>>> the only user.
>>>
>>> I wonder whether it might be an idea to maintain a small document where
>>> driver writers can list suggestions for code that could be lifted to
>>> core drm and be reused by others. That way both reviewers and writers of
>>> other drivers can keep an eye on that document and use it to avoid
>>> duplicating code. The procedure would then be to lift it to core drm and
>>> fix up prefixes as soon as we have two or more users.
>>>
>>> Thoughts?
>> FWIW, when we originally wrote the GPU scheduler it was part of
>> amdgpu, but we consciously kept any AMD-isms out of it so it could be
>> lifted up to a core component when another user came along.  Maybe
>> some comments in the top of those files to that effect to maintain the
>> separation.
>>
>> Alex
>>
>>
>>> Thomas
>>>
>>>
>>>>> *) If a drm helper, should we use a config option?
>>>> I am no fan of Kconfig things tbh. Maybe just include it in the vma
>>>> helpers, or perhaps we want to do a drm-accel-helpers with gem helpers,
>>>> drm/sched, this one here, vm/vma helpers or whatever they will be and so
>>>> on? Kinda like we have modeset helpers.
>>>>
>>>> I'd definitely not go for a Kconfig per individual file, that's just
>>>> excessive.
>>>> -Daniel
>>>>
>>>>> For usage examples, see xe_pt.c
>>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pt.c
>>>>>
>>>>> Thanks,
>>>>> Thomas
>>>>>
>>>>> Thomas Hellström (1):
>>>>>     drm: Add a gpu page-table walker helper
>>>>>
>>>>>    drivers/gpu/drm/Makefile      |   1 +
>>>>>    drivers/gpu/drm/drm_pt_walk.c | 159 +++++++++++++++++++++++++++++++++
>>>>>    include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++++
>>>>>    3 files changed, 321 insertions(+)
>>>>>    create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>>>>>    create mode 100644 include/drm/drm_pt_walk.h
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
