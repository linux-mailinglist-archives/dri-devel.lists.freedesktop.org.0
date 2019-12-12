Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3D11D480
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 18:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF306E041;
	Thu, 12 Dec 2019 17:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAACB6E037;
 Thu, 12 Dec 2019 17:49:11 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 09:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; d="scan'208";a="414006141"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.64])
 by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2019 09:49:10 -0800
Date: Thu, 12 Dec 2019 09:49:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [Intel-gfx][PATCH] drm/i915/display: cleanup intel_bw_state on
 i915 module removal
Message-ID: <20191212174910.GH85422@mdroper-desk1.amr.corp.intel.com>
References: <20191209143921.9240-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209143921.9240-1-pankaj.laxminarayan.bharadiya@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 David Airlie <airlied@linux.ie>, Stuart Summers <stuart.summers@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 09, 2019 at 08:09:02PM +0530, Pankaj Bharadiya wrote:
> intel_bw_state allocated memory is not getting freed even after
> module removal.
> 
> kmemleak reported backtrace:
> 
>     [<0000000079019739>] kmemdup+0x17/0x40
>     [<00000000d58c1b9d>] intel_bw_duplicate_state+0x1b/0x40 [i915]
>     [<000000007423ed0c>] drm_atomic_get_private_obj_state+0xca/0x140
>     [<00000000100e3533>] intel_bw_atomic_check+0x133/0x350 [i915]
>     [<00000000126d0e0c>] intel_atomic_check+0x1ab7/0x20d0 [i915]
>     [<00000000d5dfc004>] drm_atomic_check_only+0x563/0x810
>     [<00000000c9379611>] drm_atomic_commit+0xe/0x50
>     [<00000000ec82b765>] drm_atomic_helper_disable_all+0x133/0x160
>     [<000000003c44760c>] drm_atomic_helper_shutdown+0x65/0xc0
>     [<00000000414e3e5c>] i915_driver_remove+0xcb/0x130 [i915]
>     [<00000000f8544c2a>] i915_pci_remove+0x19/0x40 [i915]
>     [<000000002dcbd148>] pci_device_remove+0x36/0xb0
>     [<000000003c8c6b0a>] device_release_driver_internal+0xe0/0x1c0
>     [<00000000580e9566>] unbind_store+0xc3/0x120
>     [<00000000869d0df5>] kernfs_fop_write+0x104/0x190
>     [<000000004dc1a355>] vfs_write+0xb9/0x1d0
> 
> Call the drm_atomic_private_obj_fini(), which inturn calls the
> intel_bw_destroy_state() to make sure the intel_bw_state memory is
> freed properly.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

It looks like we'd also leak this object if intel_modeset_init() bails
out early due to failure to init a crtc.  I.e., we call
drm_mode_config_cleanup() which cleans up any regular state objects that
may have been initialized by this point, but never destroy the bw_state
which was allocated earlier in the function.


Matt

> ---
>  drivers/gpu/drm/i915/display/intel_bw.c      | 5 +++++
>  drivers/gpu/drm/i915/display/intel_bw.h      | 1 +
>  drivers/gpu/drm/i915/display/intel_display.c | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> index dcb66a33be9b..b228671d5a5d 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> @@ -486,3 +486,8 @@ int intel_bw_init(struct drm_i915_private *dev_priv)
>  
>  	return 0;
>  }
> +
> +void intel_bw_cleanup(struct drm_i915_private *dev_priv)
> +{
> +	drm_atomic_private_obj_fini(&dev_priv->bw_obj);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_bw.h b/drivers/gpu/drm/i915/display/intel_bw.h
> index 9db10af012f4..20b9ad241802 100644
> --- a/drivers/gpu/drm/i915/display/intel_bw.h
> +++ b/drivers/gpu/drm/i915/display/intel_bw.h
> @@ -25,6 +25,7 @@ struct intel_bw_state {
>  
>  void intel_bw_init_hw(struct drm_i915_private *dev_priv);
>  int intel_bw_init(struct drm_i915_private *dev_priv);
> +void intel_bw_cleanup(struct drm_i915_private *dev_priv);
>  int intel_bw_atomic_check(struct intel_atomic_state *state);
>  void intel_bw_crtc_update(struct intel_bw_state *bw_state,
>  			  const struct intel_crtc_state *crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 3190aa27ffdc..756eb90b1bb1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -17912,6 +17912,8 @@ void intel_modeset_driver_remove(struct drm_i915_private *i915)
>  
>  	intel_gmbus_teardown(i915);
>  
> +	intel_bw_cleanup(i915);
> +
>  	destroy_workqueue(i915->flip_wq);
>  	destroy_workqueue(i915->modeset_wq);
>  
> -- 
> 2.23.0
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
