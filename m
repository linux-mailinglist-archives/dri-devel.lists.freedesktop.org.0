Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BAA85577
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 09:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA48E10EB1B;
	Fri, 11 Apr 2025 07:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Uh61Qopc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vb8lMEFJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pmspsa0t";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N4ukjotT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2881210EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 07:30:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B62F8210F9;
 Fri, 11 Apr 2025 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744356601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oy36hPamqwxY2/lHeuv3BqfzxQ1sz7Y3Jtmy6czp4ws=;
 b=Uh61Qopc3vyT2wCct4RHX0sckROW2Q3piAt/IoZMFgWw+2ePKmJfoqUXC5bEbkuRri6wAV
 jJZTDcDxV/+rYM60eRCrgoOl1zozJtXXmNLs2eX6WqpsRgsNZlJxmMJuHPFQsMJGB+s3Ph
 gxHW7zLpd3yn3IQgwgm5Sr7M1Sj9UFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744356601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oy36hPamqwxY2/lHeuv3BqfzxQ1sz7Y3Jtmy6czp4ws=;
 b=vb8lMEFJr/OaxyvLmyS7HjtFa6O3KZGQbLRyO7ILe+zX/TIMF8zI/C1jMMydh5G1Q93NtQ
 zh3zpa/DkvYcXSCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744356600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oy36hPamqwxY2/lHeuv3BqfzxQ1sz7Y3Jtmy6czp4ws=;
 b=Pmspsa0tFfMRSSvasT9cqOdZTo6g+jb8s1EJMwPABnVwTTtHAcqxIbnEy0Umjzo3xKSJ9J
 OLY6NWy3FNHOvdk6wZv0Ga5L8uwX75vEQylqWwZot3nsTjoKDlJs4XBo5hgPObL/2R6DsY
 p0fw3KIAGx1PmYZ2WDRpbkT+/LYGbVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744356600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Oy36hPamqwxY2/lHeuv3BqfzxQ1sz7Y3Jtmy6czp4ws=;
 b=N4ukjotT3xRkRCQ/xnVxxkXrmW2NkVb5Sjen7lsVwjikT0mSrdcaAaWxX1hts8EJooGXQ8
 P1YD3JDRN876yMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9681613886;
 Fri, 11 Apr 2025 07:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JxhmI/jE+Gf1AgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Apr 2025 07:30:00 +0000
Message-ID: <588bf468-f5c6-41d4-9b63-c698342712be@suse.de>
Date: Fri, 11 Apr 2025 09:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] drm: Eliminate redundant drm_format_info lookups
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email, intel.com:email,
 imap1.dmz-prg2.suse.org:helo]
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

a really nice cleanup. With the various comments fixed, you can add

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

to the series.

Best regards
Thomas

Am 10.04.25 um 18:31 schrieb Ville Syrjala:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> I noticed a bunch of redundant (and rather expensive) drm_format_info
> lookups in some traces recently. This series is an attempt to eliminate
> them.
>
> Ville Syrjälä (19):
>    drm: Pass pixel_format+modifier to .get_format_info()
>    drm: Pass pixel_format+modifier directly to drm_get_format_info()
>    drm: Look up the format info earlier
>    drm: Pass the format info to .fb_create()
>    drm: Allow the caller to pass in the format info to
>      drm_helper_mode_fill_fb_struct()
>    drm/malidp: Pass along the format info from .fb_create()
>      malidp_verify_afbc_framebuffer_size()
>    drm/gem: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/gem/afbc: Eliminate redundant drm_get_format_info()
>    drm/amdgpu: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/armada: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/exynos: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/gma500: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/i915: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/komeda: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/msm: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/tegra: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/virtio: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm/vmwgfx: Pass along the format info from .fb_create() to
>      drm_helper_mode_fill_fb_struct()
>    drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
>      mandatory
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  1 +
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
>   .../arm/display/komeda/komeda_framebuffer.c   |  3 +-
>   .../arm/display/komeda/komeda_framebuffer.h   |  1 +
>   drivers/gpu/drm/arm/malidp_drv.c              | 12 +++---
>   drivers/gpu/drm/armada/armada_fb.c            | 12 +++---
>   drivers/gpu/drm/armada/armada_fb.h            |  4 +-
>   drivers/gpu/drm/armada/armada_fbdev.c         |  5 ++-
>   drivers/gpu/drm/drm_fourcc.c                  |  7 ++--
>   drivers/gpu/drm/drm_framebuffer.c             | 27 ++++++-------
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 38 ++++++++-----------
>   drivers/gpu/drm/drm_modeset_helper.c          |  4 +-
>   drivers/gpu/drm/exynos/exynos_drm_fb.c        |  7 ++--
>   drivers/gpu/drm/exynos/exynos_drm_fb.h        |  1 +
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  5 ++-
>   drivers/gpu/drm/gma500/fbdev.c                |  5 ++-
>   drivers/gpu/drm/gma500/framebuffer.c          | 14 ++++---
>   drivers/gpu/drm/gma500/psb_drv.h              |  1 +
>   drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++++----
>   drivers/gpu/drm/i915/display/intel_fb.h       |  5 ++-
>   drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 ++-
>   .../drm/i915/display/intel_plane_initial.c    |  3 +-
>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 ++-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
>   drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
>   drivers/gpu/drm/msm/msm_fb.c                  | 18 +++++----
>   drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  9 +----
>   drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
>   drivers/gpu/drm/nouveau/nouveau_display.h     |  1 +
>   drivers/gpu/drm/omapdrm/omap_fb.c             | 10 ++---
>   drivers/gpu/drm/omapdrm/omap_fb.h             |  3 +-
>   drivers/gpu/drm/qxl/qxl_display.c             |  3 +-
>   drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
>   drivers/gpu/drm/radeon/radeon_fbdev.c         |  3 +-
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  3 +-
>   drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 +-
>   .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  3 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 11 ++----
>   drivers/gpu/drm/tegra/drm.h                   |  2 +
>   drivers/gpu/drm/tegra/fb.c                    |  7 ++--
>   drivers/gpu/drm/tegra/fbdev.c                 |  4 +-
>   drivers/gpu/drm/tests/drm_framebuffer_test.c  |  1 +
>   drivers/gpu/drm/vc4/vc4_kms.c                 |  3 +-
>   drivers/gpu/drm/virtio/virtgpu_display.c      |  6 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  1 +
>   drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  6 ++-
>   drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
>   drivers/gpu/drm/xen/xen_drm_front_kms.c       |  3 +-
>   drivers/gpu/drm/xlnx/zynqmp_kms.c             |  3 +-
>   include/drm/drm_fourcc.h                      |  2 +-
>   include/drm/drm_gem_framebuffer_helper.h      |  6 +++
>   include/drm/drm_mode_config.h                 |  3 +-
>   include/drm/drm_modeset_helper.h              |  2 +
>   56 files changed, 207 insertions(+), 139 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

