Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3882A8B08B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466DB10E840;
	Wed, 16 Apr 2025 06:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gpcjICB5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P+wjYFa9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gpcjICB5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P+wjYFa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC30B10E840
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:41:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20FC81F445;
 Wed, 16 Apr 2025 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744785672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=noPMp+klVq71bpMa5KPzXvbYfQPxChOADw6e8B+sIjU=;
 b=gpcjICB5LiAe6jU1677yZp+N3n0DsjzFJz3rwvW5krOK6qrz6z6Xy5rm9fM+uv1d/aDrQV
 2Zi+jCKxfX5ZtC5jvZqEjyqa8+fK/tGybM1oFtx5GMoajqqkTqvHvzpUCSu+uwpl41Y1nz
 +IZmTIwXKC5A1gytz2RUgDptJ6PQveI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744785672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=noPMp+klVq71bpMa5KPzXvbYfQPxChOADw6e8B+sIjU=;
 b=P+wjYFa90pP0xCRQ9w4cAlsLH5rkam9zKEoztopnZTvwveuvrP+ugSeb0T3fLEPGHz+n7Q
 CwqQZQ0f+Kjb6NCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744785672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=noPMp+klVq71bpMa5KPzXvbYfQPxChOADw6e8B+sIjU=;
 b=gpcjICB5LiAe6jU1677yZp+N3n0DsjzFJz3rwvW5krOK6qrz6z6Xy5rm9fM+uv1d/aDrQV
 2Zi+jCKxfX5ZtC5jvZqEjyqa8+fK/tGybM1oFtx5GMoajqqkTqvHvzpUCSu+uwpl41Y1nz
 +IZmTIwXKC5A1gytz2RUgDptJ6PQveI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744785672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=noPMp+klVq71bpMa5KPzXvbYfQPxChOADw6e8B+sIjU=;
 b=P+wjYFa90pP0xCRQ9w4cAlsLH5rkam9zKEoztopnZTvwveuvrP+ugSeb0T3fLEPGHz+n7Q
 CwqQZQ0f+Kjb6NCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0359213976;
 Wed, 16 Apr 2025 06:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id u4yyOgdR/2d8PgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Apr 2025 06:41:11 +0000
Message-ID: <b24d22a3-5206-4738-8ccb-2f2ec8ec9194@suse.de>
Date: Wed, 16 Apr 2025 08:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Reggression caused by "drm/fb-helper: Don't use the preferred
 depth for the BPP default"
To: Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?=
 <noralf@tronnes.org>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>
References: <CAOMZO5Dw9O_8E72ZsQhm7j+PX9XQfj9_w-WrkzaxczyyCGndVA@mail.gmail.com>
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
In-Reply-To: <CAOMZO5Dw9O_8E72ZsQhm7j+PX9XQfj9_w-WrkzaxczyyCGndVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,tronnes.org];
 TO_DN_ALL(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_THREE(0.00)[3];
 MIME_TRACE(0.00)[0:+]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
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

Hi,

thanks for the bug report.

Am 16.04.25 um 04:23 schrieb Fabio Estevam:
> Hi,
>
> I have a custom board populated with a cfaf240320x panel connected via
> SPI and driven by the drivers/gpu/drm/tiny/panel-mipi-dbi.c driver.
>
> It works well on kernel 6.1.
>
> After upgrading the kernel to 6.12 (also tested Linux-next), the panel
> no longer works correctly: the colors are wrong, and the image appears
> twice, one in each half of the screen.
>
> Running git bisect pointed to the following bad commit:
>
> 559358282e5b43b1b01e7f6afac6e0beb33cb4a2 is the first bad commit
> commit 559358282e5b43b1b01e7f6afac6e0beb33cb4a2
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Wed Nov 23 12:53:48 2022 +0100
>
>      drm/fb-helper: Don't use the preferred depth for the BPP default
>
>      If no preferred value for bits-per-pixel has been given, fall back
>      to 32. Never use the preferred depth. The color depth is the number
>      of color/alpha bits per pixel, while bpp is the overall number of
>      bits in most cases.
>
>      Most noteworthy, XRGB8888 has a depth of 24 and a bpp value of 32.
>      Using depth for bpp would make the value 24 as well and format
>      selection in fbdev helpers fails. Unfortunately XRGB8888 is the most
>      common format and the old heuristic therefore fails for most of
>      the drivers (unless they implement the 24-bit RGB888 format).
>
>      Picking a bpp of 32 will later on result in a default depth of 24
>      and the format XRGB8888. As XRGB8888 is the default format for most
>      of the current and legacy graphics stack, all drivers must support
>      it. So it is the safe choice.
>
>      v2:
>              * fix commit-message typo (Javier)
>
>      Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>      Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>      Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>      Link: https://patchwork.freedesktop.org/patch/msgid/20221123115348.2521-8-tzimmermann@suse.de
>
> Then I did a quick hack like this:
>
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -425,7 +425,7 @@ void drm_fb_helper_prepare(struct drm_device *dev,
> struct drm_fb_helper *helper,
>           *       format.
>           */
>          if (!preferred_bpp)
> -               preferred_bpp = 32;
> +               preferred_bpp = 16;
>
>          INIT_LIST_HEAD(&helper->kernel_fb_list);
>          spin_lock_init(&helper->damage_lock);
>
> and the display correctly again.
>
> What is the proper fix for this issue?

The proper fix would patch the driver to support 32-bit correctly. It 
looks like the panel only supports 16 bpp and 24 bpp, so format 
conversion would be required.

For an easier fix, you can replace drm_client_setup() at [1] with 
drm_client_setup_with_fourcc() and pass DRM_FORMAT_RGB565 as the second 
argument.

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/tiny/panel-mipi-dbi.c#L393

>
> Thanks,
>
> Fabio Estevam

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

