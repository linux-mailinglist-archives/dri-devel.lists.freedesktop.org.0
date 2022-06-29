Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A6E5605B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FAC10EA00;
	Wed, 29 Jun 2022 16:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C7B10EA00;
 Wed, 29 Jun 2022 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656519772; x=1688055772;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MVm+vlf7U7Q6NUkd2sQEP4K2cGYqOvBsVc6FZW4xPwU=;
 b=M0a0MgvAQRI8GAoPy/etFfyhshHPQb2XQNMK1CmGU6o2+k5wU9uyU4qO
 5c6HQaVvRrmHv0vscyAzqOBmKvPqAgig9q47chNCdc8gzbQvOe/ZP+bm7
 ccuQULViL3UcNC3emCUzXh66a/q+RKm+yedFhMYK9XJNDGkU5XgOrdRze
 aqRIoGnb/WAb77dIEs18OXTt6nRkhbwjCPDor0De98+XjPJCQWoEpdFcu
 MhPYmhkryagdAsly/dZB4TeNFfAFxCqORgJBD1J9e6pNq536drna5T2Kn
 oTCI0/MKcuvAi4fAm5gnNyY0id5eU1g/OO6ptYUHyR61tsX5zPmy806kf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="282810312"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="282810312"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:22:50 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="647466857"
Received: from kjeldbeg-mobl2.ger.corp.intel.com (HELO [10.249.254.56])
 ([10.249.254.56])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 09:22:47 -0700
Message-ID: <fe1fa1cc-3e2f-39b0-ea73-b9123a8b76bd@linux.intel.com>
Date: Wed, 29 Jun 2022 18:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 09/13] drm/i915/selftests: skip the mman tests for
 stolen
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220629121427.353800-1-matthew.auld@intel.com>
 <20220629121427.353800-10-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220629121427.353800-10-matthew.auld@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/22 14:14, Matthew Auld wrote:
> It's not supported, and just skips later anyway. With small-BAR things
> get more complicated since all of stolen is likely not even CPU
> accessible, hence not passing I915_BO_ALLOC_GPU_ONLY just results in the
> object create failing.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

This reminds me,

Is there a problem for fbdev (and hence things like plymouth) if the 
initial fbdev image ends up as a stolen memory object which in turn ends 
up not being mappable? I remember we discussed this before but can't 
recall what the answer was.

Anyway, for this patch

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>





>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 5bc93a1ce3e3..388c85b0f764 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -979,6 +979,9 @@ static int igt_mmap(void *arg)
>   		};
>   		int i;
>   
> +		if (mr->private)
> +			continue;
> +
>   		for (i = 0; i < ARRAY_SIZE(sizes); i++) {
>   			struct drm_i915_gem_object *obj;
>   			int err;
> @@ -1435,6 +1438,9 @@ static int igt_mmap_access(void *arg)
>   		struct drm_i915_gem_object *obj;
>   		int err;
>   
> +		if (mr->private)
> +			continue;
> +
>   		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>   		if (obj == ERR_PTR(-ENODEV))
>   			continue;
> @@ -1580,6 +1586,9 @@ static int igt_mmap_gpu(void *arg)
>   		struct drm_i915_gem_object *obj;
>   		int err;
>   
> +		if (mr->private)
> +			continue;
> +
>   		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>   		if (obj == ERR_PTR(-ENODEV))
>   			continue;
> @@ -1727,6 +1736,9 @@ static int igt_mmap_revoke(void *arg)
>   		struct drm_i915_gem_object *obj;
>   		int err;
>   
> +		if (mr->private)
> +			continue;
> +
>   		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
>   		if (obj == ERR_PTR(-ENODEV))
>   			continue;
