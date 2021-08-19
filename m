Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A623F1DE0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 18:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AEA6E9A9;
	Thu, 19 Aug 2021 16:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0F96E9A6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 16:31:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k29so9980166wrd.7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xdfmGh23k0aNDX33xwOdlnspLCgiV2qSptJyQT4CArg=;
 b=TqvsyYuIzPTFNISEaUDmY0h791HLIf4qH1WXS1GxVOvTPNRDVQWqqcXQlxGoSmEhYq
 hmHtTmIeKTi83VzFGyYEcVObXx+9sz/n5eRC4i5PoGxDQ5FuJyqmzwZC3DZsTYvcC7lj
 Pr/Hk6ZGcay72lFauB5YyEIy1wE9tdSBx7LT+U3/P67mkfLEUFIanjAo3tpK1Of8NDws
 BwdnJJRNFFFrUFU5DylX11cauyAcPLYzFuHfmvb7prU10HBcx3ThlIFERG8TGHBfHyo4
 yySdwCCzMSuAkV9jh3xYDU+0sLNNdvXISoBFguTvMb8H+aD1MJ35euCxfdXOs3xfCmJt
 nByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xdfmGh23k0aNDX33xwOdlnspLCgiV2qSptJyQT4CArg=;
 b=tOHSZJFQ8eoYwv+g9a8VGC4r8efc7oFUXGliKXFIJbVCl32pVLSDrEQvjGbVxGrT+o
 wAisZvxxisMN5mQ/7JpaKjO4YUBNLs4OEVHWdNFqgYV1vZgwhTlU+tDKoDBRFpyFgt7M
 wamijj8m+dI6duS3TNhJ3QU85DI3GKVs5er9NEaTlTBYfI1EsV9lWdDK/0ILlst91uxk
 sGgsdd4fogSG5bzyupc8Io1CSCsUJNG4a1hSq+KxMkpwpzL7Q9BEHkm5/g4T8Q+lkny2
 sXwP8gWW3Ucx2zu/MGxssuFkFPBBSKy7rq7poU195SFQZtQTnGYfsfWp/wJtXSqif3LD
 lukw==
X-Gm-Message-State: AOAM531zLww5ydEoTw4ZypUjeoJTfYW6b11oCncpY7/uazcwoR6zRDR5
 5AD+hNf9tmJBg7Jg1duw3I0=
X-Google-Smtp-Source: ABdhPJw+layCx1zXDlaPhdMiFy7BJcVfdPSGx4BZzhnHtq808ns6k0cMS2cwB3t84/EUctnSBTQSPg==
X-Received: by 2002:adf:f541:: with SMTP id j1mr4794858wrp.180.1629390683554; 
 Thu, 19 Aug 2021 09:31:23 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id p8sm7766709wme.22.2021.08.19.09.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:31:21 -0700 (PDT)
Date: Thu, 19 Aug 2021 18:31:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Message-ID: <YR6HWMuYcF6NIepi@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
 <YR0SSz7KMh7TwaFW@orome.fritz.box>
 <eff5ef47-e6e0-3e03-cf1a-d931b0f2dc2a@gmail.com>
 <YR033zuYWWLCeYpM@orome.fritz.box>
 <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rcVyDzt3QNLnQ9/o"
Content-Disposition: inline
In-Reply-To: <a5b942cb-1611-9ae1-6e89-4b68fdaf03e3@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--rcVyDzt3QNLnQ9/o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 07:57:04PM +0300, Dmitry Osipenko wrote:
> 18.08.2021 19:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> We don't have a platform device for CaR. I don't see how it's going to
> >> work. We need to create a platform device for each RPM-capable clock
> >> because that's how RPM works. The compatible string is required for
> >> instantiating OF-devices from a node, otherwise we will have to
> >> re-invent the OF core.
> > I think we do have a platform device for CAR. It's just not bound
> > against by the driver because these clock drivers are "special". But
> > from other parts of the series you're already trying to fix that, at
> > least partially.
> >=20
> > But it doesn't seem right to create a platform device for each RPM-
> > capable clock. Why do they need to be devices? They aren't, so why
> > pretend? Is it that some API that we want to use here requires the
> > struct device?
>=20
> The "device" representation is internal to the kernel. It's okay to me
> to have PLLs represented by a device, it's a distinct h/w by itself.
>=20
> CCF supports managing of clock's RPM and it requires to have clock to be
> backed by a device. That's what we are using here.
>=20
> Please see
> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/clk/clk.c#L109

Looking at the implementation of __clk_register() and where that device
pointer typically comes from, I don't think the way this is used here is
what was intended. The way I interpret the code is that a clock is
registered with a parent device (i.e. its provider) and
clk_pm_runtime_get() is then used internally as a way to make sure that
when a clock is prepared, it's parent device is runtime resumed. This is
presumably to ensure that any registers that the driver might need to
access in order to prepare and enable the clock are accessible (i.e. the
CAR is not powered off or in reset).

So the struct device that is passed to __clk_register() (or its callers)
should be that of the CAR rather than virtual struct devices created by
the CAR.

And it's a bit debatable whether or not PLLs represent distinct
hardware. Ultimately every transistor on a chip could be considered
distinct hardware. But a platform device is a device on a platform bus,
which is really just another way of saying it's a hardware block that's
accessible from the CPU via a memory-mapped address. A PLL (just like
other clocks) is merely a resource exposed by means of access to these
registers. So I don't think they should be platform devices. Even making
them struct device:s seems a bit of a stretch.

Is there any reason why struct clk can't be used for this? I mean, the
whole purpose of that structure is to represent clocks. Why do we need
to make them special?

> >>> Also, I don't think the tegra- prefix is necessary here. The parent n=
ode
> >>> is already identified as Tegra via the compatible string.
> >>>
> >>> In the case of CAR, I'd imagine something like:
> >>>
> >>> 	clocks {
> >>> 		sclk {
> >>> 			operating-points-v2 =3D <&opp_table>;
> >>> 			power-domains =3D <&domain>;
> >>> 		};
> >>> 	};
> >>>
> >>> Now you've only got the bare minimum in here that you actually add. A=
ll
> >>> the other data that you used to have is simply derived from the paren=
t.
> >> 'clocks' is already a generic keyword in DT. It's probably not okay to
> >> redefine it.
> > "clocks" is not a generic keyword. It's the name of a property and given
> > that we're talking about the clock provider here, it doesn't need a
> > clocks property of its own, so it should be fine to use that for the
> > node.
>=20
> I'm curious what Rob thinks about it. Rob, does this sound okay to you?

Another alternative would be to omit that level altogether and just make
sclk and siblings direct children of the CAR node.

Thierry

--rcVyDzt3QNLnQ9/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEeh1YACgkQ3SOs138+
s6H2hw/9FHQE4gIC68lVuteJusivX3to+lSemB8K8zjRkcxT7nURgxWEiaqizxEC
HdNxAuNdVDpD1v34JC2ZGJgnnYdMSrk9k4BhykGgn1+QhdgEQGSTAEXUhcxfK2Yg
5Slk4jnHH9HF0GPYfbJ5SP6k3NgkeL8h0fCa2JviaoCOhzyRBJK71IG1cIOlj7Ud
3nxcd1/NzHcPZnsGivm5Qd8saf1nyLrZghmyUsuaZp5tsH8Ct/x5HWiShOTVB6UT
+uRefYWMbuaJp/mCa+6N0gK2827S84iSRzO5sxI3nYZbRJsgLgD766fzdC/EDZ9G
Zg5AZgzH67GoEicbdCQMgx6zVV6Y1LQF1+5mrHjpomm2OWRVZELLEfGa1pqVNIGu
VJjQuIX618IKU5jBYUw18+vr2HiJNDEFCXX0PrBYXp/cc64fiq4I3M30clqQQoxr
puehYCuiVtD9v6lr8tnEA79qUnn0XsWIpzzHbeLtwclpaqN5lTZUo6eXXFIGid+3
ZauSDJzqa4qTX1fvwH23kMnkA91nI2A00rPQWtER0uhJGq8TjXFPeJ4JHsvTyXxg
Xr77eogUzKs15p0Eh3BBBYCu5CLnaePC+kK5pcVnJLDmbmRW/gaS/RvCuw/YfIhE
Q5nj2KNqZny4RL9VKn0X77bP0ngrfjlFjFsEDt+9MYgNMX3kjj8=
=ibYp
-----END PGP SIGNATURE-----

--rcVyDzt3QNLnQ9/o--
