Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124AC8997AD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9922B113A4C;
	Fri,  5 Apr 2024 08:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7qKlFRo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158E2113A4C;
 Fri,  5 Apr 2024 08:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712305387; x=1743841387;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fJL2KHQkdjUph1O0NwIctaRsIM1gxtgMqJOcHgU6ee4=;
 b=B7qKlFRo8uN3f/h+T5TL9BNTTELy9CNtWP4dgqLAvL/T9P4fObbBZnpj
 adotl4g+/Eb9CoaWq7NjFUNoyAOg6JW2u/OAjuZKm07J2TgpNXN9eYUJX
 4c0fYjYyLrgsaq+uZsS+vgcoMqon+9/p994N2bBGoWByG7Dw8PHui8fJ9
 PLx6Bu5cKBoqWAXykxueebQVixISCycOH+qi+vVIXGb6UCi9q9h1kl7sr
 7AOteLw2jb9OzEncdf+8IEHAetg7I+hpWSCmTVqPcFcYL2Ff3eMUfkA/i
 zHbsSuSTy/t9w/ScIsyYJqCnsMUs9JjAkbW+mb1qDhIcgHfOjVaBKQJxj w==;
X-CSE-ConnectionGUID: JoqN4v3CRgeSV4hB5+pMww==
X-CSE-MsgGUID: wBk/vp/kTBS5YAzrwzksQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7752352"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7752352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:23:07 -0700
X-CSE-ConnectionGUID: XzjeCdD2R8y07SomCOnG7g==
X-CSE-MsgGUID: JJtEt6FqQAOKT4NaKCQrKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="19169149"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 01:23:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 10/12] drm/client: Use [CONNECTOR:%d:%s] formatting
In-Reply-To: <20240404203336.10454-11-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-11-ville.syrjala@linux.intel.com>
Date: Fri, 05 Apr 2024 11:23:01 +0300
Message-ID: <87a5m8cj6i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 04 Apr 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Switch to the canonical [CONNECTOR:%d:%s] etc. format for
> printing out kms objects.

I've been pinging for reviews on [1] for a while now. :/

I'm just doing what you do in patches 9-10 in one go, and I very much
prefer having the [CONNECTOR:%d:%s] bit as the first thing in the
debug. For an individual line your style might read better, but for
reading a log with a bunch of consecutive lines, I think having it as a
prefix reads better.

BR,
Jani.


[1] https://lore.kernel.org/r/f580f7a20bdea45178cef3940b636d491ae3dd92.1709=
843865.git.jani.nikula@intel.com


>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++++-------------
>  1 file changed, 35 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 1751162b7d5c..415d1799337b 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -251,8 +251,10 @@ static void drm_client_connectors_enabled(struct drm=
_device *dev,
>  	for (i =3D 0; i < connector_count; i++) {
>  		connector =3D connectors[i];
>  		enabled[i] =3D drm_connector_enabled(connector, true);
> -		drm_dbg_kms(dev, "connector %d enabled? %s\n", connector->base.id,
> -			    connector->display_info.non_desktop ? "non desktop" : str_yes_no(=
enabled[i]));
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] enabled? %s\n",
> +			    connector->base.id, connector->name,
> +			    connector->display_info.non_desktop ?
> +			    "non desktop" : str_yes_no(enabled[i]));
>=20=20
>  		any_enabled |=3D enabled[i];
>  	}
> @@ -368,8 +370,8 @@ static int drm_client_get_tile_offsets(struct drm_dev=
ice *dev,
>  			continue;
>=20=20
>  		if (!modes[i] && (h_idx || v_idx)) {
> -			drm_dbg_kms(dev, "no modes for connector tiled %d %d\n",
> -				    i, connector->base.id);
> +			drm_dbg_kms(dev, "no modes for tiled [CONNECTOR:%d:%s]\n",
> +				    connector->base.id, connector->name);
>  			continue;
>  		}
>  		if (connector->tile_h_loc < h_idx)
> @@ -438,14 +440,15 @@ static bool drm_client_target_preferred(struct drm_=
device *dev,
>  			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, =
offsets, i,
>  						    connector->tile_h_loc, connector->tile_v_loc);
>  		}
> -		drm_dbg_kms(dev, "looking for cmdline mode on connector %d\n",
> -			    connector->base.id);
> +		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> +			    connector->base.id, connector->name);
>=20=20
>  		/* got for command line mode first */
>  		modes[i] =3D drm_connector_pick_cmdline_mode(connector);
>  		if (!modes[i]) {
> -			drm_dbg_kms(dev, "looking for preferred mode on connector %d %d\n",
> -				    connector->base.id, connector->tile_group ? connector->tile_grou=
p->id : 0);
> +			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (ti=
le group: %d)\n",
> +				    connector->base.id, connector->name,
> +				    connector->tile_group ? connector->tile_group->id : 0);
>  			modes[i] =3D drm_connector_preferred_mode(connector, width, height);
>  		}
>  		/* No preferred modes, pick one off the list */
> @@ -465,8 +468,8 @@ static bool drm_client_target_preferred(struct drm_de=
vice *dev,
>  			    (connector->tile_h_loc =3D=3D 0 &&
>  			     connector->tile_v_loc =3D=3D 0 &&
>  			     !drm_connector_get_tiled_mode(connector))) {
> -				drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
> -					    connector->base.id);
> +				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s=
]\n",
> +					    connector->base.id, connector->name);
>  				modes[i] =3D drm_connector_fallback_non_tiled_mode(connector);
>  			} else {
>  				modes[i] =3D drm_connector_get_tiled_mode(connector);
> @@ -634,15 +637,15 @@ static bool drm_client_firmware_config(struct drm_c=
lient_dev *client,
>  			num_connectors_detected++;
>=20=20
>  		if (!enabled[i]) {
> -			drm_dbg_kms(dev, "connector %s not enabled, skipping\n",
> -				    connector->name);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] not enabled, skipping\n",
> +				    connector->base.id, connector->name);
>  			conn_configured |=3D BIT(i);
>  			continue;
>  		}
>=20=20
>  		if (connector->force =3D=3D DRM_FORCE_OFF) {
> -			drm_dbg_kms(dev, "connector %s is disabled by user, skipping\n",
> -				    connector->name);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] is disabled by user, skipping\n",
> +				    connector->base.id, connector->name);
>  			enabled[i] =3D false;
>  			continue;
>  		}
> @@ -652,8 +655,8 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  			if (connector->force > DRM_FORCE_OFF)
>  				goto bail;
>=20=20
> -			drm_dbg_kms(dev, "connector %s has no encoder or crtc, skipping\n",
> -				    connector->name);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] has no encoder or crtc, skipping\=
n",
> +				    connector->base.id, connector->name);
>  			enabled[i] =3D false;
>  			conn_configured |=3D BIT(i);
>  			continue;
> @@ -675,23 +678,24 @@ static bool drm_client_firmware_config(struct drm_c=
lient_dev *client,
>  			}
>  		}
>=20=20
> -		drm_dbg_kms(dev, "looking for cmdline mode on connector %s\n",
> -			    connector->name);
> +		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> +			    connector->base.id, connector->name);
>=20=20
>  		/* go for command line mode first */
>  		modes[i] =3D drm_connector_pick_cmdline_mode(connector);
>=20=20
>  		/* try for preferred next */
>  		if (!modes[i]) {
> -			drm_dbg_kms(dev, "looking for preferred mode on connector %s %d\n",
> -				    connector->name, connector->has_tile);
> +			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (ti=
led? %s)\n",
> +				    connector->base.id, connector->name,
> +				    str_yes_no(connector->has_tile));
>  			modes[i] =3D drm_connector_preferred_mode(connector, width, height);
>  		}
>=20=20
>  		/* No preferred mode marked by the EDID? Are there any modes? */
>  		if (!modes[i] && !list_empty(&connector->modes)) {
> -			drm_dbg_kms(dev, "using first mode listed on connector %s\n",
> -				    connector->name);
> +			drm_dbg_kms(dev, "using first mode listed on [CONNECTOR:%d:%s]\n",
> +				    connector->base.id, connector->name);
>  			modes[i] =3D drm_connector_first_mode(connector);
>  		}
>=20=20
> @@ -702,8 +706,8 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  			 * is dodgy. Switch to crtc->state->mode, after taking
>  			 * care of the resulting locking/lifetime issues.
>  			 */
> -			drm_dbg_kms(dev, "looking for current mode on connector %s\n",
> -				    connector->name);
> +			drm_dbg_kms(dev, "looking for current mode on [CONNECTOR:%d:%s]\n",
> +				    connector->base.id, connector->name);
>  			modes[i] =3D &connector->state->crtc->mode;
>  		}
>  		/*
> @@ -712,14 +716,14 @@ static bool drm_client_firmware_config(struct drm_c=
lient_dev *client,
>  		 */
>  		if (connector->has_tile &&
>  		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
> -			drm_dbg_kms(dev, "Falling back to non tiled mode on Connector %d\n",
> -				    connector->base.id);
> +			drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]=
\n",
> +				    connector->base.id, connector->name);
>  			modes[i] =3D drm_connector_fallback_non_tiled_mode(connector);
>  		}
>  		crtcs[i] =3D new_crtc;
>=20=20
> -		drm_dbg_kms(dev, "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
> -			    connector->name,
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s]: %dx%d%s\n",
> +			    connector->base.id, connector->name,
>  			    connector->state->crtc->base.id,
>  			    connector->state->crtc->name,
>  			    modes[i]->hdisplay, modes[i]->vdisplay,
> @@ -860,8 +864,9 @@ int drm_client_modeset_probe(struct drm_client_dev *c=
lient, unsigned int width,
>  			struct drm_mode_set *modeset =3D drm_client_find_modeset(client, crtc=
);
>  			struct drm_connector *connector =3D connectors[i];
>=20=20
> -			drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
> -				    mode->name, crtc->base.id, offset->x, offset->y);
> +			drm_dbg_kms(dev, "desired mode %s set on [CRTC:%d:%s] (%d,%d)\n",
> +				    mode->name, crtc->base.id, crtc->name,
> +				    offset->x, offset->y);
>=20=20
>  			if (WARN_ON_ONCE(modeset->num_connectors =3D=3D DRM_CLIENT_MAX_CLONED=
_CONNECTORS ||
>  					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors =3D=3D 1=
))) {

--=20
Jani Nikula, Intel
