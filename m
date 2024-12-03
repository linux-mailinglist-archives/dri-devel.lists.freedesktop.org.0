Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD009E163B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C95810E981;
	Tue,  3 Dec 2024 08:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pelGDcAb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uWum2Cy0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pelGDcAb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uWum2Cy0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014EB10E981
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:50:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B60D71F445;
 Tue,  3 Dec 2024 08:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733215815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mBT5IV89AGbz0aQsqk0A7Zq59D46Jh1euDz8NBbLLj8=;
 b=pelGDcAb/Cs2RdjeL8ajcG9lS53We/7px13J9kBakISk2ynBPneUn6ZgzrEjNcledsz88u
 7WUTxJAg6Rwpkw3vxGp33CT07GDJ2DeIlAZ77jvT4PNMT7Te/UvsnhEXyRIvWpLZmpI6ea
 HG16W5Ii7ry0NMhLLOycp3goDPxOGpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733215815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mBT5IV89AGbz0aQsqk0A7Zq59D46Jh1euDz8NBbLLj8=;
 b=uWum2Cy0J1w2DXFabttWRg83tIfc5EZjLADcXH7enVisqWJOIQ5uGEG9Y6EjDqwpbvS8Qu
 0a3zG/wdNk90bXCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1733215815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mBT5IV89AGbz0aQsqk0A7Zq59D46Jh1euDz8NBbLLj8=;
 b=pelGDcAb/Cs2RdjeL8ajcG9lS53We/7px13J9kBakISk2ynBPneUn6ZgzrEjNcledsz88u
 7WUTxJAg6Rwpkw3vxGp33CT07GDJ2DeIlAZ77jvT4PNMT7Te/UvsnhEXyRIvWpLZmpI6ea
 HG16W5Ii7ry0NMhLLOycp3goDPxOGpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1733215815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mBT5IV89AGbz0aQsqk0A7Zq59D46Jh1euDz8NBbLLj8=;
 b=uWum2Cy0J1w2DXFabttWRg83tIfc5EZjLADcXH7enVisqWJOIQ5uGEG9Y6EjDqwpbvS8Qu
 0a3zG/wdNk90bXCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59E62139C2;
 Tue,  3 Dec 2024 08:50:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6IGEFEfGTmdPQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Dec 2024 08:50:15 +0000
Message-ID: <05521cf8-0ac2-412e-873d-6e25eac5f53c@suse.de>
Date: Tue, 3 Dec 2024 09:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241115142950.1758007-1-jfalempe@redhat.com>
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
In-Reply-To: <20241115142950.1758007-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,linutronix.de,igalia.com,verizon.net,linaro.org,suse.com,lists.freedesktop.org,vger.kernel.org];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_RHS_MATCH_FROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
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

Hi


Am 15.11.24 um 14:40 schrieb Jocelyn Falempe:
> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> This is not a full replacement to fbcon, as it will only print the kmsg.
> It will never handle user input, or a terminal because this is better done in userspace.
>
> If you're curious on how it looks like, I've put a small demo here:
> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>
> Design decisions:
>    * It uses the drm_client API, so it should work on all drm drivers from the start.
>    * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>      It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>    * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>   
> v2:
>   * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
>   * Stop drawing when the drm_master is taken. This avoid wasting CPU cycle if the buffer is not visible.
>   * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
>   * Add color support for the timestamp prefix, like what dmesg does.
>   * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.
>
> v3:
>   * Remove the work thread and circular buffer, and use the new write_thread() console API.
>   * Register a console for each drm driver.
>
> v4:
>   * Can be built as a module, even if that's not really useful.
>   * Rebased on top of "drm: Introduce DRM client library" series from Thomas Zimmermann.
>   * Add a Kconfig menu to choose between drm client.
>   * Add suspend/resume callbacks.
>   * Add integer scaling support.
>   
> v5:
>   * Build drm_log in drm_client_lib module, to avoid circular dependency.
>   * Export drm_draw symbols, so they can be used if drm_client_lib is built as module.
>   * Change scale parameter to unsigned int (Jani Nikula)
>
> v6:
>   * Use console_stop() and console_start() in the suspend/resume callback (Petr Mladek).
>   * rebase and solve conflict with "drm/panic: Add ABGR2101010 support"
>
> v7:
>   * Add a patch fix a build issue due to missing DRM_CLIENT_LIB, reported by kernel test bot.
>
> v8:
>   * Rebased after drm client moved to drivers/gpu/drm/clients/
>   * Rename DRM_LOG to DRM_CLIENT_LOG (Thomas Zimmermann)
>   * Drop "Always select DRM_CLIENT_LIB", and select only if DRM_CLIENT_LOG is set
>   * Add an info message if no clients are initialized in drm_client_setup()
>
> Jocelyn Falempe (6):
>    drm/panic: Move drawing functions to drm_draw
>    drm/log: Introduce a new boot logger to draw the kmsg on the screen

I have a number of minor comments on this patch. For the rest of the series:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>


Best regards
Thomas

>    drm/log: Do not draw if drm_master is taken
>    drm/log: Color the timestamp, to improve readability
>    drm/log: Implement suspend/resume
>    drm/log: Add integer scaling support
>
>   drivers/gpu/drm/Kconfig                       |   5 +
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/clients/Kconfig               |  48 ++
>   drivers/gpu/drm/clients/Makefile              |   1 +
>   drivers/gpu/drm/clients/drm_client_internal.h |   6 +
>   drivers/gpu/drm/clients/drm_client_setup.c    |  29 +-
>   drivers/gpu/drm/clients/drm_log.c             | 420 ++++++++++++++++++
>   drivers/gpu/drm/drm_draw.c                    | 233 ++++++++++
>   drivers/gpu/drm/drm_draw.h                    |  56 +++
>   drivers/gpu/drm/drm_panic.c                   | 257 +----------
>   10 files changed, 818 insertions(+), 238 deletions(-)
>   create mode 100644 drivers/gpu/drm/clients/drm_log.c
>   create mode 100644 drivers/gpu/drm/drm_draw.c
>   create mode 100644 drivers/gpu/drm/drm_draw.h
>
>
> base-commit: 7d2faa8dbb7055a115fe0cd6068d7090094a573d

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

