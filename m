Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D323B6B037D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4B510E653;
	Wed,  8 Mar 2023 09:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0C10E5CC;
 Wed,  8 Mar 2023 09:57:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58311B81C14;
 Wed,  8 Mar 2023 09:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC892C433EF;
 Wed,  8 Mar 2023 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678269454;
 bh=/qd+skQp3D3bicLZ6MDaLy4rcvPFVnyfrpif2N5UNN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MgfbJIUMMRwxpwbWXHv6F6txlDaVJzWlSLHHT79scaIj2Ljo/M0nFl6jp+ndsgA9R
 RDbPJoCs03kwJFzHeJf39GpgygjC86yeFSuRG2rHEJGzMb96ynm2Hbwii6Q45MasdM
 qSvINrUmWM3qK6ARRlAtHSEyfomEU2mNqylhZy6QSSPrZ+eomHiQ6GwIFRTNSlU6XE
 mjvsZJ89ZG6SoDqkvlQVhX1iAbFShSYBDpPcX/TlzXgEVngYcLO0uoBt9I9rknm/kO
 lCBZutn/gfd4/+gLirBJg5J0FkXOvQ1xSkXMqWKYtNKF4d0FiZXJHR8iMMVWw3CUqZ
 t0aJfADwYxkJA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pZqYs-0005Lo-R4; Wed, 08 Mar 2023 10:58:19 +0100
Date: Wed, 8 Mar 2023 10:58:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm: Initialize mode_config earlier
Message-ID: <ZAhcOiHhlMd/IKu/@hovoldconsulting.com>
References: <20230113041051.4189063-1-quic_bjorande@quicinc.com>
 <eea1c5dc-6bc5-4246-f0e1-0c790de9f078@linaro.org>
 <9a64c685-9ff0-bc1d-e604-e3773ff9edd7@linaro.org>
 <20230117025122.jt3wrjkqfnogu4ci@builder.lan>
 <Y8ZWl85gSpOaLgO4@hovoldconsulting.com>
 <Y86vaTQR7INWezyj@hovoldconsulting.com>
 <20230123171749.GA623918@hu-bjorande-lv.qualcomm.com>
 <Y8+SHQ/klPwusQRj@hovoldconsulting.com>
 <Y/9aGus6jzIHqjoK@hovoldconsulting.com>
 <20230302231704.GA1373835@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302231704.GA1373835@hu-bjorande-lv.qualcomm.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 03:17:04PM -0800, Bjorn Andersson wrote:
> On Wed, Mar 01, 2023 at 02:58:50PM +0100, Johan Hovold wrote:

> > So after debugging this issue a third time, I can conclude that it is
> > still very much present in 6.2.
> > 
> > It appears you looked at the linux-next tree when you concluded that
> > this patch was not needed. In 6.2 the bridge->hpd_cb callback is set
> > before mode_config.funcs is initialised as part of
> > kms->funcs->hw_init(kms).
> > 
> > The hpd DRM changes heading into 6.3 do appear to avoid the NULL-pointer
> > dereference by moving the bridge->hpd_cb initialisation to
> > drm_kms_helper_poll_init() as you mention above.

I can confirm that as expected my reproducer no longer triggers with
6.3-rc1.
 
> > The PMIC GLINK altmode driver still happily forwards notifications
> > regardless of the DRM driver state though, which can lead to missed
> > hotplug events. It seems you need to implement the
> > hpd_enable()/disable() callbacks and either cache or not enable events
> > in fw until the DRM driver is ready.
> > 
> 
> It's not clear to me what the expectation from the DRM framework is on
> this point. We register a drm_bridge which is only capable of signaling
> HPD events (DRM_BRIDGE_OP_HPD), not querying HPD state (DRM_BRIDGE_OP_DETECT).

I think the assumption is that any bridge that can generate hotplug
events also has a way of detecting whether it is connected (i.e.
DRM_BRIDGE_OP_HPD => DRM_BRIDGE_OP_DETECT).

The pmic_glink_altmode driver appears to be the only driver that sets
DRM_BRIDGE_OP_HPD but not DRM_BRIDGE_OP_DETECT.

> Does this imply that any such bridge must ensure that hpd events are
> re-delivered once hpd_enable() has been invoked (we can't invoke it from
> hpd_enable...)?
> 
> Is it reasonable to do this retriggering in the altmode driver? Or is it
> the job of the TCPM (it seems reasonable to not send the PAN_EN message
> until we get hpd_enable()...)?

Are you sure there is no way to query the firmware about the connected
state?

Otherwise, enabling the notification messages when hpd_enable() is
called looks like it should work as the fw currently appears to always
send a disconnected event followed by a connect event if connected.

But that's not going to be enough unless you can also disable events in
fw on hpd_disable() so that the state can again be updated on the next
hpd_enable().

If that's not possible, it seems you need to cache the state in the
driver and hope you get a notification after a suspend cycle if the
state has changed.

But in any case, the DRM documentation is pretty clear on that a bridge
driver should not be calling drm_bridge_hpd_notify() until hpd_enable()
is called (and also not after hpd_disable()) as the pmic_glink_altmode
driver currently do.

	hpd_enable

	Enable hot plug detection. From now on the bridge shall call
	drm_bridge_hpd_notify() each time a change is detected in the
	output connection status, until hot plug detection gets disabled
	with hpd_disable.

	This callback is optional and shall only be implemented by
	bridges that support hot-plug notification without polling.
	Bridges that implement it shall also implement the hpd_disable
	callback and set the DRM_BRIDGE_OP_HPD flag in their
	drm_bridge->ops.

	https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#c.drm_bridge_funcs

Johan
