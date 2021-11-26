Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D3F45E910
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 09:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4873B6E874;
	Fri, 26 Nov 2021 08:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85EF6E874
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:15:48 +0000 (UTC)
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mqWOX-0008Mz-Bs; Fri, 26 Nov 2021 09:15:45 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 08/12] arm64: dts: rockchip: rk356x: Add VOP2 nodes
Date: Fri, 26 Nov 2021 09:15:44 +0100
Message-ID: <2143457.uCsENmBeE3@diego>
In-Reply-To: <20211126074021.GH28260@pengutronix.de>
References: <20211117143347.314294-1-s.hauer@pengutronix.de>
 <8451aeb1-03c9-6c90-c95e-c4a76e2159b8@gmail.com>
 <20211126074021.GH28260@pengutronix.de>
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

Am Freitag, 26. November 2021, 08:40:21 CET schrieb Sascha Hauer:
> On Thu, Nov 25, 2021 at 09:25:28PM +0100, Johan Jonker wrote:
> > Hi Sascha,
> > 
> > 
> > On 11/17/21 3:33 PM, Sascha Hauer wrote:
> > > The VOP2 is the display output controller on the RK3568. Add the node
> > > for it to the dtsi file along with the required display-subsystem node
> > > and the iommu node.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 52 ++++++++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > index 46d9552f60284..6ebf7c14e096a 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > @@ -447,6 +447,58 @@ gmac1_mtl_tx_setup: tx-queues-config {
> > >  		};
> > >  	};
> > >  
> > 
> > > +	display_subsystem: display-subsystem {
> > > +		compatible = "rockchip,display-subsystem";
> > > +		ports = <&vop_out>;
> > > +	};
> > 
> > Some DT sort rules:
> > 
> > For nodes:
> > Sort things without reg alphabetical first,
> > then sort the rest by reg address.
> > 
> > > +
> > > +	vop: vop@fe040000 {
> > 
> > > +		compatible = "rockchip,rk3568-vop";
> > 
> > From rockchip-vop2.yaml:
> > +properties:
> > +  compatible:
> > +    enum:
> > 
> > +      - rockchip,rk3568-vop
> > +      - rockchip,rk3566-vop
> > 
> > Maybe sort yaml compatibles in alphabetical order.
> > 
> > rockchip,rk3566-vop is not used in the dtsi I think.
> > 
> > Comment by Andy Yan:
> > > 
> > > But take care that the vop on rk3566 has a special limitation: there are 
> > > three
> > > 
> > > windows(Cluster1/Esmart1/Smart1) that have a mirror lock, that means they
> > > 
> > > can't be programed framebuffer address independently , they can only
> > > 
> > > share framebuffer address with Cluster0/Esmart0/Smart0.
> > 
> > Question:
> > Given Andy's comment could someone explain weather the vop and hdmi
> > nodes should be in rk3566.dtsi and rk3568.dtsi with an extra
> > rockchip,rk3566-dw-hdmi compatible?
> 
> We could put the vop/hdmi nodes into rk356x.dtsi and just add the
> compatible properties to rk3566.dtsi and rk3568.dtsi.

sounds about right. We have similar solutions in place in other socs.

Heiko



