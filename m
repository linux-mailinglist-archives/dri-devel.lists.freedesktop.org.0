Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13478B22244
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 11:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DA110E5C7;
	Tue, 12 Aug 2025 09:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kkDY/DdH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JLupkIP7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Be5QCc5r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ejF4snpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C751C10E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 09:02:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E27021B86;
 Tue, 12 Aug 2025 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754989345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ObAV/l5g/1KvPQal6xn62ZbW576JVaeHKKhU5l3vvJI=;
 b=kkDY/DdHivYMp0OtFVzxfqbLIhp7FijDn4ApGHE1tQt2hD6Fv5RpIBO0zLSR7MbLNI0JFG
 42fD8tJ4qgTuIAcfUZjknHGAQjq95jTZ1mhTBCsFCwoBdvtOYbbrmoTwyaKVddMhe0sc5L
 qUmMCmpBkAu6kQn8TWP4A8WBtjs1R0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754989345;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ObAV/l5g/1KvPQal6xn62ZbW576JVaeHKKhU5l3vvJI=;
 b=JLupkIP7cYRwdLVt4TqPZA/A097TFt8eg8/jB9hzAMUCk9TeVrIPDSGv67Zy9uJh+bsXFj
 CHDLhvoIe/TUCiBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754989344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ObAV/l5g/1KvPQal6xn62ZbW576JVaeHKKhU5l3vvJI=;
 b=Be5QCc5rduNdEqk2p3UzXAlKGZQo2nlOOxOT4jgOXeyOHllNl8xdQpzuQOYZK/ZHCz1jXN
 vA6CYhL6/jrI5Qu9cCD8ir1iOW5XNsYnv78qX0Gz3ms087eZND8f3oWxujz+mUvXR/PLVr
 bcQZ+xtMwNpJGLPvB54nAnyPndLxo+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754989344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ObAV/l5g/1KvPQal6xn62ZbW576JVaeHKKhU5l3vvJI=;
 b=ejF4snpGHBwqHvyFy5xaZOGMAPR88+IV+qrnwU9tuZU6vAJE+BQK/Si2U2caEjy7XasreJ
 aevdC4oi64xLUXDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D79F91351A;
 Tue, 12 Aug 2025 09:02:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 02Q4Mx8Dm2jpbgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Aug 2025 09:02:23 +0000
Message-ID: <91ccb201-123b-4899-bc44-7f08bd6baf43@suse.de>
Date: Tue, 12 Aug 2025 11:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gud: Replace simple display pipe with DRM atomic
 helpers
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jani Nikula <jani.nikula@intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250808133634.6839-1-rubenru09.ref@aol.com>
 <20250808133634.6839-1-rubenru09@aol.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250808133634.6839-1-rubenru09@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,linutronix.de,intel.com,redhat.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Hi

Am 08.08.25 um 15:36 schrieb Ruben Wauters:
> The simple display pipe is obsolete and the atomic helpers allow for
> more control over the rendering process. As such, this patch replaces
> the old simple display pipe system with the newer atomic helpers.
>
> As the code is mainly the same, merely replaced with the new atomic
> system, there should be no change in functionality.
>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> Unfortunately I have not been able to test this on hardware. It
> compiles without errors, but I sadly do not currently have the hardware
> to ensure that this works as intended. I would appreciate it if anyone
> would be able to initially check the code I have written to ensure that
> I have used the DRM atomic helpers correctly (as I do not have much
> experience with the DRM helpers or system), and then if anyone could
> test this on hardware to ensure this patch displays identically to the
> current implementation, it would be greatly appreciated. If that is not
> possible, I can hold onto this patch until I am able to test it myself
> when I am able to get the hardware required.

Not being able to test is not so great, as the changes are likely to 
break the driver. But gud is for an abandoned hobbyist project, so 
testers might be rare. Getting a device to work will help. You'll need a 
Raspi Zero with the firmware from https://github.com/notro/gud/wiki . 
(It would be nice to reactive this project.)

I left a few comments below. It looks good already, apart from being 
untested.


>
> Thank you
> ---
>   drivers/gpu/drm/gud/gud_connector.c | 24 +++++-----
>   drivers/gpu/drm/gud/gud_drv.c       | 54 +++++++++++++++++-----
>   drivers/gpu/drm/gud/gud_internal.h  | 13 +++---
>   drivers/gpu/drm/gud/gud_pipe.c      | 69 ++++++++++++++++++++---------
>   4 files changed, 110 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
> index 0f07d77c5d52..75f404ec08b4 100644
> --- a/drivers/gpu/drm/gud/gud_connector.c
> +++ b/drivers/gpu/drm/gud/gud_connector.c
> @@ -607,13 +607,16 @@ int gud_connector_fill_properties(struct drm_connector_state *connector_state,
>   	return gconn->num_properties;
>   }
>   
> +static const struct drm_encoder_funcs gud_drm_simple_encoder_funcs_cleanup = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
>   				struct gud_connector_descriptor_req *desc)
>   {
>   	struct drm_device *drm = &gdrm->drm;
>   	struct gud_connector *gconn;
>   	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
>   	int ret, connector_type;
>   	u32 flags;
>   
> @@ -681,20 +684,13 @@ static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
>   		return ret;
>   	}
>   
> -	/* The first connector is attached to the existing simple pipe encoder */
> -	if (!connector->index) {
> -		encoder = &gdrm->pipe.encoder;
> -	} else {
> -		encoder = &gconn->encoder;
> -
> -		ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
> -		if (ret)
> -			return ret;
> -
> -		encoder->possible_crtcs = 1;
> -	}
> +	gdrm->encoder.possible_crtcs = drm_crtc_mask(&gdrm->crtc);
> +	ret = drm_encoder_init(drm, &gdrm->encoder, &gud_drm_simple_encoder_funcs_cleanup,
> +			       DRM_MODE_ENCODER_NONE, NULL);
> +	if (ret)
> +		return ret;
>   
> -	return drm_connector_attach_encoder(connector, encoder);
> +	return drm_connector_attach_encoder(connector, &gdrm->encoder);
>   }
>   
>   int gud_get_connectors(struct gud_device *gdrm)
> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
> index 5385a2126e45..ac723b4ea7bf 100644
> --- a/drivers/gpu/drm/gud/gud_drv.c
> +++ b/drivers/gpu/drm/gud/gud_drv.c

The changes to this file rather belong into gud_pipe.c but the current 
implementation of gud_probe() mixes up feature detection with pipeline 
init. Untangling this would be another patch later.

> @@ -16,6 +16,7 @@
>   #include <drm/clients/drm_client_setup.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_blend.h>
> +#include <drm/drm_crtc_helper.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_drv.h>
> @@ -289,7 +290,7 @@ static int gud_get_properties(struct gud_device *gdrm)
>   			 * but mask out any additions on future devices.
>   			 */
>   			val &= GUD_ROTATION_MASK;
> -			ret = drm_plane_create_rotation_property(&gdrm->pipe.plane,
> +			ret = drm_plane_create_rotation_property(&gdrm->plane,
>   								 DRM_MODE_ROTATE_0, val);
>   			break;
>   		default:
> @@ -338,10 +339,30 @@ static int gud_stats_debugfs(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> -static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
> -	.check      = gud_pipe_check,
> -	.update	    = gud_pipe_update,
> -	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS
> +static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs = {
> +	.atomic_check = drm_crtc_helper_atomic_check
> +};
> +
> +static const struct drm_crtc_funcs gud_crtc_funcs = {
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_plane_helper_funcs gud_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = gud_plane_atomic_check,
> +	.atomic_update = gud_plane_atomic_update,
> +};
> +
> +static const struct drm_plane_funcs gud_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
>   };
>   
>   static const struct drm_mode_config_funcs gud_mode_config_funcs = {
> @@ -350,7 +371,7 @@ static const struct drm_mode_config_funcs gud_mode_config_funcs = {
>   	.atomic_commit = drm_atomic_helper_commit,
>   };
>   
> -static const u64 gud_pipe_modifiers[] = {
> +static const u64 gud_plane_modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
>   	DRM_FORMAT_MOD_INVALID
>   };
> @@ -567,12 +588,17 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   			return -ENOMEM;
>   	}
>   
> -	ret = drm_simple_display_pipe_init(drm, &gdrm->pipe, &gud_pipe_funcs,
> -					   formats, num_formats,
> -					   gud_pipe_modifiers, NULL);
> +	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
> +				       &gud_plane_funcs,
> +				       formats, num_formats,
> +				       gud_plane_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +

No empty line here, please.

>   	if (ret)
>   		return ret;
>   
> +	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
> +
>   	devm_kfree(dev, formats);
>   	devm_kfree(dev, formats_dev);
>   
> @@ -582,7 +608,15 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>   		return ret;
>   	}
>   
> -	drm_plane_enable_fb_damage_clips(&gdrm->pipe.plane);
> +	drm_plane_enable_fb_damage_clips(&gdrm->plane);

This line is part of plane initialization. It would best be done right 
after drm_plane_helper_add().

Best regards
Thomas

> +
> +	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
> +					&gud_crtc_funcs, NULL);
> +
> +	if (ret)
> +		return ret;
> +
> +	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
>   
>   	ret = gud_get_connectors(gdrm);
>   	if (ret) {
> diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
> index d6fb25388722..6152a9b5da43 100644
> --- a/drivers/gpu/drm/gud/gud_internal.h
> +++ b/drivers/gpu/drm/gud/gud_internal.h
> @@ -15,7 +15,9 @@
>   
>   struct gud_device {
>   	struct drm_device drm;
> -	struct drm_simple_display_pipe pipe;
> +	struct drm_plane plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
>   	struct work_struct work;
>   	u32 flags;
>   	const struct drm_format_info *xrgb8888_emulation_format;
> @@ -62,11 +64,10 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val);
>   
>   void gud_clear_damage(struct gud_device *gdrm);
>   void gud_flush_work(struct work_struct *work);
> -int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> -		   struct drm_plane_state *new_plane_state,
> -		   struct drm_crtc_state *new_crtc_state);
> -void gud_pipe_update(struct drm_simple_display_pipe *pipe,
> -		     struct drm_plane_state *old_state);
> +int gud_plane_atomic_check(struct drm_plane *plane,
> +			   struct drm_atomic_state *state);
> +void gud_plane_atomic_update(struct drm_plane *plane,
> +			     struct drm_atomic_state *atomic_state);
>   int gud_connector_fill_properties(struct drm_connector_state *connector_state,
>   				  struct gud_property_req *properties);
>   int gud_get_connectors(struct gud_device *gdrm);
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 8d548d08f127..6a0e6234224a 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -451,14 +451,15 @@ static void gud_fb_handle_damage(struct gud_device *gdrm, struct drm_framebuffer
>   	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, damage);
>   }
>   
> -int gud_pipe_check(struct drm_simple_display_pipe *pipe,
> -		   struct drm_plane_state *new_plane_state,
> -		   struct drm_crtc_state *new_crtc_state)
> +int gud_plane_atomic_check(struct drm_plane *plane,
> +			   struct drm_atomic_state *state)
>   {
> -	struct gud_device *gdrm = to_gud_device(pipe->crtc.dev);
> -	struct drm_plane_state *old_plane_state = pipe->plane.state;
> -	const struct drm_display_mode *mode = &new_crtc_state->mode;
> -	struct drm_atomic_state *state = new_plane_state->state;
> +	struct gud_device *gdrm = to_gud_device(plane->dev);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
>   	struct drm_framebuffer *old_fb = old_plane_state->fb;
>   	struct drm_connector_state *connector_state = NULL;
>   	struct drm_framebuffer *fb = new_plane_state->fb;
> @@ -472,17 +473,35 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
>   	if (WARN_ON_ONCE(!fb))
>   		return -EINVAL;
>   
> +	if (WARN_ON_ONCE(!crtc))
> +		return -EINVAL;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	mode = &crtc_state->mode;
> +
> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (!new_plane_state->visible)
> +		return 0;
> +
>   	if (old_plane_state->rotation != new_plane_state->rotation)
> -		new_crtc_state->mode_changed = true;
> +		crtc_state->mode_changed = true;
>   
>   	if (old_fb && old_fb->format != format)
> -		new_crtc_state->mode_changed = true;
> +		crtc_state->mode_changed = true;
>   
> -	if (!new_crtc_state->mode_changed && !new_crtc_state->connectors_changed)
> +	if (!crtc_state->mode_changed && !crtc_state->connectors_changed)
>   		return 0;
>   
>   	/* Only one connector is supported */
> -	if (hweight32(new_crtc_state->connector_mask) != 1)
> +	if (hweight32(crtc_state->connector_mask) != 1)
>   		return -EINVAL;
>   
>   	if (format->format == DRM_FORMAT_XRGB8888 && gdrm->xrgb8888_emulation_format)
> @@ -500,7 +519,7 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
>   	if (!connector_state) {
>   		struct drm_connector_list_iter conn_iter;
>   
> -		drm_connector_list_iter_begin(pipe->crtc.dev, &conn_iter);
> +		drm_connector_list_iter_begin(plane->dev, &conn_iter);
>   		drm_for_each_connector_iter(connector, &conn_iter) {
>   			if (connector->state->crtc) {
>   				connector_state = connector->state;
> @@ -567,16 +586,19 @@ int gud_pipe_check(struct drm_simple_display_pipe *pipe,
>   	return ret;
>   }
>   
> -void gud_pipe_update(struct drm_simple_display_pipe *pipe,
> -		     struct drm_plane_state *old_state)
> +void gud_plane_atomic_update(struct drm_plane *plane,
> +			     struct drm_atomic_state *atomic_state)
>   {
> -	struct drm_device *drm = pipe->crtc.dev;
> +	struct drm_device *drm = plane->dev;
>   	struct gud_device *gdrm = to_gud_device(drm);
> -	struct drm_plane_state *state = pipe->plane.state;
> -	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
> -	struct drm_framebuffer *fb = state->fb;
> -	struct drm_crtc *crtc = &pipe->crtc;
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(atomic_state, plane);
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(atomic_state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(new_state);
> +	struct drm_framebuffer *fb = new_state->fb;
> +	struct drm_crtc *crtc = new_state->crtc;
>   	struct drm_rect damage;
> +	struct drm_rect dst_clip;
> +	struct drm_atomic_helper_damage_iter iter;
>   	int ret, idx;
>   
>   	if (crtc->state->mode_changed || !crtc->state->enable) {
> @@ -611,8 +633,15 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
>   	if (ret)
>   		goto ctrl_disable;
>   
> -	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
> +	drm_atomic_helper_damage_iter_init(&iter, old_state, new_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		dst_clip = new_state->dst;
> +
> +		if (!drm_rect_intersect(&dst_clip, &damage))
> +			continue;
> +
>   		gud_fb_handle_damage(gdrm, fb, &shadow_plane_state->data[0], &damage);
> +	}
>   
>   	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


