Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D427797A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 21:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2536EB57;
	Thu, 24 Sep 2020 19:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935C96EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 19:38:14 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D99292007A;
 Thu, 24 Sep 2020 21:38:08 +0200 (CEST)
Date: Thu, 24 Sep 2020 21:38:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [RFC PATCH v1 3/3] dt-binding: display: Require two rests on
 mantix panel
Message-ID: <20200924193807.GA1223313@ravnborg.org>
References: <cover.1600707235.git.agx@sigxcpu.org>
 <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=6LdyRFKnEOD0PBeQgTUA:9
 a=wPNLvfGTeEIA:10 a=iBZjaW-pnkserzjvUTHh:22
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
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

On Mon, Sep 21, 2020 at 06:55:52PM +0200, Guido G=FCnther wrote:
> We need to reset both for the panel to show an image.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>  .../bindings/display/panel/mantix,mlaf057we51-x.yaml       | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> =

> diff --git a/Documentation/devicetree/bindings/display/panel/mantix,mlaf0=
57we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,mlaf=
057we51-x.yaml
> index 937323cc9aaa..ba5a18fac9f9 100644
> --- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-=
x.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-=
x.yaml
> @@ -35,7 +35,9 @@ properties:
>    vddi-supply:
>      description: 1.8V I/O voltage supply
>  =

> -  reset-gpios: true
> +  reset-gpios:
> +    minItems: 2
> +    maxItems: 2

reset-gpios is, as you already wrote, defined in panel-common.yaml.
Do not try to change it here.
It would be much better, I think, to introduce a mantix,reset-gpios
property.

This would avoid that we had two different reset-gpios definitions.

	Sam

>  =

>    backlight: true
>  =

> @@ -62,7 +64,8 @@ examples:
>              avdd-supply =3D <&reg_avdd>;
>              avee-supply =3D <&reg_avee>;
>              vddi-supply =3D <&reg_1v8_p>;
> -            reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> +            reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>,
> +                          <&gpio1 24 GPIO_ACTIVE_LOW>;
>              backlight =3D <&backlight>;
>          };
>      };
> -- =

> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
