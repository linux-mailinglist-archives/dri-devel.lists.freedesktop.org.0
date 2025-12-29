Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB40CE68EE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 12:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B66E10E3FA;
	Mon, 29 Dec 2025 11:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E1610E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 11:39:16 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A9C993F6A7;
 Mon, 29 Dec 2025 12:39:14 +0100 (CET)
Date: Mon, 29 Dec 2025 12:39:13 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Teguh Sobirin <teguh@sobir.in>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Message-ID: <aVJlvFWcq5QMVWYM@SoMainline.org>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
 <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>
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

On 2025-12-28 05:57:12, Dmitry Baryshkov wrote:
> Since DPU 8.x Watchdog timer settings were moved from the TOP to the
> INTF block. Support programming the timer in the INTF block. Fixes tag
> points to the commit which removed register access to thos registers on

thos -> those

> DPU 8.x+ (and which also should have added proper support for WD timer
> on those devices).

Right, yes.  Commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming
through TOP on >= SM8450") was already a fixup of that (though marked as fixing
the followup commit 100d7ef ("drm/msm/dpu: add support for SM8450") for being
the first to use the new DPU_MDP_PERIPH_0_REMOVED flag).

> 
> Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

...
> @@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
>  
>  		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
>  			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> -							 vsync_cfg.vsync_source);
> +							 &vsync_cfg);

In some way this makes me wonder if we simply need another struct, in favour
of not missing fields that are never / not-yet read, although resulting in more
clutter.

(Just a nit / question, not a request)

...
> +	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
> +		u32 reg;
> +
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
> +			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
> +
> +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
> +		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
> +		reg |= BIT(8);		/* enable heartbeat timer */
> +		reg |= BIT(0);		/* enable WD timer */

My downstream also sets BIT(1) for "select default 16 clock ticks":

https://github.com/sonyxperiadev/kernel-techpack-display-driver/blob/61a727e1ce1fda617a73793b2cbb76b5ca846ea2/msm/sde/sde_hw_intf.c#L511

Although it doesn't read back the current register value.  Do we need that; or
maybe you are inferring this "missing" BIT(1) via this readback?

After all downstream removed the readback exactly in favour of setting BIT(1)
though because of a "default value change" since MDSS 9.x.x:

https://github.com/sonyxperiadev/kernel-techpack-display-driver/commit/e55c68138b04770d51067c158f92de526e0c926e

- Marijn
