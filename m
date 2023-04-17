Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B946E404A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8CC10E373;
	Mon, 17 Apr 2023 07:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C21210E373
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1681714838; x=1713250838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NNWz/l3oDZnpTc0Gl/qtMRqwydt/1fHPp3ooI4fBNHk=;
 b=j6PKyg019Gxirh2nKaIDOJeE+81uRXJF9BvtlhjT2qWInposl0M+6RZl
 UYH87odWedzJniW+ptN1Rpd2Zw8BxmYxpT7SV94WOgVP4F7ZOhEul//Jf
 J7EX6/te19xm+Ah6AoK9dE2Nj+TxV2LeuO+czrv335Z3zVkv5dwI1HIm8
 6QrFbgUkSgSugQCo7O1A2C223lnGQV1OwWQUuIttWS67yLdXLlScxu6iO
 sx9bCfH2t1qvZ++AxxBJYIIAf2U3txz33y0wly0wuxMTQJqdFwhVZjow4
 ErMjCVxIFaa8ccMBLh2pOtLviRsj2/hMbDaHR1/gRW0fom20pPlafnjtG A==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677538800"; d="scan'208";a="30355382"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 17 Apr 2023 09:00:35 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 17 Apr 2023 09:00:35 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 17 Apr 2023 09:00:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1681714835; x=1713250835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NNWz/l3oDZnpTc0Gl/qtMRqwydt/1fHPp3ooI4fBNHk=;
 b=R5e84MjyrDoniy+dfBQOQWtqr6KaZDALr70l6mryZjVE4FER04Wctpuw
 FkycPeUJXvPIXAXKnj84kradEe0y0jxatVdwC0Fyi36GsIENjF1Sc3P+P
 TNST8pMg5NyaZhnKWwHUawNrCeAVna75bVW5jGW9kUiXt15fd6EMRfmtU
 8PuYEEiJm4gIpAy2Y77jk0yGH1nbXXYxexPlIw/VudMmnPD+5ZnGiqXZm
 1cXfVVVRnRUldEG4Srb7BZIgfGtI5rLtRjp0ccB6YkRh90uFt0rDVyF3x
 Aj3Sj9oaIHfk4Q9eiTVyFj3ig+IIJJnsmPAzEpExIQkXF1F+NF21uhe1F w==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677538800"; d="scan'208";a="30355381"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Apr 2023 09:00:35 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 009EB280056;
 Mon, 17 Apr 2023 09:00:34 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
Date: Mon, 17 Apr 2023 09:00:33 +0200
Message-ID: <5667233.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAHCN7xKsvT-TL4xdP=CKDzTJoFq1PGqmFmTohdRF9JaWaxWemw@mail.gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
 <414febc4-aab1-95ec-ac2e-e82a3f881d01@denx.de>
 <CAHCN7xKsvT-TL4xdP=CKDzTJoFq1PGqmFmTohdRF9JaWaxWemw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Montag, 17. April 2023, 00:31:24 CEST schrieb Adam Ford:
> On Sun, Apr 16, 2023 at 5:07=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
> > On 4/15/23 12:40, Adam Ford wrote:
> > > According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
> > > and max values for M and  the frequency range for the VCO_out
> > > calculator were incorrect.  This also appears to be the case for the
> > > imx8mn and imx8mp.
> > >=20
> > > To fix this, make new variables to hold the min and max values of m
> > > and the minimum value of VCO_out, and update the PMS calculator to
> > > use these new variables instead of using hard-coded values to keep
> > > the backwards compatibility with other parts using this driver.
> >=20
> > [...]
> >=20
> > >   static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data=
 =3D
> > >   {
> > >=20
> > > @@ -470,6 +485,9 @@ static const struct samsung_dsim_driver_data
> > > imx8mm_dsi_driver_data =3D {> >=20
> > >        */
> > >      =20
> > >       .pll_p_offset =3D 14,
> > >       .reg_values =3D imx8mm_dsim_reg_values,
> > >=20
> > > +     .m_min =3D 64,
> > > +     .m_max =3D 1023,
> > > +     .vco_min =3D 1050,
> >=20
> > You might want to call this 'min_freq' since there is a 'max_freq' which
> > seems to indicate what VCO max frequency is.
> >=20
> > Note that the same datasheet contains the following information:
> > "
> > MIPI_DPHY_M_PLLPMS field descriptions
> >=20
> > 12=E2=80=934 PMS_M
> > Specifies the PLL PMS value for the M divider
> > NOTE: The programmable divider range should be within 25 to 125 to
> > ensure PLL stability.
>=20
> I was confused by this because this statement is not consistent with
> the link they reference jumps me to the table where it reads M is
> between 64 and 1023.
>=20
> > NOTE: The M and P divider values should be considered together to ensure
> > VCO ouput frequency
> > (VCO_out) range is between 350 MHz to 750 MHz.
> > Please refer to the topic DPHY PLL for more information.
>=20
> I was confused by this too, because the NXP documentation reads the
> 350 - 750MHz that you state, but  "Table 13-45: DPHY PLL Parameters"
> which immediately follows that sentence  on page 4158 shows VCO_out is
> between 1050-2100 MHz.
>=20
> I compared the PMS values for a variety of frequencies to those that
> were set in the downstream NXP code, and the PMS values matched.
> Maybe someone from NXP can explain the discrepancy.

Also note that, according to Table 13-28 in RM (Rev 2 07/2022) for i.MX8M=20
Nano, VCO_out and Fout has a maximum of 1500MHz only. Although the note abo=
ve=20
mentions a range  of 1050-2100MHz...

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


