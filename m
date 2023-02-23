Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F76A0C71
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 16:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4212710EBC6;
	Thu, 23 Feb 2023 15:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117E710E4D0;
 Thu, 23 Feb 2023 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677164597; x=1708700597;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IzuNdPYAVd3+39vyxhYs5eAdwzuC2CS8j1lSuOR6ErM=;
 b=ZawOOFa9aTbmzlDp45qoIrhtCWeznaMM15jiZ2m1xTM6hXQb08IL1l47
 HXiq2hVtfwbGLQxWLynFbH2rD8ODLP3reKh5ZJK1u2yOrrKNU7ouvnRhy
 IdSs2nFujSu+UVCy4UAZvAtQFYkaCmCUXz6UCAy8TwkE/4iFUtnJL4iXK
 wkcoWsbAgGeKY6JC6/gUJx7eg/89m4iJ6neKC1cYQO3+2HhiR0VSqevs2
 qY1Gx0TvZxuLwIY0dZAlM0Qpm8rxwHpH1b030ukPMWRHgBWtL2wy8EL+A
 q7UzXudq9WH0tgT6R0ZdGuY3LAVENUNbaUVga7mSm15po4+M1VB7B5PIe Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="316973119"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="316973119"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 06:38:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="918010962"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="918010962"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.84])
 ([10.249.254.84])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 06:38:21 -0800
Message-ID: <699c33d7-6788-99ab-6787-1cebff0bf70e@linux.intel.com>
Date: Thu, 23 Feb 2023 15:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 0/1] drm: Add a gpu page-table walker
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230216162729.219979-1-thomas.hellstrom@linux.intel.com>
 <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <Y+6PqOdRf+vu8rZc@phenom.ffwll.local>
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
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Daniel,

On 2/16/23 21:18, Daniel Vetter wrote:
> On Thu, Feb 16, 2023 at 05:27:28PM +0100, Thomas Hellström wrote:
>> A slightly unusual cover letter for a single patch.
>>
>> The page table walker is currently used by the xe driver only,
>> but the code is generic so we can be good citizens and add it to drm
>> as a helper, for possible use by other drivers,
>> If so we can merge the commit when we merge the xe driver.
>>
>> The question raised here is
>> *) Should it be a generic drm helper or xe-specific with changed
>>     prefixes?
> I think if there's some other drivers interested in using this, then this
> sounds like a good idea. Maybe more useful if it's also integrated into
> the vm/vma helpers that are being discussed as an optional part?
>
> Maybe some good old sales pitching here to convince people would be good.
>
> Maybe one of the new accel drivers is interested in this too?

Thanks for your thoughts on this. Yeah, I think it's a bit awkward to 
push for having code generic when there is only one user, and the 
prospect of having other drivers rewrite their page-table building code 
based on this helper in the near future is probably small. Perhaps more 
of interest to new drivers. I think what will happen otherwise is that 
during some future cleanup this will be pushed down to xe claiming it's 
the only user.

I wonder whether it might be an idea to maintain a small document where 
driver writers can list suggestions for code that could be lifted to 
core drm and be reused by others. That way both reviewers and writers of 
other drivers can keep an eye on that document and use it to avoid 
duplicating code. The procedure would then be to lift it to core drm and 
fix up prefixes as soon as we have two or more users.

Thoughts?

Thomas


>
>> *) If a drm helper, should we use a config option?
> I am no fan of Kconfig things tbh. Maybe just include it in the vma
> helpers, or perhaps we want to do a drm-accel-helpers with gem helpers,
> drm/sched, this one here, vm/vma helpers or whatever they will be and so
> on? Kinda like we have modeset helpers.
>
> I'd definitely not go for a Kconfig per individual file, that's just
> excessive.
> -Daniel
>
>> For usage examples, see xe_pt.c
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_pt.c
>>
>> Thanks,
>> Thomas
>>
>> Thomas Hellström (1):
>>    drm: Add a gpu page-table walker helper
>>
>>   drivers/gpu/drm/Makefile      |   1 +
>>   drivers/gpu/drm/drm_pt_walk.c | 159 +++++++++++++++++++++++++++++++++
>>   include/drm/drm_pt_walk.h     | 161 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 321 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_pt_walk.c
>>   create mode 100644 include/drm/drm_pt_walk.h
>>
>> -- 
>> 2.34.1
>>
