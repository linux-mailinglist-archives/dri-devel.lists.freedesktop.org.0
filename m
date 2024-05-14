Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAD8C4CF7
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 09:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF9C10E2F4;
	Tue, 14 May 2024 07:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XTo/Pdc3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VB+lXPkM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XTo/Pdc3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VB+lXPkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EBF10E2F4;
 Tue, 14 May 2024 07:28:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A49D5F882;
 Tue, 14 May 2024 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715671700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19JqZquf/esolvWbVp1cAUdglPLMMRPDpEzIiO+s/sA=;
 b=XTo/Pdc3/oRvO6CpbwO+GmfRx7EPp5j6epgqNSh9PvqdRekMk6qQ1bvQD9LpM5FopCDfAV
 jClSApKcIqdA0dCMVgjmCz2u3wuT8AD2sAAKDwlcExrDPxjmj67Wt/bpzrGntB6jEXJXso
 khrEi8DmHlOJemTkvLBtTsX9Zv9hbH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715671700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19JqZquf/esolvWbVp1cAUdglPLMMRPDpEzIiO+s/sA=;
 b=VB+lXPkMryYFulM158VouOsypa7Cg+Y8pqh5p55dQsRAaRGON36FEcabJgHF1P341Kr7/W
 3X4URZo/jX/AP0Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715671700; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19JqZquf/esolvWbVp1cAUdglPLMMRPDpEzIiO+s/sA=;
 b=XTo/Pdc3/oRvO6CpbwO+GmfRx7EPp5j6epgqNSh9PvqdRekMk6qQ1bvQD9LpM5FopCDfAV
 jClSApKcIqdA0dCMVgjmCz2u3wuT8AD2sAAKDwlcExrDPxjmj67Wt/bpzrGntB6jEXJXso
 khrEi8DmHlOJemTkvLBtTsX9Zv9hbH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715671700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=19JqZquf/esolvWbVp1cAUdglPLMMRPDpEzIiO+s/sA=;
 b=VB+lXPkMryYFulM158VouOsypa7Cg+Y8pqh5p55dQsRAaRGON36FEcabJgHF1P341Kr7/W
 3X4URZo/jX/AP0Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEEE2137C3;
 Tue, 14 May 2024 07:28:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7edRNZMSQ2ZQQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 May 2024 07:28:19 +0000
Message-ID: <3c051a26-bccb-4edb-a71e-86e8313fd60c@suse.de>
Date: Tue, 14 May 2024 09:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/edid: remove drm_do_get_edid()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20240513202723.261440-1-jani.nikula@intel.com>
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
In-Reply-To: <20240513202723.261440-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email]
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



Am 13.05.24 um 22:27 schrieb Jani Nikula:
> All users of drm_do_get_edid() have been converted to
> drm_edid_read_custom(). Remove the unused function to prevent new users
> from creeping in.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

>
> ---
>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_edid.c | 28 ----------------------------
>   include/drm/drm_edid.h     |  4 ----
>   2 files changed, 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 4f54c91b31b2..0f7c4c5b14b9 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2464,34 +2464,6 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
>   	return NULL;
>   }
>   
> -/**
> - * drm_do_get_edid - get EDID data using a custom EDID block read function
> - * @connector: connector we're probing
> - * @read_block: EDID block read function
> - * @context: private data passed to the block read function
> - *
> - * When the I2C adapter connected to the DDC bus is hidden behind a device that
> - * exposes a different interface to read EDID blocks this function can be used
> - * to get EDID data using a custom block read function.
> - *
> - * As in the general case the DDC bus is accessible by the kernel at the I2C
> - * level, drivers must make all reasonable efforts to expose it as an I2C
> - * adapter and use drm_get_edid() instead of abusing this function.
> - *
> - * The EDID may be overridden using debugfs override_edid or firmware EDID
> - * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
> - * order. Having either of them bypasses actual EDID reads.
> - *
> - * Return: Pointer to valid EDID or NULL if we couldn't find any.
> - */
> -struct edid *drm_do_get_edid(struct drm_connector *connector,
> -			     read_block_fn read_block,
> -			     void *context)
> -{
> -	return _drm_do_get_edid(connector, read_block, context, NULL);
> -}
> -EXPORT_SYMBOL_GPL(drm_do_get_edid);
> -
>   /**
>    * drm_edid_raw - Get a pointer to the raw EDID data.
>    * @drm_edid: drm_edid container
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index b085525e53e2..6bdfa254a1c1 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -423,10 +423,6 @@ static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *pro
>   }
>   
>   bool drm_probe_ddc(struct i2c_adapter *adapter);
> -struct edid *drm_do_get_edid(struct drm_connector *connector,
> -	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
> -			      size_t len),
> -	void *data);
>   struct edid *drm_get_edid(struct drm_connector *connector,
>   			  struct i2c_adapter *adapter);
>   struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

