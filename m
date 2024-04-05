Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC147899721
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 09:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B29113A1D;
	Fri,  5 Apr 2024 07:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="X7Yj5rqd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LTWdFccF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X7Yj5rqd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LTWdFccF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8BA113A1D;
 Fri,  5 Apr 2024 07:57:09 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A462521A22;
 Fri,  5 Apr 2024 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712303827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+d660G1uoS2b8ch8UgOCxIwY2iLkirc42K2elQX0Z7Q=;
 b=X7Yj5rqdZNkrF+bSi58IESEF7BlJVcrMJPHh3tiFlbAihoXZIbahYTT/Rr71jUiY2glZjF
 c8W4w04Ejkv4uOCSUJY0P//m7rpJxNaFv+4lS5f4iGPz7xH4fEJ73lUsrNuHjz14GjvrkL
 8pFho+WoG8ZfLRbXAK/Brv+39lYZllg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712303827;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+d660G1uoS2b8ch8UgOCxIwY2iLkirc42K2elQX0Z7Q=;
 b=LTWdFccFYZ5/M4964SXzGSjRxHzgh2gZAHCS+6wmiCKgSgp//a7gCwob0LFafWHzI7Qrn2
 tbdEQSPH4AbsR3BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712303827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+d660G1uoS2b8ch8UgOCxIwY2iLkirc42K2elQX0Z7Q=;
 b=X7Yj5rqdZNkrF+bSi58IESEF7BlJVcrMJPHh3tiFlbAihoXZIbahYTT/Rr71jUiY2glZjF
 c8W4w04Ejkv4uOCSUJY0P//m7rpJxNaFv+4lS5f4iGPz7xH4fEJ73lUsrNuHjz14GjvrkL
 8pFho+WoG8ZfLRbXAK/Brv+39lYZllg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712303827;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+d660G1uoS2b8ch8UgOCxIwY2iLkirc42K2elQX0Z7Q=;
 b=LTWdFccFYZ5/M4964SXzGSjRxHzgh2gZAHCS+6wmiCKgSgp//a7gCwob0LFafWHzI7Qrn2
 tbdEQSPH4AbsR3BA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 860C8139F1;
 Fri,  5 Apr 2024 07:57:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id X5d7H9OuD2ZXOAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Apr 2024 07:57:07 +0000
Message-ID: <9f689077-529f-431b-9506-e92f8a1d8003@suse.de>
Date: Fri, 5 Apr 2024 09:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] drm/client: Streamline mode selection debugs
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-12-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240404203336.10454-12-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns]
X-Spam-Score: -4.29
X-Spam-Flag: NO
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

Am 04.04.24 um 22:33 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Get rid of all the redundant debugs and just wait until the end
> to print which mode (and of which type) we picked.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_client_modeset.c | 65 +++++++++++++---------------
>   1 file changed, 31 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 415d1799337b..ad88c11037d8 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -408,6 +408,8 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>   
>   retry:
>   	for (i = 0; i < connector_count; i++) {
> +		const char *mode_type;
> +
>   		connector = connectors[i];
>   
>   		if (conn_configured & BIT_ULL(i))
> @@ -440,20 +442,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>   			drm_client_get_tile_offsets(dev, connectors, connector_count, modes, offsets, i,
>   						    connector->tile_h_loc, connector->tile_v_loc);
>   		}
> -		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> -			    connector->base.id, connector->name);
>   
> -		/* got for command line mode first */
> +		mode_type = "cmdline";
>   		modes[i] = drm_connector_pick_cmdline_mode(connector);
> +
>   		if (!modes[i]) {
> -			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tile group: %d)\n",
> -				    connector->base.id, connector->name,
> -				    connector->tile_group ? connector->tile_group->id : 0);
> +			mode_type = "preferred";
>   			modes[i] = drm_connector_preferred_mode(connector, width, height);
>   		}
> -		/* No preferred modes, pick one off the list */
> -		if (!modes[i])
> +
> +		if (!modes[i]) {
> +			mode_type = "first";
>   			modes[i] = drm_connector_first_mode(connector);
> +		}
> +
>   		/*
>   		 * In case of tiled mode if all tiles not present fallback to
>   		 * first available non tiled mode.
> @@ -468,16 +470,20 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>   			    (connector->tile_h_loc == 0 &&
>   			     connector->tile_v_loc == 0 &&
>   			     !drm_connector_get_tiled_mode(connector))) {
> -				drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> -					    connector->base.id, connector->name);
> +				mode_type = "non tiled";
>   				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
>   			} else {
> +				mode_type = "tiled";
>   				modes[i] = drm_connector_get_tiled_mode(connector);
>   			}
>   		}
>   
> -		drm_dbg_kms(dev, "found mode %s\n",
> -			    modes[i] ? modes[i]->name : "none");
> +		if (!modes[i])
> +			mode_type = "no";
> +
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
> +			    connector->base.id, connector->name,
> +			    mode_type, modes[i] ? modes[i]->name : "none");

Instead of tracking the whole mode_type thing, maybe just do

if (!modes[i])
     drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found mode: " DRM_MODE_FMT, 
DRM_MODE_ARG(modes[i]) );

to print the full mode.

If no mode has been found, the code will later print a warning anyway.

Best regards
Thomas

>   		conn_configured |= BIT_ULL(i);
>   	}
>   
> @@ -624,6 +630,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   		struct drm_connector *connector;
>   		struct drm_encoder *encoder;
>   		struct drm_crtc *new_crtc;
> +		const char *mode_type;
>   
>   		connector = connectors[i];
>   
> @@ -673,29 +680,22 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   		 */
>   		for (j = 0; j < count; j++) {
>   			if (crtcs[j] == new_crtc) {
> -				drm_dbg_kms(dev, "fallback: cloned configuration\n");
> +				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n",
> +					    connector->base.id, connector->name);
>   				goto bail;
>   			}
>   		}
>   
> -		drm_dbg_kms(dev, "looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> -			    connector->base.id, connector->name);
> -
> -		/* go for command line mode first */
> +		mode_type = "cmdline";
>   		modes[i] = drm_connector_pick_cmdline_mode(connector);
>   
> -		/* try for preferred next */
>   		if (!modes[i]) {
> -			drm_dbg_kms(dev, "looking for preferred mode on [CONNECTOR:%d:%s] (tiled? %s)\n",
> -				    connector->base.id, connector->name,
> -				    str_yes_no(connector->has_tile));
> +			mode_type = "preferred";
>   			modes[i] = drm_connector_preferred_mode(connector, width, height);
>   		}
>   
> -		/* No preferred mode marked by the EDID? Are there any modes? */
> -		if (!modes[i] && !list_empty(&connector->modes)) {
> -			drm_dbg_kms(dev, "using first mode listed on [CONNECTOR:%d:%s]\n",
> -				    connector->base.id, connector->name);
> +		if (!modes[i]) {
> +			mode_type = "first";
>   			modes[i] = drm_connector_first_mode(connector);
>   		}
>   
> @@ -706,28 +706,25 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>   			 * is dodgy. Switch to crtc->state->mode, after taking
>   			 * care of the resulting locking/lifetime issues.
>   			 */
> -			drm_dbg_kms(dev, "looking for current mode on [CONNECTOR:%d:%s]\n",
> -				    connector->base.id, connector->name);
> +			mode_type = "current";
>   			modes[i] = &connector->state->crtc->mode;
>   		}
> +
>   		/*
>   		 * In case of tiled modes, if all tiles are not present
>   		 * then fallback to a non tiled mode.
>   		 */
>   		if (connector->has_tile &&
>   		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
> -			drm_dbg_kms(dev, "Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> -				    connector->base.id, connector->name);
> +			mode_type = "non tiled";
>   			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
>   		}
>   		crtcs[i] = new_crtc;
>   
> -		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] on [CRTC:%d:%s]: %dx%d%s\n",
> +		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
>   			    connector->base.id, connector->name,
> -			    connector->state->crtc->base.id,
> -			    connector->state->crtc->name,
> -			    modes[i]->hdisplay, modes[i]->vdisplay,
> -			    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
> +			    new_crtc->base.id, new_crtc->name,
> +			    mode_type, modes[i]->name);
>   
>   		fallback = false;
>   		conn_configured |= BIT(i);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

