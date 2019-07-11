Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1565A05
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 17:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DE96E215;
	Thu, 11 Jul 2019 15:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3446E215
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 15:08:47 +0000 (UTC)
Received: from [217.140.106.52] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hlaGm-0002Ug-9P; Thu, 11 Jul 2019 14:42:00 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7990FD02DA8; Thu, 11 Jul 2019 15:41:59 +0100 (BST)
Date: Thu, 11 Jul 2019 15:41:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
Message-ID: <20190711144159.GH14859@sirena.co.uk>
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <20190706010604.GG20625@sirena.org.uk>
 <CAOCk7No77CDRE=bnBVGzYw9ixWKO4PMBBWksm4JEeh3ydfOk+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOCk7No77CDRE=bnBVGzYw9ixWKO4PMBBWksm4JEeh3ydfOk+g@mail.gmail.com>
X-Cookie: Visit beautiful Vergas, Minnesota.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+HlbWEQmRduQNmwZFRzhfjm5S2Nl7jUTbuTLfBpBQqk=; b=Wou5o/MPpOc6TgukRzTBE/GH+
 RjTTLTQbUoZs3rqtFDNYiTTqcywlE97WS1aQvfu0aZSweV6wT+FTGnPpwgRC7hPVC1T1yktQXgFF0
 y4n54l2AWJtFqwvW014NATDZc/TT5iZI6BS4La50RlA2uClTaigHVREvsuAgme/SIif/I=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Dave Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0084923081=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0084923081==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline


--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 12:08:34PM -0600, Jeffrey Hugo wrote:
> On Fri, Jul 5, 2019 at 7:06 PM Mark Brown <broonie@kernel.org> wrote:

> The addresses for these spec defined messages are 8-bit wide, so 256
> valid "destinations".  However, the payload is variable.  Most of the
> defined operations take an 8-bit payload, but there are a few that I
> see with 16-bit payloads.

Oh, good, variable register sizes, what a market leading idea :(
That basically doesn't work with regmap, you need to either
define one regmap per register size and attach them to the device
or use reg_read() and reg_write() and hide the complexity in
there.

> As the contents of the generic read/write messages are implementation
> defined, the answer to your question seems to be no - the spec does
> not define that the registers are 8-bit addressable, and 8-bit wide.

The code definitely ought to at least be more flexible then.
Right now it's very hard coded.

> I think perhaps the discussion needs to step back a bit, and decide
> how flexible do we want this regmap over DSI to be?  I think its
> usefulness comes from when a device can be configured via multiple
> interfaces, so I don't expect it to be useful for every DSI interface.
> It seems like the DSI panels use DSI directly to craft their
> configuration.  As a result, we are probably looking at just devices
> which use the generic read/write commands, but sadly the format for
> those is not universal per the spec.  From the implementations I've
> seen, I suspect 8-bit addressing of 8-bit wide registers to be the
> most common, but apparently there is an exception to that already in
> the one device that I care about.

It's relatively easy to add a bunch of special cases in - look at
how the I2C code handles it, keying off a combination of the
register configuration and the capabilities of the host
controller.  I guess for this it'd mainly be the register
configuration.  You might find the reg_read()/reg_write()
interface better than the raw buffer one for some of the formats,
it does let=20

> Do we want to go forward with this regmap support just for the one TI
> device, and see what other usecases come out of it, and attempt to
> solve those as we go?

I have no strong opinions here, it looks fine from a framework
point of view though it's unclear to me if viewing it as a
register map meshes well with how the hardware is designed or not
- it seems plausible though.

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0nSrQACgkQJNaLcl1U
h9Dqygf/XOpd88JPRHZWBN+yYZ3UHJfhBe6xy8/HfJBBT8sXXA2L3k7rHpRMmhKk
RC58a6kuy8mDm+tQhIgEwHUlFotAHGk8kn0yNQuVK0XNL4zvAqdcQHV+gsn//x6G
R3PQrLboonlT69lWDNW4dI1zc78mY6FzKQRtFa7kmIYZ5hr/WwtR9TfpReeUxLCr
P5FYi4QzBp3uloWecgLExYmFZj3IHznUWpp8Hm11JDXyrpVShOMJCiA99q/W9N6A
ALxrijQlTenDH7gMw7YEaDhnl+osCa392CguDJiSNbDW7usZ+5WGOF7TGOLu8F+u
udGDeMVl9eOc7g2CHoRTEg6/WtQv/A==
=1lgs
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--

--===============0084923081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0084923081==--
