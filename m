Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AE95735E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 20:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A4A10E1D1;
	Mon, 19 Aug 2024 18:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="fOpTRt4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2615F10E1A1;
 Mon, 19 Aug 2024 18:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724092473;
 bh=CXGmN8EyDVzXoe2M8gWWViUhY6WEqQS87W831yysQDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOpTRt4aPU7zD4FlbxjvuJHOuq1jBVJvY/sdiFEgogTZkfLG3lZoSmuhLcyiisv+y
 vbbV6duG5k819VA5VzsH9rONgRuPbn7shPg/0dkZ6aUFuVbeN5RpissOJpqRWsdNp8
 hRpdDkxK9WIfb+rVnmIPyCeyjevdTtwYIHjUUFlU=
Date: Mon, 19 Aug 2024 20:34:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/radeon: Switch radeon_connector to struct drm_edid
Message-ID: <cd93d170-152e-4217-b325-32da2ed529a8@t-8ch.de>
References: <20240818-radeon-drm_edid-v1-1-4b7fdd19132e@weissschuh.net>
 <87y14s6gke.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y14s6gke.fsf@intel.com>
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

On 2024-08-19 11:51:45+0000, Jani Nikula wrote:
> On Sun, 18 Aug 2024, Thomas Weißschuh <linux@weissschuh.net> wrote:
> > "struct drm_edid" is the safe and recommended alternative to "struct edid".
> >
> > Rename the member to make sure that no usage sites are missed,
> > as "struct drm_edid" has some restrictions, for example it can not be
> > used with kfree().
> >
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > This is only compile-tested.
> > ---
> >  drivers/gpu/drm/radeon/radeon_audio.c      |  4 +--
> >  drivers/gpu/drm/radeon/radeon_combios.c    |  4 +--
> >  drivers/gpu/drm/radeon/radeon_connectors.c | 54 +++++++++++++++---------------
> >  drivers/gpu/drm/radeon/radeon_mode.h       |  5 ++-
> >  4 files changed, 33 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
> > index 47aa06a9a942..59d0e47c94d0 100644
> > --- a/drivers/gpu/drm/radeon/radeon_audio.c
> > +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> > @@ -311,7 +311,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
> >  	if (!connector)
> >  		return;
> >  
> > -	sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
> > +	sad_count = drm_edid_to_sad(drm_edid_raw(radeon_connector->drm_edid), &sads);
> 
> The drm_edid_raw() usages could use a FIXME comment; eventually we want
> all of them gone too.

amdgpu and radeon are the last users of drm_edid_to_sad() and
drm_edid_to_speaker_allocation() which do not have access to a drm_edid.
After that we can fix the to function to directly take the drm_edid.
(I have a patch for it)

Personally  I dislike to have so many FIXMEs in the code.

> 
> >  	if (sad_count < 0)
> >  		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
> >  	if (sad_count <= 0)
> > @@ -335,7 +335,7 @@ static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
> >  	if (!connector)
> >  		return;
> >  
> > -	sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
> > +	sad_count = drm_edid_to_speaker_allocation(drm_edid_raw(radeon_connector->drm_edid), &sadb);
> >  	if (sad_count < 0) {
> >  		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
> >  			  sad_count);
> > diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
> > index df8d7f56b028..f4947acd0419 100644
> > --- a/drivers/gpu/drm/radeon/radeon_combios.c
> > +++ b/drivers/gpu/drm/radeon/radeon_combios.c
> > @@ -390,10 +390,10 @@ bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev)
> >  }
> >  
> >  /* this is used for atom LCDs as well */
> > -struct edid *
> > +const struct drm_edid *
> >  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev)
> >  {
> > -	return drm_edid_duplicate(drm_edid_raw(rdev->mode_info.bios_hardcoded_edid));
> > +	return drm_edid_dup(rdev->mode_info.bios_hardcoded_edid);
> >  }
> >  
> >  static struct radeon_i2c_bus_rec combios_setup_i2c_bus(struct radeon_device *rdev,
> > diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
> > index 528a8f3677c2..87a78c8e09c0 100644
> > --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> > +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> > @@ -261,7 +261,7 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
> >  	struct radeon_device *rdev = dev->dev_private;
> >  	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
> >  
> > -	if (radeon_connector->edid)
> > +	if (radeon_connector->drm_edid)
> >  		return;
> >  
> >  	/* on hw with routers, select right port */
> > @@ -271,8 +271,8 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
> >  	if ((radeon_connector_encoder_get_dp_bridge_encoder_id(connector) !=
> >  	     ENCODER_OBJECT_ID_NONE) &&
> >  	    radeon_connector->ddc_bus->has_aux) {
> > -		radeon_connector->edid = drm_get_edid(connector,
> > -						      &radeon_connector->ddc_bus->aux.ddc);
> > +		radeon_connector->drm_edid = drm_edid_read_ddc(connector,
> > +							       &radeon_connector->ddc_bus->aux.ddc);
> >  	} else if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
> >  		   (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
> >  		struct radeon_connector_atom_dig *dig = radeon_connector->con_priv;
> > @@ -280,22 +280,22 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
> >  		if ((dig->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT ||
> >  		     dig->dp_sink_type == CONNECTOR_OBJECT_ID_eDP) &&
> >  		    radeon_connector->ddc_bus->has_aux)
> > -			radeon_connector->edid = drm_get_edid(&radeon_connector->base,
> > -							      &radeon_connector->ddc_bus->aux.ddc);
> > +			radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
> > +								       &radeon_connector->ddc_bus->aux.ddc);
> >  		else if (radeon_connector->ddc_bus)
> > -			radeon_connector->edid = drm_get_edid(&radeon_connector->base,
> > -							      &radeon_connector->ddc_bus->adapter);
> > +			radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
> > +								       &radeon_connector->ddc_bus->adapter);
> >  	} else if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC &&
> >  		   connector->connector_type == DRM_MODE_CONNECTOR_LVDS &&
> >  		   radeon_connector->ddc_bus) {
> > -		radeon_connector->edid = drm_get_edid_switcheroo(&radeon_connector->base,
> > -								 &radeon_connector->ddc_bus->adapter);
> > +		radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
> > +							       &radeon_connector->ddc_bus->adapter);
> 
> drm_edid_read_switcheroo()!

Ack.

> 
> 
> >  	} else if (radeon_connector->ddc_bus) {
> > -		radeon_connector->edid = drm_get_edid(&radeon_connector->base,
> > -						      &radeon_connector->ddc_bus->adapter);
> > +		radeon_connector->drm_edid = drm_edid_read_ddc(&radeon_connector->base,
> > +							       &radeon_connector->ddc_bus->adapter);
> >  	}
> >  
> > -	if (!radeon_connector->edid) {
> > +	if (!radeon_connector->drm_edid) {
> >  		/* don't fetch the edid from the vbios if ddc fails and runpm is
> >  		 * enabled so we report disconnected.
> >  		 */
> > @@ -306,20 +306,22 @@ static void radeon_connector_get_edid(struct drm_connector *connector)
> >  			/* some laptops provide a hardcoded edid in rom for LCDs */
> >  			if (((connector->connector_type == DRM_MODE_CONNECTOR_LVDS) ||
> >  			     (connector->connector_type == DRM_MODE_CONNECTOR_eDP)))
> > -				radeon_connector->edid = radeon_bios_get_hardcoded_edid(rdev);
> > +				radeon_connector->drm_edid = radeon_bios_get_hardcoded_edid(rdev);
> >  		} else {
> >  			/* some servers provide a hardcoded edid in rom for KVMs */
> > -			radeon_connector->edid = radeon_bios_get_hardcoded_edid(rdev);
> > +			radeon_connector->drm_edid = radeon_bios_get_hardcoded_edid(rdev);
> >  		}
> >  	}
> > +
> > +	drm_edid_connector_update(&radeon_connector->base, radeon_connector->drm_edid);
> >  }
> >  
> >  static void radeon_connector_free_edid(struct drm_connector *connector)
> >  {
> >  	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
> >  
> > -	kfree(radeon_connector->edid);
> > -	radeon_connector->edid = NULL;
> > +	drm_edid_free(radeon_connector->drm_edid);
> > +	radeon_connector->drm_edid = NULL;
> >  }
> >  
> >  static int radeon_ddc_get_modes(struct drm_connector *connector)
> > @@ -327,12 +329,12 @@ static int radeon_ddc_get_modes(struct drm_connector *connector)
> >  	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
> >  	int ret;
> >  
> > -	if (radeon_connector->edid) {
> > -		drm_connector_update_edid_property(connector, radeon_connector->edid);
> > -		ret = drm_add_edid_modes(connector, radeon_connector->edid);
> > +	if (radeon_connector->drm_edid) {
> > +		drm_edid_connector_update(connector, radeon_connector->drm_edid);
> > +		ret = drm_edid_connector_add_modes(connector);
> >  		return ret;
> >  	}
> > -	drm_connector_update_edid_property(connector, NULL);
> > +	drm_edid_connector_update(connector, NULL);
> 
> The whole thing above can be simplified, as the functions handle NULL
> parameters just fine.

Ack.

> 
> >  	return 0;
> >  }
> >  
> > @@ -869,7 +871,7 @@ radeon_lvds_detect(struct drm_connector *connector, bool force)
> >  
> >  	/* check for edid as well */
> >  	radeon_connector_get_edid(connector);
> > -	if (radeon_connector->edid)
> > +	if (radeon_connector->drm_edid)
> >  		ret = connector_status_connected;
> >  	/* check acpi lid status ??? */
> >  
> > @@ -1012,13 +1014,12 @@ radeon_vga_detect(struct drm_connector *connector, bool force)
> >  		radeon_connector_free_edid(connector);
> >  		radeon_connector_get_edid(connector);
> >  
> > -		if (!radeon_connector->edid) {
> > +		if (!radeon_connector->drm_edid) {
> >  			DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
> >  					connector->name);
> >  			ret = connector_status_connected;
> >  		} else {
> > -			radeon_connector->use_digital =
> > -				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> > +			radeon_connector->use_digital = drm_edid_is_digital(radeon_connector->drm_edid);
> >  
> >  			/* some oems have boards with separate digital and analog connectors
> >  			 * with a shared ddc line (often vga + hdmi)
> > @@ -1270,7 +1271,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
> >  		radeon_connector_free_edid(connector);
> >  		radeon_connector_get_edid(connector);
> >  
> > -		if (!radeon_connector->edid) {
> > +		if (!radeon_connector->drm_edid) {
> >  			DRM_ERROR("%s: probed a monitor but no|invalid EDID\n",
> >  					connector->name);
> >  			/* rs690 seems to have a problem with connectors not existing and always
> > @@ -1286,8 +1287,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
> >  				broken_edid = true; /* defer use_digital to later */
> >  			}
> >  		} else {
> > -			radeon_connector->use_digital =
> > -				!!(radeon_connector->edid->input & DRM_EDID_INPUT_DIGITAL);
> > +			radeon_connector->use_digital = drm_edid_is_digital(radeon_connector->drm_edid);
> >  
> >  			/* some oems have boards with separate digital and analog connectors
> >  			 * with a shared ddc line (often vga + hdmi)
> > diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> > index 421c83fc70dc..ae1d91cd93ec 100644
> > --- a/drivers/gpu/drm/radeon/radeon_mode.h
> > +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> > @@ -38,7 +38,6 @@
> >  #include <linux/i2c.h>
> >  #include <linux/i2c-algo-bit.h>
> >  
> > -struct edid;
> >  struct drm_edid;
> >  struct radeon_bo;
> >  struct radeon_device;
> > @@ -521,7 +520,7 @@ struct radeon_connector {
> >  	bool use_digital;
> >  	/* we need to mind the EDID between detect
> >  	   and get modes due to analog/digital/tvencoder */
> > -	struct edid *edid;
> > +	const struct drm_edid *drm_edid;
> >  	void *con_priv;
> >  	bool dac_load_detect;
> >  	bool detected_by_load; /* if the connection status was determined by load */
> > @@ -843,7 +842,7 @@ radeon_get_crtc_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
> >  				 const struct drm_display_mode *mode);
> >  
> >  extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
> > -extern struct edid *
> > +extern const struct drm_edid *
> >  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
> >  extern bool radeon_atom_get_clock_info(struct drm_device *dev);
> >  extern bool radeon_combios_get_clock_info(struct drm_device *dev);
> >
> > ---
> > base-commit: 19cff16559a4f2d763faf4f8392bf86d3a21b93c
> > change-id: 20240818-radeon-drm_edid-9f0cec36e227
> >
> > Best regards,
> 
> -- 
> Jani Nikula, Intel
