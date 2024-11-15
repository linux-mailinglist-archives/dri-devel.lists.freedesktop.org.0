Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226559CF0C6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C4210E892;
	Fri, 15 Nov 2024 15:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VqAl7j/0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ieClMeYq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VqAl7j/0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ieClMeYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D7110E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:55:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B25C4211C9;
 Fri, 15 Nov 2024 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731686098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/HMO9Z4QkivRzsPYS4LZ4h6IFG25tQKmO6gXs3b7tgg=;
 b=VqAl7j/0cPy75bpmKRgMkYnEifsvbDhh93j3i+HMDrT/JI9qqo4jUyH6MacG5TtXiU0yjy
 zv4SBeDPLQ69F2wKSi1RhjzGIAgdROdCGAe089ui3hJNG6ZSx6l9j/LJBKwr6f3f8Ngz7l
 M7pcuTFHcNy+Ri88RpBS6bX9cZtWjDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731686098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/HMO9Z4QkivRzsPYS4LZ4h6IFG25tQKmO6gXs3b7tgg=;
 b=ieClMeYq+Atvsjo7jY5iEm8721Eu5n0IF5gljFnQXUCDUcu984LBcSAI6+TOXFfeLW6g7U
 al4tJnPgHx1cdqBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731686098; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/HMO9Z4QkivRzsPYS4LZ4h6IFG25tQKmO6gXs3b7tgg=;
 b=VqAl7j/0cPy75bpmKRgMkYnEifsvbDhh93j3i+HMDrT/JI9qqo4jUyH6MacG5TtXiU0yjy
 zv4SBeDPLQ69F2wKSi1RhjzGIAgdROdCGAe089ui3hJNG6ZSx6l9j/LJBKwr6f3f8Ngz7l
 M7pcuTFHcNy+Ri88RpBS6bX9cZtWjDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731686098;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/HMO9Z4QkivRzsPYS4LZ4h6IFG25tQKmO6gXs3b7tgg=;
 b=ieClMeYq+Atvsjo7jY5iEm8721Eu5n0IF5gljFnQXUCDUcu984LBcSAI6+TOXFfeLW6g7U
 al4tJnPgHx1cdqBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F805134B8;
 Fri, 15 Nov 2024 15:54:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vDrkENJuN2feRAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Nov 2024 15:54:58 +0000
Message-ID: <a600708e-5240-4c31-ad29-4a6e791a65e7@suse.de>
Date: Fri, 15 Nov 2024 16:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: rework FB_CORE dependency
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jani Nikula <jani.nikula@intel.com>, Harry Wentland
 <harry.wentland@amd.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241115152722.3537630-1-arnd@kernel.org>
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
In-Reply-To: <20241115152722.3537630-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[14];
 ARC_NA(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[arndb.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,glider.be,intel.com,amd.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_COUNT_TWO(0.00)[2]; TAGGED_RCPT(0.00)[renesas];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email, imap1.dmz-prg2.suse.org:helo,
 suse.de:mid]
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


Am 15.11.24 um 16:27 schrieb Arnd Bergmann:
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
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_mmap':
> drm_fbdev_shmem.c:(.text+0x34c): undefined reference to `fb_deferred_io_mmap'
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_imageblit':
> drm_fbdev_shmem.c:(.text+0x35f): undefined reference to `sys_imageblit'
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_copyarea':
> drm_fbdev_shmem.c:(.text+0x38b): undefined reference to `sys_copyarea'
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_fillrect':
> drm_fbdev_shmem.c:(.text+0x3b7): undefined reference to `sys_fillrect'
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_write':
> drm_fbdev_shmem.c:(.text+0x3e9): undefined reference to `fb_sys_write'
> x86_64-linux-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_read':
> drm_fbdev_shmem.c:(.text+0x413): undefined reference to `fb_sys_read'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
> drm_fb_helper.c:(.text+0x2c6): undefined reference to `fb_set_suspend'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
> drm_fb_helper.c:(.text+0x2e1): undefined reference to `fb_set_suspend'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_info':
> drm_fb_helper.c:(.text+0x33a): undefined reference to `framebuffer_alloc'
> x86_64-linux-ld: drm_fb_helper.c:(.text+0x359): undefined reference to `fb_alloc_cmap'
> x86_64-linux-ld: drm_fb_helper.c:(.text+0x368): undefined reference to `framebuffer_release'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_release_info':
> drm_fb_helper.c:(.text+0x3a4): undefined reference to `fb_dealloc_cmap'
> x86_64-linux-ld: drm_fb_helper.c:(.text+0x3ab): undefined reference to `framebuffer_release'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_unregister_info':
> drm_fb_helper.c:(.text+0x3bb): undefined reference to `unregister_framebuffer'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `__drm_fb_helper_initial_config_and_unlock':
> drm_fb_helper.c:(.text+0xb6d): undefined reference to `register_framebuffer'
> x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend_unlocked':
> drm_fb_helper.c:(.text+0x167a): undefined reference to `fb_set_suspend'
>
> Since the code that calls into fb_core is not actually in the client_lib
> module but in other helper libraries, move the 'select' again to the
> places that actually call into fb_core, in this case DRM_GEM_SHMEM_HELPER
> and DRM_KMS_HELPER.

Thanks a lot for the fix. The dependency handling of among the modules 
is nightmare-ish.

>
> Fixes: dadd28d4142f ("drm/client: Add client-lib module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have only given this light build testing. It seems sensible on the surface,
> but there is a chance that there are additional helpers that need the same
> 'select'. Moving it into CONFIG_DRM itself would be the safer option, but
> that seems to defeat the purpose of the client-lib module.

This patch's idea looks correct to me. It's likely a matter of finding 
all corner cases. As you say, selecting FB_CORE from CONFIG_DRM is too 
strong a dependency. Fbdev emulation is implemented throughout a number 
of helper and driver modules. So fbdev should be an independent module 
if possible.

> ---
>   drivers/gpu/drm/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index a4a092ee70d9..4f21bff6282a 100644
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
> @@ -220,7 +221,6 @@ config DRM_CLIENT_LIB
>   	tristate
>   	depends on DRM
>   	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
> -	select FB_CORE if DRM_FBDEV_EMULATION

This should remain. More fbdev code will move into drm_fbdev_client.c 
and that will require FB_CORE.

>   	help
>   	  This option enables the DRM client library and selects all
>   	  modules and components according to the enabled clients.
> @@ -372,6 +372,7 @@ config DRM_GEM_SHMEM_HELPER
>   	tristate
>   	depends on DRM && MMU
>   	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
> +	select FB_CORE if DRM_FBDEV_EMULATION

This select is also needed by DRM_GEM_DMA_HELPER and DRM_GEM_TTM_HELPER.

Please sort these select statements alphabetically.

Best regards
Thomas

>   	help
>   	  Choose this if you need the GEM shmem helper functions
>   

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

