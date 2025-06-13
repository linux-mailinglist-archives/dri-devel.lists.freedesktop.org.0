Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75141AD8349
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B324A10E1BE;
	Fri, 13 Jun 2025 06:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4D01B10E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:41:22 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id B8D54E74071; Fri, 13 Jun 2025 08:41:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham version=3.3.1
Received: from [192.168.178.25] (a89-182-68-6.net-htp.de [89.182.68.6])
 by lynxeye.de (Postfix) with ESMTPSA id 01D37E7400A;
 Fri, 13 Jun 2025 08:41:10 +0200 (CEST)
Message-ID: <4616baf23cf75bf64a6997410f806d7d449ca42b.camel@lynxeye.de>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
From: Lucas Stach <dev@lynxeye.de>
To: Doug Anderson <dianders@chromium.org>, Jayesh Choudhary
 <j-choudhary@ti.com>,  Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Jun 2025 08:41:10 +0200
In-Reply-To: <CAD=FV=XTjEVfNtAOww1=UXbAknXNzWd0fcB5UMBEJrO2gt_hvg@mail.gmail.com>
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
 <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
 <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
 <CAD=FV=W8RNcZvg5zgL1wDRmaH_eXrc79YQsMr9Be5HVtOWwwcw@mail.gmail.com>
 <CAD=FV=XTjEVfNtAOww1=UXbAknXNzWd0fcB5UMBEJrO2gt_hvg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
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

Am Donnerstag, dem 12.06.2025 um 15:31 -0700 schrieb Doug Anderson:
> Hi,
>=20
> On Thu, Jun 12, 2025 at 10:52=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> >=20
> > Hi,
> >=20
> > On Thu, Jun 12, 2025 at 12:35=E2=80=AFAM Jayesh Choudhary <j-choudhary@=
ti.com> wrote:
> > >=20
> > > > > If refclk is described in devicetree node, then I see that
> > > > > the driver modifies it in every resume call based solely on the
> > > > > clock value in dts.
> > > >=20
> > > > Exactly. But that is racy with what the chip itself is doing. I.e.
> > > > if you don't have that usleep() above, the chip will win the race
> > > > and the refclk frequency setting will be set according to the
> > > > external GPIOs (which is poorly described in the datasheet, btw),
> > > > regardless what the linux driver is setting (because that I2C write
> > > > happens too early).
> > >=20
> > > I am a little confused here.
> > > Won't it be opposite?
> > > If we have this delay here, GPIO will stabilize and set the register
> > > accordingly?
> > >=20
> > > In the driver, I came across the case when we do not have refclk.
> > > (My platform does have a refclk, I am just removing the property from
> > > the dts node to check the affect of GPIO[3:1] in question because clo=
ck
> > > is not a required property for the bridge as per the bindings)
> > >=20
> > > In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
> > > when we go to resume(), we do not do enable_comms() that calls
> > > ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
> > > I see that register read for SN_DEVICE_ID_REGS fails in that case.
> > >=20
> > > Adding this delay fixes that issue. This made me think that we need
> > > the delay for GPIO to stabilize and set the refclk.
> >=20
> > FWIW, it's been on my plate for a while to delete the "no refclk"
> > support. The chip is really hard to use properly without a refclk and
> > I'm not at all convinced that the current code actually works properly
> > without a refclk. I'm not aware of any current hardware working this
> > way. I know we had some very early prototype hardware ages ago that
> > tried it and we got it limping along at one point, but the driver
> > looked _very_ different then. I believe someone on the lists once
> > mentioned trying to do something without a refclk and it didn't work
> > and I strongly encouraged them to add a refclk.
>=20
> Actually, I may have to eat my words here. I double-checked the dts
> and I see there's at least two mainline users
> ("meson-g12b-bananapi-cm4-mnt-reform2.dts" and
> "/imx8mq-mnt-reform2.dts") that don't seem to be specifying a `refclk`
> to `ti,sn65dsi86`.
>=20
> Neil / Lucas: is that correct? ...and it actually works?
>=20
The description is correct, the refclock is not connected on the reform
baseboard.

It sort of works, as-in AUX channel is not working before the display
link is up to provide a reference clock and I guess that also means HPD
is broken. On the reform the connected panel is described as a simple
panel with a fixed mode, not using the EDID from panel.

Regards,
Lucas
