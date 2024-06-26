Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD719184CA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2639E10E8F3;
	Wed, 26 Jun 2024 14:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="N0Gx2aSz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3hBBYi4f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N0Gx2aSz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3hBBYi4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5F110E8F3;
 Wed, 26 Jun 2024 14:47:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E4AB21AD7;
 Wed, 26 Jun 2024 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719413258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PkWA3MsRGi3T+cNj4hEYTl9G6TDSXQiurGbxWqcbyKs=;
 b=N0Gx2aSzoeaCd3AGuxbzVitqhnTect+Ci3IylSzSTd9YTv9PkYGS68KEMM+BBGZea+Qcpr
 DYPoP83cdnIKUPKz0sPi4frZAJFLopVQOqx5qwL/U/xlLm7VK28R7ntpAjRPoulVs/dCKt
 xFMS6tU60vVC0vmF+F29xF7EWDgKpwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719413258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PkWA3MsRGi3T+cNj4hEYTl9G6TDSXQiurGbxWqcbyKs=;
 b=3hBBYi4fN1/etat3RA4RKTEQWKAU3BAM8xG2Ak7R2r6kxhCrN/Oj9254gSe3etR/h9zkmj
 Z4K77ZD0nSgQtGAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719413258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PkWA3MsRGi3T+cNj4hEYTl9G6TDSXQiurGbxWqcbyKs=;
 b=N0Gx2aSzoeaCd3AGuxbzVitqhnTect+Ci3IylSzSTd9YTv9PkYGS68KEMM+BBGZea+Qcpr
 DYPoP83cdnIKUPKz0sPi4frZAJFLopVQOqx5qwL/U/xlLm7VK28R7ntpAjRPoulVs/dCKt
 xFMS6tU60vVC0vmF+F29xF7EWDgKpwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719413258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PkWA3MsRGi3T+cNj4hEYTl9G6TDSXQiurGbxWqcbyKs=;
 b=3hBBYi4fN1/etat3RA4RKTEQWKAU3BAM8xG2Ak7R2r6kxhCrN/Oj9254gSe3etR/h9zkmj
 Z4K77ZD0nSgQtGAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64963139C2;
 Wed, 26 Jun 2024 14:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LmgoFwoqfGanWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jun 2024 14:47:38 +0000
Message-ID: <3c627f1d-ab9e-480f-8f42-91a108477c24@suse.de>
Date: Wed, 26 Jun 2024 16:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] drm/radeon: remove load callback
To: Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240624151122.23724-1-wuhoipok@gmail.com>
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
In-Reply-To: <20240624151122.23724-1-wuhoipok@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.29 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[9]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
 MID_RHS_MATCH_FROM(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.29
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

Am 24.06.24 um 17:10 schrieb Wu Hoi Pok:
> Changes between v1 and v3:
>
> 1. add "ddev->dev_private = rdev;"
> 2. include a cover letter

A cover letter should briefly say what the patchset is about.

BTW it's not clear to me why you need to modify radeon_dev.dev for 
removing the load callback. It seems it's a separate issue.

Best regards
Thomas


>
> Wu Hoi Pok (7):
>    drm/radeon: remove load callback
>    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 1
>    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 2
>    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 3
>    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 4
>    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 5
>    drm/radeon: rdev->ddev to rdev_to_drm(rdev) 6
>
>   drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
>   drivers/gpu/drm/radeon/cik.c               | 14 ++--
>   drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
>   drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
>   drivers/gpu/drm/radeon/ni.c                |  2 +-
>   drivers/gpu/drm/radeon/r100.c              | 24 +++----
>   drivers/gpu/drm/radeon/r300.c              |  6 +-
>   drivers/gpu/drm/radeon/r420.c              |  6 +-
>   drivers/gpu/drm/radeon/r520.c              |  2 +-
>   drivers/gpu/drm/radeon/r600.c              | 12 ++--
>   drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
>   drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
>   drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
>   drivers/gpu/drm/radeon/radeon.h            | 11 +++-
>   drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
>   drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
>   drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
>   drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
>   drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
>   drivers/gpu/drm/radeon/radeon_device.c     | 19 ++----
>   drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++-----------
>   drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
>   drivers/gpu/drm/radeon/radeon_drv.h        |  1 -
>   drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
>   drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
>   drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
>   drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
>   drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
>   drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
>   drivers/gpu/drm/radeon/radeon_kms.c        | 18 ++----
>   drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
>   drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
>   drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
>   drivers/gpu/drm/radeon/rs400.c             |  6 +-
>   drivers/gpu/drm/radeon/rs600.c             | 14 ++--
>   drivers/gpu/drm/radeon/rs690.c             |  2 +-
>   drivers/gpu/drm/radeon/rv515.c             |  4 +-
>   drivers/gpu/drm/radeon/rv770.c             |  2 +-
>   drivers/gpu/drm/radeon/si.c                |  4 +-
>   40 files changed, 193 insertions(+), 191 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

