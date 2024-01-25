Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB883BD9B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4529410E900;
	Thu, 25 Jan 2024 09:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BFB10E900;
 Thu, 25 Jan 2024 09:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706175711; x=1737711711;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WeBZw7CQQ/b0Kuc3VgepmfjtbEo4oCwHmiOwv7/FBic=;
 b=QrKs+fk94YkLOU4qEFPof2BS646x1aX/gITC+3v+vwonGa14Po5Joj6X
 O2maEIYOu/jBu0UoEwwzKdoRFKQE6WCaK+Fa8ngZwygX5jDWesT/4L2So
 1z+ImC527vnwCG0Yw1/Fs6H4Hmr1DG/w6Z0OYEg1almLAiyB8+utcAk6/
 2LntatybLuLWrlNDbLmYgW+itLf+T4tHthqTq1tGkzc/7NHK4Yy/33kfg
 TMPkvi7p3fb757WyLQBYX3fSSDM8uh05/xvsAbz0x/egxmAX28d6mondS
 WG/FjvYUy6HyUE2dfQ5Sb/kkDJdzOrzjucsPw1xd9V9vhBibIXbUMcCfB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20662388"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20662388"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959789568"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959789568"
Received: from cyrillet-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.252])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 01:41:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: wangxiaoming321 <xiaoming.wang@intel.com>, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe/display: Fix memleak in display initialization
In-Reply-To: <20240125063633.989944-1-xiaoming.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240125063633.989944-1-xiaoming.wang@intel.com>
Date: Thu, 25 Jan 2024 11:41:40 +0200
Message-ID: <87bk99lpgr.fsf@intel.com>
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
Cc: wangxiaoming321 <xiaoming.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Jan 2024, wangxiaoming321 <xiaoming.wang@intel.com> wrote:
> In the call stack xe_device_probe ->  xe_display_init_nommio -> intel_power_domains_init
> Power_domains  hasn't been cleaned up if return error,
> which has do the clean in i915_driver_late_release call from i915_driver_probe.

This has nothing to do with i915_*.

If intel_power_domains_init() returns an error, it should have cleaned
up after itself, not force its caller to do that. If there's an issue,
please fix it in intel_power_domains_init().

BR,
Jani.


>
> unreferenced object 0xffff88811150ee00 (size 512):
>   comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
>   hex dump (first 32 bytes):
>     10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
>     ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
>     [<ffffffff812c98b2>] __kmalloc+0x52/0x150
>     [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
>     [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
>     [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
>     [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
>     [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
>     [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
>     [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
>     [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
>     [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
>     [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
>     [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
>     [<ffffffff8192e159>] bus_add_driver+0x119/0x220
>     [<ffffffff81930d00>] driver_register+0x60/0x120
>     [<ffffffffa05e50a0>] 0xffffffffa05e50a0
>
> Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 74391d9b11ae..2725afba4afb 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -146,8 +146,10 @@ int xe_display_init_nommio(struct xe_device *xe)
>  	intel_detect_pch(xe);
>  
>  	err = intel_power_domains_init(xe);
> -	if (err)
> +	if (err) {
> +		intel_power_domains_cleanup(xe);
>  		return err;
> +	}
>  
>  	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
>  }

-- 
Jani Nikula, Intel
