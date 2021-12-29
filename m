Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E1481204
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 12:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB9710EB31;
	Wed, 29 Dec 2021 11:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDAB10EB31;
 Wed, 29 Dec 2021 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640777363; x=1672313363;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=d9j1A73rhBYI40NPyWAd2Yn2UEy8e8hwGB2o6HNR6sM=;
 b=V4PHEulAWbACBExxhg/XkqlybP6byRyJmqWqD3OaCC7VV7j532shl2cI
 yV6b00DAOWrFvWGM+xCjBBSFYxIkvteM1l4D8/T0XkqDlfgsFSC9XOyRr
 O1j7CcvI45ayLet1vTzyaG8xrVUIfInulkWwwh0gKhpJn/UacW+zJ74AK
 SGNi5BQK3XCNBSV3yApfWCdRIWe7GiDh2s7mNgdgxYA3gSj8D1o/0b/Ro
 EQ7tyafs0GZCe4HjwJmbEPzFIFs8cs+4f6IgXXQWKULp3kelxgzDJVsU3
 hNtLqaPGJOMQ3sN/K9jM5jQTpymGGYEarVLucZPOdML20IJ5ZxdMty9gZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="327836234"
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="327836234"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 03:29:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,245,1635231600"; d="scan'208";a="510495319"
Received: from jcurran1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.44])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2021 03:29:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Increment composite fence seqno
In-Reply-To: <20211214195913.35735-1-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211214195913.35735-1-matthew.brost@intel.com>
Date: Wed, 29 Dec 2021 13:29:17 +0200
Message-ID: <87k0fnk5te.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 14 Dec 2021, Matthew Brost <matthew.brost@intel.com> wrote:
> Increment composite fence seqno on each fence creation.

For future reference, this commit message is not enough. Both the
subject line and the commit message just repeat what I can see from the
code, i.e. *what* is being done, but there is not a hint on the *why*
here.

BR,
Jani.

>
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 2213f7b613da..96cf8361b017 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3113,7 +3113,7 @@ eb_composite_fence_create(struct i915_execbuffer *eb, int out_fence_fd)
>  	fence_array = dma_fence_array_create(eb->num_batches,
>  					     fences,
>  					     eb->context->parallel.fence_context,
> -					     eb->context->parallel.seqno,
> +					     eb->context->parallel.seqno++,
>  					     false);
>  	if (!fence_array) {
>  		kfree(fences);

-- 
Jani Nikula, Intel Open Source Graphics Center
