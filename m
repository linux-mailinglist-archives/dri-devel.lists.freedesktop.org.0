Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEDC4FEEA2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 07:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE33B112184;
	Wed, 13 Apr 2022 05:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 565 seconds by postgrey-1.36 at gabe;
 Wed, 13 Apr 2022 05:42:08 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A96D112183
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 05:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id A84EE8061;
 Wed, 13 Apr 2022 05:30:07 +0000 (UTC)
Date: Wed, 13 Apr 2022 08:32:40 +0300
From: Tony Lindgren <tony@atomide.com>
To: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] drm/tidss: Soft Reset DISPC on startup
Message-ID: <YlZgeGPoWv+Z0iYy@atomide.com>
References: <20220314113739.18000-1-devarsht@ti.com>
 <86a07099-1074-e8d1-6d0e-1ce68414b627@ideasonboard.com>
 <20220412212049.gjnel7aubol56azk@earache>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412212049.gjnel7aubol56azk@earache>
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
Cc: Devarsh Thakkar <devarsht@ti.com>, tomba@kernel.org, airlied@linux.ie,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a-bhatia1@ti.com, vigneshr@ti.com,
 laurent.pinchart@ideasonboard.com, jyri.sarha@iki.fi, nikhil.nd@ti.com,
 linux-arm-kernel@lists.infradead.org, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Nishanth Menon <nm@ti.com> [220412 21:18]:
> On 17:24-20220412, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 14/03/2022 13:37, Devarsh Thakkar wrote:
> > > Soft reset the display subsystem controller on startup and wait for
> > > the reset to complete. This helps the scenario where display was
> > > already in use by some other core before the linux was booted.
> > 
> > The reason the omapdrm doesn't do a reset is that the PM features on some of
> > the DSS registers were set and controlled outside dss driver, so the dss
> > driver could not do a reset just like that. That design was carried to the
> > tidss driver, although I'm not sure if the reason is valid on AM6 and J7
> > platforms.
> > 
> > If that reasoning is not valid, this patch is ok and:
> > 
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Yeah seems OK to me for tidss, I don't think there's any other layer to
do this in a generic way for k3 devices currently.

The thing to check here is that the sysconfig register gets properly
initialized to the right state after reset. For PM, likely the syconfig
value after reset is not correct, but that can be reconfigured later on
as needed.

> Tony - sysc control for older omap devices still control this directly?

Yes, for a  reason. The reset affects the entire interconnect target
module, and disabling clockdomain autoidle needs to be considered for
enable. For omaps, the resets are handled in a generic way for all the
TI devices by ti-sysc.

With ti-sysc, the reset is done before probing dss devices on init in
sysc_init_module(). The dss related quirk handling is done in
sysc_pre_reset_quirk_dss(). If needed, we could add support for reset
framework to ti-sysc for omapdrm to call. But so far there has not been
much of a need for that, I think 8250_omap could use reset framework if
available though.

Anyways, sounds like there's no need to do a similar dss reset in
omapdrm.

Regards,

Tony

