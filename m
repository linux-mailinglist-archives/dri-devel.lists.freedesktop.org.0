Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5429627C8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A2B10E505;
	Wed, 28 Aug 2024 12:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yVOGfHyn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PEOfSgMA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yVOGfHyn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PEOfSgMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151B710E507
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:52:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9FAB01FBB5;
 Wed, 28 Aug 2024 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724849531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nI30HYC0jQH/TnOoPQFsyVnYKxNKGVQDkHKtUrmmlZc=;
 b=yVOGfHynD6ZOVTDw0Oa+KZqPd0mFds1VV9AjLcLbJYo4Qh1iffw8rruEwNb9xWd/Lhx2B6
 GoaDDoYfFi3+Sy8B4LgKa5/XkF70p6jHCimHJYg3ol12zJW1jw34nwYisXGayJZ83qFPQ8
 KAmeuYmnMUPGKXD83fKOwb24iK65XVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724849531;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nI30HYC0jQH/TnOoPQFsyVnYKxNKGVQDkHKtUrmmlZc=;
 b=PEOfSgMAfXTMWwlnpLMfgeEtd87MvgN1OmvKTz7WnBNQOrskx2rVXbKklgxtvlf67TG31k
 Btw/Zn9CIb+OHeCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yVOGfHyn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PEOfSgMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724849531; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nI30HYC0jQH/TnOoPQFsyVnYKxNKGVQDkHKtUrmmlZc=;
 b=yVOGfHynD6ZOVTDw0Oa+KZqPd0mFds1VV9AjLcLbJYo4Qh1iffw8rruEwNb9xWd/Lhx2B6
 GoaDDoYfFi3+Sy8B4LgKa5/XkF70p6jHCimHJYg3ol12zJW1jw34nwYisXGayJZ83qFPQ8
 KAmeuYmnMUPGKXD83fKOwb24iK65XVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724849531;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nI30HYC0jQH/TnOoPQFsyVnYKxNKGVQDkHKtUrmmlZc=;
 b=PEOfSgMAfXTMWwlnpLMfgeEtd87MvgN1OmvKTz7WnBNQOrskx2rVXbKklgxtvlf67TG31k
 Btw/Zn9CIb+OHeCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 764AC138D2;
 Wed, 28 Aug 2024 12:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K5hmG3sdz2YtGwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 28 Aug 2024 12:52:11 +0000
Message-ID: <a1e0ddbc-30b5-4303-9d1a-99f51c44d679@suse.de>
Date: Wed, 28 Aug 2024 14:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/tiny/gm12u320: convert to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <c31c3afa883a3321345608c480c26161b638a83e.1724348429.git.jani.nikula@intel.com>
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
In-Reply-To: <c31c3afa883a3321345608c480c26161b638a83e.1724348429.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9FAB01FBB5
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:dkim, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
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

Am 22.08.24 um 19:42 schrieb Jani Nikula:
> Prefer the struct drm_edid based functions for allocating the EDID and
> updating the connector.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/tiny/gm12u320.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index e0defb1d134f..0bd7707c053e 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -464,7 +464,7 @@ static int gm12u320_set_ecomode(struct gm12u320_device *gm12u320)
>    * Note this assumes this driver is only ever used with the Acer C120, if we
>    * add support for other devices the vendor and model should be parameterized.
>    */
> -static struct edid gm12u320_edid = {
> +static const struct edid gm12u320_edid = {
>   	.header		= { 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 },
>   	.mfg_id		= { 0x04, 0x72 },	/* "ACR" */
>   	.prod_code	= { 0x20, 0xc1 },	/* C120h */
> @@ -523,8 +523,15 @@ static struct edid gm12u320_edid = {
>   
>   static int gm12u320_conn_get_modes(struct drm_connector *connector)
>   {
> -	drm_connector_update_edid_property(connector, &gm12u320_edid);
> -	return drm_add_edid_modes(connector, &gm12u320_edid);
> +	const struct drm_edid *drm_edid;
> +	int count;
> +
> +	drm_edid = drm_edid_alloc(&gm12u320_edid, sizeof(gm12u320_edid));

Wouldn't it be better to use drm_edid_read_custom() to get the 
connector's edid override, if any?

Best regards
Thomas

> +	drm_edid_connector_update(connector, drm_edid);
> +	count = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
> +
> +	return count;
>   }
>   
>   static const struct drm_connector_helper_funcs gm12u320_conn_helper_funcs = {

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

