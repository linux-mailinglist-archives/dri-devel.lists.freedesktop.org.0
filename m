Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A448D567222
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59A310F8D6;
	Tue,  5 Jul 2022 15:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E6111BC06
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 15:10:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2D656BB;
 Tue,  5 Jul 2022 17:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657033822;
 bh=PWh8L5jrworbt4/8YMDIMjVP8a6XVCiG2OWrajdQNNM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=qjn0TfRAl5zvhUYkJQvIq3iO9/6amU4wA6/IIGcvd1W1fEDFiKoQv0eeFBzG5a0Mt
 AJd283hGOLPCx58zRnynQCfUUBDaD9qSno99/DMBohCcXOxSjdSAMcket/+uo2ZVnT
 G/PXYdNp57vhskHTFkMedt822ouzhWX0oguzVNEY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0f803b7c-d004-1302-6ef8-205e5b177918@prevas.dk>
References: <0f803b7c-d004-1302-6ef8-205e5b177918@prevas.dk>
Subject: Re: connecting a sn65dsi86 to displayport connector
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Date: Tue, 05 Jul 2022 16:10:20 +0100
Message-ID: <165703382008.2228597.17239168312569308180@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rasmus,

Quoting Rasmus Villemoes (2022-07-05 10:08:37)
> Hi
>=20
> I have an imx8mp board with a sn65dsi86 and a (full-size) DisplayPort
> connector, which I'm trying to get up and running.
>=20
> The display connector registers itself as a bridge; I do get
> successfully to the end of display_connector_probe(). But
> ti_sn_bridge_probe() only looks for a panel (passing NULL for the
> drm_bridge** argument), so always fails with -EPROBE_DEFER.
>=20
> This text
>=20
>   At the moment, this binding only handles the eDP case. It is
>   possible it will be extended in the future to handle the DP case.
>   For DP, presumably a connector would be listed under the DP AUX
>   bus instead of a panel.
>=20
> in dp-aux-bus.yaml suggests that what I'm trying to do is simply not
> supported yet. But then I stumbled on commit 5a6bca1ff7a5 (arm64: dts:
> renesas: falcon-cpu: Add DSI display output), which seems to do exactly
> what I'm trying to, except with a mini dp connector. So I must be
> missing something; maybe ti_sn_bridge_probe() failing is not actually a
> problem and I could be looking at the wrong place.
>=20
> Snippets from my .dts; the dp connector is currently placed at top
> level, i.e. not within an aux-bus node below the sn65dsi86:
>=20
>         display_port0: connector {
>                 compatible =3D "dp-connector";
>                 label =3D "DP0";
>                 type =3D "full-size";
>                 dp-pwr-supply =3D <&reg_DP_PWR>;
>=20
>                 port {
>                         dp_connector_in: endpoint {
>                                 remote-endpoint =3D <&sn65dsi86_out>;
>                         };
>                 };
>         };
>=20
> &i2c5 {
> ...
>         eDP: bridge@2c {
>                 compatible =3D "ti,sn65dsi86";
>                 reg =3D <0x2c>;
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_eDP>;
>=20
>                 interrupts-extended =3D <&gpio3 14 IRQ_TYPE_LEVEL_HIGH>;
>                 enable-gpios =3D <&gpio3 9 GPIO_ACTIVE_HIGH>;
>=20
>                 vpll-supply =3D <&VDD_1V8>;
>                 vccio-supply =3D <&VDD_1V8>;
>                 vcca-supply =3D <&reg_1V2>;
>                 vcc-supply =3D <&reg_1V2>;
>=20
>                 clocks =3D <&clk_38_4MHz>;
>                 clock-names =3D "refclk";
>=20
>                 ports {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
>=20
>                         port@0 {
>                                 reg =3D <0>;
>                                 sn65dsi86_in_a: endpoint {
>                                         remote-endpoint =3D <&mipi_dsi_ou=
t>;
>                                 };
>                         };
>=20
>                         port@1 {
>                                 reg =3D <1>;
>                                 sn65dsi86_out: endpoint {
>                                         remote-endpoint =3D <&dp_connecto=
r_in>;
>                                         data-lanes =3D <3 2 1 0>;
>                                 };
>                         };
>                 };
>         };
> };
>=20
> When I manually set the enable-gpio high in U-Boot, I can talk to the
> device and e.g. read out the 8 device_id bytes which match what I expect.
>=20
> Any hints would be highly appreciated.

If it helps, this is an area I've been working to support one of our
boards. I have a branch at:

 git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
 kbingham/drm-misc/next/sn65dsi86/hpd

But it's still a work in progress, and now needs rebasing to account for
Sam's latest updates.

I intend to resume this in a few weeks, but hopefully that branch may
have some helpful pointers to get things progressing for you too.

--
Kieran


>=20
> Thanks,
> Rasmus
