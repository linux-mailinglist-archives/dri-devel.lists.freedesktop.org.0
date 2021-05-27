Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BEB392DCA
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C436EEAB;
	Thu, 27 May 2021 12:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEC96EEAB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 12:15:37 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A579B2C;
 Thu, 27 May 2021 14:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1622117735;
 bh=Zdfvs0otbYEp586eju7SAPyeSsWMxyCPD9FdTwIBoaA=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=DpYLzF9wxqeDL80uxCMsdp0PeI+Tke1dg/pp80+F91n6hc9hYRPhkGMXsjbTRZRW6
 /ZjrHdBY283qJGbYQlMVUNwaz3AcbopThGboOPkPP7tnq711kvzNmAE+hYuk5+vOmx
 7TkeU8e+7udzvA57g0HYFI8D/T00cIIk6P2rjNuU=
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
 <20210121152959.1725404-12-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 11/11] drm/tidss: Annotate dma-fence critical section in
 commit path
Message-ID: <7c07a183-cd1b-ab75-527c-cdf37cd4273c@ideasonboard.com>
Date: Thu, 27 May 2021 15:15:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210121152959.1725404-12-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 21/01/2021 17:29, Daniel Vetter wrote:
> Ends right after hw_done(), totally standard case.
> 
> Acked-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_kms.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 09485c7f0d6f..95f8e0f78e32 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -4,6 +4,8 @@
>    * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>    */
>   
> +#include <linux/dma-fence.h>
> +
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_bridge.h>
> @@ -26,6 +28,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
>   {
>   	struct drm_device *ddev = old_state->dev;
>   	struct tidss_device *tidss = to_tidss(ddev);
> +	bool fence_cookie = dma_fence_begin_signalling();
>   
>   	dev_dbg(ddev->dev, "%s\n", __func__);
>   
> @@ -36,6 +39,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
>   	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
>   
>   	drm_atomic_helper_commit_hw_done(old_state);
> +	dma_fence_end_signalling(fence_cookie);
>   	drm_atomic_helper_wait_for_flip_done(ddev, old_state);
>   
>   	drm_atomic_helper_cleanup_planes(ddev, old_state);
> 

I bisected v5.13 rc lockdep warnings to this patch. I see this with tidss (lockdep
report below) and omapdrm (probably caused by "drm/omapdrm: Annotate dma-fence critical
section in commit path"). The report on omapdrm is very similar, with fs_reclaim and
dma_fence_map, but hdmi bridge instead of mhdp bridge.

I'm unfamiliar with this piece of drm code, do you have any hints on what the problem
might be and where I should be looking at?

  Tomi

[   20.769286] ======================================================
[   20.776918] WARNING: possible circular locking dependency detected
[   20.783082] 5.11.0-rc2-00688-g4d56a4f08391-dirty #18 Not tainted
[   20.789072] ------------------------------------------------------
[   20.795232] kmstest/397 is trying to acquire lock:
[   20.800008] ffff800011637878 (fs_reclaim){+.+.}-{0:0}, at: fs_reclaim_acquire+0x40/0xa4
[   20.808014]
[   20.808014] but task is already holding lock:
[   20.813828] ffff000804fb41a8 (&mhdp->link_mutex){+.+.}-{3:3}, at: cdns_mhdp_atomic_enable+0x54/0x2c0 [cdns_mhdp8546]
[   20.824343]
[   20.824343] which lock already depends on the new lock.
[   20.824343]
[   20.832497]
[   20.832497] the existing dependency chain (in reverse order) is:
[   20.839958]
[   20.839958] -> #2 (&mhdp->link_mutex){+.+.}-{3:3}:
[   20.846214]        lock_acquire.part.0+0x178/0x380
[   20.850999]        lock_acquire+0x6c/0x90
[   20.854996]        __mutex_lock+0x9c/0x540
[   20.859083]        mutex_lock_nested+0x44/0x70
[   20.863513]        cdns_mhdp_atomic_enable+0x54/0x2c0 [cdns_mhdp8546]
[   20.869938]        drm_atomic_bridge_chain_enable+0x60/0xd4 [drm]
[   20.876093]        drm_atomic_helper_commit_modeset_enables+0x148/0x260 [drm_kms_helper]
[   20.884207]        tidss_atomic_commit_tail+0x64/0xd0 [tidss]
[   20.889947]        commit_tail+0xac/0x190 [drm_kms_helper]
[   20.895445]        drm_atomic_helper_commit+0x194/0x3a0 [drm_kms_helper]
[   20.902155]        drm_atomic_commit+0x58/0x70 [drm]
[   20.907165]        drm_mode_atomic_ioctl+0x9f0/0xbbc [drm]
[   20.912693]        drm_ioctl_kernel+0xd0/0x124 [drm]
[   20.917701]        drm_ioctl+0x238/0x460 [drm]
[   20.922189]        __arm64_sys_ioctl+0xb4/0x100
[   20.926707]        el0_svc_common.constprop.0+0x80/0x1e0
[   20.932007]        do_el0_svc+0x30/0xa0
[   20.935831]        el0_svc+0x20/0x30
[   20.939394]        el0_sync_handler+0x1a8/0x1b0
[   20.943910]        el0_sync+0x174/0x180
[   20.947734]
[   20.947734] -> #1 (dma_fence_map){++++}-{0:0}:
[   20.953644]        lock_acquire.part.0+0x178/0x380
[   20.958422]        lock_acquire+0x6c/0x90
[   20.962418]        __dma_fence_might_wait+0x60/0xdc
[   20.967285]        dma_resv_lockdep+0x1dc/0x2b4
[   20.971803]        do_one_initcall+0x90/0x460
[   20.976145]        kernel_init_freeable+0x2c0/0x32c
[   20.981012]        kernel_init+0x20/0x128
[   20.985007]        ret_from_fork+0x10/0x3c
[   20.989091]
[   20.989091] -> #0 (fs_reclaim){+.+.}-{0:0}:
[   20.994740]        check_noncircular+0x164/0x180
[   20.999344]        __lock_acquire+0x13dc/0x1be4
[   21.003861]        lock_acquire.part.0+0x178/0x380
[   21.008639]        lock_acquire+0x6c/0x90
[   21.012635]        fs_reclaim_acquire+0x7c/0xa4
[   21.017152]        kmem_cache_alloc_trace+0x7c/0x3c0
[   21.022103]        drm_mode_duplicate+0x34/0x70 [drm]
[   21.027199]        cdns_mhdp_atomic_enable+0x1c4/0x2c0 [cdns_mhdp8546]
[   21.033711]        drm_atomic_bridge_chain_enable+0x60/0xd4 [drm]
[   21.039845]        drm_atomic_helper_commit_modeset_enables+0x148/0x260 [drm_kms_helper]
[   21.047946]        tidss_atomic_commit_tail+0x64/0xd0 [tidss]
[   21.053681]        commit_tail+0xac/0x190 [drm_kms_helper]
[   21.059179]        drm_atomic_helper_commit+0x194/0x3a0 [drm_kms_helper]
[   21.065889]        drm_atomic_commit+0x58/0x70 [drm]
[   21.070897]        drm_mode_atomic_ioctl+0x9f0/0xbbc [drm]
[   21.076423]        drm_ioctl_kernel+0xd0/0x124 [drm]
[   21.081430]        drm_ioctl+0x238/0x460 [drm]
[   21.085917]        __arm64_sys_ioctl+0xb4/0x100
[   21.090434]        el0_svc_common.constprop.0+0x80/0x1e0
[   21.095730]        do_el0_svc+0x30/0xa0
[   21.099554]        el0_svc+0x20/0x30
[   21.103117]        el0_sync_handler+0x1a8/0x1b0
[   21.107632]        el0_sync+0x174/0x180
[   21.111454]
[   21.111454] other info that might help us debug this:
[   21.111454]
[   21.119435] Chain exists of:
[   21.119435]   fs_reclaim --> dma_fence_map --> &mhdp->link_mutex
[   21.119435]
[   21.129768]  Possible unsafe locking scenario:
[   21.129768]
[   21.135670]        CPU0                    CPU1
[   21.140184]        ----                    ----
[   21.144698]   lock(&mhdp->link_mutex);
[   21.148435]                                lock(dma_fence_map);
[   21.154340]                                lock(&mhdp->link_mutex);
[   21.160591]   lock(fs_reclaim);
[   21.163721]
[   21.163721]  *** DEADLOCK ***
[   21.163721]
[   21.169623] 4 locks held by kmstest/397:
[   21.173532]  #0: ffff8000145efc28 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_modeset_acquire_init+0x48/0x70 [drm]
[   21.184011]  #1: ffff000805dc7888 (crtc_ww_class_mutex){+.+.}-{3:3}, at: drm_modeset_lock+0x138/0x170 [drm]
[   21.193795]  #2: ffff8000116d53f8 (dma_fence_map){++++}-{0:0}, at: tidss_atomic_commit_tail+0x2c/0xd0 [tidss]
[   21.203701]  #3: ffff000804fb41a8 (&mhdp->link_mutex){+.+.}-{3:3}, at: cdns_mhdp_atomic_enable+0x54/0x2c0 [cdns_mhdp8546]
[   21.214642]
[   21.214642] stack backtrace:
[   21.218984] CPU: 1 PID: 397 Comm: kmstest Not tainted 5.11.0-rc2-00688-g4d56a4f08391-dirty #18
[   21.227575] Hardware name: Texas Instruments K3 J721E SoC (DT)
[   21.233390] Call trace:
[   21.235825]  dump_backtrace+0x0/0x1f0
[   21.239476]  show_stack+0x24/0x80
[   21.242781]  dump_stack+0xec/0x154
[   21.246170]  print_circular_bug+0x1f8/0x200
[   21.250341]  check_noncircular+0x164/0x180
[   21.254426]  __lock_acquire+0x13dc/0x1be4
[   21.258422]  lock_acquire.part.0+0x178/0x380
[   21.262679]  lock_acquire+0x6c/0x90
[   21.266155]  fs_reclaim_acquire+0x7c/0xa4
[   21.270152]  kmem_cache_alloc_trace+0x7c/0x3c0
[   21.274582]  drm_mode_duplicate+0x34/0x70 [drm]
[   21.279159]  cdns_mhdp_atomic_enable+0x1c4/0x2c0 [cdns_mhdp8546]
[   21.285151]  drm_atomic_bridge_chain_enable+0x60/0xd4 [drm]
[   21.290764]  drm_atomic_helper_commit_modeset_enables+0x148/0x260 [drm_kms_helper]
[   21.298343]  tidss_atomic_commit_tail+0x64/0xd0 [tidss]
[   21.303559]  commit_tail+0xac/0x190 [drm_kms_helper]
[   21.308535]  drm_atomic_helper_commit+0x194/0x3a0 [drm_kms_helper]
[   21.314725]  drm_atomic_commit+0x58/0x70 [drm]
[   21.319214]  drm_mode_atomic_ioctl+0x9f0/0xbbc [drm]
[   21.324220]  drm_ioctl_kernel+0xd0/0x124 [drm]
[   21.328708]  drm_ioctl+0x238/0x460 [drm]
[   21.332676]  __arm64_sys_ioctl+0xb4/0x100
[   21.336672]  el0_svc_common.constprop.0+0x80/0x1e0
[   21.341449]  do_el0_svc+0x30/0xa0
[   21.344753]  el0_svc+0x20/0x30
[   21.347795]  el0_sync_handler+0x1a8/0x1b0
[   21.351790]  el0_sync+0x174/0x180
