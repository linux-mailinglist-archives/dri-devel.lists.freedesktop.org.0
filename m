Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C20899771
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 10:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5562113A1E;
	Fri,  5 Apr 2024 08:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZdvyyKQS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mdj5pKoQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cJ0pmk18";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nfa0JDfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF02D11249C;
 Fri,  5 Apr 2024 08:03:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 028C121A21;
 Fri,  5 Apr 2024 08:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712304181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n2QBxlqPLpG44q6Td/vPIWB30ifIj6AlCDyo/aZxxpY=;
 b=ZdvyyKQSmJgoVEqhkkNChWrfdCpJRqU9CWQ5b9abqDbIrbS1/tx1HZR+hoBu4V43VAPaa7
 +1ZiKEgHbSL53/bmEzAh9Ui76+6Xd9JnMCzSS3SHO5ep5Lz5DKexDR6+sMbBvH6pzfAXrr
 M3WgnnQIC6r3zm1hU47Tb+ihlb+ddRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712304181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n2QBxlqPLpG44q6Td/vPIWB30ifIj6AlCDyo/aZxxpY=;
 b=mdj5pKoQuqD/X6FduDgh+jrLfiGyBJ+41W51yOZXdITKGSc3/MJKRcRADRHegixf9c0ohQ
 edZtanblnJwQysDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712304180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n2QBxlqPLpG44q6Td/vPIWB30ifIj6AlCDyo/aZxxpY=;
 b=cJ0pmk18cBu5jGO0WiQwtw6lOw4ifUnKLbYG0Ghk44b3VrMBOEuFRcNxR2oiEu7Y5WzoKd
 Ig/A4X3n2cjwrpyD26wGTse6ROImbBlm/aNUn0YaWE0MyrIgKB0rQnnaBbg5a6BgA6WhzQ
 N43j3rvmWtN9VnwBR/v0oRKswvEI2q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712304180;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=n2QBxlqPLpG44q6Td/vPIWB30ifIj6AlCDyo/aZxxpY=;
 b=Nfa0JDfEFWHdUrf7gfaYWpkyPwCghMCS2D3l/QcfnFgMlQtVyIIHxWsR8yO9bE+0G638Og
 3C4WVTO3qrhcioDg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D9309139E8;
 Fri,  5 Apr 2024 08:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ZKuwMzOwD2ZwOgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Apr 2024 08:02:59 +0000
Message-ID: <733f50c4-aca8-4def-b797-b898422c4b84@suse.de>
Date: Fri, 5 Apr 2024 10:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/client: Use array notation for function
 arguments
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
 <20240404203336.10454-8-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20240404203336.10454-8-ville.syrjala@linux.intel.com>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns, intel.com:email]
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
> Use the array notation rather that the pointer notation for
> function arguments. This makes it clear to the reader that
> we are in fact dealing with an array rather than a single
> pointer. Functionally the two are equivalent.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_client_modeset.c | 42 ++++++++++++++--------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 384a9f8227a0..08fc896885dd 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -232,9 +232,9 @@ static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
>   	return enable;
>   }
>   
> -static void drm_client_connectors_enabled(struct drm_connector **connectors,
> +static void drm_client_connectors_enabled(struct drm_connector *connectors[],
>   					  unsigned int connector_count,
> -					  bool *enabled)
> +					  bool enabled[])

I like this style, but have been criticized for using it. I hope this 
has changed.

Best regards
Thomas

>   {
>   	bool any_enabled = false;
>   	struct drm_connector *connector;
> @@ -257,11 +257,11 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
>   }
>   
>   static bool drm_client_target_cloned(struct drm_device *dev,
> -				     struct drm_connector **connectors,
> +				     struct drm_connector *connectors[],
>   				     unsigned int connector_count,
> -				     const struct drm_display_mode **modes,
> -				     struct drm_client_offset *offsets,
> -				     bool *enabled, int width, int height)
> +				     const struct drm_display_mode *modes[],
> +				     struct drm_client_offset offsets[],
> +				     bool enabled[], int width, int height)
>   {
>   	int count, i, j;
>   	bool can_clone = false;
> @@ -342,10 +342,10 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>   	return false;
>   }
>   
> -static int drm_client_get_tile_offsets(struct drm_connector **connectors,
> +static int drm_client_get_tile_offsets(struct drm_connector *connectors[],
>   				       unsigned int connector_count,
> -				       const struct drm_display_mode **modes,
> -				       struct drm_client_offset *offsets,
> +				       const struct drm_display_mode *modes[],
> +				       struct drm_client_offset offsets[],
>   				       int idx,
>   				       int h_idx, int v_idx)
>   {
> @@ -375,11 +375,11 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
>   	return 0;
>   }
>   
> -static bool drm_client_target_preferred(struct drm_connector **connectors,
> +static bool drm_client_target_preferred(struct drm_connector *connectors[],
>   					unsigned int connector_count,
> -					const struct drm_display_mode **modes,
> -					struct drm_client_offset *offsets,
> -					bool *enabled, int width, int height)
> +					const struct drm_display_mode *modes[],
> +					struct drm_client_offset offsets[],
> +					bool enabled[], int width, int height)
>   {
>   	const u64 mask = BIT_ULL(connector_count) - 1;
>   	struct drm_connector *connector;
> @@ -491,10 +491,10 @@ static bool connector_has_possible_crtc(struct drm_connector *connector,
>   }
>   
>   static int drm_client_pick_crtcs(struct drm_client_dev *client,
> -				 struct drm_connector **connectors,
> +				 struct drm_connector *connectors[],
>   				 unsigned int connector_count,
> -				 struct drm_crtc **best_crtcs,
> -				 const struct drm_display_mode **modes,
> +				 struct drm_crtc *best_crtcs[],
> +				 const struct drm_display_mode *modes[],
>   				 int n, int width, int height)
>   {
>   	struct drm_device *dev = client->dev;
> @@ -566,12 +566,12 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>   
>   /* Try to read the BIOS display configuration and use it for the initial config */
>   static bool drm_client_firmware_config(struct drm_client_dev *client,
> -				       struct drm_connector **connectors,
> +				       struct drm_connector *connectors[],
>   				       unsigned int connector_count,
> -				       struct drm_crtc **crtcs,
> -				       const struct drm_display_mode **modes,
> -				       struct drm_client_offset *offsets,
> -				       bool *enabled, int width, int height)
> +				       struct drm_crtc *crtcs[],
> +				       const struct drm_display_mode *modes[],
> +				       struct drm_client_offset offsets[],
> +				       bool enabled[], int width, int height)
>   {
>   	const int count = min_t(unsigned int, connector_count, BITS_PER_LONG);
>   	unsigned long conn_configured, conn_seq, mask;

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

