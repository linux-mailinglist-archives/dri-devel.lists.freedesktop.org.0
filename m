Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C07439EA6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 20:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327B89CF7;
	Mon, 25 Oct 2021 18:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B7C89CF7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 18:41:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635187295; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=KTAT/Evk80jqFVorUHbXWkgtNBFIlPqrxVfwPYDQ8X0=;
 b=P5TL31pU29zdHR0Lk94TiddbI3sZPruYQLmnaHKFRlPKiKJZLBX7JGdeMlxzTAtzNYKnL4vB
 N4IfJxj0v1SyVm0AyKyWP7yiEVAsz33bwhaxNXomEs6aqNWNrqNa9vhbH2k41amSNW/0mAfg
 KRz3ifYL60/loDE1WEHiyUpO0vw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6176fa5dfd91319f0fce81aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 18:41:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A7544C4360C; Mon, 25 Oct 2021 18:41:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.71.111.83] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 68BDCC4338F;
 Mon, 25 Oct 2021 18:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 68BDCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <ac55afe1-ed3e-5ff8-4109-bfcba3044368@codeaurora.org>
Date: Mon, 25 Oct 2021 11:41:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Remove dynamic allocation from atomic
 context
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Jessica Zhang <jesszhan@codeaurora.org>, Mark Yacoub
 <markyacoub@google.com>, open list <linux-kernel@vger.kernel.org>
References: <20211023160016.3322052-1-robdclark@gmail.com>
 <20211023160016.3322052-2-robdclark@gmail.com>
From: Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211023160016.3322052-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/23/2021 9:00 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> We know the upper bound on # of mixers (ie. two), so lets just allocate
> this on the stack.
>
> Fixes:
>
>     BUG: sleeping function called from invalid context at include/linux/sched/mm.h:201
>     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
>     INFO: lockdep is turned off.
>     irq event stamp: 43642
>     hardirqs last  enabled at (43641): [<ffffffe24dd276bc>] cpuidle_enter_state+0x158/0x25c
>     hardirqs last disabled at (43642): [<ffffffe24dfff450>] enter_el1_irq_or_nmi+0x10/0x1c
>     softirqs last  enabled at (43620): [<ffffffe24d4103fc>] __do_softirq+0x1e4/0x464
>     softirqs last disabled at (43615): [<ffffffe24d48bd90>] __irq_exit_rcu+0x104/0x150
>     CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.15.0-rc3-debug+ #105
>     Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>     Call trace:
>      dump_backtrace+0x0/0x18c
>      show_stack+0x24/0x30
>      dump_stack_lvl+0xa0/0xd4
>      dump_stack+0x18/0x34
>      ___might_sleep+0x1e0/0x1f0
>      __might_sleep+0x78/0x8c
>      slab_pre_alloc_hook.constprop.0+0x48/0x6c
>      __kmalloc+0xc8/0x21c
>      dpu_crtc_vblank_callback+0x158/0x1f8
>      dpu_encoder_vblank_callback+0x70/0xc4
>      dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
>      dpu_core_irq+0x1bc/0x1d0
>      dpu_irq+0x1c/0x28
>      msm_irq+0x34/0x40
>      __handle_irq_event_percpu+0x15c/0x308
>      handle_irq_event_percpu+0x3c/0x90
>      handle_irq_event+0x54/0x98
>      handle_level_irq+0xa0/0xd0
>      handle_irq_desc+0x2c/0x44
>      generic_handle_domain_irq+0x28/0x34
>      dpu_mdss_irq+0x90/0xe8
>      handle_irq_desc+0x2c/0x44
>      handle_domain_irq+0x54/0x80
>      gic_handle_irq+0xd4/0x148
>      call_on_irq_stack+0x2c/0x54
>      do_interrupt_handler+0x4c/0x64
>      el1_interrupt+0x30/0xd0
>      el1h_64_irq_handler+0x18/0x24
>      el1h_64_irq+0x78/0x7c
>      arch_local_irq_enable+0xc/0x14
>      cpuidle_enter+0x44/0x5c
>      do_idle+0x248/0x268
>      cpu_startup_entry+0x30/0x48
>      rest_init+0x188/0x19c
>      arch_call_rest_init+0x1c/0x28
>      start_kernel+0x704/0x744
>      __primary_switched+0xc0/0xc8
>
> Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jessica Zhang <jesszhan@codeaurora.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0ae397044310..2523e829f485 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -182,21 +182,19 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc_state *crtc_state;
>   	struct dpu_crtc_mixer *m;
> -	u32 *crcs;
> +	u32 crcs[CRTC_DUAL_MIXERS];
>   
>   	int i = 0;
>   	int rc = 0;
>   
>   	crtc_state = to_dpu_crtc_state(crtc->state);
> -	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
>   
> -	if (!crcs)
> -		return -ENOMEM;
> +	BUILD_BUG_ON(ARRAY_SIZE(crcs) != ARRAY_SIZE(crtc_state->mixers));
>   
>   	/* Skip first 2 frames in case of "uncooked" CRCs */
>   	if (crtc_state->crc_frame_skip_count < 2) {
>   		crtc_state->crc_frame_skip_count++;
> -		goto cleanup;
> +		return 0;
>   	}
>   
>   	for (i = 0; i < crtc_state->num_mixers; ++i) {
> @@ -210,16 +208,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   
>   		if (rc) {
>   			DRM_DEBUG_DRIVER("MISR read failed\n");
> -			goto cleanup;
> +			return rc;
>   		}
>   	}
>   
> -	rc = drm_crtc_add_crc_entry(crtc, true,
> +	return drm_crtc_add_crc_entry(crtc, true,
>   			drm_crtc_accurate_vblank_count(crtc), crcs);
> -
> -cleanup:
> -	kfree(crcs);
> -	return rc;
>   }
>   
>   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
