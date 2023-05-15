Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84A7029B5
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 11:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F0610E19D;
	Mon, 15 May 2023 09:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE00B10E193;
 Mon, 15 May 2023 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684144643; x=1715680643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UIThM3bnFCWOJ8aoiXG5s9R02dYGKvVgOBWKagbupBM=;
 b=kiRsBUBSqyZw+ZKmErr+ma/+2hAObFn8Hxlj0whLbK7dVVQq8uWCYhtI
 TOOUagudf/F3ZsT0SOtX93rykiag6XLdIRKVZC4u4/qdhpf0/F17PRcIb
 kZCkrJ2mPgumTAMO668pE8m8CU/0p5pxiv3ClEwcmdDDEUTC0qLSKYGu4
 n3qOgg8FSt6aeTJP9bw/nwDykOyMeuYQlUdgupVMHVh1aleNLBZySz8Ol
 069thXTzmykXX8ucP0IUM3CfdRsq7pUiU+1ai2KeHui5cdydj6EDnE3ij
 h5Cj5oOs/HQhL1U5QQFGZbvob6TnGhRjz6fc2vGj44U1OkZlD5lhOwOZB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="330777844"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="330777844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="845197877"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="845197877"
Received: from dkanafee-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.48.254])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 02:57:22 -0700
Date: Mon, 15 May 2023 11:57:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2] drm/i915/hwmon: Silence UBSAN uninitialized bool
 variable warning
Message-ID: <ZGIB/5X6JDRAJNuk@ashyti-mobl2.lan>
References: <20230512203735.2635237-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512203735.2635237-1-ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ashutosh,

On Fri, May 12, 2023 at 01:37:35PM -0700, Ashutosh Dixit wrote:
> Loading i915 on UBSAN enabled kernels (CONFIG_UBSAN/CONFIG_UBSAN_BOOL)
> causes the following warning:
> 
>   UBSAN: invalid-load in drivers/gpu/drm/i915/gt/uc/intel_uc.c:558:2
>   load of value 255 is not a valid value for type '_Bool'
>   Call Trace:
>    dump_stack_lvl+0x57/0x7d
>    ubsan_epilogue+0x5/0x40
>    __ubsan_handle_load_invalid_value.cold+0x43/0x48
>    __uc_init_hw+0x76a/0x903 [i915]
>    ...
>    i915_driver_probe+0xfb1/0x1eb0 [i915]
>    i915_pci_probe+0xbe/0x2d0 [i915]
> 
> The warning happens because during probe i915_hwmon is still not available
> which results in the output boolean variable *old remaining
> uninitialized. Silence the warning by initializing the variable to an
> arbitrary value.
> 
> v2: Move variable initialization to the declaration (Andi)
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

pushed in drm-intel-gt-next.

Thanks,
Andi

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 1381943b8973d..c8b9cbb7ba3a9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -465,7 +465,7 @@ static int __uc_init_hw(struct intel_uc *uc)
>  	struct intel_guc *guc = &uc->guc;
>  	struct intel_huc *huc = &uc->huc;
>  	int ret, attempts;
> -	bool pl1en;
> +	bool pl1en = false;
>  
>  	GEM_BUG_ON(!intel_uc_supports_guc(uc));
>  	GEM_BUG_ON(!intel_uc_wants_guc(uc));
> -- 
> 2.38.0
