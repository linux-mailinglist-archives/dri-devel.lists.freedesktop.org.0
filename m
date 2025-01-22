Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4EA18D03
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 08:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93AB10E1EF;
	Wed, 22 Jan 2025 07:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="s9Af0NcP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GKHyQV3+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s9Af0NcP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GKHyQV3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763B110E1EF
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 07:48:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 278AD21243;
 Wed, 22 Jan 2025 07:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737532097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p8lKugjz8LTRqGvaTlvkY+AbB0nhQ+NL6kSMRzPuUz0=;
 b=s9Af0NcPkhvHIWeH7ndMQJeRHu8t+Cor8IseRdpuVEjCZ4XTuDrvhKdI9RxrSNkcWNsbN4
 zeB65gQ5wluFCnp1QrvtrlyakwSyIjqZ8NnXY6GiWU+n8LlCr1sMZsUJpouq1jI9mirdsb
 rF8633gpMetbYnDk6Z+DQjB5ksmW6yU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737532097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p8lKugjz8LTRqGvaTlvkY+AbB0nhQ+NL6kSMRzPuUz0=;
 b=GKHyQV3+fU62+5ZHerH1v74LqgYleTOrwEv5f8XCdvK53iEdtlgGcqFSwYDXEW+wXZi/xi
 EKUkSDmdH7cvrZDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737532097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p8lKugjz8LTRqGvaTlvkY+AbB0nhQ+NL6kSMRzPuUz0=;
 b=s9Af0NcPkhvHIWeH7ndMQJeRHu8t+Cor8IseRdpuVEjCZ4XTuDrvhKdI9RxrSNkcWNsbN4
 zeB65gQ5wluFCnp1QrvtrlyakwSyIjqZ8NnXY6GiWU+n8LlCr1sMZsUJpouq1jI9mirdsb
 rF8633gpMetbYnDk6Z+DQjB5ksmW6yU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737532097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=p8lKugjz8LTRqGvaTlvkY+AbB0nhQ+NL6kSMRzPuUz0=;
 b=GKHyQV3+fU62+5ZHerH1v74LqgYleTOrwEv5f8XCdvK53iEdtlgGcqFSwYDXEW+wXZi/xi
 EKUkSDmdH7cvrZDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 025AA1397D;
 Wed, 22 Jan 2025 07:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ZG7gOsCikGd0CAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Jan 2025 07:48:16 +0000
Message-ID: <a5a98971-405e-496b-89a4-75a61fd6d898@suse.de>
Date: Wed, 22 Jan 2025 08:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: undefined reference to `drm_fb_helper_fini'
To: Marc Kleine-Budde <mkl@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: kernel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch
References: <20250121-greedy-flounder-of-abundance-4d2ee8-mkl@pengutronix.de>
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
In-Reply-To: <20250121-greedy-flounder-of-abundance-4d2ee8-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[pengutronix.de,gmail.com,ffwll.ch];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
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

Hi,

thanks for the bug report. Arnd just sent a fix, I think.

https://lore.kernel.org/dri-devel/20250122064655.1095176-1-arnd@kernel.org/T/#u

Best regards
Thomas


Am 21.01.25 um 13:06 schrieb Marc Kleine-Budde:
> Hello,
>
> while working on something completely different, I stumbled over this
> linker problem, during final linking of the kernel.
>
> - ARCH=arm64
> - linux: v6.13
> - gcc version 12.2.0 (Debian 12.2.0-14)
> - GNU ld (GNU Binutils for Debian) 2.40
> - .config is attached
>
> | aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
> | aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_destroy':
> | drivers/gpu/drm/drm_fbdev_shmem.c:62: undefined reference to `drm_fb_helper_fini'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.c:67: undefined reference to `drm_fb_helper_unprepare'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_fb_mmap':
> | drivers/gpu/drm/drm_fbdev_shmem.c:45: undefined reference to `drm_gem_fb_get_obj'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_imageblit':
> | drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_area'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_copyarea':
> | drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_area'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_fillrect':
> | drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_area'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_defio_write':
> | drivers/gpu/drm/drm_fbdev_shmem.c:37: undefined reference to `drm_fb_helper_damage_range'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_driver_fbdev_probe':
> | drivers/gpu/drm/drm_fbdev_shmem.c:171: undefined reference to `drm_fb_helper_alloc_info'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.c:177: undefined reference to `drm_fb_helper_fill_info'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.c:192: undefined reference to `drm_fb_helper_deferred_io'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `drm_fb_helper_deferred_io' which may bind externally can not be used when making a shared object; recompile with -fPIC
> | drivers/gpu/drm/drm_fbdev_shmem.c:192:(.text+0x54c): dangerous relocation: unsupported relocation
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.c:192: undefined reference to `drm_fb_helper_deferred_io'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.c:202: undefined reference to `drm_fb_helper_release_info'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o: in function `drm_fbdev_shmem_get_page':
> | drivers/gpu/drm/drm_fbdev_shmem.c:86: undefined reference to `drm_gem_fb_get_obj'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x38): undefined reference to `drm_fb_helper_check_var'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x40): undefined reference to `drm_fb_helper_set_par'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x50): undefined reference to `drm_fb_helper_setcmap'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x58): undefined reference to `drm_fb_helper_blank'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x60): undefined reference to `drm_fb_helper_pan_display'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0x90): undefined reference to `drm_fb_helper_ioctl'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0xb8): undefined reference to `drm_fb_helper_debug_enter'
> | aarch64-linux-gnu-ld: drivers/gpu/drm/drm_fbdev_shmem.o:(.rodata+0xc0): undefined reference to `drm_fb_helper_debug_leave'
>
> regards,
> Marc
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

