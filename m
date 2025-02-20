Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB07A3DEE2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED6B10E9A0;
	Thu, 20 Feb 2025 15:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDFsu/09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A131910E99F;
 Thu, 20 Feb 2025 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740066044; x=1771602044;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gNHNt6lCen0DHsSDxtO7RivDVN29tF7Ss1yakXiI1uY=;
 b=WDFsu/09h94KCzfKTB9+ZbMgVWYt/K/Qq8ZkhVo6+RQGf1EEJ6D1ASng
 csqo2M3dUzHqKOJ5N8Vez+l7JE/V/yYrKo7q0ES2KHBmIDHarDJXhRuBN
 is3jB5zwzAknxGtA52G7hHhuZpegfk9jy5oUeCpfP5BJ5Rd+qjVoEiexh
 +pDyI7xkzbG+g7CBplrotf/Is/Ngn9AdfLKQrnuAqrOG1hFVvpNzS7CXd
 Aqvpd2b8TCwteR2LNI6q3y2NHZQtHlyb/nZwptUIf9zeV19vOOMFCPu1/
 bvfdhRUHz30WT8vBv/QODBncJdC9S1+tUDwDkf01DnQDC+rU4SL9smJ4J A==;
X-CSE-ConnectionGUID: rcAuYbDLREadPsyPapzH3A==
X-CSE-MsgGUID: bKD9Hz6XTPC1FNh9Bkt/ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40707254"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="40707254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 07:40:43 -0800
X-CSE-ConnectionGUID: TP2nwyJqRXuniy2pnl1GBw==
X-CSE-MsgGUID: Dwg/kEDoRNG/GnkB9vLY+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="145926313"
Received: from yakiklei-mobl2.ger.corp.intel.com (HELO [10.245.82.75])
 ([10.245.82.75])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 07:40:40 -0800
Message-ID: <880db65b-6d17-4adf-ad88-4a9e077aebc4@linux.intel.com>
Date: Thu, 20 Feb 2025 16:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915: Add VM_DONTEXPAND to exported buffers
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, karol.wachowski@intel.com,
 tomasz.rusinowicz@intel.com, Krzysztof Karas <krzysztof.karas@intel.com>
References: <20250114082303.1319508-1-jacek.lawrynowicz@linux.intel.com>
 <a712ee97-1851-4f6d-97b1-7d1cc136481f@linux.intel.com>
 <173996250609.74092.8072729956400006000@jlahtine-mobl>
 <22fedeac-0919-4d33-b4a3-ade7afce8261@linux.intel.com>
 <15c019f5-a26b-47e5-9ec5-41746e63cae6@ursulin.net>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <15c019f5-a26b-47e5-9ec5-41746e63cae6@ursulin.net>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/20/2025 2:53 PM, Tvrtko Ursulin wrote:
> 
> On 20/02/2025 13:14, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 2/19/2025 11:55 AM, Joonas Lahtinen wrote:
>>> Quoting Jacek Lawrynowicz (2025-02-11 17:57:03)
>>>> Hi, can I submit this to drm-misc or should someone commit this to drm-intel?
>>>
>>> Is the this happening in linux-next or is it still completely out-of-tree?
>> The patch is not merged so it is happening everywhere.
>>
>>> Feels weird that the splat would not have happened in any hybrid GPU
>>> systems in the past. Did you look what is the difference between your
>>> driver and amdgpu/nouveau?
>>
>> It looks like imported buffers are just never mmaped.
>>
>> This is a call chain when mmapping imported buffer in amdgpu:
>> drm_gem_mmap()->drm_gem_mmap_obj()->amdgpu_gem_object_mmap()->drm_gem_ttm_mmap()->ttm_bo_mmap_obj()
>>
>> And this is intel_vpu call chain:
>> drm_gem_mmap()->drm_gem_mmap_obj()->drm_gem_shmem_object_mmap()->drm_gem_shmem_mmap()->dma_buf_mmap()->i915_gem_dmabuf_mmap()
>>
>> amdgpu does not check if the object is imported and just calls drm_gem_ttm_mmap() and dma_buf_mmap() is never called.
>> Same with xe and nouveau. All drivers using drm_gem_shmem seems ok but besides them only couple small drivers check for import_attach in mmap.
>> Looks like most drivers do not support mmapping imported buffers.
>> Is this really possible? Do you have test coverage for this?
> 
> Without going into details here, commenting just on the "mmaping imported buffers" part.
> 
> My understanding is that mmaping imported buffers should not be supported by design. There was some discussion around this in https://lore.kernel.org/dri-devel/bc7f7844-0aa3-4802-b203-69d58e8be2fa@linux.intel.com/ (The thread is for a patch which added this ability to i915.).

If so, these drivers should return an error when mmaping imported buffer instead of happily proceed as if it was an ordinary buffer.
In my opinion, every driver that doesn't check obj->import_attach in drm_gem_object_funcs->mmap has potential for security vulnerability.

Thomas, Simona, shouldn't there be a clear policy regarding this for the all drivers?

Jacek
