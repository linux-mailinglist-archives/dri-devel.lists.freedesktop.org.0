Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36844BB3BE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 09:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8B10EBA1;
	Fri, 18 Feb 2022 08:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFBC10EC2F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 08:00:29 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKyBn-0001Pb-Fj; Fri, 18 Feb 2022 09:00:27 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKyBk-0006aK-Mo; Fri, 18 Feb 2022 09:00:24 +0100
Date: Fri, 18 Feb 2022 09:00:24 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Message-ID: <20220218080024.GU18637@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <e1eb945b-d7da-f21c-ee19-e19f7f1d9b04@rock-chips.com>
 <20220217135823.GR18637@pengutronix.de> <6072461.kR79ftKOrO@diego>
 <8c0b1d1e-6787-8edc-c1fd-e1b68b92e60e@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c0b1d1e-6787-8edc-c1fd-e1b68b92e60e@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:48:57 up 69 days, 16:34, 71 users,  load average: 0.11, 0.13, 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 11:50:32AM +0800, Andy Yan wrote:
> Hi Sascha:
> 
> On 2/17/22 22:06, Heiko Stübner wrote:
> > Am Donnerstag, 17. Februar 2022, 14:58:23 CET schrieb Sascha Hauer:
> > > Hi Andy,
> > > 
> > > Please trim the context in your answers to the relevant parts, it makes
> > > it easier to find the things you said.
> > > 
> > > On Thu, Feb 17, 2022 at 08:00:11PM +0800, Andy Yan wrote:
> > > > Hi Sascha:
> > > > 
> > > > > +
> > > > > +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> > > > > +		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> > > > > +		struct device_node *node, *parent;
> > > > > +
> > > > > +		parent = of_get_parent(rkencoder->port);
> > > > > +
> > > > > +		for_each_endpoint_of_node(parent, node) {
> > > > Is there any hurt directly use our downstream vendor kernel method here: use
> > > > vcstate->output_if set by encoder driver to get which interface we should
> > > > enable here?
> > > There is no vcstate->output_if in mainline currently. Ok, we could add
> > > that. The other thing is that there are multiple HDMI interfaces and
> > > the id of the HDMI encoder is encoded into output_if. Downstream kernel
> > > adds OF aliases to the HDMI ports. I didn't want to go that route
> > > because it doesn't seem to be very elegant to me.
> aliases is a very comm strategy in device tree world.

Yes, but not for retrieving bit offsets into registers. Normally aliases
can be changed at board level without confusing drivers.

> And your method also
> add need additional dt binds to define RK3568_VOP2_EP_xxx
> > > > You method is ok with device tree,  but it tied up this driver to device
> > > > tree, we are now tring to extend vop2 driver work with ACPI, so we hope this
> > > > driver can be much more flexible.
> > > The current rockchip drm driver seems to be pretty much tied to device
> > > tree. There are probably many other places that need parallel paths for
> > > ACPI support, I think we can delay this particular part until we see the
> > > whole picture. In the end we can still retrieve the output_if
> > > information differently with ACPI while still retrieving the information
> > > from the device tree the way we are doing currently.
> 
> The current driver only reference device thee at driver initial, we not wrap
> 
> device tree related things in other parts, so if we extend it to support
> ACPI,
> 
> we just need modify the initial code, this make things easier.

The device tree parsing could be moved out of vop2_crtc_atomic_enable()
into some initialisation path. In the end it's static information,
there's no need to do it repeatedly in atomic_enable.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
