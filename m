Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD17989B39A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Apr 2024 20:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5220810F943;
	Sun,  7 Apr 2024 18:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pyl6UNvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD1F10F122;
 Sun,  7 Apr 2024 18:48:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDEED60C3B;
 Sun,  7 Apr 2024 18:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9CCC433C7;
 Sun,  7 Apr 2024 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712515717;
 bh=YGFL1rkFv9aHtvgb46NeWxJpN7qYol8+cNvtNhFDkCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pyl6UNvIbYI3c4IpK/hoKJTP/kgWHmMsvZ1wbHIcTFpvfe6hQNnVhV4PCE4mh14W1
 YebkZ3hZy4p7pIFeRykLxhZ3wYBVEv1OaFf+Jb8fmfmz6ItLA/WBTJ/RXPDrZYiO8U
 UdKWyXxVqBwO2N9t65LfWwJFZc82BoklTIb0/ZCD6SVztRkuSLBtIGZzXRKisPeoq9
 wVOh4Bx8iUnXk27FE0DwVLBBw4Txb0bRlxFuadNJhX43ppfumwtWATCxEzmL+Mw8Kt
 7wLrrPBVCSofKJhXXSpqYTUaZ2Ut3c8vTHOiLWabRZZJlhd8BVNzb6Qrq2GpvQFKit
 aJW8RejIGGZnA==
Date: Sun, 7 Apr 2024 13:48:34 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_bjorande@quicinc.com, johan@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: call dp_hpd_plug_handle()/unplug_handle()
 directly for external HPD
Message-ID: <ale6wbwzkfagcg2q6glb4vsxu3pthhkk3tquv2ixlatbdryqvh@xscsq2h6emho>
References: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406031548.25829-1-quic_abhinavk@quicinc.com>
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

On Fri, Apr 05, 2024 at 08:15:47PM -0700, Abhinav Kumar wrote:
> From: Kuogee Hsieh <quic_khsieh@quicinc.com>
[..]
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d80f89581760..bfb6dfff27e8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1665,7 +1665,7 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  		return;
>  
>  	if (!dp_display->link_ready && status == connector_status_connected)
> -		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		dp_hpd_plug_handle(dp, 0);

If I read the code correctly, and we get an external connect event
inbetween a previous disconnect and the related disable call, this
should result in a PLUG_INT being injected into the queue still.

Will that not cause the same problem?

Regards,
Bjorn

>  	else if (dp_display->link_ready && status == connector_status_disconnected)
> -		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		dp_hpd_unplug_handle(dp, 0);
>  }
> -- 
> 2.43.2
> 
