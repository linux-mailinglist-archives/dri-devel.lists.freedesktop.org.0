Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B810B4451CF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 11:57:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27A6EAB0;
	Thu,  4 Nov 2021 10:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961656EAB0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 10:57:03 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id n8so6575460plf.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HI6OL2hUqXH1cbKP1U0E29lTlSyKIQ0fy7Vbh2BV6VE=;
 b=gceXa5J7JjyQ9Yag7zDi31i1euTnulZ386u0RoIgvYpdDrEsfOnAauedFneRhV6hLN
 +mrmOuudk0kLesFcw02jboeYzblDZDPsVQQqCBvd78oFf+eNXJpFPmkoZsL2qyoj/BlH
 l91f1XmK/IBXX4zgJ0JT/bL8s6uf2QzLPAK4kiQ5JWj60Ib87lQqRbzgsJFRYUThWOoa
 xR5RxDG2IjjzoO13W3jvy9rNx/WdezQbxjTOv0vVZH+cxccm+i+1PFDAGWnlArI66z0c
 RCJDqzx85fOZ6MDU/mPUOHCJmCB6U8AHYq1z9BLlEv85fCihqmzHpbiyjmrtj/D/ZwIb
 P3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HI6OL2hUqXH1cbKP1U0E29lTlSyKIQ0fy7Vbh2BV6VE=;
 b=MRvNEmyvVf7PWfflb3NmriqMQHmf91/xHXxWC0sALeDt3bt0mKNlbW8kJD6rbWpb4Y
 LqO+W+UnTi7Tod44hRfspGeyEocScCda2KdNdwMxAfExcd4gpS1H4eedIiy5O6WdCOaM
 olSjjUMuInLWts7bsEmWWxMfqBRFpb0tomUvRzratBxF6bsoZiujyi3kVYNxCd+qH252
 5P2jMm+nEdr2ZiCkYjW3/BTSBCx/3HNJj84nBNE3ISRQnl9PUlCipRwD9Zcvi9UJSEWM
 EO0a/P6hyilG4AtUJzCcrhpv5UK7AazLX4U3KC+9xTGyLl/CE2VaCjEnfy5d5Dv54xKN
 atxw==
X-Gm-Message-State: AOAM5303YbdahFT8fgRTe9Im3sQ8dUPH+lJjfuWbh/kHkzcHZCw+o7qH
 fjKq8Lkaipq9Q1yylxyn82HS7GuW6PY/iybcQ8jTUOXGzq862Q==
X-Google-Smtp-Source: ABdhPJxiNaI3r+C/e/5etdLrsfc4tUQRjvE+SamtOt+KPuwKZ5nCJFUQaUuYrSHt2fswdIiEse3pXH9Abe1ZChBJ+h8=
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr9467300pjb.232.1636023423138; 
 Thu, 04 Nov 2021 03:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211103135112.v3.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
In-Reply-To: <20211103135112.v3.1.I67612ea073c3306c71b46a87be894f79707082df@changeid>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Nov 2021 11:56:51 +0100
Message-ID: <CAG3jFys5iB-HwK1gc4FJFX0mAWbPLE8ZQH64LoKgXyhk+eSPFA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: Make PSR-exit block less
To: Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Zain Wang <wzz@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, stable@vger.kernel.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Brian,

On Wed, 3 Nov 2021 at 21:52, Brian Norris <briannorris@chromium.org> wrote:
>
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
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
> ---
> CC list is partially constructed from the commit message of the Fixed
> commit
>
> Changes in v3:
>  - Fix the exiting/entering comment (a reviewer noticed off-mailing-list
>    that I got it backwards)
>  - Add Reviewed-by
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
> index cab6c8b92efd..6a4f20fccf84 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -998,11 +998,21 @@ int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>         if (!blocking)
>                 return 0;
>
> +       /*
> +        * db[1]!=0: entering PSR, wait for fully active remote frame buffer.
> +        * db[1]==0: exiting PSR, wait for either
> +        *  (a) ACTIVE_RESYNC - the sink "must display the
> +        *      incoming active frames from the Source device with no visible
> +        *      glitches and/or artifacts", even though timings may still be
> +        *      re-synchronizing; or
> +        *  (b) INACTIVE - the transition is fully complete.
> +        */
>         ret = readx_poll_timeout(analogix_dp_get_psr_status, dp, psr_status,
>                 psr_status >= 0 &&
>                 ((vsc->db[1] && psr_status == DP_PSR_SINK_ACTIVE_RFB) ||
> -               (!vsc->db[1] && psr_status == DP_PSR_SINK_INACTIVE)), 1500,
> -               DP_TIMEOUT_PSR_LOOP_MS * 1000);
> +               (!vsc->db[1] && (psr_status == DP_PSR_SINK_ACTIVE_RESYNC ||
> +                                psr_status == DP_PSR_SINK_INACTIVE))),
> +               1500, DP_TIMEOUT_PSR_LOOP_MS * 1000);
>         if (ret) {
>                 dev_warn(dp->dev, "Failed to apply PSR %d\n", ret);
>                 return ret;
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>


Applied to drm-misc-next
