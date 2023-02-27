Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530416A3BF2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 09:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6C610E35B;
	Mon, 27 Feb 2023 08:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462210E35B;
 Mon, 27 Feb 2023 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677485252; x=1709021252;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U3Xt04GZAyjq0cRYNKpt5g2RRGxf1W4WCXYH1jVaq74=;
 b=it8PIc93mjwuARTOYOjVOyqXw9sKoDu/5SgWIJUchnPRe7ePdBlu/IUB
 +soRh0shoetUTJ1CWbV4dNks/wPxWFQb8spA2FyO/Azh+esNMUommrwmx
 kA2bSNKBg+25OoR0gXSW6F2HtJCJt4ygosWH4w6r4+KwD7qVjik7tKeXW
 QvH2KsXUlbTZKbUdW7ZCc3/kEJ0k+uriiq1aEIw9bVaz97m1wQoI7XkVK
 m89YNI0DbWj/6o36rxBgOjwdJ8RqHJUBWL9bsaXXeztDEh8Q2D06WrhVj
 uh0ZIGI0c8tANeuG+XQui1CBewNOXrCxem1uBv2MEZGyewLLNIkxmx288 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314230074"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="314230074"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:07:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="703935010"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="703935010"
Received: from flayounx-mobl.ger.corp.intel.com (HELO [10.249.254.249])
 ([10.249.254.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:07:29 -0800
Message-ID: <ec302d85-4b84-fb5e-ff52-2e4183f18b58@linux.intel.com>
Date: Mon, 27 Feb 2023 09:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/1] drm: Add a gpu page-table walker
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
 <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
 <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
 <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CADnq5_Mfp4pCnVcsWn_vMO-hWcMhH_yb8MHccyp_jEL=XxgZNg@mail.gmail.com>
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

Hi,

On 2/23/23 19:50, Alex Deucher wrote:
> On Thu, Feb 23, 2023 at 10:03 AM Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Hi, Daniel,
>>
>> On 2/16/23 21:18, Daniel Vetter wrote:
>>> On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellström wrote:
>>>> A slightly unusual cover letter for a single patch.
>>>>
>>>> The page table walker is currently used by the xe driver only,
>>>> but the code is generic so we can be good citizens and add it to drm
>>>> as a helper, for possible use by other drivers,
>>>> If so we can merge the commit when we merge the xe driver.
>>>>
>>>> The question raised here is
>>>> *) Should it be a generic drm helper or xe-specific with changed
>>>>      prefixes?
>>> I think if there's some other drivers interested in using this, then this
>>> sounds like a good idea. Maybe more useful if it's also integrated into
>>> the vm/vma helpers that are being discussed as an optional part?
>>>
>>> Maybe some good old sales pitching here to convince people would be good.
>>>
>>> Maybe one of the new accel drivers is interested in this too?
>> Thanks for your thoughts on this. Yeah, I think it's a bit awkward to
>> push for having code generic when there is only one user, and the
>> prospect of having other drivers rewrite their page-table building code
>> based on this helper in the near future is probably small. Perhaps more
>> of interest to new drivers. I think what will happen otherwise is that
>> during some future cleanup this will be pushed down to xe claiming it's
>> the only user.
>>
>> I wonder whether it might be an idea to maintain a small document where
>> driver writers can list suggestions for code that could be lifted to
>> core drm and be reused by others. That way both reviewers and writers of
>> other drivers can keep an eye on that document and use it to avoid
>> duplicating code. The procedure would then be to lift it to core drm and
>> fix up prefixes as soon as we have two or more users.
>>
>> Thoughts?
> FWIW, when we originally wrote the GPU scheduler it was part of
> amdgpu, but we consciously kept any AMD-isms out of it so it could be
> lifted up to a core component when another user came along.  Maybe
> some comments in the top of those files to that effect to maintain the
> separation.

Sure. I'll do that. It sounds like we'll keep this in xe for now.

Thanks,

/Thomas


> Alex
>
>
>> Thomas
>>
>>
>>>> *) If a drm helper, should we use a config option?
>>> I am no fan of Kconfig things tbh. Maybe just include it in the vma
>>> helpers, or perhaps we want to do a drm-accel-helpers with gem helpers,
>>> drm/sched, this one here, vm/vma helpers or whatever they will be and so
>>> on? Kinda like we have modeset helpers.
>>>
>>> I'd definitely not go for a Kconfig per individual file, that's just
>>> excessive.
>>> -Daniel
>>>
>>>> For usage examples, see xe_pt.c
>>>> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pt.c
>>>>
>>>> Thanks,
>>>> Thomas
>>>>
>>>> Thomas Hellström (1):
>>>>     drm: Add a gpu page-table walker helper
>>>>
>>>>    drivers/gpu/drm/Makefile      |   1 +
>>>>    drivers/gpu/drm/drm_pt_walk.c | 159 +++++++++++++++++++++++++++++++++
>>>>    include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 321 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>>>>    create mode 100644 include/drm/drm_pt_walk.h
>>>>
>>>> --
>>>> 2.34.1
>>>>
