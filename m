Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A7A80BC0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 15:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D24910E012;
	Tue,  8 Apr 2025 13:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cyBZeoYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jHrDNt9M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cyBZeoYz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jHrDNt9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6556610E012
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 13:20:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 05CA91F388;
 Tue,  8 Apr 2025 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744118427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IrHvC98jBjGZAzH1rZsw44m4A7jMhdgI9Og+mTl95LQ=;
 b=cyBZeoYzYadtFC6RLtC1gOSpg+gjqQexngXOzmkKqYdV8qbJHwoFkoVu60ob5v4PkNcdCu
 92kKotQFORe8J+Zv2SzmZct9M2f0u8xzmDZ6U0Gd+R80FDZj4nEcrEbl3aGzVanYxvmK03
 DJeg1gF4EYPOHHAVM+N+4Ae6VgIDoOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744118427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IrHvC98jBjGZAzH1rZsw44m4A7jMhdgI9Og+mTl95LQ=;
 b=jHrDNt9MNt3oYnuRXOIvDGSs7qfGew3uTeYK6MpZoI99bwQkzOb8pbTaIAzfrcewb6Zqno
 V5xxRyp+zodGDMAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744118427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IrHvC98jBjGZAzH1rZsw44m4A7jMhdgI9Og+mTl95LQ=;
 b=cyBZeoYzYadtFC6RLtC1gOSpg+gjqQexngXOzmkKqYdV8qbJHwoFkoVu60ob5v4PkNcdCu
 92kKotQFORe8J+Zv2SzmZct9M2f0u8xzmDZ6U0Gd+R80FDZj4nEcrEbl3aGzVanYxvmK03
 DJeg1gF4EYPOHHAVM+N+4Ae6VgIDoOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744118427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=IrHvC98jBjGZAzH1rZsw44m4A7jMhdgI9Og+mTl95LQ=;
 b=jHrDNt9MNt3oYnuRXOIvDGSs7qfGew3uTeYK6MpZoI99bwQkzOb8pbTaIAzfrcewb6Zqno
 V5xxRyp+zodGDMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC23313691;
 Tue,  8 Apr 2025 13:20:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WSayKJoi9WfkMAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Apr 2025 13:20:26 +0000
Message-ID: <253e0739-fb1a-49b4-9f4d-3129a09a2562@suse.de>
Date: Tue, 8 Apr 2025 15:20:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/panel: auo-a030jtn01: Fix compilation build
To: Maxime Ripard <mripard@kernel.org>, Simona Vetter
 <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Anusha Srivatsa <asrivats@redhat.com>
References: <20250408122008.1676235-1-mripard@kernel.org>
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
In-Reply-To: <20250408122008.1676235-1-mripard@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[kernel.org,ffwll.ch,gmail.com,linux.intel.com];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
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

Hi Maxime

thanks for the fixes

Am 08.04.25 um 14:20 schrieb Maxime Ripard:
> Commit 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in
> place of devm_kzalloc()") switched from a kmalloc + drm_panel_init call
> to a devm_drm_panel_alloc one.
>
> However, the variable it was storing the allocated pointer in doesn't
> exist, resulting in a compilation breakage.
>
> Fixes: 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

On this series

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

And as far as the build error is concerned:

Tested-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas



> ---
>   drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> index 83529b1c2bac..6e52bf6830e1 100644
> --- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> @@ -198,14 +198,14 @@ static int a030jtn01_probe(struct spi_device *spi)
>   	struct a030jtn01 *priv;
>   	int err;
>   
>   	spi->mode |= SPI_MODE_3 | SPI_3WIRE;
>   
> -	panel = devm_drm_panel_alloc(dev, struct a030jtn01, panel,
> -				     &a030jtn01_funcs, DRM_MODE_CONNECTOR_DPI);
> -	if (IS_ERR(panel))
> -		return PTR_ERR(panel);
> +	priv = devm_drm_panel_alloc(dev, struct a030jtn01, panel,
> +				    &a030jtn01_funcs, DRM_MODE_CONNECTOR_DPI);
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
>   
>   	priv->spi = spi;
>   	spi_set_drvdata(spi, priv);
>   
>   	priv->map = devm_regmap_init_spi(spi, &a030jtn01_regmap_config);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

