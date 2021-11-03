Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435914448FB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 20:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9C36EA7C;
	Wed,  3 Nov 2021 19:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28E66E9D4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 19:31:47 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id q203so4032888iod.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/Y3mjLIS01qa8XXnmm8AMYi6L9auIu0M6Uelm2LfL/Q=;
 b=bLOril2fPuSEumCnf3hZ8ZEdSwDqiPHRmXlLPCpb7I6pXdEVEe1CEQjX2dkt97hAxC
 w/hlrQKOdzMMshDhCZr+23hjrpMeVFs38iLh76ZydsOQuLHjPqWpsJS8RqUl6mtJWaKf
 i26yexrWd+VmjPCC+QmvOFMPXJbx7oKA/5FVLkVi5Y7pslik2DKxtunr9Pu5/02JSTEt
 dTnB0Ny4UkI8zVPbgk3TzNtcDALYfeW1XkLhufNx5hFVrQCL14BBe65MMLZtzEoQR3ma
 WDv4yTAxyVedGBPodkIdEUjgZETt6vZD+NZag869Nra+Dgtm6mq7z6DjTeC5X35aFqUI
 f9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/Y3mjLIS01qa8XXnmm8AMYi6L9auIu0M6Uelm2LfL/Q=;
 b=tRUf76ROtNkapoV0EIbI+nPzA6MvxhldQzTCbwEBuxESZ9NAM9lm6uhQJg6QGHZA2C
 k5AlYg6PdtEZq4K7kYyO0awb4CMZRsOuE8eFlND849RhL4R6v+YZvHLu9h/H4Sh2jXbX
 YwoTo9y/dqVVHhXJ4QQinYDTu4mJCbW/Ma89HOy5V7ZJ2RURpVKivYA/6xNQBAByD/6s
 PykMEJhO22WnFfpt5fIlN4fYCEpkbxZlu6dKaW2gdCO5N9hLAQUYoYHnrp5wJq00i032
 1V+YeVbd3XY+xq88ufujTCSo3AFsluTMCiJ+8Om+bw5/7MXK/3nzk0xuMTe7/4giUlxN
 +NBQ==
X-Gm-Message-State: AOAM53371rEoUkfEJ9fF2mo559NvwQo6p+n918+crFxFjoeIMY3bM6Cn
 lyBw/klA/fvWHBCG0xfOGE6BjA==
X-Google-Smtp-Source: ABdhPJzUB9iACqPsp+38R1Fj5f5Mz+BprkKagKdv6MhY0zj43Ky7VwNBN2ubwxqayHoF/z5ZIU/hgA==
X-Received: by 2002:a5d:8903:: with SMTP id b3mr33733679ion.44.1635967906967; 
 Wed, 03 Nov 2021 12:31:46 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id s15sm1915546ilu.16.2021.11.03.12.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 12:31:46 -0700 (PDT)
Date: Wed, 3 Nov 2021 15:31:45 -0400
From: Sean Paul <sean@poorly.run>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Make PSR-exit block less
Message-ID: <20211103193145.GG10475@art_vandelay>
References: <20211029165044.v2.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029165044.v2.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Zain Wang <wzz@rock-chips.com>,
 Sean Paul <seanpaul@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, stable@vger.kernel.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 29, 2021 at 04:50:55PM -0700, Brian Norris wrote:
> Prior to commit 6c836d965bad ("drm/rockchip: Use the helpers for PSR"),
> "PSR exit" used non-blocking analogix_dp_send_psr_spd(). The refactor
> started using the blocking variant, for a variety of reasons -- quoting
> Sean Paul's potentially-faulty memory:
> 
> """
>  - To avoid racing a subsequent PSR entry (if exit takes a long time)
>  - To avoid racing disable/modeset
>  - We're not displaying new content while exiting PSR anyways, so there
>    is minimal utility in allowing frames to be submitted
>  - We're lying to userspace telling them frames are on the screen when
>    we're just dropping them on the floor
> """
> 
> However, I'm finding that this blocking transition is causing upwards of
> 60+ ms of unneeded latency on PSR-exit, to the point that initial cursor
> movements when leaving PSR are unbearably jumpy.
> 
> It turns out that we need to meet in the middle somewhere: Sean is right
> that we were "lying to userspace" with a non-blocking PSR-exit, but the
> new blocking behavior is also waiting too long:
> 
> According to the eDP specification, the sink device must support PSR
> entry transitions from both state 4 (ACTIVE_RESYNC) and state 0
> (INACTIVE). It also states that in ACTIVE_RESYNC, "the Sink device must
> display the incoming active frames from the Source device with no
> visible glitches and/or artifacts."
> 
> Thus, for our purposes, we only need to wait for ACTIVE_RESYNC before
> moving on; we are ready to display video, and subsequent PSR-entry is
> safe.
> 
> Tested on a Samsung Chromebook Plus (i.e., Rockchip RK3399 Gru Kevin),
> where this saves about 60ms of latency, for PSR-exit that used to
> take about 80ms.
> 
> Fixes: 6c836d965bad ("drm/rockchip: Use the helpers for PSR")
> Cc: <stable@vger.kernel.org>
> Cc: Zain Wang <wzz@rock-chips.com>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Sean Paul <seanpaul@chromium.org>

Thank you for revising this!

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> CC list is partially constructed from the commit message of the Fixed
> commit
> 
> Changes in v2:
>  - retitled subject (previous: "drm/bridge: analogix_dp: Make
>    PSR-disable non-blocking")
>  - instead of completely non-blocking, make this "less"-blocking
>  - more background (thanks Sean!)
>  - more specification details
> 
>  drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> index cab6c8b92efd..f8e119e84ae2 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -998,11 +998,21 @@ int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>  	if (!blocking)
>  		return 0;
>  
> +	/*
> +	 * db[1]==0: entering PSR, wait for fully active remote frame buffer.
> +	 * db[1]!=0: exiting PSR, wait for either
> +	 *  (a) ACTIVE_RESYNC - the sink "must display the
> +	 *      incoming active frames from the Source device with no visible
> +	 *      glitches and/or artifacts", even though timings may still be
> +	 *      re-synchronizing; or
> +	 *  (b) INACTIVE - the transition is fully complete.
> +	 */
>  	ret = readx_poll_timeout(analogix_dp_get_psr_status, dp, psr_status,
>  		psr_status >= 0 &&
>  		((vsc->db[1] && psr_status == DP_PSR_SINK_ACTIVE_RFB) ||
> -		(!vsc->db[1] && psr_status == DP_PSR_SINK_INACTIVE)), 1500,
> -		DP_TIMEOUT_PSR_LOOP_MS * 1000);
> +		(!vsc->db[1] && (psr_status == DP_PSR_SINK_ACTIVE_RESYNC ||
> +				 psr_status == DP_PSR_SINK_INACTIVE))),
> +		1500, DP_TIMEOUT_PSR_LOOP_MS * 1000);
>  	if (ret) {
>  		dev_warn(dp->dev, "Failed to apply PSR %d\n", ret);
>  		return ret;
> -- 
> 2.33.1.1089.g2158813163f-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
