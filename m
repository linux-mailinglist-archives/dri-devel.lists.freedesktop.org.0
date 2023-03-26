Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BC6C96CD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 18:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D7710E234;
	Sun, 26 Mar 2023 16:24:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96B10E148;
 Sun, 26 Mar 2023 16:24:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 245ADB80D18;
 Sun, 26 Mar 2023 16:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99907C433EF;
 Sun, 26 Mar 2023 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679847857;
 bh=IGEd5W7TwFuc13MCnmwDt/Gvu0l2lx3AZLXmSs0KZaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ewq4zUSujBGB09GG5DHTJZAqjRatXUnzpUniRWLo99ayZFw1yySCLo2zk91eBe0Sc
 v3dPgsrk6chXLJ6ET7r36WegTurp0GuUpIE204OcRI9CK9sC2meRX0lCJuP5WZjB80
 tD5XiysuHatR6TotxgHkfoMpgitiOWYf/7GQMpk8mMNuBbRfuaANfvUHC+UJ9AcF40
 SuwpYT0IBiayVfaFcJebL7haaFs9mGD/2TVivRQVFARLYAGTwicXPjfcSwniKHlBUT
 cKuyRRq1a8JTEb3mYIGuJEOt+cwOufYy9Fe+Pk2zm7QdoQqebm5yhU2ipml982kqAk
 8u8+NIJ7d30LA==
Date: Sun, 26 Mar 2023 09:27:23 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: Re: [PATCH v14 14/14] drm/msm/dp: set self refresh aware based on
 PSR support
Message-ID: <20230326162723.3lo6pnsfdwzsvbhj@ripper>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677774797-31063-15-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 10:03:17PM +0530, Vinod Polimera wrote:
> For the PSR to kick in, self_refresh_aware has to be set.
> Initialize it based on the PSR support for the eDP interface.
> 

When I boot my sc8280xp devices (CRD and X13s) to console with this
patch included I get a login prompt, and then there are no more screen
updates.

Switching virtual terminal (ctrl+alt+fN) causes the screen to redraw.

Blindly login in and launching Wayland works and from then on screen
updates works as expected.

Switching from Wayland to another virtual terminal causes the problem to
re-appear, no updates after the initial refresh, switching back go the
Wayland-terminal crashed the machine.



Reverting this single patch resolves both the issue with the console
updating as exected and flipping between the virtual terminal with
Wayland and the others no longer crashes my machine.

Regards,
Bjorn

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 029e08c..785d766 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -117,6 +117,8 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
>  	if (WARN_ON(!conn_state))
>  		return -ENODEV;
>  
> +	conn_state->self_refresh_aware = dp->psr_supported;
> +
>  	if (!conn_state->crtc || !crtc_state)
>  		return 0;
>  
> -- 
> 2.7.4
> 
