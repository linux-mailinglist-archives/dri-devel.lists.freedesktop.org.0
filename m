Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5444BDE1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:35:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384426E123;
	Wed, 10 Nov 2021 09:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ADF6E105;
 Wed, 10 Nov 2021 09:35:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="256326633"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="256326633"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 01:35:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="582594619"
Received: from dkeohane-mobl1.ger.corp.intel.com (HELO [10.213.222.153])
 ([10.213.222.153])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 01:35:44 -0800
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use per device iommu check
To: Lu Baolu <baolu.lu@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <20211109171926.vrb5juvp64mv65b4@ldmartin-desk2>
 <bcb8736d-a46a-a756-e6ca-7872a21b075c@linux.intel.com>
 <de8337fc-09c8-3c9c-1e30-34737afa50a8@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <60635c85-8a0d-51b2-18d1-c4e2eb9e9536@linux.intel.com>
Date: Wed, 10 Nov 2021 09:35:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <de8337fc-09c8-3c9c-1e30-34737afa50a8@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/11/2021 07:25, Lu Baolu wrote:
> On 2021/11/10 1:35, Tvrtko Ursulin wrote:
>>
>> On 09/11/2021 17:19, Lucas De Marchi wrote:
>>> On Tue, Nov 09, 2021 at 12:17:59PM +0000, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> On igfx + dgfx setups, it appears that intel_iommu=igfx_off option only
>>>> disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
>>>> and probe presence of iommu domain per device to accurately reflect its
>>>> status.
>>>
>>> nice, I was just starting to look into thus but for another reason: we
>>> are adding support for other archs, like aarch64, and the global from 
>>> here
>>> was a problem
>>
>> Yes I realized the other iommu angle as well. To do this properly we 
>> need to sort the intel_vtd_active call sites into at least two buckets 
>> - which are truly about VT-d and which are just IOMMU.
>>
>> For instance the THP decision in i915_gemfs.co would be "are we behind 
>> any iommu". Some other call sites are possibly only about the bugs in 
>> the igfx iommu. Not sure if there is a third bucket for any potential 
>> differences between igfx iommu and other Intel iommu in case of dgfx.
>>
>> I'd like to hear from Baolu as well to confirm if intel_iommu driver 
>> is handling igfx + dgfx correctly in respect to the two global 
>> variables I mention in the commit message.
> 
> I strongly agree that the drivers should call the IOMMU interface
> directly for portability. For Intel graphic driver, we have two issues:
> 
> #1) driver asks vt-d driver for identity map with intel_iommu=igfx_off.
> #2) driver query the status with a global intel_iommu_gfx_mapped.
> 
> We need to solve these two problems step by step. This patch is
> definitely a good start point.

(I should have really consolidated the thread, but never mind now.)

You mean good starting point for the discussion or between your first 
and second email you started thinking it may even work?

Because as I wrote in the other email, it appears to work. But I fully 
accept it may be by accident and you may suggest a proper API to be 
added to the IOMMU core, which I would then be happy to use.

If maybe not immediately, perhaps we could start with this patch and 
going forward add something more detailed. Like for instance allowing us 
to query the name/id of the iommu driver in case i915 needs to apply 
different quirks across them? Not sure how feasible that would be, but 
at the moment the need does sound plausible to me.

Regards,

Tvrtko
