Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEE480F560
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 19:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7478F10E687;
	Tue, 12 Dec 2023 18:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A4E510E690
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 18:19:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rD7Ls-0006nY-1E; Tue, 12 Dec 2023 19:19:28 +0100
Message-ID: <9089fb993eb0b2b630784e5b91cb88c1ff2f45fb.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/mxsfb: Add an entry for "fsl,imx8mq-lcdif"
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>, marex@denx.de
Date: Tue, 12 Dec 2023 19:19:25 +0100
In-Reply-To: <20231211204138.553141-1-festevam@gmail.com>
References: <20231211204138.553141-1-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, martink@posteo.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio,

Am Montag, dem 11.12.2023 um 17:41 -0300 schrieb Fabio Estevam:
> From: Fabio Estevam <festevam@denx.de>
>=20
> On i.MX6SX, the LCDIF has an associated power domain.
>=20
> However, i.MX8MQ does not have an LCDIF power domain.
>=20
> imx8mq.dtsi has the following compatible string:
>=20
> compatible =3D "fsl,imx8mq-lcdif", "fsl,imx6sx-lcdif";
>=20
> which causes the following dt-schema warning:
>=20
> imx8mq-evk.dtb: lcd-controller@30320000: 'power-domains' is a required pr=
operty
> 	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>=20
> To prevent this problem, add a specific fsl,imx8mq-lcdif entry in
> the driver to properly handle such a power-domain requirement difference.
>=20
I don't really like this series. While we don't make any strong
guarantees in this way, it breaks booting older kernels with a new DT.

As this driver patch shows, there are no actual differences in the IP
block between i.MX6SX and i.MX8MQ, it's just the SoC integration that's
different, where in one SoC the controller is located in a power
domain, while it isn't in another.

To me this smells like making changes to parts that don't really care
about those differences. The thing that cares about the difference is
the DT schema validation and I feel like there must be a better way to
describe this in the schema than to patch both driver and DT just to
accommodate a SoC integration difference. Is there a way to make the
power-domain property not dependent on the IP block, but the machine
compatible?

Regards,
Lucas

> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mx=
sfb_drv.c
> index b483ef48216a..ac9ce3b45b38 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -340,6 +340,7 @@ static const struct of_device_id mxsfb_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx23-lcdif", .data =3D &mxsfb_devdata[MXSFB_V3]=
, },
>  	{ .compatible =3D "fsl,imx28-lcdif", .data =3D &mxsfb_devdata[MXSFB_V4]=
, },
>  	{ .compatible =3D "fsl,imx6sx-lcdif", .data =3D &mxsfb_devdata[MXSFB_V6=
], },
> +	{ .compatible =3D "fsl,imx8mq-lcdif", .data =3D &mxsfb_devdata[MXSFB_V6=
], },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);

