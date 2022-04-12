Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F744FD2E9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E9D10E55A;
	Tue, 12 Apr 2022 08:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D31910E55A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:23:39 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B177E0004;
 Tue, 12 Apr 2022 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649751816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8/BUvdkEcJIRkkGqjqjfSEkXhbiW0if/BHm1OExvqGA=;
 b=P9hyo6f3qtS5V49850/VVxAN9C6ND+mD+VPXg0F4wUi3QSUxHf1VkVETXtlFvbqWnK5NRI
 RNYR/5GFcxw7PqVyrR2TOGD/0FQytBYI+U7URWyvg4lwJsD9ilIgnG6NWTgg0K9gcqUOVM
 6BsdqJClAalYBKBirbsuQYd1p2hgVJSDZIoKZbB3kz3l44DVGS9WHEUCSICyYaP/rro2jM
 tiMBaSZ/83l5ffSITSmvssg3HtS9qqWCJ3D+7bFZs7XALLIefz9oO9HUDr3c3kXHIurgVU
 9XxGovWl0RAi8WQIa5GwfPmZVKHc/GZqTt3M/VNaMAIA96rA2XI7vMABe86jsw==
Date: Tue, 12 Apr 2022 10:23:34 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] drm: of: Improve error handling in bridge/panel detection
Message-ID: <YlU3BsARY6GB6/qC@aptenodytes>
References: <20220407093408.1478769-1-paul.kocialkowski@bootlin.com>
 <YlD4235/tGsQqede@yoga.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RsThgsWvuAuvhE8K"
Content-Disposition: inline
In-Reply-To: <YlD4235/tGsQqede@yoga.lan>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--RsThgsWvuAuvhE8K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

with a question for Jagan at the end.

On Fri 08 Apr 22, 22:09, Bjorn Andersson wrote:
> On Thu 07 Apr 04:34 CDT 2022, Paul Kocialkowski wrote:
>=20
> > With the previous rework of drm_of_find_panel_or_bridge only
> > -EPROBE_DEFER is returned while previous behavior allowed -ENODEV
> > to be returned when the port/endpoint is either missing or unavailable.
> >=20
> > Make the default return code of the function -ENODEV to handle this and
> > only return -EPROBE_DEFER in find_panel_or_bridge when the of device is
> > available but not yet registered. Also return the error code whenever
> > the remote node exists to avoid checking for child nodes.
> >=20
> > Checking child nodes could result in -EPROBE_DEFER returned by
> > find_panel_or_bridge with an unrelated child node that would overwrite
> > a legitimate -ENODEV from find_panel_or_bridge if the remote node from
> > the of graph is unavailable. This happens because find_panel_or_bridge
> > has no way to distinguish between a legitimate panel/bridge node that
> > isn't yet registered and an unrelated node.
> >=20
> > Add comments around to clarify this behavior.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Fixes: 67bae5f28c89 ("drm: of: Properly try all possible cases for brid=
ge/panel detection")
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> >=20
>=20
> Thanks for your patch, this does seem to solve the first problem I
> reported, where I have a DisplayPort bridge with the following content:
>=20
> sn65dsi86: bridge@2c {
> 	compatible =3D "ti,sn65dsi86";
> 	...;
>=20
> 	ports {
> 		port@0 {
> 			reg =3D <0>;
> 			sn65dsi86_in_a: endpoint {
> 				remote-endpoint =3D <&dsi0_out>;
> 			};
> 		};
>=20
> 		port@1 {
> 			reg =3D <1>;
> 			sn65dsi86_out: endpoint {
> 				remote-endpoint =3D <&panel_in_edp>;
> 			};
> 		};
> 	};
>=20
> 	aux-bus {
> 		panel: panel {
> 			compatible =3D "boe,nv133fhm-n61";
> 			backlight =3D <&backlight>;
>=20
> 			port {
> 				panel_in_edp: endpoint {
> 					remote-endpoint =3D <&sn65dsi86_out>;
> 				};
> 			};
> 		};
> 	};
> };
>=20
> The code now finds a match on of_graph_get_remote_node() and returns 0
> or -EPROBE_DEFER from find_panel_or_bridge(?, 1, ?). And we return this,
> before failing to resolve the "aux-bus" as a panel.

Sounds good!

> But my other case still doesn't work:
>=20
> mdss_dp: displayport-controller@ae90000 {
> 	compatible =3D "qcom,sm8350-dp";
> 	...;
> 	operating-points-v2 =3D <&dp_opp_table>;
>=20
> 	ports {
> 		port@0 {
> 			reg =3D <0>;
> 			dp_in: endpoint {
> 				remote-endpoint =3D <&dpu_intf0_out>;
> 			};
> 		};
> 	};
>=20
> 	dp_opp_table: opp-table {
> 		...
> 	};
> };
>=20
> port@1 may be a reference to a DisplayPort panel, but in this particular
> case the output is a USB Type-c connector (compatible
> "usb-c-connector"). So I'm not able to specify this link, given that it
> will not be a bridge or panel...ever...

So in this case you have one port that can go either to a panel or a connec=
tor.
Using drm_of_find_panel_or_bridge will always return -EPROBE_DEFER for the
connector (I suspect this was also the previous behavior) so I think you sh=
ould
first check (in the driver) if the remote is a type-c connector
(of_graph_get_remote_node +  of_device_is_compatible) and use
drm_of_find_panel_or_bridge if not.

> So this does not find a match on of_graph_get_remote_node(np, 1, ?), so
> we move ahead and look at all children not named "port" or "ports". We
> find the opp-table and concludes that this not a panel. At this point
> ret is overwritten and we end up returning -EPROBE_DEFER.

So if I understand correctly, port@1 is not defined when the issue happens
and it returns -EPROBE_DEFER like you described.

We could step things up a notch and return -ENODEV if of_graph_is_present
but of_graph_get_remote_node returns NULL. The idea would be that if the of
graph is present, the child node mechanism cannot be used.

> I think it's worth reverting back to the explicit of_graph link to the
> panel, even in the case that it's an immediate child node. It avoids the
> problem of specifying that all future display nodes must only have
> children of type ports, port or panel. We might be able to come up with
> something that works for my case, but it seems fragile and not very
> future proof. The explicit port is a little bit clunky, but it doesn't
> have this problem.

I think in any case we really don't want to specify that display nodes cann=
ot
have any other child than ports, port or a direct panel/bridge. I know that
a number of bindings already specify different types of child nodes.

I am absolutly in favor of reverting the child node mechanism, but it might
be too late already if a binding was already defined to work this way.
Of course we should actively discourage anyone to use it in a new binding.

Jagan, can you prove some insight on why this mechanism was needed in the f=
irst
place and if we can get rid of it without breaking any active binding?

Cheers,

Paul

> Regards,
> Bjorn
>=20
> > ---
> >  drivers/gpu/drm/drm_of.c | 23 ++++++++++++++++++-----
> >  1 file changed, 18 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 8716da6369a6..97ea9d2016ff 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -223,6 +223,9 @@ static int find_panel_or_bridge(struct device_node =
*node,
> >  				struct drm_panel **panel,
> >  				struct drm_bridge **bridge)
> >  {
> > +	if (!of_device_is_available(node))
> > +		return -ENODEV;
> > +
> >  	if (panel) {
> >  		*panel =3D of_drm_find_panel(node);
> >  		if (!IS_ERR(*panel))
> > @@ -265,7 +268,7 @@ int drm_of_find_panel_or_bridge(const struct device=
_node *np,
> >  				struct drm_bridge **bridge)
> >  {
> >  	struct device_node *node;
> > -	int ret;
> > +	int ret =3D -ENODEV;
> > =20
> >  	if (!panel && !bridge)
> >  		return -EINVAL;
> > @@ -282,8 +285,12 @@ int drm_of_find_panel_or_bridge(const struct devic=
e_node *np,
> >  			ret =3D find_panel_or_bridge(node, panel, bridge);
> >  			of_node_put(node);
> > =20
> > -			if (!ret)
> > -				return 0;
> > +			/*
> > +			 * If the graph/remote node is present we consider it
> > +			 * to be the legitimate candidate here and return
> > +			 * whatever code we got from find_panel_or_bridge.
> > +			 */
> > +			return ret;
> >  		}
> >  	}
> > =20
> > @@ -296,12 +303,18 @@ int drm_of_find_panel_or_bridge(const struct devi=
ce_node *np,
> >  		ret =3D find_panel_or_bridge(node, panel, bridge);
> >  		of_node_put(node);
> > =20
> > -		/* Stop at the first found occurrence. */
> > +		/*
> > +		 * Note that an unrelated (available) child node will cause
> > +		 * find_panel_or_bridge to return -EPROBE_DEFER because there
> > +		 * is no way to distinguish the node from a legitimate
> > +		 * panel/bridge that didn't register yet. Keep iterating nodes
> > +		 * and only return on the first found occurrence.
> > +		 */
> >  		if (!ret)
> >  			return 0;
> >  	}
> > =20
> > -	return -EPROBE_DEFER;
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
> > =20
> > --=20
> > 2.35.1
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--RsThgsWvuAuvhE8K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJVNwYACgkQ3cLmz3+f
v9En1ggAjUXTG2lHoEKBdruRe7Dd8kzQrav2FV13zPsiv7nYC1CennWfaAqPWUDU
yqg5ae+zHwP3TMmhFqzp1eHfNJ1PQ5+XVW7ANDcig400QKeRuIMqVBVybFubJLP/
oCB8oP1h3S6bMk7nDRM8oHsIUz8bHdxeBzGncKzMLNlUvFkAgTYyl0Yaj6HZ/S5E
+VxjDArY4FpVz8GvOpf1UNZgTtfkSl1K+mQ6J0/mIifY0S/BAw70GosBsvGgSqM2
AraPkUK3tcj8M6HZIs2sW5Q0FnNZiDIxmk9IClyBYCG9HHlmo9nV8su/lQ3Po+vz
EFicWeA45ovXso3DlCt+lRQz4BQI/A==
=FCXc
-----END PGP SIGNATURE-----

--RsThgsWvuAuvhE8K--
