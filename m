Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D150A3DB05
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E506A10E0F0;
	Thu, 20 Feb 2025 13:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rmb0MH4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3009A10E0F0;
 Thu, 20 Feb 2025 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740057304; x=1771593304;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V2C6WGPAhxJbFbrw5/XQBWG1uEs0zPqr7UgWRoYF8xk=;
 b=Rmb0MH4JePEGU8gADL+OH8bsLuHfB/121FfbIp9Jq7z/a57Rj8vJnc8/
 wwmG39+SiBymdRVeHYoLGuLqoGEh16ryOtl/golRHWlq4zNq85g/lj5KB
 nCvf0r3ShccTFFJeTiXJYSQN5yavOBzCdR3HwCQGxRH1LceR04YIASnuy
 0C4Dh03LQOn0dNGGOOjLFGq/3MM5OmmEDlyKWaJQBMNg69sAVz5BD4lkS
 gc94/31FRzvflGbjTF0NRCBi3oqtRg07WpLIDvYOdiucFnNRUUB0exRz+
 U+losXAuGpBL8EQBq9thGRwIw0u12p33A7fyVXzKWfSGaowLQK74FDL0T w==;
X-CSE-ConnectionGUID: Dh4fped/RS+uKA7H72WDhw==
X-CSE-MsgGUID: G915fK9MSze7jti+qgVeVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="51046542"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="51046542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 05:15:03 -0800
X-CSE-ConnectionGUID: sMivNI6nRv2SqZIXmhnH5Q==
X-CSE-MsgGUID: GYBe42RUSU2uZTZefXE5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="115571790"
Received: from yakiklei-mobl2.ger.corp.intel.com (HELO [10.245.82.75])
 ([10.245.82.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 05:15:00 -0800
Message-ID: <22fedeac-0919-4d33-b4a3-ade7afce8261@linux.intel.com>
Date: Thu, 20 Feb 2025 14:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915: Add VM_DONTEXPAND to exported buffers
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, karol.wachowski@intel.com,
 tomasz.rusinowicz@intel.com, Krzysztof Karas <krzysztof.karas@intel.com>
References: <20250114082303.1319508-1-jacek.lawrynowicz@linux.intel.com>
 <a712ee97-1851-4f6d-97b1-7d1cc136481f@linux.intel.com>
 <173996250609.74092.8072729956400006000@jlahtine-mobl>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173996250609.74092.8072729956400006000@jlahtine-mobl>
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

On 2/19/2025 11:55 AM, Joonas Lahtinen wrote:
> Quoting Jacek Lawrynowicz (2025-02-11 17:57:03)
>> Hi, can I submit this to drm-misc or should someone commit this to drm-intel?
> 
> Is the this happening in linux-next or is it still completely out-of-tree?
The patch is not merged so it is happening everywhere.

> Feels weird that the splat would not have happened in any hybrid GPU
> systems in the past. Did you look what is the difference between your
> driver and amdgpu/nouveau?

It looks like imported buffers are just never mmaped.

This is a call chain when mmapping imported buffer in amdgpu:
drm_gem_mmap()->drm_gem_mmap_obj()->amdgpu_gem_object_mmap()->drm_gem_ttm_mmap()->ttm_bo_mmap_obj()

And this is intel_vpu call chain:
drm_gem_mmap()->drm_gem_mmap_obj()->drm_gem_shmem_object_mmap()->drm_gem_shmem_mmap()->dma_buf_mmap()->i915_gem_dmabuf_mmap()

amdgpu does not check if the object is imported and just calls drm_gem_ttm_mmap() and dma_buf_mmap() is never called.
Same with xe and nouveau. All drivers using drm_gem_shmem seems ok but besides them only couple small drivers check for import_attach in mmap.
Looks like most drivers do not support mmapping imported buffers.
Is this really possible? Do you have test coverage for this?

PS.
you may also want to add VM_PFNMAP, VM_DONTDUMP and VM_IO that you are setting for i915 buffers in i915_gem_object_mmap().

Jacek
