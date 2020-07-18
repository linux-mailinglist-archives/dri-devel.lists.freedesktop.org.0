Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5E4224D2D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 18:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1535E6E154;
	Sat, 18 Jul 2020 16:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBA76E154
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 16:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id E1245FB03;
 Sat, 18 Jul 2020 18:52:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wM7kdGGFcpcI; Sat, 18 Jul 2020 18:52:16 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 13A4A42576; Sat, 18 Jul 2020 18:52:16 +0200 (CEST)
Date: Sat, 18 Jul 2020 18:52:16 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Fix example in nwl-dsi.yaml
Message-ID: <20200718165215.GA26122@bogon.m.sigxcpu.org>
References: <20200703114717.2140832-1-megous@megous.com>
 <20200703114717.2140832-2-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703114717.2140832-2-megous@megous.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Jul 03, 2020 at 01:47:16PM +0200, Ondrej Jirman wrote:
> The example is now validated against rocktech,jh057n00900 schema
> that was ported to yaml, and didn't validate with:
> =

> - '#address-cells', '#size-cells', 'port@0' do not match any of
>   the regexes: 'pinctrl-[0-9]+'
> - 'vcc-supply' is a required property
> - 'iovcc-supply' is a required property
> - 'reset-gpios' is a required property
> =

> Fix it.
> =

> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/display/bridge/nwl-dsi.yaml      | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yam=
l b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 8aff2d68fc33..2c4c34e3bc29 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -165,6 +165,7 @@ examples:
>   - |
>  =

>     #include <dt-bindings/clock/imx8mq-clock.h>
> +   #include <dt-bindings/gpio/gpio.h>
>     #include <dt-bindings/interrupt-controller/arm-gic.h>
>     #include <dt-bindings/reset/imx8mq-reset.h>
>  =

> @@ -191,12 +192,12 @@ examples:
>                phy-names =3D "dphy";
>  =

>                panel@0 {
> -                      #address-cells =3D <1>;
> -                      #size-cells =3D <0>;
>                        compatible =3D "rocktech,jh057n00900";
>                        reg =3D <0>;
> -                      port@0 {
> -                           reg =3D <0>;
> +                      vcc-supply =3D <&reg_2v8_p>;
> +                      iovcc-supply =3D <&reg_1v8_p>;
> +                      reset-gpios =3D <&gpio3 13 GPIO_ACTIVE_LOW>;
> +                      port {
>                             panel_in: endpoint {
>                                       remote-endpoint =3D <&mipi_dsi_out>;
>                             };

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
 -- Guido
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
