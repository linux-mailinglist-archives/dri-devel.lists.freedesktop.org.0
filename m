Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F03728081
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 14:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8E210E5B4;
	Thu,  8 Jun 2023 12:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8944B10E5B7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 12:53:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q7F8D-0003bo-0V; Thu, 08 Jun 2023 14:52:49 +0200
Message-ID: <343dc13df7369ccee22f51852b3e8518e500025a.camel@pengutronix.de>
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
From: Lucas Stach <l.stach@pengutronix.de>
To: Adam Ford <aford173@gmail.com>, Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>
Date: Thu, 08 Jun 2023 14:52:44 +0200
In-Reply-To: <CAHCN7xKdKGA02=ZDNQkVVVDV0AZTqd7QpHA2Nq9LNnbmK=hKxA@mail.gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
 <e1379d94-66a5-8538-abdf-de7770befb7d@prevas.dk>
 <CAHCN7xK9RaLRSK_jSbbuGBUf14-FOHsrawi2J8G29iHSOj2Nyw@mail.gmail.com>
 <bfd050f2-b39e-c091-614e-0c77fe324435@prevas.dk>
 <CAHCN7xKdKGA02=ZDNQkVVVDV0AZTqd7QpHA2Nq9LNnbmK=hKxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, aford@beaconembedded.com,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 08.06.2023 um 07:30 -0500 schrieb Adam Ford:
> On Thu, Jun 8, 2023 at 6:40=E2=80=AFAM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> >=20
> >=20
[...]
> > > Have you tried using modetest to see what refresh rates are available=
?
> >=20
> > Hm. My userspace may be a little weird. When I run modetest I just get
> >=20
> > trying to open device 'i915'...failed
> > trying to open device 'amdgpu'...failed
> > ...
> > trying to open device 'imx-dcss'...failed
> > trying to open device 'mxsfb-drm'...failed
> > no device found
> >=20
>=20
> One the 8MP, I think you need to append "-M imx-lcdif" to the modetest
> command  to specify the driver being used.
> I don't have my 8MP with me right now, but I think that's the right name.

That's correct. Alternatively update libdrm to >=3D 2.4.114, which knows
to look for this driver in the tests.

Regards,
Lucas
