Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79DC6DE2C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 11:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4810E042;
	Wed, 19 Nov 2025 10:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2B110E042
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 10:08:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1vLf6Y-0005Lv-2P; Wed, 19 Nov 2025 11:08:02 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vLf6W-001EIQ-1G;
 Wed, 19 Nov 2025 11:08:00 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <mfe@pengutronix.de>) id 1vLf6W-00C2jC-0s;
 Wed, 19 Nov 2025 11:08:00 +0100
Date: Wed, 19 Nov 2025 11:08:00 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Martin Kepplinger <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [RFC 0/4] how to link a panel to a touchscreen controller driver
Message-ID: <20251119100800.hsaody7emvx4aq67@pengutronix.de>
References: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119065109.910251-1-martink@posteo.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Martin,

On 25-11-19, Martin Kepplinger wrote:
> hi,
> 
> When there's a panel/touchscreen combination that is sold as a combinded
> module (with the reset line shared even), how would I connect the 2
> drivers and make sure the touchscreen driver probes after the panel is ready?
> 
> I have the feeling there is https://docs.kernel.org/driver-api/device_link.html
> for such cases. Can you show me examples of 2 "random" drivers connected
> in this case?

are you aware of the "struct drm_panel_follower" API? This doesn't
ensure that the touchscreen driver is probed after the panel driver, but
it ensures that the touchscreen power-state follows the panel
power-state.

> In the past I also played with CONFIG_RESET_GPIO using the reset-controller
> logic, but I *think* this is more for 2+ of the *same* devices connected.

Unfortunately sharing the same reset line for different devices is not
uncommon. We saw this on NXP IW61x WiFi/BT chips as well. In that
particular case, the API was changed to the reset API which you linked
above, to gain refcount support. This works very well.

> Might there be yet a different way in devicetree I'm not aware of?

You an check for the 'panel' property within the
Documentation/devicetree/bindings/input/.

Regards,
  Marco

> 
> The below patches - for completeness - are only the workaround for what I'd
> like to do, exposing the state of the panel so that the touchscreen can query
> it.
> 
> thank you very much for any hints,
> 
>                                martin
> 
> 
> 
> Guido Günther (2):
>   hack: drm: panel: mantix: Allow to query enabled state
>   hack: Input: edt-ft5x06: hackery to probe after panel
> 
> Martin Kepplinger (2):
>   hack: edt-ft5x06 / panel-mantix-mlaf057we51: declare
>     mantix_panel_prepared() in drm_panel.h
>   hack: arm64: dts: imx8mq-librem5: add purism,panel-librem5-workaround
> 
>  .../boot/dts/freescale/imx8mq-librem5.dtsi    |  1 +
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 12 ++++++++++
>  drivers/input/touchscreen/edt-ft5x06.c        | 22 +++++++++++++++++++
>  include/drm/drm_panel.h                       |  2 ++
>  4 files changed, 37 insertions(+)
> 
> -- 
> 2.47.3
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
