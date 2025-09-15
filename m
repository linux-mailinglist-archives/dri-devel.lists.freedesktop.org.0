Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E6B5714C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 09:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38AD10E2D3;
	Mon, 15 Sep 2025 07:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jxn3CpdE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wgOGh5hL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="umQmIgrI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SV0oeKfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D925F10E2D3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 07:23:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 79C441FB62;
 Mon, 15 Sep 2025 07:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757921022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=avkQBaKpQ2tXPojONTuZJv8D5y0jW2E+baU2QVcI4DU=;
 b=jxn3CpdEgIU463lBafIa+jrZtph7h1N9ma52/EnV6QctSTAAzA3lfxbv7JAwZsDkWFOiFv
 RrbKk3+FX9t7WeYEqKcLJpUHAbyjObManhIgcSqgJZwTn61rN5lrM/gB+Ey//5zVtelVAK
 triLlRal+NtMNIvuN0wSUTWw3zpSa/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757921022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=avkQBaKpQ2tXPojONTuZJv8D5y0jW2E+baU2QVcI4DU=;
 b=wgOGh5hL3PKI8i65VVdE7JtbCnOqn5omm9/bKcNa6edz7NM2rJsc1ulOktyWN3U1T4YWuC
 TKb8IHA7KbnnxaDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757921021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=avkQBaKpQ2tXPojONTuZJv8D5y0jW2E+baU2QVcI4DU=;
 b=umQmIgrI7iLS0KP0k2lZQlrf+JsXJbmB7ahAZcTWMXZzn638s4TxxO6r2RdmVIduW+fhaK
 YTlyEmy5umntWPx4Wufgi3XrxkbEVuf4C6HFB2mR9z4G/4n3nRQkMtFRkiE2aBBmsRKTNq
 7+TgBon99HsrPpRxhTFG6G+sq1beAOM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757921021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=avkQBaKpQ2tXPojONTuZJv8D5y0jW2E+baU2QVcI4DU=;
 b=SV0oeKfdRmDD/n56WxeJbghi7C8+SUrohh9IgeTawsjqg59b/1oiOoA3mjLWUwP0I6l7yD
 FObTqJAz/z23MCCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E73D91398D;
 Mon, 15 Sep 2025 07:23:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gZbDLPu+x2ijUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Sep 2025 07:23:39 +0000
Message-ID: <002989b4-f35a-4918-8493-6e352c6244f3@suse.de>
Date: Mon, 15 Sep 2025 09:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: gud: replace WARN_ON/WARN_ON_ONCE with drm versions
To: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250914155308.2144-1-rubenru09.ref@aol.com>
 <20250914155308.2144-1-rubenru09@aol.com>
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
In-Reply-To: <20250914155308.2144-1-rubenru09@aol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[aol.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[aol.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 
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

Am 14.09.25 um 17:50 schrieb Ruben Wauters:
> GUD is a drm driver, and therefore should use the drm versions of
> WARN_ON and WARN_ON_ONCE. This patch replaces all instances of WARN_ON
> and WARN_ON_ONCE with drm_WARN_ON and drm_WARN_ON_ONCE.
>
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks a lot. I'll merge the patch in a bit.

Best regards
Thomas

> ---
>   drivers/gpu/drm/gud/gud_connector.c |  8 ++++----
>   drivers/gpu/drm/gud/gud_pipe.c      | 10 +++++-----
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/gud/gud_connector.c b/drivers/gpu/drm/gud/gud_connector.c
> index 4a15695fa933..62e349b06dbe 100644
> --- a/drivers/gpu/drm/gud/gud_connector.c
> +++ b/drivers/gpu/drm/gud/gud_connector.c
> @@ -561,11 +561,11 @@ static int gud_connector_add_properties(struct gud_device *gdrm, struct gud_conn
>   			continue; /* not a DRM property */
>   
>   		property = gud_connector_property_lookup(connector, prop);
> -		if (WARN_ON(IS_ERR(property)))
> +		if (drm_WARN_ON(drm, IS_ERR(property)))
>   			continue;
>   
>   		state_val = gud_connector_tv_state_val(prop, &gconn->initial_tv_state);
> -		if (WARN_ON(IS_ERR(state_val)))
> +		if (drm_WARN_ON(drm, IS_ERR(state_val)))
>   			continue;
>   
>   		*state_val = val;
> @@ -593,7 +593,7 @@ int gud_connector_fill_properties(struct drm_connector_state *connector_state,
>   			unsigned int *state_val;
>   
>   			state_val = gud_connector_tv_state_val(prop, &connector_state->tv);
> -			if (WARN_ON_ONCE(IS_ERR(state_val)))
> +			if (drm_WARN_ON_ONCE(connector_state->connector->dev, state_val))
>   				return PTR_ERR(state_val);
>   
>   			val = *state_val;
> @@ -667,7 +667,7 @@ static int gud_connector_create(struct gud_device *gdrm, unsigned int index,
>   		return ret;
>   	}
>   
> -	if (WARN_ON(connector->index != index))
> +	if (drm_WARN_ON(drm, connector->index != index))
>   		return -EINVAL;
>   
>   	if (flags & GUD_CONNECTOR_FLAGS_POLL_STATUS)
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 54d9aa9998e5..3a208e956dff 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -61,7 +61,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
>   	size_t len;
>   	void *buf;
>   
> -	WARN_ON_ONCE(format->char_per_block[0] != 1);
> +	drm_WARN_ON_ONCE(fb->dev, format->char_per_block[0] != 1);
>   
>   	/* Start on a byte boundary */
>   	rect->x1 = ALIGN_DOWN(rect->x1, block_width);
> @@ -138,7 +138,7 @@ static size_t gud_xrgb8888_to_color(u8 *dst, const struct drm_format_info *forma
>   				pix = ((r >> 7) << 2) | ((g >> 7) << 1) | (b >> 7);
>   				break;
>   			default:
> -				WARN_ON_ONCE(1);
> +				drm_WARN_ON_ONCE(fb->dev, 1);
>   				return len;
>   			}
>   
> @@ -527,7 +527,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
>   		drm_connector_list_iter_end(&conn_iter);
>   	}
>   
> -	if (WARN_ON_ONCE(!connector_state))
> +	if (drm_WARN_ON_ONCE(plane->dev, !connector_state))
>   		return -ENOENT;
>   
>   	len = struct_size(req, properties,
> @@ -539,7 +539,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
>   	gud_from_display_mode(&req->mode, mode);
>   
>   	req->format = gud_from_fourcc(format->format);
> -	if (WARN_ON_ONCE(!req->format)) {
> +	if (drm_WARN_ON_ONCE(plane->dev, !req->format)) {
>   		ret = -EINVAL;
>   		goto out;
>   	}
> @@ -561,7 +561,7 @@ int gud_plane_atomic_check(struct drm_plane *plane,
>   			val = new_plane_state->rotation;
>   			break;
>   		default:
> -			WARN_ON_ONCE(1);
> +			drm_WARN_ON_ONCE(plane->dev, 1);
>   			ret = -EINVAL;
>   			goto out;
>   		}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


