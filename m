Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5254BA277
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADFD10EC1A;
	Thu, 17 Feb 2022 14:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE4210EC33
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 14:06:19 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nKhQG-0006ci-1D; Thu, 17 Feb 2022 15:06:16 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v6 21/23] drm: rockchip: Add VOP2 driver
Date: Thu, 17 Feb 2022 15:06:15 +0100
Message-ID: <6072461.kR79ftKOrO@diego>
In-Reply-To: <20220217135823.GR18637@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <e1eb945b-d7da-f21c-ee19-e19f7f1d9b04@rock-chips.com>
 <20220217135823.GR18637@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 17. Februar 2022, 14:58:23 CET schrieb Sascha Hauer:
> Hi Andy,
> 
> Please trim the context in your answers to the relevant parts, it makes
> it easier to find the things you said.
> 
> On Thu, Feb 17, 2022 at 08:00:11PM +0800, Andy Yan wrote:
> > Hi Sascha:
> > 
> > > +
> > > +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> > > +		struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> > > +		struct device_node *node, *parent;
> > > +
> > > +		parent = of_get_parent(rkencoder->port);
> > > +
> > > +		for_each_endpoint_of_node(parent, node) {
> > 
> > Is there any hurt directly use our downstream vendor kernel method here: use
> > vcstate->output_if set by encoder driver to get which interface we should
> > enable here?
> 
> There is no vcstate->output_if in mainline currently. Ok, we could add
> that. The other thing is that there are multiple HDMI interfaces and
> the id of the HDMI encoder is encoded into output_if. Downstream kernel
> adds OF aliases to the HDMI ports. I didn't want to go that route
> because it doesn't seem to be very elegant to me.
> 
> > 
> > You method is ok with device tree,  but it tied up this driver to device
> > tree, we are now tring to extend vop2 driver work with ACPI, so we hope this
> > driver can be much more flexible.
> 
> The current rockchip drm driver seems to be pretty much tied to device
> tree. There are probably many other places that need parallel paths for
> ACPI support, I think we can delay this particular part until we see the
> whole picture. In the end we can still retrieve the output_if
> information differently with ACPI while still retrieving the information
> from the device tree the way we are doing currently.

agreed :-) .

I.e. adding ACPI support for Rockchip drivers separately later on
makes things way easier.

Having a separate discussion about ACPI changes at that point
also makes the whole process easier, as adding the whole thing
here will delay everything even more.

Also if a later series really only is about adding ACPI support, this
makes for easier discussion but also easier review of changes.
The new VOP2 driver is big enough as it is.


Heiko


