Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6AD965F40
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 12:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A27710EA67;
	Fri, 30 Aug 2024 10:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fuLWTUD/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hh+DxBog";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SkB7zBlt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WI3+UTho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998F010EA67;
 Fri, 30 Aug 2024 10:30:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E3D11F7C1;
 Fri, 30 Aug 2024 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725013836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k937I8cdtbLPG3kT8iCo5l5pl+cGpAGzmDZsqWVWZO0=;
 b=fuLWTUD/EjH8+QoHAOHp/CgS+86rcCasFit5g3SgPQAqjdUmVuopAJBIpvvDVnuQp5JF3u
 l/Oy2v7+dLjeBMC7kxIwqbL7Mynt/nbek15NdnsMuOb+DlbbRo0gZoulUhrkwjfjp4C77y
 0v///LGo9OqF3OjRE7mP5N/LFB8OQqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725013836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k937I8cdtbLPG3kT8iCo5l5pl+cGpAGzmDZsqWVWZO0=;
 b=Hh+DxBogUv2WcU+Rt/JydNfnKNM1luSYod5FQtnsKNaRJ4QoA+4IDv/xRLBebahPdUL1+e
 qDoPzYxp2TNCRVAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725013835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k937I8cdtbLPG3kT8iCo5l5pl+cGpAGzmDZsqWVWZO0=;
 b=SkB7zBlt4z4gcoYUB5ZR11bEtOwerIAqQ78hfLbTnnzN/xXgrnOxQ/1AWllLLT+8jFQpqs
 dnnHr95iju4y9B1i/TgCnOXIvV6RTQlcCX1LZHt5dERCFiRiCUbE5GqCV6OjfECO0W/1+1
 mxTFqo1Rr+03naWwfMygGrhn4sMAxWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725013835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=k937I8cdtbLPG3kT8iCo5l5pl+cGpAGzmDZsqWVWZO0=;
 b=WI3+UThoegsfIN+lBvSyHIQPIl7SBprNl9Mg2A2Cg9uDOVDGEF401p/LzRLRu54JmwHLPo
 4QT5nDeIUSIYpwDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D83AC13A3D;
 Fri, 30 Aug 2024 10:30:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bFp3M0qf0WYsHgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 10:30:34 +0000
Message-ID: <55274d81-d96c-47e7-a200-41636ffe1067@suse.de>
Date: Fri, 30 Aug 2024 12:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/81] drm: Add client-agnostic setup helper
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-5-tzimmermann@suse.de>
 <6c78eb72-c555-1fa8-18f9-c1e671a8b12@linux-m68k.org>
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
In-Reply-To: <6c78eb72-c555-1fa8-18f9-c1e671a8b12@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_TLS_ALL(0.00)[];
 ARC_NA(0.00)[]; TAGGED_RCPT(0.00)[renesas];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[ffwll.ch,gmail.com,redhat.com,lists.freedesktop.org,ideasonboard.com];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email, linux-m68k.org:email,
 imap1.dmz-prg2.suse.org:helo, suse.de:mid, suse.de:email]
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

Am 30.08.24 um 11:45 schrieb Geert Uytterhoeven:
>     Hi Thomas,
>
> On Fri, 30 Aug 2024, Thomas Zimmermann wrote:
>> DRM may support multiple in-kernel clients that run as soon as a DRM
>> driver has been registered. To select the client(s) in a single place,
>> introduce drm_client_setup().
>>
>> Drivers that call the new helper automatically instantiate the kernel's
>> configured default clients. Only fbdev emulation is currently supported.
>> Later versions can add support for DRM-based logging, a boot logo or 
>> even
>> a console.
>>
>> Some drivers handle the color mode for clients internally. Provide the
>> helper drm_client_setup_with_color_mode() for them.
>>
>> v3:
>> - fix build error
>> v2:
>> - add drm_client_setup_with_fourcc() (Laurent)
>> - push default-format handling into actual clients
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart 
>> <laurent.pinchart+renesas@ideasonboard.com>
>
> Thanks for your patch!
>
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_client_setup.c
>
>> +/**
>> + * drm_client_setup_with_fourcc() - Setup in-kernel DRM clients for 
>> color mode
>> + * @dev: DRM device
>> + * @fourcc: Preferred pixel format as 4CC code for the device
>> + *
>> + * This function sets up the in-kernel DRM clients. It is equivalent
>> + * to drm_client_setup(), but expects a 4CC code as second argument.
>> + *
>> + * Do not use this function in new drivers. Prefer 
>> drm_client_setup() with a
>> + * format of NULL.
>
> Why? To me this looks like the right function to call on hardware
> that does not support ARGB8888 natively.

Sorry, that needs to be fixed. the _fourcc() helper is ok-ish.

Ideally, the client would select the format automatically. It could also 
look at the preferred_depth in struct drm_mode_config. But some drivers 
still want a different format for fbdev emulation. See the _fourcc() 
helper as a fallback for this scenario.

>
> BTW, once this series is applied, I plan to check again how to wire up
> native fbcon support for monochrome (DRM_FORMAT_R1) and grayscale
> (DRM_FORMAT_R8), as used by the Solomon driver.

The internals of fbdev emulation still use a color-mode value (see 
drm_fbdev_client_setup()). This would require fixing first. It's 
probably not hard.

I know that you've been waiting for the format parameter for some time. 
We're getting there. :)

Best regards
Thomas

>
>> + */
>> +void drm_client_setup_with_fourcc(struct drm_device *dev, u32 fourcc)
>> +{
>> +    drm_client_setup(dev, drm_format_info(fourcc));
>> +}
>> +EXPORT_SYMBOL(drm_client_setup_with_fourcc);
>> +
>> +/**
>> + * drm_client_setup_with_color_mode() - Setup in-kernel DRM clients 
>> for color mode
>> + * @dev: DRM device
>> + * @color_mode: Preferred color mode for the device
>> + *
>> + * This function sets up the in-kernel DRM clients. It is equivalent
>> + * to drm_client_setup(), but expects a color mode as second argument.
>> + *
>> + * Do not use this function in new drivers. Prefer 
>> drm_client_setup() with a
>
>
> Yeah, this is definitely not to be used in new drivers, as color_mode is
> ambiguous.
>
>> + * format of NULL.
>
> or drm_client_setup_with_fourcc().
>
>> + */
>> +void drm_client_setup_with_color_mode(struct drm_device *dev, 
>> unsigned int color_mode)
>> +{
>> +    u32 fourcc = drm_driver_color_mode_format(dev, color_mode);
>> +
>> +    drm_client_setup_with_fourcc(dev, fourcc);
>> +}
>> +EXPORT_SYMBOL(drm_client_setup_with_color_mode);
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

