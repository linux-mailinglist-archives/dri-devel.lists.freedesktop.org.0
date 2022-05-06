Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548351D3C8
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 10:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF7010EFE7;
	Fri,  6 May 2022 08:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0284C10EFD5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 08:54:26 +0000 (UTC)
Received: from p508fcb34.dip0.t-ipconnect.de ([80.143.203.52]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nmtjD-0005t9-LO; Fri, 06 May 2022 10:54:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v11 16/24] arm64: dts: rockchip: rk356x: Add VOP2 nodes
Date: Fri, 06 May 2022 10:54:18 +0200
Message-ID: <8099476.NyiUUSuA9g@phil>
In-Reply-To: <20220506071028.GS4012@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <2508329.Lt9SDvczpP@diego> <20220506071028.GS4012@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 6. Mai 2022, 09:10:28 CEST schrieb Sascha Hauer:
> On Thu, May 05, 2022 at 09:23:03AM +0200, Heiko St=FCbner wrote:
> > Am Donnerstag, 5. Mai 2022, 08:41:31 CEST schrieb Sascha Hauer:
> > > On Thu, May 05, 2022 at 02:28:24AM +0200, Heiko St=FCbner wrote:
> > > > Am Freitag, 22. April 2022, 09:28:33 CEST schrieb Sascha Hauer:
> > > > > The VOP2 is the display output controller on the RK3568. Add the =
node
> > > > > for it to the dtsi file along with the required display-subsystem=
 node
> > > > > and the iommu node.
> > > > >=20
> > > > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > > > Acked-by: Rob Herring <robh@kernel.org>
> > > > > ---
> > > > > +	vop: vop@fe040000 {
> > > > > +		reg =3D <0x0 0xfe040000 0x0 0x3000>, <0x0 0xfe044000 0x0 0x100=
0>;
> > > > > +		reg-names =3D "regs", "gamma_lut";
> > > >=20
> > > > reg-names does not seem to be part of the dt-binding.
> > > > Though now in the vop2-driver I see that the code uses that naming.
> > > >=20
> > > > I guess we might want to just go the vop1-way by using numbered
> > > > platform-resources via a follow-up patch and drop the regnames here?
> > >=20
> > > Or we could document the reg-names properties in a follow-up patch.
> > > Wouldn't that be better?
> >=20
> > Also a possibility. Although that of course leads us into the naming
> > bike-shed ;-) ... i.e. for reg-names I'd do "vop" + "gamme-lut" (dash i=
nstead
> > of underscore) - instead of the ones used right now.
>=20
> I also like dashes better than underscores and "vop" describes it better
> than the generic "reg" name, so at least the two of us don't need to
> dive deeper into the naming bike-shed ;)

:-D ... one problem solved already

> > While using numbered resources would keep the commonality between
> > both vops
>=20
> I like the named resources better, but I'll leave it up to you. You
> decide, I'll create fixup patches in either direction.

ok, then let's go with the named-resources. As we'll need an Ack from
DT-people, we should probably expedite this.

Ideally I guess, do the dt-binding fixup + resend the fixed dt-node patches
with it. From the original series those dt-nodes + the hdmi rate stuff
is the only thing missing and the rates can be a separate thing.

Heiko


