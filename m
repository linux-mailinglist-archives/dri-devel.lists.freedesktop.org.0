Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B16437FC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 23:23:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D450C10E11C;
	Mon,  5 Dec 2022 22:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA51710E08C;
 Mon,  5 Dec 2022 22:23:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E1136148E;
 Mon,  5 Dec 2022 22:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8C2C433C1;
 Mon,  5 Dec 2022 22:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670278995;
 bh=r7Zbs6ql/zVmwGxY0A2vvhLYDbx61rLzdNI7bJloNmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N25sRvjt9ynOVmKtUWr0551Jy3GiEGY9HV0ZbMTMbrQhtsBGGuL+iODpFpZh9eC57
 1VK5Lk6yv6A0eaec8NaewtUYlPqqQuIg87EkXNMhgKHy9I9fwBdoEx51CSZGGJbIpk
 geaYrLTRQTPmafEXuW4dElMoWSHXSqulhMgtI+5ACu5dXmSQqlY3K3DjOnmGSVci0J
 HI+cIbhqJw+7EqnCAcjjw/HOopBqtWv2ixtqM2TRhzdtOZTrJKQtmPcR0SgFreDZDk
 Lrhn6rLJqLZSqTA7XxIepXKyRODqo9QYmRUtONBdWqPG9HGX6/YWug4tB6VObC/Qx0
 kb5rT6Xk3Sm9g==
Date: Mon, 5 Dec 2022 16:23:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 08/13] drm/msm/dp: Implement hpd_notify()
Message-ID: <20221205222312.gmg65h35d44zigg4@builder.lan>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-9-quic_bjorande@quicinc.com>
 <4E586110-168A-4D47-966F-357DF042AFC7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E586110-168A-4D47-966F-357DF042AFC7@linaro.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 06, 2022 at 12:29:13AM +0300, Dmitry Baryshkov wrote:
> 
> 
> On 5 December 2022 20:44:28 GMT+03:00, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >From: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> >The DisplayPort controller's hot-plug mechanism is based on pinmuxing a
> >physical signal on a GPIO pin into the controller. This is not always
> >possible, either because there aren't dedicated GPIOs available or
> >because the hot-plug signal is a virtual notification, in cases such as
> >USB Type-C.
> >
> >For these cases, by implementing the hpd_notify() callback for the
> >DisplayPort controller's drm_bridge, a downstream drm_bridge
> >(next_bridge) can be used to track and signal the connection status
> >changes.
> >
> >This makes it possible to use downstream drm_bridges such as
> >display-connector or any virtual mechanism, as long as they are
> >implemented as a drm_bridge.
> >
> >Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >[bjorn: Drop connector->fwnode assignment and dev from struct msm_dp]
> >Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Minor nit: if for the next revision you reorder the patches to have
> hpd_enable first, then missing conditions, then this patch, it will
> look more logical.

You're right, that will look better. I'll do so.

Thanks,
Bjorn

> 
> >---
> >
> >Changes since v3:
> >- None
> >
> > drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++++++++++++
> > drivers/gpu/drm/msm/dp/dp_drm.c     |  1 +
> > drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
> > 3 files changed, 25 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >index 666b45c8ab80..17fcf8cd84cd 100644
> >--- a/drivers/gpu/drm/msm/dp/dp_display.c
> >+++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >@@ -1772,3 +1772,25 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> > 	dp_display->dp_mode.h_active_low =
> > 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> > }
> >+
> >+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >+			  enum drm_connector_status status)
> >+{
> >+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
> >+	struct msm_dp *dp_display = dp_bridge->dp_display;
> >+	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
> >+
> >+	/* Without next_bridge interrupts are handled by the DP core directly */
> >+	if (!dp_display->next_bridge)
> >+		return;
> >+
> >+	if (!dp->core_initialized) {
> >+		drm_dbg_dp(dp->drm_dev, "not initialized\n");
> >+		return;
> >+	}
> >+
> >+	if (!dp_display->is_connected && status == connector_status_connected)
> >+		dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> >+	else if (dp_display->is_connected && status == connector_status_disconnected)
> >+		dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> >+}
> >diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> >index 6db82f9b03af..3898366ebd5e 100644
> >--- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >@@ -102,6 +102,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
> > 	.get_modes    = dp_bridge_get_modes,
> > 	.detect       = dp_bridge_detect,
> > 	.atomic_check = dp_bridge_atomic_check,
> >+	.hpd_notify   = dp_bridge_hpd_notify,
> > };
> > 
> > struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> >diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> >index 82035dbb0578..79e6b2cf2d25 100644
> >--- a/drivers/gpu/drm/msm/dp/dp_drm.h
> >+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> >@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
> > void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> > 			const struct drm_display_mode *mode,
> > 			const struct drm_display_mode *adjusted_mode);
> >+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
> >+			  enum drm_connector_status status);
> > 
> > #endif /* _DP_DRM_H_ */
> 
> -- 
> With best wishes
> Dmitry
