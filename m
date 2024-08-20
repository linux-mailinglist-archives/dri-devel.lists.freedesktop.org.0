Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35095805F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C5810E4E0;
	Tue, 20 Aug 2024 07:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jEKAvVa8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B6610E4CF;
 Tue, 20 Aug 2024 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724140476; x=1755676476;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hck3bHzWx7WDKLDaFym5HQG2fFAzrpjrjVnA+2HCE6M=;
 b=jEKAvVa8JimHUhyPHouPLsyTs33QaPoLUWYOp/PrlQz/KS78K4uPafBE
 ebn4I5tf0+QVN1a8KEWZOe/HijfcPu03Idn/Ifz51rQ6Ob2VL9/FIXhc5
 hW2mupCrBW80nlUx7Ww7Nvw4oGQ5aPoD8cMZpdkA2G/GhLTc79LvGG5aF
 55bT24KCVVi/kSdtz2PNmpOPAt9uBA5Pps6Zk+JsIMgEaPPzYBVnP3Vgx
 ZB5sTNmus1WGsNjUo3/NPafOVPl+evFlgnX3dNukPTOp3kwFmHfdzl3X/
 tcNpsQgR+Qf7DFdkk02rk/0mG/DDGyEu/ha7lpwgatMSJsrS1HwEqZ56L g==;
X-CSE-ConnectionGUID: KGQeUEu0RYycK42zRACQ4w==
X-CSE-MsgGUID: NoPLG8h8QQufImcKXK50/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22560101"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22560101"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:54:36 -0700
X-CSE-ConnectionGUID: nmdr6myvTq+QbC84Wmiwxw==
X-CSE-MsgGUID: 7+H/mZ6KSsGJNaxQKbftSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65592139"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:54:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Michal Mrozek
 <michal.mrozek@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Shekhar Chauhan <shekhar.chauhan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Yu Jiaoliang <yujiaoliang@vivo.com>
Subject: Re: [PATCH v1] drivers:gt:Switch to use kmemdup_array()
In-Reply-To: <20240820074505.2728118-1-yujiaoliang@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240820074505.2728118-1-yujiaoliang@vivo.com>
Date: Tue, 20 Aug 2024 10:54:27 +0300
Message-ID: <87ikvv634c.fsf@intel.com>
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

On Tue, 20 Aug 2024, Yu Jiaoliang <yujiaoliang@vivo.com> wrote:
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

For future reference, please look at git log for the file instead of
inventing subject prefixes.

There should be a blank line between commit message and trailers.

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 09a287c1aedd..d90348c56765 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -111,8 +111,8 @@ static void wa_init_finish(struct i915_wa_list *wal)
>  {
>  	/* Trim unused entries. */
>  	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
> -		struct i915_wa *list = kmemdup(wal->list,
> -					       wal->count * sizeof(*list),
> +		struct i915_wa *list = kmemdup_array(wal->list,
> +					       wal->count, sizeof(*list),
>  					       GFP_KERNEL);
>  
>  		if (list) {

-- 
Jani Nikula, Intel
