Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70FB8791B1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 11:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B85112D76;
	Tue, 12 Mar 2024 10:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bwpDKae3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7E7112D76;
 Tue, 12 Mar 2024 10:09:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D104C61001;
 Tue, 12 Mar 2024 10:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAFEC433F1;
 Tue, 12 Mar 2024 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710238145;
 bh=AbfRb7Kg3IljFjwdymBcsCC9K7rYKzeKaZKP5Wl6L6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bwpDKae3eYTmJz4L6IDtofbiuUok6opahnBlZq94FCd30Y3GIjgNw5ETcXZQ0R+cL
 HaVf2wBHGruoBOsRZVGRviZ1ELu8yX06EEA21vuhSVigxG4hDCAzW7P8DOFxHhWJKd
 z8bcmOa/UpsQNkrTnjbroOkwelh2nknMidzWfeDIW/o23UvQW4xWEg2fhyxzpgGpLW
 9QBWdpPN5bn7kaDc2jQpgX+8oGSdx+NOgY1SAmr/VYd1fHJb/Uti/hOAfVDbNppxkX
 4ef4Nrwf20XwYhy7qlq0EX2CV1Yf6hq0v+Z06RdToUb3X/WzEfa2H4GZZE/BG6NWRH
 px3uHIF7tsqkw==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rjz4J-000000007YQ-0ATZ;
 Tue, 12 Mar 2024 11:09:11 +0100
Date: Tue, 12 Mar 2024 11:09:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 quic_bjorande@quicinc.com, Rob Clark <robdclark@chromium.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: move link_ready out of HPD event thread
Message-ID: <ZfApxyVAJMK4bL8O@hovoldconsulting.com>
References: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308214532.1404038-1-quic_abhinavk@quicinc.com>
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

On Fri, Mar 08, 2024 at 01:45:32PM -0800, Abhinav Kumar wrote:
> There are cases where the userspace might still send another
> frame after the HPD disconnect causing a modeset cycle after
> a disconnect. This messes the internal state machine of MSM DP driver
> and can lead to a crash as there can be an imbalance between
> bridge_disable() and bridge_enable().

Can you be more specific here? What steps would lead to this issue and
how exactly does is mess with the state machine? Is there an easy way
to reproduce it (e.g. by instrumenting the code with some sleep)?

The hotplug code is really convoluted and having a clear description of
the problem is needed to evaluate the patch (including when revisiting
it some time from now when I've forgotten about how this state machine
works).

As you know, we ran into a related issue on sc8280xp (X13s) since
6.8-rc1, but that did not involve any user space interaction at all.

For reference, there are some more details in this thread:

	https://lore.kernel.org/all/Ze8Ke_M2xHyPYCu-@hovoldconsulting.com/
 
> This was also previously reported on [1] for which [2] was posted
> and helped resolve the issue by rejecting commits if the DP is not
> in connected state.
> 
> The change resolved the bug but there can also be another race condition.
> If hpd_event_thread does not pick up the EV_USER_NOTIFICATION and process it
> link_ready will also not be set to false allowing the frame to sneak in.

How could the event thread fail to pick up the notification event? Or do
you mean there's a race window before it has been processed?

> Lets move setting link_ready outside of hpd_event_thread() processing to
> eliminate a window of race condition.

As we discussed in thread above, this patch does not eliminate the race,
even if it may reduce the race window.
 
> [1] : https://gitlab.freedesktop.org/drm/msm/-/issues/17
> [2] : https://lore.kernel.org/all/1664408211-25314-1-git-send-email-quic_khsieh@quicinc.com/
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> @@ -466,6 +466,8 @@ static int dp_display_notify_disconnect(struct device *dev)
>  {
>  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>  
> +	dp->dp_display.link_ready = false;

As I also pointed out in the other thread, setting link_ready to false
here means that any spurious connect event (during physical disconnect)
will always be processed, something which can currently lead to a leaked
runtime pm reference.

Wasting some power is of course preferred over crashing the machine, but
please take it into consideration anyway.

Especially if your intention with this patch was to address the resets
we saw with sc8280xp which are gone since the HPD notify revert (which
fixed the hotplug detect issue that left the bridge in a
half-initialised state).

> +
>  	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
>  
>  	return 0;

Johan
