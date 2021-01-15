Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E532F8CF7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B687B6E5D3;
	Sat, 16 Jan 2021 10:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D906E4E8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:21:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 065C4AA6F;
 Fri, 15 Jan 2021 18:21:19 +0000 (UTC)
Message-ID: <b707107cfd81e556e446c8691f04dc8d247f81ac.camel@suse.de>
Subject: Re: [PATCH V4] dt-bindings: gpu: Convert v3d to json-schema
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 15 Jan 2021 19:21:17 +0100
In-Reply-To: <1610564917-11559-1-git-send-email-stefan.wahren@i2se.com>
References: <1610564917-11559-1-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1042030434=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1042030434==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-9bhOjb89UhlJwDzoHjSe"


--=-9bhOjb89UhlJwDzoHjSe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-13 at 20:08 +0100, Stefan Wahren wrote:
> This converts the v3d bindings to yaml format.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas

>=20
> Changes in V4:
> - define order for required reg-names
> - adapt example
>=20
> Changes in V3:
> - drop redundant maxItems in case we already have items defined
> - fix order of reg-names enum
> - tag required items in description
> - add reg-names to required properties
> - drop clock-names
>=20
> =C2=A0.../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
> =C2=A0.../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 75 +++++++++++=
+++++++++++
> =C2=A02 files changed, 75 insertions(+), 33 deletions(-)
> =C2=A0delete mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v=
3d.txt
> =C2=A0create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v=
3d.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt b/Doc=
umentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> deleted file mode 100644
> index b2df82b..0000000
> --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Broadcom V3D GPU
> -
> -Only the Broadcom V3D 3.x and newer GPUs are covered by this binding.
> -For V3D 2.x, see brcm,bcm-vc4.txt.
> -
> -Required properties:
> -- compatible:	Should be "brcm,7268-v3d" or "brcm,7278-v3d"
> -- reg:		Physical base addresses and lengths of the register areas
> -- reg-names:	Names for the register areas.  The "hub" and "core0"
> -		  register areas are always required.  The "gca" register area
> -		  is required if the GCA cache controller is present.  The
> -		  "bridge" register area is required if an external reset
> -		  controller is not present.
> -- interrupts:	The interrupt numbers.  The first interrupt is for the hub=
,
> -		  while the following interrupts are separate interrupt lines
> -		  for the cores (if they don't share the hub's interrupt).
> -		  See bindings/interrupt-controller/interrupts.txt
> -
> -Optional properties:
> -- clocks:	The core clock the unit runs on
> -- resets:	The reset line for v3d, if not using a mapping of the bridge
> -		  See bindings/reset/reset.txt
> -
> -v3d {
> -	compatible =3D "brcm,7268-v3d";
> -	reg =3D <0xf1204000 0x100>,
> -	      <0xf1200000 0x4000>,
> -	      <0xf1208000 0x4000>,
> -	      <0xf1204100 0x100>;
> -	reg-names =3D "bridge", "hub", "core0", "gca";
> -	interrupts =3D <0 78 4>,
> -		     <0 77 4>;
> -};
> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Do=
cumentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> new file mode 100644
> index 0000000..fbce844
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/brcm,bcm-v3d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom V3D GPU Bindings
> +
> +maintainers:
> +  - Eric Anholt <eric@anholt.net>
> +  - Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> +
> +properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - brcm,7268-v3d
> +      - brcm,7278-v3d
> +
> +  reg:
> +    items:
> +      - description: hub register (required)
> +      - description: core0 register (required)
> +      - description: GCA cache controller register (if GCA controller pr=
esent)
> +      - description: bridge register (if no external reset controller)
> +    minItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: hub
> +      - const: core0
> +      - enum: [ bridge, gca ]
> +      - enum: [ bridge, gca ]
> +    minItems: 2
> +    maxItems: 4
> +
> +  interrupts:
> +    items:
> +      - description: hub interrupt (required)
> +      - description: core interrupts (if it doesn't share the hub's inte=
rrupt)
> +    minItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpu@f1200000 {
> +      compatible =3D "brcm,7268-v3d";
> +      reg =3D <0xf1200000 0x4000>,
> +            <0xf1208000 0x4000>,
> +            <0xf1204000 0x100>,
> +            <0xf1204100 0x100>;
> +      reg-names =3D "hub", "core0", "bridge", "gca";
> +      interrupts =3D <0 78 4>,
> +                   <0 77 4>;
> +    };
> +
> +...



--=-9bhOjb89UhlJwDzoHjSe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmAB3R0ACgkQlfZmHno8
x/6zlAgAr4hmHIcqPIBSJv91KJeRqu6x3uKC+AxZNzD3O+P4ajSUtYjdBeZ7UAcq
JI/l6zhuTsALg8CjWSFsbwXxkOzzfamUNk80gqo/0ug87hhODasgLui53GrOFjH6
06k8EoncuUwwNmiPTQGOqEg82Kitxx4mjhV7jJgCbI10LewDgVB2IPlAVwkpTW/z
nqJ/Hk1AlHcWKqozBVGw7veNCG83yk+Sf/tdjuYA9rS1LTk8y8sE0uu/sZtailHu
sFm8S8a0ouFSMPRYwVYrZaIRC+lbDK5Kf6S3iKUFU6s3/gqnZHgrIyRSDfaoMDll
9IoxDo306UB0DwM67LnVvxSMivBacQ==
=4lrW
-----END PGP SIGNATURE-----

--=-9bhOjb89UhlJwDzoHjSe--


--===============1042030434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1042030434==--

