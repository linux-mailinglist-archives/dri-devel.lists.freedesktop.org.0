Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B3D3A50C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 11:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A1810E2A4;
	Mon, 19 Jan 2026 10:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkdMUjYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039E110E08F;
 Mon, 19 Jan 2026 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768818673; x=1800354673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yx5xKLfKMFBT595CHRCKFxrAsGme5jm7v4kRVJY3QM8=;
 b=JkdMUjYN7/3CT5d7uHWx82xaf/mB/ZO189nke/nFxF3mKalTTsKp8F27
 9QK92rtVUOYUd/tC8ScvtqOQdg5e21CbvSC+1LWXkOl+0mf6htg8qyVyk
 p3edzZPdug5aWfP5jvk5ytt1gVYY+cbQgv04wJSAbaDGflvtsIoEQRuhF
 tgqVUS4xscxaWSRu0LavKKZ6JlI1KCr5NwhItW1k9d7adnTxIRV75AWre
 UBtFT/+e7NXWU8ZESrFbxiq7GIqb49XQ4tY9fZb+0EEmCp5bBIeXOhgaF
 a0gpGMzef1iBHOZCU7PFE4FoUaOM+vVidHHLhDdRqyq5NXSp6SXIvI8/6 w==;
X-CSE-ConnectionGUID: Qa+lOoWhSP+PHlcYjlIPiA==
X-CSE-MsgGUID: YdgJHWH8QO2XX5HFt/18Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87609784"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="87609784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:31:12 -0800
X-CSE-ConnectionGUID: R9FFOm8cSnKFmJhb6ZPO4g==
X-CSE-MsgGUID: u1sG5ectS3Whw8cbP0IlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="209972195"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.22])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 02:31:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: Prevent userspace mapping
 invalidation
Date: Mon, 19 Jan 2026 11:31:06 +0100
Message-ID: <3333011.vfdyTQepKt@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
References: <5biajlwhi3oaep72si2dj2lhp2xwrpfa2gxqc2l36464uishjo@g26isdq64nv2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Krzysztof,

On Monday, 19 January 2026 11:16:02 CET Krzysztof Karas wrote:
> IGT mmap testing in i915 uses current task's address space to
> allocate new userspace mapping, without registering real user
> for that address space in mm_struct.
> 
> It was observed that mm->mm_users would occasionally drop to 0
> during tests, which reaped userspace mappings, further leading
> to failures upon reading from userland memory.
> 
> Prevent this by artificially increasing mm_users counter for the
> duration of the test.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14204
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> During testing I also found out that this problem affects
> another function, __igt_mmap(), which also utilizes userspace
> VMAs.
> 
> v2:
>  * use mmget/mmput() (Jani);
>  * include __igt_mmap() in the scope;
>  * change comments and commit message;
> 
>  .../drm/i915/gem/selftests/i915_gem_mman.c    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 0d250d57496a..82ab090f66c8 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -916,6 +916,13 @@ static int __igt_mmap(struct drm_i915_private *i915,
>  	if (err)
>  		return err;
>  
> +	/*
> +	 * Get a reference to tasks's mm_struct to artificially increase mm_users
> +	 * and ensure the kernel does not try to clean up the userspace mappings
> +	 * of the current task during the test.
> +	 */
> +	mmget_not_zero(current->mm);

What happens if that fails?

Thanks,
Janusz

> +
>  	addr = igt_mmap_offset(i915, offset, obj->base.size, PROT_WRITE, MAP_SHARED);
>  	if (IS_ERR_VALUE(addr))
>  		return addr;
> @@ -968,6 +975,11 @@ static int __igt_mmap(struct drm_i915_private *i915,
>  		err = gtt_check(obj);
>  out_unmap:
>  	vm_munmap(addr, obj->base.size);
> +	/*
> +	 * mmput() is not supposed to be called on task's own
> +	 * mm_struct, so let kernel handle that.
> +	 */
> +	mmput_async(current->mm);
>  	return err;
>  }
>  
> @@ -1177,6 +1189,13 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
>  	if (err)
>  		goto out_put;
>  
> +	/*
> +	 * Get a reference to tasks's mm_struct to artificially increase mm_users
> +	 * and ensure the kernel does not try to clean up the userspace mappings
> +	 * of the current task during the test.
> +	 */
> +	mmget_not_zero(current->mm);
> +
>  	/*
>  	 * This will eventually create a GEM context, due to opening dummy drm
>  	 * file, which needs a tiny amount of mappable device memory for the top
> @@ -1293,6 +1312,11 @@ static int __igt_mmap_migrate(struct intel_memory_region **placements,
>  
>  out_addr:
>  	vm_munmap(addr, obj->base.size);
> +	/*
> +	 * mmput() is not supposed to be called on task's own
> +	 * mm_struct, so let kernel handle that.
> +	 */
> +	mmput_async(current->mm);
>  
>  out_put:
>  	i915_gem_object_put(obj);
> 




