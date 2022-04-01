Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC934EE932
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE7910FF73;
	Fri,  1 Apr 2022 07:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5BD10FF72
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 07:44:51 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34E7D1BF206;
 Fri,  1 Apr 2022 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648799089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P2d3No4EDXkEh3l7L1vhz/J82XaNZW1KUTwfTQprtMI=;
 b=ixhmXyxrKfJTOBUFTFjmcF1pqZICgVBc7T7yeYk0J3ogOABA+iOg5R9Jv5kc1CuUJ6JiPE
 b9RhyzNa81/eHrJFxaUlsc0+xh/NwDYvAT80C2P3vAf9yK9C0zf9w5bfJPVMNwKmHtIXRS
 O53OcFtIr8A5HMH+XR8F78LIJXZvgHeHBtq8pYR8zfWI/GsfNxykxZ/BkhwJU+15tqvPKD
 PIXZGUFV+/bTurtZpxs/G/bHoutebuGKyqOvy9e8S5Qbu8XfW6vGmBQ5KsoD03G1L7qRc9
 MwCHcYwCGXqpQwUMms27g1bXV+p+KJn6SS6Hko315OpYMr8A3/uQXe2yPh6Wuw==
Date: Fri, 1 Apr 2022 09:44:46 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] drm: of: Properly try all possible cases for
 bridge/panel detection
Message-ID: <YkatbpubQjwBWOiK@aptenodytes>
References: <20220329132732.628474-1-paul.kocialkowski@bootlin.com>
 <YkZulslrzeurp43U@ripper>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RmzJoGyI2gCKxmMX"
Content-Disposition: inline
In-Reply-To: <YkZulslrzeurp43U@ripper>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--RmzJoGyI2gCKxmMX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Thu 31 Mar 22, 20:16, Bjorn Andersson wrote:
> On Tue 29 Mar 06:27 PDT 2022, Paul Kocialkowski wrote:
>=20
> > While bridge/panel detection was initially relying on the usual
> > port/ports-based of graph detection, it was recently changed to
> > perform the lookup on any child node that is not port/ports
> > instead when such a node is available, with no fallback on the
> > usual way.
> >=20
> > This results in breaking detection when a child node is present
> > but does not contain any panel or bridge node, even when the
> > usual port/ports-based of graph is there.
> >=20
> > In order to support both situations properly, this commit reworks
> > the logic to try both options and not just one of the two: it will
> > only return -EPROBE_DEFER when both have failed.
> >=20
>=20
> Thanks for your patch Paul, it fixed a regression on a device where I
> have a eDP bridge with an of_graph and a aux-bus defined.
>=20
> But unfortunately it does not resolve the regression I have for the
> USB based DisplayPort setup described below.
>=20
>=20
> In the Qualcomm DisplayPort driver We're calling:
>=20
> 	devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>=20
> and with the following DT snippet the behavior changed:
>=20
> displayport-controller@ae90000 {
> 	compatible =3D "qcom,sc8180x-dp";
> 	...
>=20
> 	operating-points-v2 =3D <&dp0_opp_table>;
>=20
> 	ports {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		port@0 {
> 			reg =3D <0>;
> 			dp0_in: endpoint {
> 				remote-endpoint =3D <&display_driver>;
> 			};
> 		};
> 	};
>=20
> 	dp0_opp_table: opp-table {
> 		...;
> 	};
> };
>=20
> Prior to the introduction of 80253168dbfd ("drm: of: Lookup if child
> node has panel or bridge") this would return -ENODEV, so we could
> differentiate the case when we have a statically defined eDP panel from
> that of a dynamically attached (over USB) DP panel.
>=20
> Prior to your change, above case without the opp-table node would have
> still returned -ENODEV.
>=20
> But now this will just return -EPROBE_DEFER in both cases.

Oh that's right, the -ENODEV case was just completely removed by my change.
Initially this would happen if !of_graph_is_present or if the remote node
doesn't exist.

Now that we are also checking for child nodes, we can't just return -ENODEV
when the graph or remote node is missing: we must also check that there is =
no
child node that is a panel/bridge.

For the graph remote case, we can reliabily return -EPROBE_DEFER when
of_graph_is_present and the remote exists and of_device_is_available.
Otherwise we can go for -ENODEV. I think getting -EPROBE_DEFER at this point
should stop the drm_of_find_panel_or_bridge process.

On the other hand for the child panel/bridge node case, I don't see how we
can reliably distinguish between -EPROBE_DEFER and -ENODEV, because
of_drm_find_panel and of_drm_find_bridge will behave the same if the child
node is a not-yet-probed panel/bridge or a totally unrelated node.
So I think we should always return -EPROBE_DEFER in that case.

As a result you can't get -ENODEV if using the of graph while having any
(unrelated) child node there, so your issue remains.

Do you see any way we could make this work?

> I thought the appropriate method of referencing the dsi panel was to
> actually reference that using the of_graph, even though it's a child of
> the dsi controller - that's at least how we've done it in e.g. [1].
> I find this to be much nicer than to just blindly define that all
> children of any sort of display controller must be a bridge or a panel.

Yes I totally agree. Given that using the child node directly apparently
can't allow us to distinguish between -EPROBE_DEFER/-ENODEV I would be in
favor of dropping this mechanism and going with explicit of graph in any ca=
se
(even if it's a child node). I don't see any downside to this approach.

What do yout think?

Paul

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm64/boot/dts/qcom/sdm845-mtp.dts#n436
>=20
> Regards,
> Bjorn
>=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Fixes: 80253168dbfd ("drm: of: Lookup if child node has panel or bridge=
")
> > ---
> >=20
> > Changes since v2:
> > - Removed unnecessary else statement and added a comment about
> >   clearing the panel pointer on error.
> >=20
> > Changes since v1:
> > - Renamed remote to node;
> > - Renamed helper to find_panel_or_bridge;
> > - Cleared bridge pointer early;
> > - Returned early to make the code more concise;
> >=20
> > ---
> >  drivers/gpu/drm/drm_of.c | 99 ++++++++++++++++++++--------------------
> >  1 file changed, 50 insertions(+), 49 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> > index 9d90cd75c457..8716da6369a6 100644
> > --- a/drivers/gpu/drm/drm_of.c
> > +++ b/drivers/gpu/drm/drm_of.c
> > @@ -219,6 +219,29 @@ int drm_of_encoder_active_endpoint(struct device_n=
ode *node,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
> > =20
> > +static int find_panel_or_bridge(struct device_node *node,
> > +				struct drm_panel **panel,
> > +				struct drm_bridge **bridge)
> > +{
> > +	if (panel) {
> > +		*panel =3D of_drm_find_panel(node);
> > +		if (!IS_ERR(*panel))
> > +			return 0;
> > +
> > +		/* Clear the panel pointer in case of error. */
> > +		*panel =3D NULL;
> > +	}
> > +
> > +	/* No panel found yet, check for a bridge next. */
> > +	if (bridge) {
> > +		*bridge =3D of_drm_find_bridge(node);
> > +		if (*bridge)
> > +			return 0;
> > +	}
> > +
> > +	return -EPROBE_DEFER;
> > +}
> > +
> >  /**
> >   * drm_of_find_panel_or_bridge - return connected panel or bridge devi=
ce
> >   * @np: device tree node containing encoder output ports
> > @@ -241,66 +264,44 @@ int drm_of_find_panel_or_bridge(const struct devi=
ce_node *np,
> >  				struct drm_panel **panel,
> >  				struct drm_bridge **bridge)
> >  {
> > -	int ret =3D -EPROBE_DEFER;
> > -	struct device_node *remote;
> > +	struct device_node *node;
> > +	int ret;
> > =20
> >  	if (!panel && !bridge)
> >  		return -EINVAL;
> > +
> >  	if (panel)
> >  		*panel =3D NULL;
> > -
> > -	/**
> > -	 * Devices can also be child nodes when we also control that device
> > -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > -	 *
> > -	 * Lookup for a child node of the given parent that isn't either port
> > -	 * or ports.
> > -	 */
> > -	for_each_available_child_of_node(np, remote) {
> > -		if (of_node_name_eq(remote, "port") ||
> > -		    of_node_name_eq(remote, "ports"))
> > -			continue;
> > -
> > -		goto of_find_panel_or_bridge;
> > +	if (bridge)
> > +		*bridge =3D NULL;
> > +
> > +	/* Check for a graph on the device node first. */
> > +	if (of_graph_is_present(np)) {
> > +		node =3D of_graph_get_remote_node(np, port, endpoint);
> > +		if (node) {
> > +			ret =3D find_panel_or_bridge(node, panel, bridge);
> > +			of_node_put(node);
> > +
> > +			if (!ret)
> > +				return 0;
> > +		}
> >  	}
> > =20
> > -	/*
> > -	 * of_graph_get_remote_node() produces a noisy error message if port
> > -	 * node isn't found and the absence of the port is a legit case here,
> > -	 * so at first we silently check whether graph presents in the
> > -	 * device-tree node.
> > -	 */
> > -	if (!of_graph_is_present(np))
> > -		return -ENODEV;
> > -
> > -	remote =3D of_graph_get_remote_node(np, port, endpoint);
> > -
> > -of_find_panel_or_bridge:
> > -	if (!remote)
> > -		return -ENODEV;
> > +	/* Otherwise check for any child node other than port/ports. */
> > +	for_each_available_child_of_node(np, node) {
> > +		if (of_node_name_eq(node, "port") ||
> > +		    of_node_name_eq(node, "ports"))
> > +			continue;
> > =20
> > -	if (panel) {
> > -		*panel =3D of_drm_find_panel(remote);
> > -		if (!IS_ERR(*panel))
> > -			ret =3D 0;
> > -		else
> > -			*panel =3D NULL;
> > -	}
> > -
> > -	/* No panel found yet, check for a bridge next. */
> > -	if (bridge) {
> > -		if (ret) {
> > -			*bridge =3D of_drm_find_bridge(remote);
> > -			if (*bridge)
> > -				ret =3D 0;
> > -		} else {
> > -			*bridge =3D NULL;
> > -		}
> > +		ret =3D find_panel_or_bridge(node, panel, bridge);
> > +		of_node_put(node);
> > =20
> > +		/* Stop at the first found occurrence. */
> > +		if (!ret)
> > +			return 0;
> >  	}
> > =20
> > -	of_node_put(remote);
> > -	return ret;
> > +	return -EPROBE_DEFER;
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

--RmzJoGyI2gCKxmMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJGrW4ACgkQ3cLmz3+f
v9E0GAf/TTQSoT8Uptk97ABofCuAwM4f1FkNEk95OXicipadFTC7w9N1dfqBni6f
pOaAg2X6rotvMUKzFbgLAP6zyyEaGkqhlq0J/K3Wa56Zygi4zlv3DmGhjOuEHliH
FHbEdOJFEn5DzlGLy3IUjGCO+lsURqB4RE5AOZSYqR2fhIrHzNdbB9yQ7FPydLbJ
nmH9o0qkrX37bXLgTz4YYT0fuZ8rEHJYZsqfAFw6wakP54IqLx4DEe+IHjqzUo5t
4zSX/n45GZsJ5BLoelmFeVhewG2/MfRWHQ9PmYo+vYgZ2sG+gTo9wuR1WMstdwba
utI3/aj0CuyAPUsOOCrBQeRgsYdzpw==
=Dhbj
-----END PGP SIGNATURE-----

--RmzJoGyI2gCKxmMX--
