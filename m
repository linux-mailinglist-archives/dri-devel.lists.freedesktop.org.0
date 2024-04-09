Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608389D46B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815F10E950;
	Tue,  9 Apr 2024 08:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="T0IuJlRT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NjRMCJeo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T0IuJlRT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NjRMCJeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FC810E950
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 08:33:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03F62338B9;
 Tue,  9 Apr 2024 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712651586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=787v//qZrKAJYvf2hIDtLJlLYCcU/FS9gtyn2Glvps8=;
 b=T0IuJlRTsjAxhvSJpPqXWBtzgp7CQlrNhnilKRVNcS507axgGYKpTr3uzZ6W9eCt+DvfH3
 Jm4yPXHma9AU/fqJBBShHSfFBLoXc7o9qYSPDHCBCOwfM9j0gkAF9GBE3o1WEPDLbuaAXi
 WMozmG76BfU84V7x/tK0HfAaDcY1UEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712651586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=787v//qZrKAJYvf2hIDtLJlLYCcU/FS9gtyn2Glvps8=;
 b=NjRMCJeou5qwSP4g8kiPp759oZ3mTMaxUM9DGazb2yRPIpIpcsh5MycXyZj5L44u/0NzYC
 PIlh1WLyyP5dziAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712651586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=787v//qZrKAJYvf2hIDtLJlLYCcU/FS9gtyn2Glvps8=;
 b=T0IuJlRTsjAxhvSJpPqXWBtzgp7CQlrNhnilKRVNcS507axgGYKpTr3uzZ6W9eCt+DvfH3
 Jm4yPXHma9AU/fqJBBShHSfFBLoXc7o9qYSPDHCBCOwfM9j0gkAF9GBE3o1WEPDLbuaAXi
 WMozmG76BfU84V7x/tK0HfAaDcY1UEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712651586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=787v//qZrKAJYvf2hIDtLJlLYCcU/FS9gtyn2Glvps8=;
 b=NjRMCJeou5qwSP4g8kiPp759oZ3mTMaxUM9DGazb2yRPIpIpcsh5MycXyZj5L44u/0NzYC
 PIlh1WLyyP5dziAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id AD91D13253;
 Tue,  9 Apr 2024 08:33:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id yHXsKEH9FGYQOgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Apr 2024 08:33:05 +0000
Message-ID: <dec96dc5-5c90-472d-b18a-ff5c5383a20d@suse.de>
Date: Tue, 9 Apr 2024 10:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/9] drm/panic: Add a drm panic handler
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com
References: <20240328120638.468738-1-jfalempe@redhat.com>
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
In-Reply-To: <20240328120638.468738-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org,linux.dev];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns]
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

Hi,

for patches 6, 7, and 9

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

Am 28.03.24 um 13:03 schrieb Jocelyn Falempe:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
>
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>
> It works with simpledrm, mgag200, ast, and imx.
>
> To test it, make sure you're using one of the supported driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
>
> or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0
>
> There were not many comments on v10, so I think we're close to something that can be merged.
> Even if this is not yet useful, it will allows to work on more driver support, and
> better debug information.
>
> v2:
>   * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>   * Add the panic reason to the panic message (Nerdopolis)
>   * Add an exclamation mark (Nerdopolis)
>   
> v3:
>   * Rework the drawing functions, to write the pixels line by line and
>   to use the drm conversion helper to support other formats.
>   (Thomas Zimmermann)
>   
> v4:
>   * Fully support all simpledrm formats using drm conversion helpers
>   * Rename dpanic_* to drm_panic_*, and have more coherent function name.
>     (Thomas Zimmermann)
>   * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>   * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>   * Add foreground/background color config option
>   * Fix the bottom lines not painted if the framebuffer height
>     is not a multiple of the font height.
>   * Automatically register the driver to drm_panic, if the function
>     get_scanout_buffer() exists. (Thomas Zimmermann)
>   * Add mgag200 support.
>   
> v5:
>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>     (Thomas Zimmermann)
>   * Also add drm_fb_fill() to fill area with background color.
>   * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>   * Add a flush() callback for drivers that needs to synchronize the buffer.
>   * Add a void *private field, so drivers can pass private data to
>     draw_pixel_xy() and flush().
>   * Add ast support.
>   * Add experimental imx/ipuv3 support, to test on an ARM hw. (Maxime Ripard)
>
> v6:
>   * Fix sparse and __le32 warnings
>   * Drop the IMX/IPUV3 experiment, it was just to show that it works also on
>     ARM devices.
>
> v7:
>   * Add a check to see if the 4cc format is supported by drm_panic.
>   * Add a drm/plane helper to loop over all visible primary buffer,
>     simplifying the get_scanout_buffer implementations
>   * Add a generic implementation for drivers that uses drm_fb_dma. (Maxime Ripard)
>   * Add back the IMX/IPUV3 support, and use the generic implementation. (Maxime Ripard)
>
> v8:
>   * Directly register each plane to the panic notifier (Sima)
>   * Replace get_scanout_buffer() with set_scanout_buffer() to simplify
>     the locking. (Thomas Zimmermann)
>   * Add a debugfs entry, to trigger the drm_panic without a real panic (Sima)
>   * Fix the drm_panic Documentation, and include it in drm-kms.rst
>
> v9:
>   * Revert to using get_scanout_buffer() (Sima)
>   * Move get_scanout_buffer() and panic_flush() to the plane helper
>     functions (Thomas Zimmermann)
>   * Register all planes with get_scanout_buffer() to the panic notifier
>   * Use drm_panic_lock() to protect against race (Sima)
>   * Create a debugfs file for each plane in the device's debugfs
>     directory. This allows to test for each plane of each GPU
>     independently.
> v10:
>   * Move blit and fill functions back in drm_panic (Thomas Zimmermann).
>   * Simplify the text drawing functions.
>   * Use kmsg_dumper instead of panic_notifier (Sima).
>   * Use spinlock_irqsave/restore (John Ogness)
>
> v11:
>   * Use macro instead of inline functions for drm_panic_lock/unlock (John Ogness)
>
>
> Best regards,
>
> Daniel Vetter (1):
>    drm/panic: Add drm panic locking
>
> Jocelyn Falempe (8):
>    drm/panic: Add a drm panic handler
>    drm/panic: Add support for color format conversion
>    drm/panic: Add debugfs entry to test without triggering panic.
>    drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
>    drm/simpledrm: Add drm_panic support
>    drm/mgag200: Add drm_panic support
>    drm/imx: Add drm_panic support
>    drm/ast: Add drm_panic support
>
>   Documentation/gpu/drm-kms.rst            |  12 +
>   drivers/gpu/drm/Kconfig                  |  32 ++
>   drivers/gpu/drm/Makefile                 |   1 +
>   drivers/gpu/drm/ast/ast_mode.c           |  18 +
>   drivers/gpu/drm/drm_atomic_helper.c      |   4 +
>   drivers/gpu/drm/drm_drv.c                |   5 +
>   drivers/gpu/drm/drm_fb_dma_helper.c      |  47 ++
>   drivers/gpu/drm/drm_panic.c              | 581 +++++++++++++++++++++++
>   drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c  |  11 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.h    |   7 +-
>   drivers/gpu/drm/mgag200/mgag200_mode.c   |  18 +
>   drivers/gpu/drm/tiny/simpledrm.c         |  16 +
>   include/drm/drm_fb_dma_helper.h          |   4 +
>   include/drm/drm_mode_config.h            |  10 +
>   include/drm/drm_modeset_helper_vtables.h |  37 ++
>   include/drm/drm_panic.h                  | 152 ++++++
>   include/drm/drm_plane.h                  |   6 +
>   17 files changed, 959 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_panic.c
>   create mode 100644 include/drm/drm_panic.h
>
>
> base-commit: 6376eb8b911534735fec104c1a0d780e4cf3116a

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

