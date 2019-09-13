Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41228B23DE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 18:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726E6F415;
	Fri, 13 Sep 2019 16:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF2C6F415
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 16:11:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 997F43A8479
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 15:58:41 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 91F7B1C0008;
 Fri, 13 Sep 2019 15:58:15 +0000 (UTC)
Date: Fri, 13 Sep 2019 17:58:15 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add xylon logicvc bindings
 documentation
Message-ID: <20190913155815.GA1554@aptenodytes>
References: <20190910153409.111901-1-paul.kocialkowski@bootlin.com>
 <20190910153409.111901-2-paul.kocialkowski@bootlin.com>
 <20190913143510.GA9504@bogus>
MIME-Version: 1.0
In-Reply-To: <20190913143510.GA9504@bogus>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0794407143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0794407143==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob and thanks for the review!

On Fri 13 Sep 19, 15:35, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 05:34:08PM +0200, Paul Kocialkowski wrote:
> > The Xylon LogiCVC is a display controller implemented as programmable
> > logic in Xilinx FPGAs.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  .../bindings/display/xylon,logicvc.txt        | 188 ++++++++++++++++++
> >  1 file changed, 188 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/xylon,log=
icvc.txt
>=20
> Consider converting this to DT schema format. See=20
> Documentation/devicetree/writing-schema.rst (.md in 5.3).

Oh right, that would certainly be much more future-proof!

> > diff --git a/Documentation/devicetree/bindings/display/xylon,logicvc.tx=
t b/Documentation/devicetree/bindings/display/xylon,logicvc.txt
> > new file mode 100644
> > index 000000000000..eb4b1553888a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/xylon,logicvc.txt
> > @@ -0,0 +1,188 @@
> > +Xylon LogiCVC display controller
> > +
> > +The Xylon LogiCVC is a display controller that supports multiple layer=
s.
> > +It is usually implemented as programmable logic and was optimized for =
use
> > +with Xilinx Zynq-7000 SoCs and Xilinx FPGAs.
> > +
> > +Because the controller is intended for use in a FPGA, most of the conf=
iguration
> > +of the controller takes place at logic configuration bitstream synthes=
is time.
> > +As a result, many of the device-tree bindings are meant to reflect the
> > +synthesis configuration. These do not allow configuring the controller
> > +differently than synthesis configuration.
> > +
> > +Layers are declared in the "layers" sub-node and have dedicated config=
uration.
> > +In version 3 of the controller, each layer has fixed memory offset and=
 address
> > +starting from the video memory base address for its framebuffer. With =
version 4,
> > +framebuffers are configured with a direct memory address instead.
> > +
> > +Matching synthesis parameters are provided when applicable.
> > +
> > +Required properties:
> > +- compatible: Should be one of:
> > +  "xylon,logicvc-3.02.a-display"
> > +  "xylon,logicvc-4.01.a-display"
> > +- reg: Physical base address and size for the controller registers.
> > +- clocks: List of phandle and clock-specifier pairs, one for each entry
> > +  in 'clock-names'
> > +- clock-names: List of clock names that should at least contain:
> > +  - "vclk": The VCLK video clock input.
> > +- interrupts: The interrupt to use for VBLANK signaling.
> > +- xylon,display-interface: Display interface in use, should be one of:
> > +  - "lvds-4bits": 4-bit LVDS interface (C_DISPLAY_INTERFACE =3D=3D 4).
> > +- xylon,display-colorspace: Display output colorspace in use, should b=
e one of:
> > +  - "rgb": RGB colorspace (C_DISPLAY_COLOR_SPACE =3D=3D 0).
> > +- xylon,display-depth: Display output depth in use (C_PIXEL_DATA_WIDTH=
).
> > +- xylon,row-stride: Fixed number of pixels in a framebuffer row (C_ROW=
_STRIDE).
> > +- xylon,layers-count: The number of available layers (C_NUM_OF_LAYERS).
>=20
> Presumably some of this is determined by the display attached. Isn't it=
=20
> safe to assume the IP was configured correctly for the intended display=
=20
> and you can just get this from the panel?

Layers are what corresponds to DRM planes, which are not actually indicated
by the panel but are a charasteristic of the display controller. In our cas=
e,
this is directly selected at bitstream synthesis time for the controller.

So I'm afraid there is no way we can auto-detect this from the driver.

>=20
> > +Optional properties:
> > +- memory-region: phandle to a node describing memory, as specified in:
> > +  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > +- clock-names: List of clock names that can optionally contain:
> > +  - "vclk2": The VCLK2 doubled-rate video clock input.
> > +  - "lvdsclk": The LVDS clock.
> > +  - "lvdsclkn": The LVDS clock inverted.
>=20
> How are these really optional?

Well, the controller currently only supports LVDS, but more interfaces may =
be
added later, so the lvdsclk clock will be optional when another interface
is used instead. Maybe I'm mistaken about how to categorize them though.

My understanding is that the need for vclk2 and lvdsclkn depend on the targ=
et
FPGA family. I've developped the driver without the need for them, but the
datasheet states that they may be needed (but doesn't provide significant
details about their role though).

> > +- xylon,syscon: Syscon phandle representing the logicvc instance.
> > +- xylon,dithering: Dithering module is enabled (C_XCOLOR).
> > +- xylon,background-layer: The last layer is used to display a black ba=
ckground
> > +  (C_USE_BACKGROUND). It must still be registered.
> > +- xylon,layers-configurable: Configuration of layers' size, position a=
nd offset
> > +  is enabled (C_USE_SIZE_POSITION).
>=20
> I would think this will effectively have to be enabled to make this=20
> usable with DRM. I'm not sure if a "standard" userspace would use any of=
=20
> the layers if all this is fixed.

I was going with the same assumption, but drm_atomic_helper_check_plane_sta=
te
has a can_position parameter, which will check that the plane covers the
whole CRTC if set to false. So I guess it is somewhat expected that this can
be the case and some drivers (e.g. arm/hdlcd_crtc.c) also set this to false.

I guess this falls under a more generic discussion of what should be expect=
ed
by userspace when it comes to DRM. Since drivers may reject commits because=
 of
any hardware-specific limitation, there is definitely a significant grey ar=
ea
there and apparently no common rule.

> > +
> > +Required sub-nodes:
> > +- layers: The description of the display controller layers, containing=
 layer
> > +  sub-nodes that each describe a registered layer.
> > +- ports: The LogiCVC connection to an encoder input port. The connecti=
on
> > +  is modeled using the OF graph bindings, as specified in:
> > +  Documentation/devicetree/bindings/graph.txt
> > +
> > +Required layer properties:
> > +- reg: Layer index (from front to back, starting at 0).
> > +- xylon,layer-depth: Layer depth in use (C_LAYER_0_DATA_WIDTH).
> > +- xylon,layer-colorspace: Layer colorspace in use, should be one of:
> > + - "rgb": RGB colorspace (C_LAYER_*_TYPE =3D=3D 0).
>=20
> Why is this needed if there's only 1?

The hardware supports more but support is no implemented yet, so the binding
document may be enriched along with the driver in the future.

Should I describe other colorspaces even if they are not currently supporte=
d?

> > +- xylon,layer-alpha-mode: Alpha mode for the layer, should be one of:
> > + - "layer": Alpha is configured layer-wide (C_LAYER_*_ALPHA_MODE =3D=
=3D 0).
> > + - "pixel": Alpha is configured per-pixel (C_LAYER_*_ALPHA_MODE =3D=3D=
 1).
>=20
> Could just be boolean.

In this instance too, there are other modes that are not yet implemented but
supported by the hardware, so I did not describe them yet but they may be a=
dded
later.

> > +- xylon,layer-base-offset: offset in number of lines (C_LAYER_*_OFFSET=
) starting
> > +  from the video RAM base (C_VMEM_BASEADDR), only for version 3.
> > +- xylon,layer-buffer-offset: offset in number of lines (C_BUFFER_*_OFF=
SET)
> > +  starting from the layer base offset for the second buffer used in
> > +  double-buffering.
>=20
> It might be better to define all this in terms of byte offsets. I'd=20
> guess that is what CPU accesses are going to need.

I agree that it is more convenient from a driver's perspective, but the
rationale is that this allows copying parameters directly from the synthesis
configuration file, where these are expressed as a number of lines.

I would like to keep both delcarations as close to eachother as possible, a=
s to
facilitate integration work for future users of the driver. But maybe this =
is a
bit too much in that case. What do you think?

Thanks again for the constructive feedback!

Cheers,

Paul

> > +
> > +Optional layer properties:
> > +- xylon,layer-primary: Layer should be registered as a primary plane (=
exactly
> > +  one is required).
> > +
> > +Example:
> > +
> > +	reserved-memory {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		ranges;
> > +
> > +		logicvc_cma: cma@1f800000 {
> > +			compatible =3D "shared-dma-pool";
> > +			size =3D <0x800000>;
> > +			alloc-ranges =3D <0x1f800000 0x800000>;
> > +			reusable;
> > +		};
> > +	};
> > +
> > +	logicvc: logicvc@43c00000 {
> > +		compatible =3D "syscon", "simple-mfd";
> > +		reg =3D <0x43c00000 0x6000>;
> > +
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +
> > +		logicvc_display: display-engine@0 {
> > +			compatible =3D "xylon,logicvc-3.02.a-display";
> > +			reg =3D <0x0 0x6000>;
> > +			memory-region =3D <&logicvc_cma>;
> > +
> > +			clocks =3D <&logicvc_vclk 0>, <&logicvc_lvdsclk 0>;
> > +			clock-names =3D "vclk", "lvdsclk";
> > +
> > +			interrupt-parent =3D <&intc>;
> > +			interrupts =3D <0 34 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			xylon,syscon =3D <&logicvc>;
> > +
> > +			xylon,display-interface =3D "lvds-4bits";
> > +			xylon,display-colorspace =3D "rgb";
> > +			xylon,display-depth =3D <16>;
> > +			xylon,row-stride =3D <1024>;
> > +
> > +			xylon,layers-configurable;
> > +			xylon,layers-count =3D <5>;
> > +
> > +			layers {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				layer@0 {
> > +					reg =3D <0>;
> > +					xylon,layer-depth =3D <16>;
> > +					xylon,layer-colorspace =3D "rgb";
> > +					xylon,layer-alpha-mode =3D "layer";
> > +					xylon,layer-base-offset =3D <0>;
> > +					xylon,layer-buffer-offset =3D <480>;
> > +					xylon,layer-primary;
> > +				};
> > +
> > +				layer@1 {
> > +					reg =3D <1>;
> > +					xylon,layer-depth =3D <16>;
> > +					xylon,layer-colorspace =3D "rgb";
> > +					xylon,layer-alpha-mode =3D "layer";
> > +					xylon,layer-base-offset =3D <2400>;
> > +					xylon,layer-buffer-offset =3D <480>;
> > +				};
> > +
> > +				layer@2 {
> > +					reg =3D <2>;
> > +					xylon,layer-depth =3D <16>;
> > +					xylon,layer-colorspace =3D "rgb";
> > +					xylon,layer-alpha-mode =3D "layer";
> > +					xylon,layer-base-offset =3D <960>;
> > +					xylon,layer-buffer-offset =3D <480>;
> > +				};
> > +
> > +				layer@3 {
> > +					reg =3D <3>;
> > +					xylon,layer-depth =3D <16>;
> > +					xylon,layer-colorspace =3D "rgb";
> > +					xylon,layer-alpha-mode =3D "layer";
> > +					xylon,layer-base-offset =3D <480>;
> > +					xylon,layer-buffer-offset =3D <480>;
> > +				};
> > +
> > +				layer@4 {
> > +					reg =3D <4>;
> > +					xylon,layer-depth =3D <16>;
> > +					xylon,layer-colorspace =3D "rgb";
> > +					xylon,layer-alpha-mode =3D "layer";
> > +					xylon,layer-base-offset =3D <8192>;
> > +					xylon,layer-buffer-offset =3D <480>;
> > +				};
> > +			};
> > +
> > +			ports {
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				logicvc_out: port@1 {
> > +					reg =3D <1>;
> > +
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +
> > +					logicvc_output: endpoint@0 {
> > +						reg =3D <0>;
> > +						remote-endpoint =3D <&panel_input>;
> > +					};
> > +				};
> > +			};
> > +		};
> > +	};
> > --=20
> > 2.23.0
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl17vJcACgkQ3cLmz3+f
v9GkNgf/bvKdo9VSwr1LmI2F/lBdm7ahWJs2b1IHBcirnANnGpq4I0APdVAaP1i1
A6D6BBcXQM26VR89G4cHMz7MovxJ8szarQRs28KseOJ0dBSuv48JCafyAU5NyKL0
ta54b1rnuq5JXXvWZW4FOMV0hkefGXTYNA7ZQHhF6+E8iIXz501fjehkAql2yGvF
8xCRpgU16HSGcBF112JtpLnc8FoPqSs7+12PN7j6S6HG2Rg9pkOZiRFTOTKeqmfo
z0Z9DKRMmG/enVk17ag6IkFv2pWsQp+HeXcjQg1McrIxjKzNmrOTOnM/w8/zNzRD
OXgI6nEf0Gq3fVhdez2w6WqG67JSng==
=L8S8
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

--===============0794407143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0794407143==--
