Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1EC4A5A2D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA2810E63F;
	Tue,  1 Feb 2022 10:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E5310E886;
 Tue,  1 Feb 2022 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643711979; x=1675247979;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D2TRCxPVKrO+UEeCvNmwgVnvKBfcYCBPqnu9YqwQOM8=;
 b=Tim1K/Vw05ufzqGw66JJcGo9hMF3ewSH5+IBfFyvR5R7GjwSJwQBQNiA
 AZ0W+TqKljLf8icbEXfIbz8r4Dqbar+cDu7GUTeGRAZv0Xa6yFBVv1bKD
 S3F9dTmNloSUZR3i4T/EvX3/hZGB1PvQlNDosTPjanWKYmB1Qdm0ariml
 AYJAFejWOnHjqMm4dEa/FzQbWjuQrM+vKUYwyfIArXslblrnGaxBDdUFh
 WoNGQQMPLdUoP56Emim+5emHmegAUKV7a9aPh/miFhcGCmnr7G+YkCN4o
 bhPTRLanhToF/NfjO27q/M3tGwlUYgxvkT9mQ+N4F4doWpFFtuzGDBgD6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247616892"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="247616892"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:39:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="479637702"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:39:37 -0800
Message-ID: <48562893f4e27caf7413723a8fdc4d92e38301c6.camel@linux.intel.com>
Subject: Re: [PATCH 09/20] drm/i915/buddy: tweak 2big check
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 01 Feb 2022 11:39:35 +0100
In-Reply-To: <20220126152155.3070602-10-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
 <20220126152155.3070602-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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

On Wed, 2022-01-26 at 15:21 +0000, Matthew Auld wrote:
> Otherwise we get -EINVAL, instead of the more useful -E2BIG if the
> allocation doesn't fit within the pfn range, like with mappable lmem.
> The hugepages selftest, for example, needs this to know if a smaller
> size is needed.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index bc725a92fc5c..7c24cc6608e3 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -81,7 +81,7 @@ static int i915_ttm_buddy_man_alloc(struct
> ttm_resource_manager *man,
>                         lpfn = pages;
>         }
>  
> -       if (size > mm->size) {
> +       if (size > lpfn << PAGE_SHIFT) {
>                 err = -E2BIG;
>                 goto err_free_res;
>         }


