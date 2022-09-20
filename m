Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A25BE160
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DC110E4AF;
	Tue, 20 Sep 2022 09:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544C810E4AF;
 Tue, 20 Sep 2022 09:06:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B24C36274A;
 Tue, 20 Sep 2022 09:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E58C433D6;
 Tue, 20 Sep 2022 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663664788;
 bh=6pYIi9glaYZlye/aQHBoMpVkZ1qcD8dJmGfOqYp0ROA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fUD8S2gvOniifTyASmpBcDPIJdMlH8cRZA4WNglMYAr0pYRbk+Zw4hK34lc+dq20g
 I51hhRJ9LhYOzCL/W3aridwhiHSOGHKpEibeUa6BYHz7PrE3D072LoJ8eWqt2ywMHy
 oiPv4Dl5cuEuMknH2wHA7UGt/l2rw75KZrz0oF9k69yFtgkUbhkMsxbCFxn4POyG7W
 J2fN42NBPcPXPdQsiOE2Sa2mR+zPMVr9qxbsT5hU9SLMcnxECbTwlp2uICH5vFAtPV
 GeNPbY959ihZSBZmuOFuL3Tl3tS1nXoFHezTwXXvvN9ZlS1hsgtBARVHQMUm1mb85f
 k8PuqZSa7AOxg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oaZD4-0002LH-9A; Tue, 20 Sep 2022 11:06:30 +0200
Date: Tue, 20 Sep 2022 11:06:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/10] drm/msm: probe deferral fixes
Message-ID: <YymCll02tRIMb+9Z@hovoldconsulting.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913085320.8577-1-johan+linaro@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 10:53:10AM +0200, Johan Hovold wrote:
> The MSM DRM driver is currently broken in multiple ways with respect to
> probe deferral. Not only does the driver currently fail to probe again
> after a late deferral, but due to a related use-after-free bug this also
> triggers NULL-pointer dereferences.
> 
> These bugs are not new but have become critical with the release of
> 5.19 where probe is deferred in case the aux-bus EP panel driver has not
> yet been loaded.
> 
> The underlying problem is lifetime issues due to careless use of
> device-managed resources.

Any chance of getting this merged for 6.1?

Johan

> Changes in v2
>  - use a custom devres action instead of amending the AUX bus interface
>    (Doug)
>  - split sanity check fixes and cleanups per bridge type (Dmitry)
>  - add another Fixes tag for the missing bridge counter reset (Dmitry)
> 
> 
> Johan Hovold (10):
>   drm/msm: fix use-after-free on probe deferral
>   drm/msm/dp: fix memory corruption with too many bridges
>   drm/msm/dsi: fix memory corruption with too many bridges
>   drm/msm/hdmi: fix memory corruption with too many bridges
>   drm/msm/dp: fix IRQ lifetime
>   drm/msm/dp: fix aux-bus EP lifetime
>   drm/msm/dp: fix bridge lifetime
>   drm/msm/hdmi: fix IRQ lifetime
>   drm/msm/dp: drop modeset sanity checks
>   drm/msm/dsi: drop modeset sanity checks
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_parser.c  |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  5 +++--
>  drivers/gpu/drm/msm/dsi/dsi.c       |  9 +++++----
>  drivers/gpu/drm/msm/hdmi/hdmi.c     |  7 ++++++-
>  drivers/gpu/drm/msm/msm_drv.c       |  1 +
>  6 files changed, 37 insertions(+), 17 deletions(-)
