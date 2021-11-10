Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE3D44BDED
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3439D6E7E6;
	Wed, 10 Nov 2021 09:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285A189BD4;
 Wed, 10 Nov 2021 07:26:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="219822294"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="219822294"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 23:26:02 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="491991308"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.212.217])
 ([10.254.212.217])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 23:26:00 -0800
Message-ID: <de8337fc-09c8-3c9c-1e30-34737afa50a8@linux.intel.com>
Date: Wed, 10 Nov 2021 15:25:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20211109121759.170915-1-tvrtko.ursulin@linux.intel.com>
 <20211109171926.vrb5juvp64mv65b4@ldmartin-desk2>
 <bcb8736d-a46a-a756-e6ca-7872a21b075c@linux.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use per device iommu check
In-Reply-To: <bcb8736d-a46a-a756-e6ca-7872a21b075c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 10 Nov 2021 09:38:52 +0000
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/11/10 1:35, Tvrtko Ursulin wrote:
> 
> On 09/11/2021 17:19, Lucas De Marchi wrote:
>> On Tue, Nov 09, 2021 at 12:17:59PM +0000, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> On igfx + dgfx setups, it appears that intel_iommu=igfx_off option only
>>> disables the igfx iommu. Stop relying on global intel_iommu_gfx_mapped
>>> and probe presence of iommu domain per device to accurately reflect its
>>> status.
>>
>> nice, I was just starting to look into thus but for another reason: we
>> are adding support for other archs, like aarch64, and the global from 
>> here
>> was a problem
> 
> Yes I realized the other iommu angle as well. To do this properly we 
> need to sort the intel_vtd_active call sites into at least two buckets - 
> which are truly about VT-d and which are just IOMMU.
> 
> For instance the THP decision in i915_gemfs.co would be "are we behind 
> any iommu". Some other call sites are possibly only about the bugs in 
> the igfx iommu. Not sure if there is a third bucket for any potential 
> differences between igfx iommu and other Intel iommu in case of dgfx.
> 
> I'd like to hear from Baolu as well to confirm if intel_iommu driver is 
> handling igfx + dgfx correctly in respect to the two global variables I 
> mention in the commit message.

I strongly agree that the drivers should call the IOMMU interface
directly for portability. For Intel graphic driver, we have two issues:

#1) driver asks vt-d driver for identity map with intel_iommu=igfx_off.
#2) driver query the status with a global intel_iommu_gfx_mapped.

We need to solve these two problems step by step. This patch is
definitely a good start point.

Best regards,
baolu
