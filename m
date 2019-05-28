Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941EF2C421
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830F789D7D;
	Tue, 28 May 2019 10:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C3789D7D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:19:00 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1526E240013;
 Tue, 28 May 2019 10:18:52 +0000 (UTC)
Date: Tue, 28 May 2019 12:20:01 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 00/10] R-Car DU: LVDS dual-link mode support
Message-ID: <20190528102001.4ga6mib4xem5zuiq@uno.localdomain>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
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
Cc: devicetree@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: multipart/mixed; boundary="===============1426525996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1426525996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uxafowhmgmdzm5r4"
Content-Disposition: inline


--uxafowhmgmdzm5r4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sun, May 12, 2019 at 12:06:52AM +0300, Laurent Pinchart wrote:
> Hello everybody,
>
> This patch series implements support for LVDS dual-link mode in the
> R-Car DU and R-Car LVDS encoder drivers, and well as in the thc63lvd1024
> LVDS decoder driver.
>
> LVDS dual-link is a mode of operation where two individual LVDS links
> are operated together to carry even- and odd-numbered pixels separately.
> This doubles the possible bandwidth of the video transmission. Both the
> transmitter and the receiver need to support this mode of operation.
>
> The R-Car D3 and E3 SoCs include two independent LVDS encoders that can
> be grouped together to operate in dual-link mode. When used separately,
> the LVDS encoders are connected to two different CRTCs and transmit
> independent video streams. When used in dual-link mode, the first LVDS
> encoder is connected to the first CRTC, and split even- and odd-numbered
> pixels. It transmits half of the pixels on its LVDS output, and sends
> the other half to the second LVDS encoder for transmittion over the
> second LVDS link. The second LVDS encoder thus operates under control of
> the first one, and isn't connected directly to a CRTC.
>
> On the receiving side, the THC63LVD1024 LVDS-to-parallel bridge has two
> LVDS inputs and two parallel outputs. It can operate in four different
> modes:
>
> - Single-in, single-out: The first LVDS input receives the video stream,
>   and the bridge outputs it on the first parallel output. The second
>   LVDS input and the second parallel output are not used.
>
> - Single-in, dual-out: The first LVDS input receives the video stream,
>   and the bridge splits even- and odd-numbered pixels and outputs them
>   on the first and second parallel outputs. The second LVDS input is not
>   used.
>
> - Dual-in, single-out: The two LVDS inputs are used in dual-link mode,
>   and the bridge combines the even- and odd-numbered pixels and outputs
>   them on the first parallel output. The second parallel output is not
>   used.
>
> - Dual-in, dual-out: The two LVDS inputs are used in dual-link mode,
>   and the bridge outputs the even- and odd-numbered pixels on the first
>   parallel output.
>
> The operating mode is selected by two input pins of the bridge, which
> are connected to DIP switches on the development boards I use. The mode
> is thus fixed from a Linux point of view.
>
> Patch 01/10 adds a new dual_link boolen field to the drm_bridge_timings
> structure to let bridges report their LVDS mode of operation. Patch
> 02/10 clarifies the THC63LVD1024 DT bindings to document dual-link
> operation, and patch 03/10 implements dual-link support in the
> thc64lvd1024 bridge driver by setting the drm_bridge_timings dual_link
> field according to the mode selected through DT.
>
> Patch 04/10 extends the R-Car LVDS DT bindings to specify the companion
> LVDS encoder for dual-link operation. Patches 05/10 then performs a
> small cleanup in the LVDS encoder driver. Patch 06/10 implements
> dual-link support in the LVDS encoder driver, which involves retrieving
> the operation mode from the LVDS receiver, locating the companion LVDS
> encoder, and configuring both encoders when dual-link operation is
> desired. The API towards the DU driver is also extended to report the
> mode of operation.
>
> Patch 07/10 implements dual-link mode support in the DU driver. There is
> no specific configuration to be performed there, as dual-link is fully
> implemented in the LVDS encoder driver, but the DU driver has to skip
> creation of the DRM encoder and connector related to the second LVDS
> encoder when dual-link is used, as the second LVDS encoder operates as a
> slave of the first one, transparently from a CRTC (and thus userspace)
> perspective.
>
> Patch 08/10 specifies the companion LVDS encoder in the D3 and E3 DT
> bindings. This by itself doesn't enable dual-link mode, the LVDS0
> encoder is still connected to the HDMI output through LVDS receiver, and
> the LVDS1 encoder is not used. Patches 09/10 and 10/10, not intended to
> be merged, enable dual-link operation for the D3 and E3 boards for
> testing and require flipping DIP switches on the boards.
>
> The patches are based on top of my drm/du/next branch, and are available
> for convenience at
>
>         git://linuxtv.org/pinchartl/media.git drm/du/lvds/dual-link
>
> They have been tested successfully on the D3 Draak board. I expect them
> to work on E3 as well, but I don't have access to an Ebisu board to test
> this.

I have now tested the series on E3 Ebisu board using kms-tests using
the HDMI output and I confirm it works as expected.

For the whole series:
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>
> Laurent Pinchart (10):
>   drm: bridge: Add dual_link field to the drm_bridge_timings structure
>   dt-bindings: display: bridge: thc63lvd1024: Document dual-link
>     operation
>   drm: bridge: thc63: Report input bus mode through bridge timings
>   dt-bindings: display: renesas: lvds: Add renesas,companion property
>   drm: rcar-du: lvds: Remove LVDS double-enable checks
>   drm: rcar-du: lvds: Add support for dual-link mode
>   drm: rcar-du: Skip LVDS1 output on Gen3 when using dual-link LVDS mode
>   arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its companion LVDS1
>   [HACK] arm64: dts: renesas: draak: Enable LVDS dual-link operation
>   [HACK] arm64: dts: renesas: ebisu: Enable LVDS dual-link operation
>
>  .../bindings/display/bridge/renesas,lvds.txt  |   6 +
>  .../display/bridge/thine,thc63lvd1024.txt     |   6 +
>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts |  21 ++-
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi     |   2 +
>  .../arm64/boot/dts/renesas/r8a77995-draak.dts |  21 ++-
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi     |   2 +
>  drivers/gpu/drm/bridge/thc63lvd1024.c         |  54 ++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     |  12 ++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c           | 123 +++++++++++++-----
>  drivers/gpu/drm/rcar-du/rcar_lvds.h           |   5 +
>  include/drm/drm_bridge.h                      |   8 ++
>  12 files changed, 214 insertions(+), 48 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
>

--uxafowhmgmdzm5r4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlztC1EACgkQcjQGjxah
VjwFQQ/9E3PmQPv6P8/nJOR+8OfmH7lS0tYEQQIsXNnXGHSPe3QIZL104LuEfhr9
t3b4/GPfDQsXlIDs5PaZlRDEndKWxyQ8YKV8YKPHjVvo/mgV1CstkhwUWFjdtYRX
wZh8jPRcL8KsKVcTYqL0OgvjpqS/nUjF328u0pHHjyoBvEaL3N+1AHHx1lb4q3zc
Lpz7XuPsXgDgR+M+V7CI+Ge2jDKOqsc3gssGnFO8f0WUoVo2OybKZnl98OVAb0rO
u78RK3w19Zrv5XtXdE2sfwBYeWgCJ+HLQVR/Oai2cblDeB7eQQyKhP4BeVlJUVC6
c7ooAxB5Ax61NdQcGp9KfhVsSAuovS2lCwXjUwi7ElAgtU+7qMpDE22MfrYgXe0i
qalMzxLv94KZrmTkuw++a5VCrDAsY9QxPHCKq7zBF1vA7gyt/DcsTCawNykizAbo
KdYl8pNH4pxR5X0XdPyqQghtYnMO1sLWBmngCfesC1v4aTD41sVUolXN/gLi3VKh
c8zyEukzH5Vxz3c9XQ03yE3+ZBqaUAFZ/I0F6qtYOHHx4sKFiC30WZuk2DaNcQLM
YB2pC6OQHFng46jdw6kr7L4xMfE1GKgEfuti4eU8zzbYR8dkkxNyZCajW51XmROD
Zc7o15ykc79flm/QstWjI3aNkYN+EvwfGySuZEwRs9mIhHVadKY=
=gstV
-----END PGP SIGNATURE-----

--uxafowhmgmdzm5r4--

--===============1426525996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1426525996==--
