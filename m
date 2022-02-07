Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374334AD32A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC4310E3C6;
	Tue,  8 Feb 2022 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918B010E29C;
 Mon,  7 Feb 2022 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644245384; x=1675781384;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Hn1fek1PpUFCkbNObpOMi0iajsaNYauDx2f7N5NCOak=;
 b=IHLS/VXJ5c3RnYciU6nheVLV2IZpKIVCHQvZZ1dWjVwOoJZH+D62aQec
 T1jHdScsKo73RvxUTyyurHmqo1hTo8PJjmW11F+850JibgWcHxD1Uxac9
 uMfU3ZK392vxqWqLts6g60NXpGjgbG/H+8rrMlY1B8Jp5uGmd8nWIq6C/
 TTaNxExR6V7elh1ij1kK2himr3P5T9EEdTJyJZn6cnAAZUKReFiAMVX4e
 Gb5/Fj/Igc9pGBEZFKH4IEDX5jLggySUFn56c+jJbiLLqKnvZn6YlX3cI
 VOCgSy1NUxlDjMiSFMZkgSTkSO+TVdfK0R+ExKJO1DpPpNU8gv4tpCctb A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="236132905"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="236132905"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 06:49:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="540129840"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.209.116])
 ([10.251.209.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 06:49:42 -0800
Message-ID: <36464392-9691-7e79-fc33-fa7c4485f6f1@linux.intel.com>
Date: Mon, 7 Feb 2022 15:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [RFC 0/2] drm/i915/ttm: Evict and store of compressed
 object
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
 <1a195c03-d2a9-d35e-7b62-a8b70a5c21b3@amd.com>
 <20220207135335.GA15175@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220207135335.GA15175@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the clarification, Ram!

On 07/02/2022 14:53, Ramalingam C wrote:
> On 2022-02-07 at 12:41:59 +0100, Christian König wrote:
>> Am 07.02.22 um 10:37 schrieb Ramalingam C:
>>> On flat-ccs capable platform we need to evict and resore the ccs data
>>> along with the corresponding main memory.
>>>
>>> This ccs data can only be access through BLT engine through a special
>>> cmd ( )
>>>
>>> To support above requirement of flat-ccs enabled i915 platforms this
>>> series adds new param called ccs_pages_needed to the ttm_tt_init(),
>>> to increase the ttm_tt->num_pages of system memory when the obj has the
>>> lmem placement possibility.
>> Well question is why isn't the buffer object allocated with the extra space
>> in the first place?
> Hi Christian,
>
> On Xe-HP and later devices, we use dedicated compression control state (CCS)
> stored in local memory for each surface, to support the 3D and media
> compression formats.
>
> The memory required for the CCS of the entire local memory is 1/256 of the
> local memory size. So before the kernel boot, the required memory is reserved
> for the CCS data and a secure register will be programmed with the CCS base
> address
>
> So when we allocate a object in local memory we dont need to explicitly
> allocate the space for ccs data. But when we evict the obj into the smem
>   to hold the compression related data along with the obj we need smem
>   space of obj_size + (obj_size/256).
>
>   Hence when we create smem for an obj with lmem placement possibility we
>   create with the extra space.
>
>   Ram.
>> Regards,
>> Christian.
>>
>>> This will be on top of the flat-ccs enabling series
>>> https://patchwork.freedesktop.org/series/95686/
>>>
>>> For more about flat-ccs feature please have a look at
>>> https://patchwork.freedesktop.org/patch/471777/?series=95686&rev=5
>>>
>>> Testing of the series is WIP and looking forward for the early review on
>>> the amendment to ttm_tt_init and the approach.
>>>
>>> Ramalingam C (2):
>>>     drm/i915/ttm: Add extra pages for handling ccs data
>>>     drm/i915/migrate: Evict and restore the ccs data
>>>
>>>    drivers/gpu/drm/drm_gem_vram_helper.c      |   2 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  23 +-
>>>    drivers/gpu/drm/i915/gt/intel_migrate.c    | 283 +++++++++++----------
>>>    drivers/gpu/drm/qxl/qxl_ttm.c              |   2 +-
>>>    drivers/gpu/drm/ttm/ttm_agp_backend.c      |   2 +-
>>>    drivers/gpu/drm/ttm/ttm_tt.c               |  12 +-
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
>>>    include/drm/ttm/ttm_tt.h                   |   4 +-
>>>    8 files changed, 191 insertions(+), 139 deletions(-)
>>>
