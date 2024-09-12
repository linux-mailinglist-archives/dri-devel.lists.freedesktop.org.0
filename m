Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD40976284
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9B10E166;
	Thu, 12 Sep 2024 07:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="agGfufFP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s0gjiyeb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="agGfufFP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s0gjiyeb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C13F10E166
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 07:19:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95382219E5;
 Thu, 12 Sep 2024 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726125577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QMHQ2SkP3uj2iaMSmn87+RBrzys8DvTfZB8H13b++tg=;
 b=agGfufFPF/4JlSUUOUVasrEC+FoD5x/i8DNhqlNRC/NNAtmhmnwbPswzmp2yY2tKhUO0HZ
 0779AxL/Mg3XPU79dc8iqoQbUXE5UvOw6HIZS+ipwg+ab8dUDq9sy+GgsxBo4vtEdPXoRC
 tMjOmI7oi49wtcKxYZowwpHZaKaamuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726125577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QMHQ2SkP3uj2iaMSmn87+RBrzys8DvTfZB8H13b++tg=;
 b=s0gjiyebFyfrGwwWDsalbs8P9nM4Xo66irWm9kZqPvt2tUB6pnNxEqSTLBzxYZwYt6sJM3
 1NFh64k9JURhfpCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726125577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QMHQ2SkP3uj2iaMSmn87+RBrzys8DvTfZB8H13b++tg=;
 b=agGfufFPF/4JlSUUOUVasrEC+FoD5x/i8DNhqlNRC/NNAtmhmnwbPswzmp2yY2tKhUO0HZ
 0779AxL/Mg3XPU79dc8iqoQbUXE5UvOw6HIZS+ipwg+ab8dUDq9sy+GgsxBo4vtEdPXoRC
 tMjOmI7oi49wtcKxYZowwpHZaKaamuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726125577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QMHQ2SkP3uj2iaMSmn87+RBrzys8DvTfZB8H13b++tg=;
 b=s0gjiyebFyfrGwwWDsalbs8P9nM4Xo66irWm9kZqPvt2tUB6pnNxEqSTLBzxYZwYt6sJM3
 1NFh64k9JURhfpCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5388F13A73;
 Thu, 12 Sep 2024 07:19:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id efipEgmW4mY0dQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Sep 2024 07:19:37 +0000
Message-ID: <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de>
Date: Thu, 12 Sep 2024 09:19:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
To: Tejas Vipin <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
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
In-Reply-To: <20240911180650.820598-1-tejasvipin76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,linux.intel.com,kernel.org,ffwll.ch];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
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

Am 11.09.24 um 20:06 schrieb Tejas Vipin:
> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
> monitor HDMI information is available after EDID is parsed. Additionally
> rewrite the code the code to have fewer indentation levels.

The problem is that the entire logic is outdated. The content 
of cdv_hdmi_detect() should go into cdv_hdmi_get_modes(), the detect_ctx 
callback should be set to drm_connector_helper_detect_from_ddc() and 
cdv_hdmi_detect() should be deleted. The result is that ->detect_ctx 
will detect the presence of a display and ->get_modes will update EDID 
and other properties.

Do you have  a device for testing such a change?

Best regards
Thomas

>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>      - Use drm_edid instead of edid
>
> Link to v1: https://lore.kernel.org/all/20240910051856.700210-1-tejasvipin76@gmail.com/
> ---
>   drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> index 2d95e0471291..701f8bbd5f2b 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> @@ -128,23 +128,25 @@ static enum drm_connector_status cdv_hdmi_detect(
>   {
>   	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
>   	struct mid_intel_hdmi_priv *hdmi_priv = gma_encoder->dev_priv;
> -	struct edid *edid = NULL;
> +	const struct drm_edid *drm_edid;
> +	int ret;
>   	enum drm_connector_status status = connector_status_disconnected;
>   
> -	edid = drm_get_edid(connector, connector->ddc);
> +	drm_edid = drm_edid_read_ddc(connector, connector->ddc);
> +	ret = drm_edid_connector_update(connector, drm_edid);
>   
>   	hdmi_priv->has_hdmi_sink = false;
>   	hdmi_priv->has_hdmi_audio = false;
> -	if (edid) {
> -		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
> -			status = connector_status_connected;
> -			hdmi_priv->has_hdmi_sink =
> -						drm_detect_hdmi_monitor(edid);
> -			hdmi_priv->has_hdmi_audio =
> -						drm_detect_monitor_audio(edid);
> -		}
> -		kfree(edid);
> +	if (ret)
> +		return status;
> +
> +	if (drm_edid_is_digital(drm_edid)) {
> +		status = connector_status_connected;
> +		hdmi_priv->has_hdmi_sink = connector->display_info.is_hdmi;
> +		hdmi_priv->has_hdmi_audio = connector->display_info.has_audio;
>   	}
> +	drm_edid_free(drm_edid);
> +
>   	return status;
>   }
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

