Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64976A5DF20
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505D210E78B;
	Wed, 12 Mar 2025 14:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYbCdXo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7B210E78B;
 Wed, 12 Mar 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741790299; x=1773326299;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0K3gCFEANnvuSvFznJHKhN0KSpVNmcWu+Ij58erkFQo=;
 b=AYbCdXo3oZWcTlVJtC7f9V2KGiLQ8etx9XuGrsKy0xngvMtbjUv3SO58
 xIuTOMXT7i5WvfXS20xQFZqA9X7rz/cv4NaafFgYDjZqELCOQaExgDZJw
 uMeMQEQMD0e+jJiTBTYgJV6ikAOJHYXFjRDyUiQnWAysO0InxfEBi3vCr
 0gptTnbiQzD+8299qdJzXlYnlIlk7qzM+2eX2WUwhwsmZJsrV5w6Df6G4
 s/+Eui1/GKQsoxTLzmbyTFlCsMxebhT61jEh/deTsbOvZh2E0Fkj3CDLp
 6APj4f3+wiPcYtUwsIe9c7TI6U83CQatLpIDSxEa/e114RClbNintcBEG g==;
X-CSE-ConnectionGUID: 1k1gic+xTDS8AfNvZzVHaQ==
X-CSE-MsgGUID: rtszMME/Ti2uxbcJ40SzLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42731150"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="42731150"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:38:18 -0700
X-CSE-ConnectionGUID: 7f1KbwMJT861Rn7OLfk13w==
X-CSE-MsgGUID: qaLTLJTHRqCu0C8tSv1RtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="121169155"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.23])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 07:38:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 4/8] drm/client: Make copies of modes
In-Reply-To: <20250228211454.8138-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
 <20250228211454.8138-5-ville.syrjala@linux.intel.com>
Date: Wed, 12 Mar 2025 16:38:14 +0200
Message-ID: <87a59qfh61.fsf@intel.com>
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

On Fri, 28 Feb 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> drm_client_firmware_config() is currently picking up the current
> mode of the crtc via the legacy crtc->mode, which is not supposed
> to be used by atomic drivers at all. We can't simply switch over
> to the proper crtc->state->mode because we drop the crtc->mutex
> (which protects crtc->state) before the mode gets used.
>
> The most straightforward solution to extend the lifetime of
> modes[] seem to be to make full copies of the modes.
>
> And with this we can undo also commit 3eadd887dbac
> ("drm/client:Fully protect modes[] with dev->mode_config.mutex")
> as the lifetime of modes[] no longer has anything to do with
> that lock.
>
> v2: Don't try to copy NULL modes
> v3: Keep storing pointers and use drm_mode_{duplicate,destroy}()
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 62 +++++++++++++++++++++-------
>  1 file changed, 47 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_c=
lient_modeset.c
> index 148257287ae4..ff034359f063 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -265,6 +265,25 @@ static void drm_client_connectors_enabled(struct drm=
_connector *connectors[],
>  		enabled[i] =3D drm_connector_enabled(connectors[i], false);
>  }
>=20=20
> +static void mode_replace(struct drm_device *dev,
> +			 const struct drm_display_mode **dst,
> +			 const struct drm_display_mode *src)
> +{
> +	drm_mode_destroy(dev, (struct drm_display_mode *)*dst);

Arguably drm_mode_destroy() should be changed to const too.

Anyway, I think I was able to wrap my head around this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>



> +
> +	*dst =3D src ? drm_mode_duplicate(dev, src) : NULL;
> +}
> +
> +static void modes_destroy(struct drm_device *dev,
> +			  const struct drm_display_mode *modes[],
> +			  int count)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < count; i++)
> +		mode_replace(dev, &modes[i], NULL);
> +}
> +
>  static bool drm_client_target_cloned(struct drm_device *dev,
>  				     struct drm_connector *connectors[],
>  				     unsigned int connector_count,
> @@ -296,7 +315,9 @@ static bool drm_client_target_cloned(struct drm_devic=
e *dev,
>  	for (i =3D 0; i < connector_count; i++) {
>  		if (!enabled[i])
>  			continue;
> -		modes[i] =3D drm_connector_pick_cmdline_mode(connectors[i]);
> +
> +		mode_replace(dev, &modes[i],
> +			     drm_connector_pick_cmdline_mode(connectors[i]));
>  		if (!modes[i]) {
>  			can_clone =3D false;
>  			break;
> @@ -335,7 +356,7 @@ static bool drm_client_target_cloned(struct drm_devic=
e *dev,
>  					   DRM_MODE_MATCH_CLOCK |
>  					   DRM_MODE_MATCH_FLAGS |
>  					   DRM_MODE_MATCH_3D_FLAGS))
> -				modes[i] =3D mode;
> +				mode_replace(dev, &modes[i], mode);
>  		}
>  		if (!modes[i])
>  			can_clone =3D false;
> @@ -445,16 +466,19 @@ static bool drm_client_target_preferred(struct drm_=
device *dev,
>  		}
>=20=20
>  		mode_type =3D "cmdline";
> -		modes[i] =3D drm_connector_pick_cmdline_mode(connector);
> +		mode_replace(dev, &modes[i],
> +			     drm_connector_pick_cmdline_mode(connector));
>=20=20
>  		if (!modes[i]) {
>  			mode_type =3D "preferred";
> -			modes[i] =3D drm_connector_preferred_mode(connector, width, height);
> +			mode_replace(dev, &modes[i],
> +				     drm_connector_preferred_mode(connector, width, height));
>  		}
>=20=20
>  		if (!modes[i]) {
>  			mode_type =3D "first";
> -			modes[i] =3D drm_connector_first_mode(connector);
> +			mode_replace(dev, &modes[i],
> +				     drm_connector_first_mode(connector));
>  		}
>=20=20
>  		/*
> @@ -472,10 +496,12 @@ static bool drm_client_target_preferred(struct drm_=
device *dev,
>  			     connector->tile_v_loc =3D=3D 0 &&
>  			     !drm_connector_get_tiled_mode(connector))) {
>  				mode_type =3D "non tiled";
> -				modes[i] =3D drm_connector_fallback_non_tiled_mode(connector);
> +				mode_replace(dev, &modes[i],
> +					     drm_connector_fallback_non_tiled_mode(connector));
>  			} else {
>  				mode_type =3D "tiled";
> -				modes[i] =3D drm_connector_get_tiled_mode(connector);
> +				mode_replace(dev, &modes[i],
> +					     drm_connector_get_tiled_mode(connector));
>  			}
>  		}
>=20=20
> @@ -690,16 +716,19 @@ static bool drm_client_firmware_config(struct drm_c=
lient_dev *client,
>  		}
>=20=20
>  		mode_type =3D "cmdline";
> -		modes[i] =3D drm_connector_pick_cmdline_mode(connector);
> +		mode_replace(dev, &modes[i],
> +			     drm_connector_pick_cmdline_mode(connector));
>=20=20
>  		if (!modes[i]) {
>  			mode_type =3D "preferred";
> -			modes[i] =3D drm_connector_preferred_mode(connector, width, height);
> +			mode_replace(dev, &modes[i],
> +				     drm_connector_preferred_mode(connector, width, height));
>  		}
>=20=20
>  		if (!modes[i]) {
>  			mode_type =3D "first";
> -			modes[i] =3D drm_connector_first_mode(connector);
> +			mode_replace(dev, &modes[i],
> +				     drm_connector_first_mode(connector));
>  		}
>=20=20
>  		/* last resort: use current mode */
> @@ -716,7 +745,8 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  			 * fastboot check to work correctly.
>  			 */
>  			mode_type =3D "current";
> -			modes[i] =3D &connector->state->crtc->mode;
> +			mode_replace(dev, &modes[i],
> +				     &connector->state->crtc->mode);
>  		}
>=20=20
>  		/*
> @@ -726,7 +756,8 @@ static bool drm_client_firmware_config(struct drm_cli=
ent_dev *client,
>  		if (connector->has_tile &&
>  		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
>  			mode_type =3D "non tiled";
> -			modes[i] =3D drm_connector_fallback_non_tiled_mode(connector);
> +			mode_replace(dev, &modes[i],
> +				     drm_connector_fallback_non_tiled_mode(connector));
>  		}
>  		crtcs[i] =3D new_crtc;
>=20=20
> @@ -798,7 +829,6 @@ int drm_client_modeset_probe(struct drm_client_dev *c=
lient, unsigned int width,
>  	unsigned int total_modes_count =3D 0;
>  	struct drm_client_offset *offsets;
>  	unsigned int connector_count =3D 0;
> -	/* points to modes protected by mode_config.mutex */
>  	const struct drm_display_mode **modes;
>  	struct drm_crtc **crtcs;
>  	int i, ret =3D 0;
> @@ -850,7 +880,7 @@ int drm_client_modeset_probe(struct drm_client_dev *c=
lient, unsigned int width,
>=20=20
>  	if (!drm_client_firmware_config(client, connectors, connector_count, cr=
tcs,
>  					modes, offsets, enabled, width, height)) {
> -		memset(modes, 0, connector_count * sizeof(*modes));
> +		modes_destroy(dev, modes, connector_count);
>  		memset(crtcs, 0, connector_count * sizeof(*crtcs));
>  		memset(offsets, 0, connector_count * sizeof(*offsets));
>=20=20
> @@ -867,6 +897,8 @@ int drm_client_modeset_probe(struct drm_client_dev *c=
lient, unsigned int width,
>  				      crtcs, modes, 0, width, height);
>  	}
>=20=20
> +	mutex_unlock(&dev->mode_config.mutex);
> +
>  	drm_client_modeset_release(client);
>=20=20
>  	for (i =3D 0; i < connector_count; i++) {
> @@ -901,11 +933,11 @@ int drm_client_modeset_probe(struct drm_client_dev =
*client, unsigned int width,
>  			modeset->y =3D offset->y;
>  		}
>  	}
> -	mutex_unlock(&dev->mode_config.mutex);
>=20=20
>  	mutex_unlock(&client->modeset_mutex);
>  out:
>  	kfree(crtcs);
> +	modes_destroy(dev, modes, connector_count);
>  	kfree(modes);
>  	kfree(offsets);
>  	kfree(enabled);

--=20
Jani Nikula, Intel
