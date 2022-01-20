Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD351494BB7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BFA10E205;
	Thu, 20 Jan 2022 10:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA20710E205;
 Thu, 20 Jan 2022 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642674651; x=1674210651;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oppbeJLkwcwm/0mBHO2NlCB9IW+11w6O6K2f8KuPxzo=;
 b=b6pnoJ7BUDx7ejKsDQ5NPAsYjJzYQojatd90x0FwftXGaxWbxg4cYoXN
 dYeVFKAuOhFDSMJCv0wViv17cyCT/GHz2o++QJslOJjFh7s7OzjC+kKTR
 3pvnLgM3bKEugA0SD9zCa9JW61oKGO4aM3zVseFlOCwrNbr267cSCXB4q
 ky30XpHSkO94teDqbQvBVaCAg44jt/Xqi12G3dDDkLXq2IoJhAtCOBBlf
 XKG4x/GOydBkHb8g7ApGhyR4M2dUZT0ofiyQ6eK9wYj0tC8TeGXGpmxcQ
 h+FOiy4RdDGlaFXm1/9KqyHktzOoWX734bZN7ZmeHhPoo2UB0mGQrnLDD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="269720447"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="269720447"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:30:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="767555950"
Received: from bmurphy-mobl.ger.corp.intel.com (HELO [10.213.207.182])
 ([10.213.207.182])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:30:49 -0800
Message-ID: <1cac5ccf-c49b-a584-f802-a89cb5d4bfb5@linux.intel.com>
Date: Thu, 20 Jan 2022 10:30:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/7] drm: Document fdinfo format specification
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220106165536.57208-1-tvrtko.ursulin@linux.intel.com>
 <20220106165536.57208-7-tvrtko.ursulin@linux.intel.com>
 <YegpiY3MU15RsEfk@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YegpiY3MU15RsEfk@phenom.ffwll.local>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Healy <cphealy@gmail.com>, David M Nieto <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/01/2022 15:08, Daniel Vetter wrote:
> On Thu, Jan 06, 2022 at 04:55:35PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Proposal to standardise the fdinfo text format as optionally output by DRM
>> drivers.
>>
>> Idea is that a simple but, well defined, spec will enable generic
>> userspace tools to be written while at the same time avoiding a more heavy
>> handed approach of adding a mid-layer to DRM.
>>
>> i915 implements a subset of the spec, everything apart from the memory
>> stats currently, and a matching intel_gpu_top tool exists.
>>
>> Open is to see if AMD can migrate to using the proposed GPU utilisation
>> key-value pairs, or if they are not workable to see whether to go
>> vendor specific, or if a standardised  alternative can be found which is
>> workable for both drivers.
>>
>> Same for the memory utilisation key-value pairs proposal.
>>
>> v2:
>>   * Update for removal of name and pid.
>>
>> v3:
>>   * 'Drm-driver' tag will be obtained from struct drm_driver.name. (Daniel)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: David M Nieto <David.Nieto@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Daniel Stone <daniel@fooishbar.org>
>> Cc: Chris Healy <cphealy@gmail.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
> 
> I'm assuming this ack here and later on is a "amdgpu plans to use this
> too" kind of affair. Especially also in the lights of eventually using
> matching semantics for cgroups and everything else tied to gpu execution
> resource management.
> 
> If not I'm mildly worried that we're creating fake-standard stuff here
> which cannot actually be used by anything resembling driver-agnostic
> userspace.

Hard to say how much adoption there would be.

At least on the statement of that the proposed spec cannot be used for 
driver agnostic userspace, do you have concrete concerns with the spec I 
proposed, or are just going by the lack of continuous engagement by any 
third party?

Apart from AMD, during past postings Daniel Stone also had positive 
feedback (along the lines of "works the driver I am familiar with"). I 
don't know if I have missed someone else who provided feedback, hope not.

There is of course the option of dropping the idea of trying to document 
a common spec, or to do anything cross-driver at this point. AFAIR it 
was your push to try this, and I agreed it would be a good thing if it 
worked out. But given AMD already exposes stuff in fdinfo, I don't think 
it would be a blocker for merging the i915 side even if we decided to 
drop the standardisation effort for now. Given I am maintaining this 
i915 code from ~2018 and there is a lot of interest from users it would 
be good to put it in.

Regards,

Tvrtko
