Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540476FF62C
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 17:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408EA10E086;
	Thu, 11 May 2023 15:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CC710E086;
 Thu, 11 May 2023 15:40:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2526619C2;
 Thu, 11 May 2023 15:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C80EC433EF;
 Thu, 11 May 2023 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683819640;
 bh=//YCHN0izg/VsWfOmB6peEqK02YPQEdFXzbMANOXruY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzBfZu5f6wQiV92wXoVyExa/7BfTK/ZgvqHLo3t53uI5HtgRqEBSX5XLpZr5raHAy
 tX9SISUN0TGWnt+aKhh9VVytV6pl6a6QsGlxOqJJZny/wfrMnE7sq55w0CDHMs388+
 oD90KzFckhB52iXunQOP1SxmtMuuOHb79gkmJVuI2W8/2OPlnysjcJY5I1iwh0sfSH
 rjtOX/llHkK2sKIEYn4jFqJI5EFU/Y7BixHALg51mYaFTqZm8Tkyw+O4agw7mRT/f8
 mtqAkHfyILHQHCHQMIH4wGxBEFDVfWo+wSvXE+YjXAoF8wHX8+mq8AmYlsFxWWMpKe
 ep2fy9yQ9T1NA==
Date: Thu, 11 May 2023 08:44:16 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v1 1/2] drm/msm/dp: enable HDP plugin/unplugged
 interrupts to hpd_enable/disable
Message-ID: <20230511154416.67habdpdasy2szvs@ripper>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53ywhgFhJXA9krBo-Ds6ezM0K8n6w0xnVZj+sTJ4qt9cA@mail.gmail.com>
 <6830a829-5b8a-a05a-da6a-5aaaeef23e57@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6830a829-5b8a-a05a-da6a-5aaaeef23e57@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, sean@poorly.run,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 marijn.suijten@somainline.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, Stephen Boyd <swboyd@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 05:39:07PM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/10/2023 4:55 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2023-05-10 13:31:04)
> > > The internal_hpd flag was introduced to handle external DP HPD derived from GPIO
> > > pinmuxed into DP controller.
> > 
> > Was it? It looks more like it was done to differentiate between eDP and
> > DP, because internal_hpd is set only if DRM_BRIDGE_OP_HPD is set on the
> > bridge and we only set the bridge op if the connector type is DP. The
> > assumption looks like if you have DP connector_type, you have the gpio
> > pinmuxed for "dp_hot" mode, which isn't exactly true. We don't treat
> > that gpio as an irq either, because it isn't. Instead the gpio is muxed
> > to the mdss inside the SoC and then that generates an mdss interrupt
> > that's combined with non-HPD things like "video ready".
> > 
> > If that all follows, then I don't quite understand why we're setting
> > internal_hpd to false at all at runtime. It should be set to true at
> > some point, but ideally that point is during probe.
> > 
> 
> Kuogee had the same thought originally but were not entirely sure of this
> part of the commit message in Bjorn's original commit which introduced these
> changes.
> 
> "This difference is not appropriately represented by the "is_edp"
> boolean, but is properly represented by the frameworks invocation of the
> hpd_enable() and hpd_disable() callbacks. Switch the current condition
> to rely on these callbacks instead"
> 
> Does this along with below documentation mean we should generate the hpd
> interrupts only after hpd_enable callback happens?
> 
> " * Call &drm_bridge_funcs.hpd_enable if implemented and register the given
> @cb
>  * and @data as hot plug notification callback. From now on the @cb will be
>  * called with @data when an output status change is detected by the bridge,
>  * until hot plug notification gets disabled with drm_bridge_hpd_disable().
> "
> 
> Bjorn, can you please clarify this?
> 

We currently have 3 cases:

1) DP with GPIO: No downstream drm_bridge are connected, is_edp = false
and internal HPD-logic is in used (internal_hpd = true). Power needs to
be on at all times etc.

2) DP without GPIO: Downstream drm_bridge connected, is_edp = false and
internal HPD-logic should not be used/enabled (internal_hpd = false).
Power doesn't need to be on unless hpd_notify is invoked to tell us that
there's something connected...

3) eDP with or without HPD signal and/or HPD gpio. Downstream
drm_bridge/panel is connected, is_edp = true and internal HPD logic is
short-circuited regardless of the panel providing HPD signal or not.


In #1 dp_bridge_hpd_enable() will be invoked to indicate that the DP
controller is expected to perform HPD handling. In #2
dp_bridge_hpd_enable() will _not_ be invoked, instead some downstream
drm_bridge/panel will get the hpd_enable() callback and will be
responsible to updating the HPD state of the chain, which will cause
hpd_notify to be invoked.


Note that #3 is based entirely on the controller, it has currently no
relation to what is attached. It seems reasonable that this is just
another case of #2 (perhaps just always reporting
connector_status_connected?).

Regards,
Bjorn

> > > HPD plug/unplug interrupts cannot be enabled until
> > > internal_hpd flag is set to true.
> > > At both bootup and resume time, the DP driver will enable external DP
> > > plugin interrupts and handle plugin interrupt accordingly. Unfortunately
> > > dp_bridge_hpd_enable() bridge ops function was called to set internal_hpd
> > > flag to true later than where DP driver expected during bootup time.
> > > 
> > > This causes external DP plugin event to not get detected and display stays blank.
> > > Move enabling HDP plugin/unplugged interrupts to dp_bridge_hpd_enable()/disable() to
> > > set internal_hpd to true along with enabling HPD plugin/unplugged interrupts
> > > simultaneously to avoid timing issue during bootup and resume.
> > > 
> > > Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
> > > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 27 ++++++++++++++-------------
> > >   1 file changed, 14 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 3e13acdf..71aa944 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1801,15 +1788,29 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
> > >   {
> > >          struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
> > >          struct msm_dp *dp_display = dp_bridge->dp_display;
> > > +       struct dp_display_private *dp;
> > > +
> > > +       dp = container_of(dp_display, struct dp_display_private, dp_display);
> > > 
> > >          dp_display->internal_hpd = true;
> > 
> > Can we set internal_hpd to true during probe when we see that the hpd
> > pinmux exists? Or do any of these bits toggle in the irq status register
> > when the gpio isn't muxed to "dp_hot" or the controller is for eDP and
> > it doesn't have any gpio connection internally? I'm wondering if we can
> > get by with simply enabling the "dp_hot" pin interrupts
> > (plug/unplug/replug/irq_hpd) unconditionally and not worrying about them
> > if eDP is there (because the pin doesn't exist inside the SoC), or if DP
> > HPD is being signalled out of band through type-c framework.
