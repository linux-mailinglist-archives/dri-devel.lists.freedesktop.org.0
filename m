Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E722C86698F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 06:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0010EE18;
	Mon, 26 Feb 2024 05:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="p9ySF9IQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Mon, 26 Feb 2024 05:12:17 UTC
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DAA10EE18
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 05:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1708923427; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=S9/egMTPtcK0XTfnP9q6hh4uwDIf4SH7mvB7B//loFH77TgHuG6C2eyT1uy0BTMmE2mhBatdg2QG+V9x8+nzEg80tAbYjeBurf8rxAceOpVGMtJYIkPHCTtWS7ywW1QdMLiSCWWrRUFQ1G83R9JxH06F2RgRHIAhJinILJP1csg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1708923427;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QrAILGTlcUzfFUd66MJkWp2t/tRwrE6wC4UtelAjn54=; 
 b=TZrdFEPMPHMgm40I0n2fVtPCCMR4CzPNWq0/vNjM9Sq9gRB3NJYzJw1y7MFUkbOslUu6Ts0bZOA2rW6C+R1c0kDy9M/rsV1xKV+1h5rn//sMzGWsDdQoYrtXwtQy9i87Kj1nxdIOJ/zc/yeXW++qLNCqASftpa4sJUrhG8uzEko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1708923427; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=QrAILGTlcUzfFUd66MJkWp2t/tRwrE6wC4UtelAjn54=;
 b=p9ySF9IQVfZPeDuN3uhEIHKojM87TDibcGyxFn5fW1M9y+0mj8hG1090eN1PxpZu
 8HZ7D7iTYvpIRvei6Tst9iMAU5iIBplr9wk0Gbph4LwrcNW0wk/awHDUrY8YdQZzJ9B
 yrsxq8JEDVpHaUt/m8evr7TmJb01ty3ke1FcAadg5tI+cK1WxHuDUbvnaj6MtHbXR0p
 dhOAn4XRifxDvga/T+iX5VcIXvyASoI4ZANtXoBYyplgJPv+mcPDQ4XcuZL/6nKSdnJ
 4mXw6a1tm9mkY1hqJYIY0iZeex7fwG1pYGnT7NWkgu45dS4+t1niJjXJatiGkhBfiek
 AWXBUU3LMQ==
Received: from edelgard.fodlan.icenowy.me (112.94.101.70 [112.94.101.70]) by
 mx.zohomail.com with SMTPS id 1708923424459946.3223816657112;
 Sun, 25 Feb 2024 20:57:04 -0800 (PST)
Message-ID: <02c27b503f379aff28563dda6ad7e2718fe7229f.camel@icenowy.me>
Subject: Re: [PATCH v2 5/6] drm/panel: st7703: Drive XBD599 panel at higher
 clock rate
From: Icenowy Zheng <uwu@icenowy.me>
To: Frank Oltmanns <frank@oltmanns.dev>, Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Guido
 =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,  Purism Kernel Team
 <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>,  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org
Date: Mon, 26 Feb 2024 12:56:55 +0800
In-Reply-To: <87o7c4mqzr.fsf@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-5-96a46a2d8c9b@oltmanns.dev>
 <poua4bzyciiwt65sqjf2whqfdumvoe4h3bkjpf64px2vwgumrf@sai73byg2iju>
 <87sf1zxb0s.fsf@oltmanns.dev>
 <ia7e7gqozltl5wkfdvwtf2rw2ko2dt67qxtuqbavsroyv4ifys@x4mbulqhhri5>
 <87o7c4mqzr.fsf@oltmanns.dev>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2024-02-25=E6=98=9F=E6=9C=9F=E6=97=A5=E7=9A=84 17:46 +0100=EF=BC=
=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
> Hi Maxime,
>=20
> On 2024-02-22 at 11:29:51 +0100, Maxime Ripard <mripard@kernel.org>
> wrote:
> > [[PGP Signed Part:Undecided]]
> > On Sun, Feb 11, 2024 at 04:42:43PM +0100, Frank Oltmanns wrote:
> > >=20
> > > On 2024-02-08 at 20:05:08 +0100, Maxime Ripard
> > > <mripard@kernel.org> wrote:
> > > > [[PGP Signed Part:Undecided]]
> > > > Hi Frank,
> > > >=20
> > > > On Mon, Feb 05, 2024 at 04:22:28PM +0100, Frank Oltmanns wrote:
> > > > > This panel is used in the pinephone that runs on a Allwinner
> > > > > A64 SOC.
> > > > > The SOC requires pll-mipi to run at more than 500 MHz.
> > > > >=20
> > > > > This is the relevant clock tree:
> > > > > =C2=A0pll-mipi
> > > > > =C2=A0=C2=A0=C2=A0 tcon0
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcon-data-clock
> > > > >=20
> > > > > tcon-data-clock has to run at 1/4 the DSI per-lane bit rate.
> > > > > The XBD599
> > > > > has 24 bpp and 4 lanes. Therefore, the resulting requested
> > > > > tcon-data-clock rate is:
> > > > > =C2=A0=C2=A0=C2=A0 crtc_clock * 1000 * (24 / 4) / 4
> > > > >=20
> > > > > tcon-data-clock runs at tcon0 / 4 (fixed divisor), so it
> > > > > requests a
> > > > > parent rate of
> > > > > =C2=A0=C2=A0=C2=A0 4 * (crtc_clock * 1000 * (24 / 4) / 4)
> > > > >=20
> > > > > Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate
> > > > > of pll-mipi.
> > > > >=20
> > > > > pll-mipi's constraint to run at 500MHz or higher forces us to
> > > > > have a
> > > > > crtc_clock >=3D 83333 kHz if we want a 60 Hz vertical refresh
> > > > > rate.
> > > > >=20
> > > > > Change [hv]sync_(start|end) so that we reach a clock rate of
> > > > > 83502 kHz
> > > > > so that it is high enough to align with pll-pipi limits.
> > > > >=20
> > > > > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> > > >=20
> > > > That commit log is great, but it's kind of off-topic. It's a
> > > > panel
> > > > driver, it can be used on any MIPI-DSI controller, the only
> > > > relevant
> > > > information there should be the panel timings required in the
> > > > datasheet.
> > > >=20
> > > > The PLL setup is something for the MIPI-DSI driver to adjust,
> > > > not for
> > > > the panel to care for.
> > > >=20
> > >=20
> > > I absolutely agree. It even was the reason for my submission of a
> > > sunxi-ng patch series last year that was accepted, to make pll-
> > > mipi more
> > > flexible. :)
> > >=20
> > > The only remaining option I currently see for adjusting the
> > > sunxi-ng
> > > driver to further accomodate the panel, is trying to use a higher
> > > divisor than 4 for calculating tcon-data-clock from tcon0. I
> > > remember
> > > reading a discussion about this, but as far as I remember that
> > > proposal
> > > was rejected (by you, IIRC).
> > >=20
> > > While I appreciate other suggestion as well, I'll look into
> > > options for
> > > using a different divisor than 4.
> >=20
> > Like I said, I'm not against the patch at all, it looks great to me
> > on
> > principle. I just think you should completely rephrase the commit
> > log
> > using the datasheet as the only reliable source of the display
> > timings.
> > Whether sun4i can work around the panel requirements is something
> > completely orthogonal to the discussion, and thus the commit log.
> >=20
>=20
> I was trying to follow the guidelines [1] for describing the reason
> behind my changes to the panel. My original commit message was a lot
> shorter, which, understandably, resulted in follow up questions [2].
> With the current commit log, I'm trying to address those questions.
> According to the device tree, the panel is only used in the
> pinephone.
> The only reason for the change is that the SoC used by the only user
> of
> this panel can not provide the rate the panel requests with the
> current
> values. I think this information is relevant.
>=20
> Unfortunately, as described in [2], I cannot back these values with
> any
> datasheets because I couldn't find any. I could only find hints that
> they are not publicly available. Icenowy (added to CC) submitted the
> original values.

Sorry but this kind of things are just magic from the vendor that I
could hardly explain...

>=20
> Best regards,
> =C2=A0 Frank
>=20
> [1]:
> https://www.kernel.org/doc/html/v6.7/process/submitting-patches.html#desc=
ribe-your-changes
> [2]: https://lore.kernel.org/lkml/87wmsvo0fh.fsf@oltmanns.dev/
>=20
> >=20
> > Maxime
> >=20
> > [[End of PGP Signed Part]]
>=20

