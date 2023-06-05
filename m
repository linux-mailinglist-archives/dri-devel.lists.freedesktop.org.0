Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99337221CF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 11:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D0F10E1B0;
	Mon,  5 Jun 2023 09:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E2210E1B0;
 Mon,  5 Jun 2023 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685956587; x=1717492587;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=sbHgEjbWwUMscgS8dmQpbFLrrTHTgj6d/va/vlYdvAs=;
 b=AvYjFJXVlhitjj0Hw7AbwA1PheQNX6pp4tNZZM6pxN1wUR6qViZ8CPic
 zkJYA6Wmbf3XEp1d5vbX+kE/9/+YgZLUtP3grV4M/vWhhOwJYcBnha3l+
 58LD2OTbLCq5LlBxDUXq+bhmTcPLEgMXI/itM/9yVwM78oDnnvWpakNb9
 7RGmuMF6TbacxjvzWDP2WeNDNamyI1SGp0ZH25CYyl4LFRPzRzGkCSlVi
 mtxFs08a+VnEFrDnpu4p8j5HIEbKJ7l5TsxyF4NzsGcOKYZc765z40kSP
 KHO6UhgCANMuDTolhAQ1KvXfGDpL7Pfc/+lQyMF7Jlgv6hQ1Yfst9zpjt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="442698084"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="442698084"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 02:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="738305997"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="738305997"
Received: from mloughma-mobl1.ger.corp.intel.com (HELO [10.213.238.159])
 ([10.213.238.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 02:16:24 -0700
Message-ID: <2bc9cf75-e8b8-5a98-682b-630685bbe839@linux.intel.com>
Date: Mon, 5 Jun 2023 10:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v15 0/1] drm/i915: Allow user to set cache at
 BO creation
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230531171008.1738759-1-fei.yang@intel.com>
 <f7000b2e-e809-3801-48ba-d2a242dcb124@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <f7000b2e-e809-3801-48ba-d2a242dcb124@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/06/2023 09:53, Tvrtko Ursulin wrote:
> 
> On 31/05/2023 18:10, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> This series introduce a new extension for GEM_CREATE,
>> 1. end support for set caching ioctl [PATCH 1/2]
>> 2. add set_pat extension for gem_create [PATCH 2/2]
>>
>> v2: drop one patch that was merged separately
>>      commit 341ad0e8e254 ("drm/i915/mtl: Add PTE encode function")
>> v3: rebased on https://patchwork.freedesktop.org/series/117082/
>> v4: fix missing unlock introduced in v3, and
>>      solve a rebase conflict
>> v5: replace obj->cache_level with pat_set_by_user,
>>      fix i915_cache_level_str() for legacy platforms.
>> v6: rebased on https://patchwork.freedesktop.org/series/117480/
>> v7: rebased on https://patchwork.freedesktop.org/series/117528/
>> v8: dropped the two dependent patches that has been merged
>>      separately. Add IGT link and Tested-by (MESA).
>> v9: addressing comments (Andi)
>> v10: acked-by and tested-by MESA
>> v11: drop "end support for set caching ioctl" (merged)
>>       remove tools/include/uapi/drm/i915_drm.h
>> v12: drop Bspec reference in comment. add to commit message instead
>> v13: sent to test with igt@gem_create@create-ext-set-pat
>> v14: sent to test with igt@gem_create@create-ext-set-pat
>> v15: update commit message with documentation note and t-b/a-b from
>>       Media driver folks.
>>
>> Fei Yang (1):
>>    drm/i915: Allow user to set cache at BO creation
>>
>>   drivers/gpu/drm/i915/gem/i915_gem_create.c | 36 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  6 ++++
>>   include/uapi/drm/i915_drm.h                | 41 ++++++++++++++++++++++
>>   3 files changed, 83 insertions(+)
>>
> 
> Try with:
> 
> Test-with: 20230526172221.1438998-1-fei.yang@intel.com
> 
> That is how it is supposed to be done, to do a CI run against a test 
> case not yet merged that is.

Or I see that IGT has been since merged so you probably have results 
already?

Regards,

Tvrtko
