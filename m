Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B742395A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 10:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0BB6ED14;
	Wed,  6 Oct 2021 08:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF0D6ED10;
 Wed,  6 Oct 2021 08:03:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="312146832"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="312146832"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:03:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="714700036"
Received: from jpferrer-mobl1.ger.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 01:03:09 -0700
Message-ID: <ef48916b-1385-f178-1b93-e2de4229ce71@linux.intel.com>
Date: Wed, 6 Oct 2021 10:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 4/8] drm/i915: drop unneeded make_unshrinkable in
 free_object
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211005182405.915100-1-matthew.auld@intel.com>
 <20211005182405.915100-4-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211005182405.915100-4-matthew.auld@intel.com>
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


On 10/5/21 20:24, Matthew Auld wrote:
> The comment here is no longer accurate, since the current shrinker code
> requires a full ref before touching any objects. Also unset_pages()
> should already do the required make_unshrinkable() for us, if needed,
> which is also nicely balanced with set_pages().
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 9 ---------
>   1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 76ce6a1500bc..1dc3c1940c32 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -337,15 +337,6 @@ static void i915_gem_free_object(struct drm_gem_object *gem_obj)
>   	 */
>   	atomic_inc(&i915->mm.free_count);
>   
> -	/*
> -	 * This serializes freeing with the shrinker. Since the free
> -	 * is delayed, first by RCU then by the workqueue, we want the
> -	 * shrinker to be able to free pages of unreferenced objects,
> -	 * or else we may oom whilst there are plenty of deferred
> -	 * freed objects.
> -	 */
> -	i915_gem_object_make_unshrinkable(obj);
> -
>   	/*
>   	 * Since we require blocking on struct_mutex to unbind the freed
>   	 * object from the GPU before releasing resources back to the
