Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413634E6EBA
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 08:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC0E10EE83;
	Fri, 25 Mar 2022 07:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8540410EE83;
 Fri, 25 Mar 2022 07:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648192677; x=1679728677;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YdbuW0qaCqBN7XkHb50IszHlMPPe1onk78S/3zqyxjI=;
 b=HA9QqTKJdyk3GmtsC4+phKcbrVERQgmWAaM3mZu7/WQrpkr/sOxFbF89
 O+a5unBvPiGU1eJnDDianwxThOtDCxlYGRsDO8sYyy6mBTUh0q1++ou0d
 1LNkFsefQ89sqt7pxTMgSQILAEJzxnA64Asm7Uy0vvV4i5HY4lzIHsLrS
 5CjsnUgeL63DvbESinT5xe8yZ6jwhcDGJIPes9NGXOQmWPCmQWuxcPqnT
 brcNrczCSSfl48kd4i1AXbZprQBBXfqtPCNs7JfjsCUKZ+3sI6RiwnFrY
 aIbc4tVhjcNYhpKQBavK2pX/DBAylKFKAxFdwDa2B61yIfiOzjzW36HyR w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="257400424"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="257400424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 00:17:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="601965362"
Received: from vzinovie-mobl2.ccr.corp.intel.com (HELO [10.249.254.142])
 ([10.249.254.142])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 00:17:55 -0700
Message-ID: <42afeff2-88f3-5900-0daa-92b71b7d9cd3@linux.intel.com>
Date: Fri, 25 Mar 2022 08:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/i915/migrate: move the sanity check
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220324172143.377104-1-matthew.auld@intel.com>
 <20220324172143.377104-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220324172143.377104-2-matthew.auld@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/24/22 18:21, Matthew Auld wrote:
> Move the sanity check that both src and dst are never both system
> memory, which should never happen on discrete, and likely means we have
> a bug. The only exception is on integrated where we trigger this path in
> the selftests.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 20444d6ceb3c..950fd6da146c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -530,6 +530,7 @@ intel_context_migrate_copy(struct intel_context *ce,
>   	int err;
>   
>   	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
> +	GEM_BUG_ON(IS_DGFX(ce->engine->i915) && (!src_is_lmem && !dst_is_lmem));

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




>   	*out = NULL;
>   
>   	GEM_BUG_ON(ce->ring->size < SZ_64K);
> @@ -566,8 +567,6 @@ intel_context_migrate_copy(struct intel_context *ce,
>   		src_offset = 0;
>   		dst_offset = CHUNK_SZ;
>   		if (HAS_64K_PAGES(ce->engine->i915)) {
> -			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
> -
>   			src_offset = 0;
>   			dst_offset = 0;
>   			if (src_is_lmem)
