Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BCC9179B2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B097510E786;
	Wed, 26 Jun 2024 07:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="WiWg6OBN";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B/4XSzcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B986110E786
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719386992; x=1750922992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35gUMXrwDxu+zVgJhUMFNejs6Dxk9mfeBUbzNjkdFO4=;
 b=WiWg6OBNnaASnTVyA0WHGM20PKG8BvEdIgMcRXS/ms6kisEjTEGduHCG
 D17kNrdw9pjb50PrIfGiGGNK0MNfQ6A1WdxiGDTbJrhAk/hGrJKclkFYb
 Fh7BquLIPRPnIQgDkV+oC5siQfSici4MHQQV5fFlEsPhXxBOy5QxPZorB
 mrM4KTIyCA2d5BGtW2dNbGzuMKIvFvzNo+pzUKXZ7Eg3fBoSp9dA72k9n
 eYi/vxIqHqaaDFcJ80PsY4AykizejB47AU1VUtq+83o3GdgNRr7tu40hy
 ZTiKiSeI2sijqQnhbbAxo/1334O6yjkOornd90J2O6S/vAOPev8muHvpV g==;
X-CSE-ConnectionGUID: 3vNvTe7/Qz+WBim472UugQ==
X-CSE-MsgGUID: /hVNikLfTGaal7+JeNfhxg==
X-IronPort-AV: E=Sophos;i="6.08,266,1712613600"; d="scan'208";a="37591064"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Jun 2024 09:29:50 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6949C163B18; Wed, 26 Jun 2024 09:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719386985;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=35gUMXrwDxu+zVgJhUMFNejs6Dxk9mfeBUbzNjkdFO4=;
 b=B/4XSzcrCjSFyfnzKDDZ7DxNh0wk0lQLBytgMzPAWYBHC94J8K9ET/pG8C2lINUFcHVhvY
 osIbUx/JY+sAD9SyW4noHiFx64E46yfntjyeCa/uCDSzFlpiRZV+MdlbcEIk37CIdTbd7N
 VJwftJoNr78S/tFtUP87o7yMajPZ4FzP2xHy8bP0KVqyOhFsnY2ympMYovp2SrR5BhoYDI
 kvVWPsO2vNG1L3uDZmsXFnTKAcCvitz1ngP+hUrCjBH9yYC02mmk5d8xq4KahG/twt4cNA
 bpsHvSme2yzG/HCFNWelPwfYW38Yod8lTWyaK86lUDaF/Q7/iQaOFl9DUUo/sw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
Date: Wed, 26 Jun 2024 09:29:45 +0200
Message-ID: <2118572.KlZ2vcFHjT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240625120552.145389-1-marex@denx.de>
References: <20240625120552.145389-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Marek,

Am Dienstag, 25. Juni 2024, 14:05:14 CEST schrieb Marek Vasut:
> Document default DP port preemphasis configurable via new DT property
> "toshiba,pre-emphasis". This is useful in case the DP link properties
> are known and starting link training from preemphasis setting of 0 dB
> is not useful. The preemphasis can be set separately for both DP lanes
> in range 0=3D0dB, 1=3D3.5dB, 2=3D6dB .
>=20
> This is an endpoint property, not a port property, because the TC9595
> datasheet does mention that the DP might operate in some sort of split
> mode, where each DP lane is used to feed one display, so in that case
> there might be two endpoints.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
> V2: - Fix the type to u8 array
>     - Fix the enum items to match what they represent
> V3: - Update commit message, expand on this being an endpoint property
> ---
>  .../display/bridge/toshiba,tc358767.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc3=
58767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358=
767.yaml
> index 2ad0cd6dd49e0..9490854c22f3b 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.y=
aml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.y=
aml
> @@ -98,6 +98,24 @@ properties:
>              reference to a valid eDP panel input endpoint node. This por=
t is
>              optional, treated as DP panel if not defined
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              toshiba,pre-emphasis:
> +                description:
> +                  Display port output Pre-Emphasis settings for both DP =
lanes.
> +                $ref: /schemas/types.yaml#/definitions/uint8-array
> +                minItems: 2
> +                maxItems: 2
> +                items:
> +                  enum:
> +                    - 0 # No pre-emphasis
> +                    - 1 # 3.5dB pre-emphasis
> +                    - 2 # 6dB pre-emphasis
> +
>      oneOf:
>        - required:
>            - port@0
>=20

I get this warning:
> mx8mp-tqma8mpql-mba8mpxl.dtb: bridge@f: ports:port@2:endpoint: Unevaluated
> properties are not allowed ('toshiba,pre-emphasis' was unexpected)

DT node looks like this:

port@2 {
	reg =3D <2>;

	endpoint {
		toshiba,pre-emphasis =3D /bits/ 8 <1 1>;
	};
};

I think you are missing this change as well:
=2D- 8< --
=2D-- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.y=
aml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -92,7 +92,8 @@ properties:
             reference to a valid DPI output or input endpoint node.
=20
       port@2:
=2D        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: |
             eDP/DP output port. The remote endpoint phandle should be a
             reference to a valid eDP panel input endpoint node. This port =
is
=2D- 8< --

How would you determine the values to be set here? I suspect it's the value
from register DP0_SnkLTChReq (0x6d4) after link training. Are they dependent
on the actual display to be attached?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


