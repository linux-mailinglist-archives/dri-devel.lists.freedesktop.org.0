Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AEA4177E8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD089147;
	Fri, 24 Sep 2021 15:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4842188DA9;
 Fri, 24 Sep 2021 15:36:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="224143568"
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="224143568"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2021 08:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,320,1624345200"; d="scan'208";a="559665040"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 24 Sep 2021 08:35:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Sep 2021 18:35:58 +0300
Date: Fri, 24 Sep 2021 18:35:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915: remember to call i915_sw_fence_fini
Message-ID: <YU3wXm6gy3iDeqgx@intel.com>
References: <20210924144646.4096402-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210924144646.4096402-1-matthew.auld@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Sep 24, 2021 at 03:46:46PM +0100, Matthew Auld wrote:
> Seems to fix some object-debug splat which appeared while debugging
> something unrelated.
> 
> v2: s/guc_blocked/guc_state.blocked/
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Seems to help.
Tested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Bonus points if someone can figure out how this getting past CI in its
current state. I can trigger it very easily by pretty much running any
igt. Though for some reason it doesn't always trigger on the first run
of an igt after boot, sometimes takes a few runs. Dunno if the checks
are  a bit lazy or something.

> ---
>  drivers/gpu/drm/i915/gt/intel_context.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index ff637147b1a9..e9a0cad5c34d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -419,6 +419,7 @@ void intel_context_fini(struct intel_context *ce)
>  
>  	mutex_destroy(&ce->pin_mutex);
>  	i915_active_fini(&ce->active);
> +	i915_sw_fence_fini(&ce->guc_state.blocked);
>  }
>  
>  void i915_context_module_exit(void)
> -- 
> 2.26.3

-- 
Ville Syrjälä
Intel
