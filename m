Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B584A81A3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A75C10ECE7;
	Thu,  3 Feb 2022 09:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D4110ECE7;
 Thu,  3 Feb 2022 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643881420; x=1675417420;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6YuJwQfb0u49m8Kr1JiR+WbWMLDPh5jlzK00+lqNnIU=;
 b=QRotgzVaAOWH09Jel1zFzX6EwTq3hq5p7qabb8SKfm1an+B6atOysvrQ
 a1TdOtasQNJ56LY6MNA0AcXkBC/Z5SF87wvJzXhYob5LB4Y8OSueoTBc5
 cKC+IED5ANCBFl+qzQT8goi6g+P3YLDH4vTakuQBgT3azVaPJo3BRlxYA
 ISpTfWq8y/83CeZo/Yj7yZ38q7aGv2iQq1qagz+zbFPmkkfzcUAAG8+YB
 V1UYFtKgaBViYVKChV0skHi+CdrcWjmbPjLpPM/0Oi3UGoxUd/ZqmZNvQ
 ZSth7L2IrqBDJ/SudQ/d84YONQh2P/dw6hecT47Ws4MigLqrCqJzWRcTr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="248061884"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="248061884"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:43:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="620446588"
Received: from cmathias-mobl1.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:43:38 -0800
Message-ID: <5862bea3-7384-2ba3-4fe4-31e5e8fe64c9@linux.intel.com>
Date: Thu, 3 Feb 2022 10:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 18/20] drm/i915/uapi: forbid ALLOC_TOPDOWN for error
 capture
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-19-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220126152155.3070602-19-matthew.auld@intel.com>
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

On 1/26/22 16:21, Matthew Auld wrote:
> On platforms where there might be non-mappable LMEM, force userspace to
> mark the buffers with the correct hint. When dumping the BO contents
> during capture we need CPU access. Note this only applies to buffers
> that can be placed in LMEM, and also doesn't impact DG1.

Oddly enough this seems to break DG1. We probably need to understand why.

/Thomas



>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 498b458fd784..3c8083852620 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1965,7 +1965,7 @@ eb_find_first_request_added(struct i915_execbuffer *eb)
>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>   
>   /* Stage with GFP_KERNEL allocations before we enter the signaling critical path */
> -static void eb_capture_stage(struct i915_execbuffer *eb)
> +static int eb_capture_stage(struct i915_execbuffer *eb)
>   {
>   	const unsigned int count = eb->buffer_count;
>   	unsigned int i = count, j;
> @@ -1978,6 +1978,9 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
>   		if (!(flags & EXEC_OBJECT_CAPTURE))
>   			continue;
>   
> +		if (vma->obj->flags & I915_BO_ALLOC_TOPDOWN)
> +			return -EINVAL;
> +
>   		for_each_batch_create_order(eb, j) {
>   			struct i915_capture_list *capture;
>   
> @@ -1990,6 +1993,8 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
>   			eb->capture_lists[j] = capture;
>   		}
>   	}
> +
> +	return 0;
>   }
>   
>   /* Commit once we're in the critical path */
> @@ -3418,7 +3423,9 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   	}
>   
>   	ww_acquire_done(&eb.ww.ctx);
> -	eb_capture_stage(&eb);
> +	err = eb_capture_stage(&eb);
> +	if (err)
> +		goto err_vma;
>   
>   	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
>   	if (IS_ERR(out_fence)) {
