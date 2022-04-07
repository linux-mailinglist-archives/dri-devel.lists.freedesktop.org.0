Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285064F7130
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 03:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B067F10E694;
	Thu,  7 Apr 2022 01:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A4810E67C;
 Thu,  7 Apr 2022 01:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649294856; x=1680830856;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hPczqjMYDIiRBl9B39XfDTTP+R9917QCbB2OJeIrhTs=;
 b=J7KgVT5098hVM0DUkF0NLa2iztQHwV3dKpAyMDnSeP6Wa8xMPm4TTdoe
 arm2KKgehG/GN22dZ4p8VJ+azaklcVksxiIEjrDTy1T0fhvgK8s+3w20C
 7oB2h3e4bybS3R1cVcHByRTqzXZJL+B+SM/iIEUIFxXfNtsa/uEdrAtss w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2022 18:27:35 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 18:27:34 -0700
Received: from [10.71.108.57] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 18:27:34 -0700
Message-ID: <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
Date: Wed, 6 Apr 2022 18:27:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Kazlauskas, 
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/31/2022 8:20 AM, Daniel Vetter wrote:
> The stuff never really worked, and leads to lots of fun because it
> out-of-order frees atomic states. Which upsets KASAN, among other
> things.
> 
> For async updates we now have a more solid solution with the
> ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> for msm and vc4 landed. nouveau and i915 have their own commit
> routines, doing something similar.
> 
> For everyone else it's probably better to remove the use-after-free
> bug, and encourage folks to use the async support instead. The
> affected drivers which register a legacy cursor plane and don't either
> use the new async stuff or their own commit routine are: amdgpu,
> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
> 
> Inspired by an amdgpu bug report.
> 
> v2: Drop RFC, I think with amdgpu converted over to use
> atomic_async_check/commit done in
> 
> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Wed Dec 5 14:59:07 2018 -0500
> 
>      drm/amd/display: Add fast path for cursor plane updates
> 
> we don't have any driver anymore where we have userspace expecting
> solid legacy cursor support _and_ they are using the atomic helpers in
> their fully glory. So we can retire this.
> 
> v3: Paper over msm and i915 regression. The complete_all is the only
> thing missing afaict.
> 
> v4: Fixup i915 fixup ...
> 
> References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
> References: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> Cc: Maxime Ripard <maxime@cerno.tech>
> Tested-by: Maxime Ripard <maxime@cerno.tech>
> Cc: mikita.lipski@amd.com
> Cc: Michel Dänzer <michel@daenzer.net>
> Cc: harry.wentland@amd.com
> Cc: Rob Clark <robdclark@gmail.com>

Hey Rob,

I saw your tested-by and reviewed-by tags on Patchwork. Just curious, 
what device did you test on?

I'm hitting several instances of this error when doing a start/stop ui 
on Lazor Chromebook with this patch:

[ 3092.608322] CPU: 2 PID: 18579 Comm: DrmThread Tainted: G        W 
      5.17.0-rc2-lockdep-00089-g7f17ab7bf567 #155 
e5912cd286513b064a82a38938b3fdef86b079aa
[ 3092.622880] Hardware name: Google Lazor Limozeen without Touchscreen 
(rev4) (DT)
[ 3092.630492] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[ 3092.637664] pc : dpu_crtc_atomic_flush+0x9c/0x144
[ 3092.642523] lr : dpu_crtc_atomic_flush+0x60/0x144
[ 3092.647379] sp : ffffffc00c1e3760
[ 3092.650805] x29: ffffffc00c1e3760 x28: ffffff80985dd800 x27: 
0000000000000425
[ 3092.658164] x26: ffffff80985dc500 x25: ffffff80985ddc00 x24: 
ffffffdf8ae3b6f0
[ 3092.665522] x23: 0000000000000000 x22: 0000000000000000 x21: 
ffffff809b82da00
[ 3092.672890] x20: ffffff80840e1000 x19: ffffff80840e2000 x18: 
0000000000001000
[ 3092.680255] x17: 0000000000000400 x16: 0000000000000100 x15: 
000000000000003b
[ 3092.687622] x14: 0000000000000000 x13: 0000000000000002 x12: 
0000000000000003
[ 3092.694979] x11: ffffff8084009000 x10: 0000000000000040 x9 : 
0000000000000040
[ 3092.702340] x8 : 0000000000000300 x7 : 000000000000000c x6 : 
0000000000000004
[ 3092.709698] x5 : 0000000000000320 x4 : 0000000000000018 x3 : 
0000000000000000
[ 3092.717056] x2 : 0000000000000000 x1 : 7bfb38b2a3a89800 x0 : 
ffffff809a1eb300
[ 3092.724424] Call trace:
[ 3092.726958]  dpu_crtc_atomic_flush+0x9c/0x144
[ 3092.731463]  drm_atomic_helper_commit_planes+0x1bc/0x1c4
[ 3092.736944]  msm_atomic_commit_tail+0x23c/0x3e0
[ 3092.741627]  commit_tail+0x7c/0xfc
[ 3092.745145]  drm_atomic_helper_commit+0x158/0x15c
[ 3092.749998]  drm_atomic_commit+0x60/0x74
[ 3092.754055]  drm_atomic_helper_update_plane+0x100/0x110
[ 3092.759449]  __setplane_atomic+0x11c/0x120
[ 3092.763685]  drm_mode_cursor_universal+0x188/0x22c
[ 3092.768633]  drm_mode_cursor_common+0x120/0x1f8
[ 3092.773310]  drm_mode_cursor_ioctl+0x68/0x8c
[ 3092.777721]  drm_ioctl_kernel+0xe8/0x168
[ 3092.781770]  drm_ioctl+0x320/0x370
[ 3092.785289]  drm_compat_ioctl+0x40/0xdc
[ 3092.789257]  __arm64_compat_sys_ioctl+0xe0/0x150
[ 3092.794030]  invoke_syscall+0x80/0x114
[ 3092.797905]  el0_svc_common.constprop.3+0xc4/0xf8
[ 3092.802765]  do_el0_svc_compat+0x2c/0x54
[ 3092.806811]  el0_svc_compat+0x4c/0xe4
[ 3092.810598]  el0t_32_sync_handler+0xc4/0xf4
[ 3092.814914]  el0t_32_sync+0x174/0x178
[ 3092.818701] irq event stamp: 55940
[ 3092.822217] hardirqs last  enabled at (55939): [<ffffffdf8ad617a4>] 
exit_to_kernel_mode+0x10c/0x11c
[ 3092.831523] hardirqs last disabled at (55940): [<ffffffdf8ad62728>] 
el1_dbg+0x28/0x70
[ 3092.839577] softirqs last  enabled at (55938): [<ffffffdf8a2103a8>] 
__do_softirq+0x1e8/0x480
[ 3092.848256] softirqs last disabled at (55923): [<ffffffdf8a28d668>] 
__irq_exit_rcu+0xdc/0x140
[ 3092.857022] ---[ end trace 0000000000000000 ]---




Thanks,

Jessica Zhang

> Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
>   drivers/gpu/drm/i915/display/intel_display.c | 14 ++++++++++++++
>   drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
>   3 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 9603193d2fa1..a2899af82b4a 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
>   	int i, ret;
>   	unsigned int crtc_mask = 0;
>   
> -	 /*
> -	  * Legacy cursor ioctls are completely unsynced, and userspace
> -	  * relies on that (by doing tons of cursor updates).
> -	  */
> -	if (old_state->legacy_cursor_update)
> -		return;
> -
>   	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>   		if (!new_crtc_state->active)
>   			continue;
> @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>   			continue;
>   		}
>   
> -		/* Legacy cursor updates are fully unsynced. */
> -		if (state->legacy_cursor_update) {
> -			complete_all(&commit->flip_done);
> -			continue;
> -		}
> -
>   		if (!new_crtc_state->event) {
>   			commit->event = kzalloc(sizeof(*commit->event),
>   						GFP_KERNEL);
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index d2abe0e430bf..6ca5a6e7703b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -8799,6 +8799,20 @@ static int intel_atomic_commit(struct drm_device *dev,
>   		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
>   		return ret;
>   	}
> +
> +	/*
> +	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
> +	 * everything.
> +	 */
> +	if (state->base.legacy_cursor_update) {
> +		struct intel_crtc_state *new_crtc_state;
> +		struct intel_crtc *crtc;
> +		int i;
> +
> +		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
> +			complete_all(&new_crtc_state->uapi.commit->flip_done);
> +	}
> +
>   	intel_shared_dpll_swap_state(state);
>   	intel_atomic_track_fbs(state);
>   
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 1686fbb611fd..b3cfabebe5d6 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -222,6 +222,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>   		/* async updates are limited to single-crtc updates: */
>   		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));
>   
> +		complete_all(&async_crtc->state->commit->flip_done);
> +
>   		/*
>   		 * Start timer if we don't already have an update pending
>   		 * on this crtc:
> -- 
> 2.34.1
> 
