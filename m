Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B3486428
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 13:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF35210E49D;
	Thu,  6 Jan 2022 12:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1FC10E49D;
 Thu,  6 Jan 2022 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641471221; x=1673007221;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vj3fv3q5ags9sOnzRGnsvrg/V9fvvcNCaf9+aUh2DrA=;
 b=UvtAfklKPm53lYpPZjWmiK/8gXHt6pkFPKNXaf8FYQWJ8dPUWA/H2YBX
 wm8wuQUca6NlG1awFJl5WSZ/dp819VIxOoMY1In1KubPWEjH3bAXLRJbj
 a1/NesiluQ7xjGbySoaEZK2KvVA2wWMePGm3P4N1cSbT1wYjsGHhLTO4B
 sb4GIq7hG7ui9Yklq1Bmcwv4Hia2vJ48HPuMyrmDt8erFrXS4tw3OnXxv
 L2u1iAQ6hd3GLg51YJOslkEyKukVCz4VS5lSE8EV06n86GwE0zl9GOOJn
 kKDpf4GJl7U1cUXCjqRhQFecdogAdf0V8vjG/cn0wLCukfpVLeoeuhxlH g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242600424"
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="242600424"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 04:13:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,266,1635231600"; d="scan'208";a="761147185"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO [10.249.65.184])
 ([10.249.65.184])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 04:13:37 -0800
Message-ID: <367d85bb-aa50-d7c5-e219-e5773b7a295d@intel.com>
Date: Thu, 6 Jan 2022 12:13:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 4/6] drm/i915: Use vma resources for async unbinding
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220104125132.35179-1-thomas.hellstrom@linux.intel.com>
 <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220104125132.35179-5-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2022 12:51, Thomas Hellström wrote:
> Implement async (non-blocking) unbinding by not syncing the vma before
> calling unbind on the vma_resource.
> Add the resulting unbind fence to the object's dma_resv from where it is
> picked up by the ttm migration code.
> Ideally these unbind fences should be coalesced with the migration blit
> fence to avoid stalling the migration blit waiting for unbind, as they
> can certainly go on in parallel, but since we don't yet have a
> reasonable data structure to use to coalesce fences and attach the
> resulting fence to a timeline, we defer that for now.
> 
> Note that with async unbinding, even while the unbind waits for the
> preceding bind to complete before unbinding, the vma itself might have been
> destroyed in the process, clearing the vma pages. Therefore we can
> only allow async unbinding if we have a refcounted sg-list and keep a
> refcount on that for the vma resource pages to stay intact until
> binding occurs. If this condition is not met, a request for an async
> unbind is diverted to a sync unbind.
> 
> v2:
> - Use a separate kmem_cache for vma resources for now to isolate their
>    memory allocation and aid debugging.
> - Move the check for vm closed to the actual unbinding thread. Regardless
>    of whether the vm is closed, we need the unbind fence to properly wait
>    for capture.
> - Clear vma_res::vm on unbind and update its documentation.
> v4:
> - Take cache coloring into account when searching for vma resources
>    pending unbind. (Matthew Auld)
> v5:
> - Fix timeout and error check in i915_vma_resource_bind_dep_await().
> - Avoid taking a reference on the object for async binding if
>    async unbind capable.
> - Fix braces around a single-line if statement.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---

<snip>

> +
> +static void
> +i915_vma_resource_color_adjust_range(struct i915_address_space *vm,
> +				     unsigned long *start,
> +				     unsigned long *end)

Make these u64, below also? Just in case this is 32b?

> +{
> +	if (i915_vm_has_cache_coloring(vm)) {
> +		if (start)
> +			start -= I915_GTT_PAGE_SIZE;
> +		end += I915_GTT_PAGE_SIZE;

*start *end :)

> +	}

else {
     WARN_ON_ONCE(vm->color_adjust);
}

?

> +}

