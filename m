Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A83F2B74
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 13:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2446EA70;
	Fri, 20 Aug 2021 11:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1668C6EA70
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 11:42:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x10so13819834wrt.8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Zv3nHk0fhUUfiKmkGdQkVpe7JiD0JH5HC6GkKoME0XM=;
 b=hv8rGaUmqEUIYsQVTjvO8jjJY5qWKOVBpKjvHbR2ALvlGnt+TrUnqJIRipQ31QPfBT
 9z6aa4xgPzgBuOZfUHBwFiZxwzIa5EkHdQFJNOIlYPrea6eD1b1Xw1iRWNp43TVUpkua
 642qMAsgG+kWt2Gd0QleBBwYwh/Qg0tf2NfaOZzi4wHsahkyErUBOlXvnprhOFLn9299
 vMtOU+k+/bT0xHD8cQAkFuS4jSeH50Zf9iTB9sV4kFkomGIPqD4fJzO3Pr8y3Qu45GNy
 fcUI6AXMBNhi1aw1aNU5UITox9gN9CnovPOC5f3PGx3ej70uzEVHrdc183vQ/VP2MP+R
 PUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Zv3nHk0fhUUfiKmkGdQkVpe7JiD0JH5HC6GkKoME0XM=;
 b=UWoPf3COu5HXgdtEzCn+CRtimsZcIaOeYcCX2p3/vWLb/GN8a4eXxCOSfHoQfB5fBn
 f++IefoNsITwR9JblVJ6tWNqlgeGNoAaWvg95ftFQv35aQqwJR4kcbWQBBBrG0XbIGrj
 au17YN2HdMmOXbSiUejT4C+hobn/hrYvgfMEjuFlBBRRgxX8kNV36AfvBlqCrjPNaWhG
 YEACap6Dol4/ZAp74HrOC35A1zzw6fY5c3X64LX4wbuQ0uKAAn3eN0tCvDgK9OT5G+8q
 9SQBwOy6RkFvofrUogE4xjujc57TMskpsW70PKpn3ZDlvnwe25SljuoXHBiKRl6czL91
 LNdQ==
X-Gm-Message-State: AOAM530Ms3CRA92ne7MTVHTwaTy93zGuUmbz3AtHGXbeAkt2qmz3MTos
 e9l4IDvFMXIhhjX9G3vusew=
X-Google-Smtp-Source: ABdhPJzvaxzVDmTxVy2sv674AaUxMMQr/K5z/BhxB4H04EV/dW4MQpr/WCYHvipxQUkHtnS7MrtYBQ==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr9628802wru.57.1629459727651; 
 Fri, 20 Aug 2021 04:42:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id o17sm9617097wmp.13.2021.08.20.04.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 04:42:06 -0700 (PDT)
Date: Fri, 20 Aug 2021 13:42:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
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
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 07/34] clk: tegra: Support runtime PM and power domain
Message-ID: <YR+VDZzTihmpENp6@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-8-digetx@gmail.com>
 <YR0UBi/ejy+oF4Hm@orome.fritz.box>
 <da7356cb-05ee-ba84-8a7c-6e69d853a805@gmail.com>
 <YR04YHGEluqLIZeo@orome.fritz.box>
 <ad99db08-4696-1636-5829-5260f93dc681@gmail.com>
 <YR6Mvips3HAntDy0@orome.fritz.box>
 <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="e9XWAn30K57OEaiK"
Content-Disposition: inline
In-Reply-To: <e17bbe8d-7c0f-fc3d-03c7-d75c54c24a43@gmail.com>
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


--e9XWAn30K57OEaiK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 01:09:46AM +0300, Dmitry Osipenko wrote:
> 19.08.2021 19:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Aug 18, 2021 at 08:11:03PM +0300, Dmitry Osipenko wrote:
> >> 18.08.2021 19:42, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Aug 18, 2021 at 06:05:21PM +0300, Dmitry Osipenko wrote:
> >>>> 18.08.2021 17:07, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>>> On Tue, Aug 17, 2021 at 04:27:27AM +0300, Dmitry Osipenko wrote:
> >>>>> [...]
> >>>>>> +struct clk *tegra_clk_register(struct clk_hw *hw)
> >>>>>> +{
> >>>>>> +	struct platform_device *pdev;
> >>>>>> +	struct device *dev =3D NULL;
> >>>>>> +	struct device_node *np;
> >>>>>> +	const char *dev_name;
> >>>>>> +
> >>>>>> +	np =3D tegra_clk_get_of_node(hw);
> >>>>>> +
> >>>>>> +	if (!of_device_is_available(np))
> >>>>>> +		goto put_node;
> >>>>>> +
> >>>>>> +	dev_name =3D kasprintf(GFP_KERNEL, "tegra_clk_%s", hw->init->nam=
e);
> >>>>>> +	if (!dev_name)
> >>>>>> +		goto put_node;
> >>>>>> +
> >>>>>> +	pdev =3D of_platform_device_create(np, dev_name, NULL);
> >>>>>> +	if (!pdev) {
> >>>>>> +		pr_err("%s: failed to create device for %pOF\n", __func__, np);
> >>>>>> +		kfree(dev_name);
> >>>>>> +		goto put_node;
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	dev =3D &pdev->dev;
> >>>>>> +	pm_runtime_enable(dev);
> >>>>>> +put_node:
> >>>>>> +	of_node_put(np);
> >>>>>> +
> >>>>>> +	return clk_register(dev, hw);
> >>>>>> +}
> >>>>>
> >>>>> This looks wrong. Why do we need struct platform_device objects for=
 each
> >>>>> of these clocks? That's going to be a massive amount of platform de=
vices
> >>>>> and they will completely mess up sysfs.
> >>>>
> >>>> RPM works with a device. It's not a massive amount of devices, it's =
one
> >>>> device for T20 and four devices for T30.
> >>>
> >>> I'm still not sure I understand why we need to call RPM functions on a
> >>> clock. And even if they are few, it seems wrong to make these platform
> >>> devices.
> >>
> >> Before clock is enabled, we need to raise core voltage. After clock is
> >> disabled, the voltage should be dropped. CCF+RPM takes care of handling
> >> this for us.
> >=20
> > That's the part that I do understand. What I don't understand is why a
> > clock needs to be runtime suspend/resumed. Typically we suspend/resume
> > devices, and doing so typically involves disabling/enabling clocks. So
> > I don't understand why the clocks themselves now need to be runtime
> > suspended/resumed.
>=20
> CCF provides RPM management for a device that backs clock. When clock
> is enabled, it resumes the backing device.
>=20
> RPM, GENPD and OPP frameworks work with a device. We use all these
> frameworks here. Since we don't have a dedicated device for a PLL
> clock, we need to create it in order to leverage the existing generic
> kernel APIs.
>=20
> In this case clocks are not runtime suspended/resumed, the device
> which backs clock is suspended/resumed.
>=20
> >>> Perhaps they can be simple struct device:s instead? Ideally they would
> >>> also be parented to the CAR so that they appear in the right place in
> >>> the sysfs hierarchy.
> >>
> >> Could you please clarify what do you mean by 'simple struct device:s'?
> >> These clock devices should be OF devices with a of_node and etc,
> >> otherwise we can't use OPP framework.
> >=20
> > Perhaps I misunderstand the goal of the OPP framework. My understanding
> > was that this was to attach a table of operating points with a device so
> > that appropriate operating points could be selected and switched to when
> > the workload changes.
> >=20
> > Typically these operating points would be roughly a clock rate and a
> > corresponding voltage for a regulator, so that when a certain clock rate
> > is requested, the regulator can be set to the matching voltage.
> >=20
> > Hm... so is it that each of these clocks that you want to create a
> > platform device for has its own regulator? Because the patch series only
> > mentions the CORE domain, so I assumed that we would accumulate all the
> > clock rates for the clocks that are part of that CORE domain and then
> > derive a voltage to be supplied to that CORE domain.
> >=20
> > But perhaps I just don't understand correctly how this is tied together.
>=20
> We don't use regulators, we use power domain that controls regulator.
> GENPD takes care of accumulating performance requests on a per-device
> basis.
>=20
> I'm creating platform device for the clocks that require DVFS. These
> clocks don't use regulator, they are attached to the CORE domain.
> GENPD framework manages the performance state, aggregating perf votes
> from each device, i.e. from each clock individually.
>=20
> You want to reinvent another layer of aggregation on top of GENPD.
> This doesn't worth the effort, we won't get anything from it, it
> should be a lot of extra complexity for nothing. We will also lose
> from it because pm_genpd_summary won't show you a per-device info.
>=20
> domain                          status          children                 =
          performance
>     /device                                             runtime status
> -------------------------------------------------------------------------=
---------------------
> heg                             on                                       =
          1000000
>     /devices/soc0/50000000.host1x                       active           =
          1000000
>     /devices/soc0/50000000.host1x/54140000.gr2d         suspended        =
          0
> mpe                             off-0                                    =
          0
> vdec                            off-0                                    =
          0
>     /devices/soc0/6001a000.vde                          suspended        =
          0
> venc                            off-0                                    =
          0
> 3d1                             off-0                                    =
          0
>     /devices/genpd:1:54180000.gr3d                      suspended        =
          0
> 3d0                             off-0                                    =
          0
>     /devices/genpd:0:54180000.gr3d                      suspended        =
          0
> core-domain                     on                                       =
          1000000
>                                                 3d0, 3d1, venc, vdec, mpe=
, heg
>     /devices/soc0/7d000000.usb                          active           =
          1000000
>     /devices/soc0/78000400.mmc                          active           =
          950000
>     /devices/soc0/7000f400.memory-controller            unsupported      =
          1000000
>     /devices/soc0/7000a000.pwm                          active           =
          1000000
>     /devices/soc0/60006000.clock/tegra_clk_pll_c        active           =
          1000000
>     /devices/soc0/60006000.clock/tegra_clk_pll_e        suspended        =
          0
>     /devices/soc0/60006000.clock/tegra_clk_pll_m        active           =
          1000000
>     /devices/soc0/60006000.clock/tegra_clk_sclk         active           =
          1000000
>=20

I suppose if there's really no good way of doing this other than
providing a struct device, then so be it. I think the cleaned up sysfs
shown in the summary above looks much better than what the original
would've looked like.

Perhaps an additional tweak to that would be to not create platform
devices. Instead, just create struct device. Those really have
everything you need (.of_node, and can be used with RPM and GENPD). As I
mentioned earlier, platform device implies a CPU-memory-mapped bus,
which this clearly isn't. It's kind of a separate "bus" if you want, so
just using struct device directly seems more appropriate.

We did something similar for XUSB pads, see drivers/phy/tegra/xusb.[ch]
for an example of how that was done. I think you can do something
similar here.

Thierry

--e9XWAn30K57OEaiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEflQ0ACgkQ3SOs138+
s6GTxBAAux4SgNOWssIQKGH1AEza+rNysC4g84SnOK2hV16+4q73xBZ/8tN5ItTA
otnOZSkyFT+WrMsnhwQYaLAwrH4GLPMjQfsHEJh0rtMRxgATicvWG8iRAaOyE7+P
O3lHTRCaNlqNZug7HJwe+k/dhgvtx2Ov8eG4sW9KB87XWtyKTgqG2ZVi10oWR4QA
2UX42b1HVOlFEo75jjpWSx//8wapKAfc3p42jUKo7f6C6tX1Qf3yuodCgsIJKcju
u8MYjl6gYLjVsarWKXI6Kq3N6TyL4ZQsPRtSYo0wWCpHYpZTbCQmn6gnwkKyAYG6
r0OM5yHPSTG+7qoaQ+VPWF2+yyRT5iaZyxfbnMn4EWyTCTW1ShowYMQzl3cmlOWl
N8N3M30l53820bblYs5uDSFdfZt7iQyVp5pkbm8d8s7UWueV5f3j1Znue6RSxIfq
9TEDVEmiOd0LmHZiDHFZp3xRifOuXZrcWPA6Rb/O0mJUOMaF8InmV0LXvqBXKJYA
MkF1upcDfTGT9tniijqabWXatIXUhS26sX9msDvVje+k5ZnBZS6T5cntXcf7dm77
Wl15axasLk2JGjWrTCfziW2SQTCSdcHdYfvVVa2ph/ZifaSjcy/q5x1/Ugb0BdDI
dxrGX30qo2XtnO5MWxTL/cwJpm0c+TAyWb9+P8dJpMbQJ921Lnk=
=BAkl
-----END PGP SIGNATURE-----

--e9XWAn30K57OEaiK--
