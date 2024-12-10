Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF39EAB2A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 09:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C546A10E833;
	Tue, 10 Dec 2024 08:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0RKof0sA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gfS2R9sx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0RKof0sA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gfS2R9sx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246E710E833
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 08:59:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F3D42111F;
 Tue, 10 Dec 2024 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733821140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49hMjNt9pBGKOeBV6I29R5mRJ1+yvQypQMT7IZyVWhg=;
 b=0RKof0sAp83qTzhJL+hjC4PqP1s5rBTdjEBQzVSV1Ywizae/yKSo17KMOpYygL1Q6Ep9SJ
 Br0bXl+DJvBrWkTfTeKFPBoSUn11JQYddibTJDd/zLDMl/QgMDCSR3Xun1LdsYQ+CqcjSd
 DIlap8QraFMLh8a7IgzEi54Lo0caux4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733821140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49hMjNt9pBGKOeBV6I29R5mRJ1+yvQypQMT7IZyVWhg=;
 b=gfS2R9sxzVTNc/EFlnZN7pZsYx4HooM/RjlwmGbFZ9x6o1sfy7ZlwicGJr6g5G+8Y+rinc
 lJUKS4t0mDhsakAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0RKof0sA;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gfS2R9sx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733821140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49hMjNt9pBGKOeBV6I29R5mRJ1+yvQypQMT7IZyVWhg=;
 b=0RKof0sAp83qTzhJL+hjC4PqP1s5rBTdjEBQzVSV1Ywizae/yKSo17KMOpYygL1Q6Ep9SJ
 Br0bXl+DJvBrWkTfTeKFPBoSUn11JQYddibTJDd/zLDMl/QgMDCSR3Xun1LdsYQ+CqcjSd
 DIlap8QraFMLh8a7IgzEi54Lo0caux4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733821140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=49hMjNt9pBGKOeBV6I29R5mRJ1+yvQypQMT7IZyVWhg=;
 b=gfS2R9sxzVTNc/EFlnZN7pZsYx4HooM/RjlwmGbFZ9x6o1sfy7ZlwicGJr6g5G+8Y+rinc
 lJUKS4t0mDhsakAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2439E138D2;
 Tue, 10 Dec 2024 08:59:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qatuB9QCWGdtKAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 08:59:00 +0000
Message-ID: <183e6f35-85bd-4a96-be5e-eded1d9fc14b@suse.de>
Date: Tue, 10 Dec 2024 09:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] drm: rework FB_CORE dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jani Nikula <jani.nikula@intel.com>, Harry Wentland
 <harry.wentland@amd.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241115162323.3555229-1-arnd@kernel.org>
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
In-Reply-To: <20241115162323.3555229-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7F3D42111F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,arndb.de:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[15];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_CC(0.00)[arndb.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,glider.be,intel.com,amd.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[renesas];
 DKIM_TRACE(0.00)[suse.de:+];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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


Am 15.11.24 um 17:23 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The 'select FB_CORE' statement moved from CONFIG_DRM to DRM_CLIENT_LIB,
> but there are now configurations that have code calling into fb_core
> as built-in even though the client_lib itself is a loadable module:
>
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_driver_fbdev_probe':
> drm_fbdev_shmem.c:(.text+0x1fc): undefined reference to `fb_deferred_io_init'
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_destroy':
> drm_fbdev_shmem.c:(.text+0x2e1): undefined reference to `fb_deferred_io_cleanup'
> ...
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
> drm_fb_helper.c:(.text+0x2c6): undefined reference to `fb_set_suspend'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
> drm_fb_helper.c:(.text+0x2e1): undefined reference to `fb_set_suspend'
>
> In addition to DRM_CLIENT_LIB, the 'select' needs to be at least in
> two more parts, DRM_KMS_HELPER and DRM_GEM_SHMEM_HELPER, so add those
> here.
>
> Fixes: dadd28d4142f ("drm/client: Add client-lib module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks like this patch got lost. I'll merge it now and will also send a 
patch for DMA- and TTM-related options.

Best regards
Thomas

> ---
> v2: keep the select in DRM_CLIENT_LIB, keep alphabetic sorting
> ---
>   drivers/gpu/drm/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index a4a092ee70d9..410bd6d78408 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -98,6 +98,7 @@ config DRM_KUNIT_TEST
>   config DRM_KMS_HELPER
>   	tristate
>   	depends on DRM
> +	select FB_CORE if DRM_FBDEV_EMULATION
>   	help
>   	  CRTC helpers for KMS drivers.
>   
> @@ -371,6 +372,7 @@ config DRM_GEM_DMA_HELPER
>   config DRM_GEM_SHMEM_HELPER
>   	tristate
>   	depends on DRM && MMU
> +	select FB_CORE if DRM_FBDEV_EMULATION
>   	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
>   	  Choose this if you need the GEM shmem helper functions

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

