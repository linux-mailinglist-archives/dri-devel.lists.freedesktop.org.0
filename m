Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F2D8611CF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 13:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C594610EBFB;
	Fri, 23 Feb 2024 12:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KGyzFhm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AE910EBFA;
 Fri, 23 Feb 2024 12:46:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75C4E6342E;
 Fri, 23 Feb 2024 12:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAACC43330;
 Fri, 23 Feb 2024 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708692372;
 bh=D8T1iuzJvdgAM8BRFbh+hcm3BNH2Qr3Lwn/NyFiXNCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KGyzFhm7ILcP3GXTrYTNj37Jh2zhruTwranObf38pQndYH7SSUnzadWU1wxvtVqj0
 qTGEmV4Z32EIlEq08c7XGJWna2x3lkMwtjveIcgiZzFHU7xsYgbwwdTwGuHnX3OXST
 D1RXLNWq7+TUq2rxjavltUsvelEuCedCo/UgMgiOBANfVyo8HOL+zEYG5v9759klGd
 XzGpmYxdh5qbOaiVl0PTN47io8YGapFWIoQRRXww6R3c5dEImt6XFTlmI66N5sPwyv
 pNjksVmglMRXjR1DsnofXknnuHe1WXJvOO0RcaQUuLlURH0OKARgmF2OmmZCK5jnyA
 DXYjaTvKn/lDA==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rdUwR-000000002kC-3nOA;
 Fri, 23 Feb 2024 13:46:15 +0100
Date: Fri, 23 Feb 2024 13:46:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/6] drm/bridge: aux-hpd: separate allocation and
 registration
Message-ID: <ZdiTlwTOCROGD_AY@hovoldconsulting.com>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-3-johan+linaro@kernel.org>
 <CAA8EJpoxe8BmyFqMC5yrqdx-Sx2VR_2gT3x6WT9MyhdLuw+xmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoxe8BmyFqMC5yrqdx-Sx2VR_2gT3x6WT9MyhdLuw+xmA@mail.gmail.com>
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

On Thu, Feb 22, 2024 at 10:57:07PM +0200, Dmitry Baryshkov wrote:
> On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > Combining allocation and registration is an anti-pattern that should be
> > avoided. Add two new functions for allocating and registering an dp-hpd
> > bridge with a proper 'devm' prefix so that it is clear that these are
> > device managed interfaces.
> >
> >         devm_drm_dp_hpd_bridge_alloc()
> >         devm_drm_dp_hpd_bridge_add()
> >
> > The new interface will be used to fix a use-after-free bug in the
> > Qualcomm PMIC GLINK driver and may prevent similar issues from being
> > introduced elsewhere.
> >
> > The existing drm_dp_hpd_bridge_register() is reimplemented using the
> > above and left in place for now.
> >
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks for reviewing.

> Minor nit below.

> > diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> > index c4c423e97f06..4453906105ca 100644
> > --- a/include/drm/bridge/aux-bridge.h
> > +++ b/include/drm/bridge/aux-bridge.h
> > @@ -9,6 +9,8 @@
> >
> >  #include <drm/drm_connector.h>
> >
> > +struct auxiliary_device;
> > +
> >  #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
> >  int drm_aux_bridge_register(struct device *parent);
> >  #else
> > @@ -19,10 +21,23 @@ static inline int drm_aux_bridge_register(struct device *parent)
> >  #endif
> >
> >  #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
> > +struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
> > +int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
> 
> I had a pretty close idea during prototyping, but I ended up doing it
> as a single function for the following reasons:
> 
> First, this exports the implementation detail that internally the code
> uses an aux device.

That's not an issue. The opposite, with interfaces trying to do too much
and hide details from the developers so that they can no longer reason
about what is going on, is a real problem though.

> Also, by exporting the aux device the code becomes less type-safe. By
> mistake one can call devm_drm_dp_hpd_bridge_add() on any aux device,
> which is not necessarily the HPD bridge.

No. First, that is currently not even an issue either as the
registration interface is safe to use with any aux device.

Second, if you cared about about type-safety you wouldn't have used a
struct device pointer for drm_aux_hpd_bridge_notify() which you back
cast to an aux device.

> I'd prefer to see an opaque device-specific structure instead. WDYT?

That should have been there from the start. But I'm not interested in
cleaning up this mess beyond what is minimally required to fix the
regressions it caused.

This can be reworked for 6.9 or later.

> >  struct device *drm_dp_hpd_bridge_register(struct device *parent,
> >                                           struct device_node *np);
> >  void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);

Johan
