Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF34E874A28
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF2210F2B9;
	Thu,  7 Mar 2024 08:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YZU4zvU6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="db0e9Q/I";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YZU4zvU6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="db0e9Q/I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178CD10F2B9;
 Thu,  7 Mar 2024 08:55:15 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 517F45D5D2;
 Thu,  7 Mar 2024 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709801714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PZ9c0Y9KDpByaYyZMHWV1UaYrjKmfVpJwDP5oLSqqyY=;
 b=YZU4zvU6tAYjWrvaBHZFCz/ErnpxjZ2aFyOassizaMBRSY9WU0F1C3elPfsebDY290XYP7
 121ggd/oemFgfWHaYMrkOey0Os7YMmyUUyJpq5J2aH6Lhe69vx3j3nr0r8eSFbQ3EPzIuF
 +0Halb/c/cwG8EF3eXrHIMyiOtUGi0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709801714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PZ9c0Y9KDpByaYyZMHWV1UaYrjKmfVpJwDP5oLSqqyY=;
 b=db0e9Q/IyCS0ZEtZNQsUbt85I8GDmGZGS8e7Ax6LH6JCDMARcma+wUkCMi1V8n23iJkRYs
 SXCq1ElgWHLrtrDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709801714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PZ9c0Y9KDpByaYyZMHWV1UaYrjKmfVpJwDP5oLSqqyY=;
 b=YZU4zvU6tAYjWrvaBHZFCz/ErnpxjZ2aFyOassizaMBRSY9WU0F1C3elPfsebDY290XYP7
 121ggd/oemFgfWHaYMrkOey0Os7YMmyUUyJpq5J2aH6Lhe69vx3j3nr0r8eSFbQ3EPzIuF
 +0Halb/c/cwG8EF3eXrHIMyiOtUGi0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709801714;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PZ9c0Y9KDpByaYyZMHWV1UaYrjKmfVpJwDP5oLSqqyY=;
 b=db0e9Q/IyCS0ZEtZNQsUbt85I8GDmGZGS8e7Ax6LH6JCDMARcma+wUkCMi1V8n23iJkRYs
 SXCq1ElgWHLrtrDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1029A13997;
 Thu,  7 Mar 2024 08:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id RVSLAvKA6WW4EwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Mar 2024 08:55:14 +0000
Message-ID: <5642828f-28a5-4f79-a96f-5ca4411163c7@suse.de>
Date: Thu, 7 Mar 2024 09:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] drm: fix headers, add header test facility
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
References: <cover.1709749576.git.jani.nikula@intel.com>
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
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-3.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 URIBL_BLOCKED(0.00)[suse.de:email,intel.com:email,ffwll.ch:email];
 BAYES_HAM(-3.00)[100.00%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -3.09
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

Am 06.03.24 um 19:31 schrieb Jani Nikula:
> First, fix a bunch of issues in drm headers, uncovered with the last
> patch. A few kernel-doc warnings are just brushed under the carpet for
> now, with a FIXME comment. Otherwise, pretty straightforward stuff.

Nice, thanks a lot. For the FIXME comments, maybe maintainers can 
provide the docs to include in your patchset. But that wouldn't be a 
blocker IMHO. The /* private: */ comments make kernel-doc ignore the 
rest of the structure, right?

With the required fixes applied, for patches 1 to 14:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

For patches 15 to 22:

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>
> Second, add a header test facility to catch issues at build time when
> CONFIG_DRM_HEADER_TEST=y. This is the last patch, and I think needs
> Masahiro's ack.
>
> BR,
> Jani.
>
>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
>
> Jani Nikula (22):
>    drm/crtc: make drm_crtc_internal.h self-contained
>    drm: add missing header guards to drm_internal.h
>    drm/kunit: fix drm_kunit_helpers.h kernel-doc
>    drm/amdgpu: make amd_asic_type.h self-contained
>    drm: bridge: samsung-dsim: make samsung-dsim.h self-contained
>    drm/dp_mst: fix drm_dp_mst_helper.h kernel-doc
>    drm/crc: make drm_debugfs_crc.h self-contained and fix kernel-doc
>    drm/encoder: silence drm_encoder_slave.h kernel-doc
>    drm: fix drm_format_helper.h kernel-doc warnings
>    drm/lease: make drm_lease.h self-contained
>    drm: fix drm_gem_vram_helper.h kernel-doc
>    drm/of: make drm_of.h self-contained
>    drm/i2c: silence ch7006.h and sil164.h kernel-doc warnings
>    drm/suballoc: fix drm_suballoc.h kernel-doc
>    drm/i915: fix i915_gsc_proxy_mei_interface.h kernel-doc
>    drm/i915/hdcp: fix i915_hdcp_interface.h kernel-doc warnings
>    drm/i915/pxp: fix i915_pxp_tee_interface.h kernel-doc warnings
>    drm/ttm: fix ttm_bo.h kernel-doc warnings
>    drm/ttm: make ttm_caching.h self-contained
>    drm/ttm: fix ttm_execbuf_util.h kernel-doc warnings
>    drm/ttm: fix ttm_kmap_iter.h kernel-doc warnings
>    drm: ensure drm headers are self-contained and pass kernel-doc
>
>   Kbuild                                     |  1 +
>   drivers/gpu/drm/Kconfig                    | 11 +++++++++++
>   drivers/gpu/drm/Makefile                   | 18 ++++++++++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h        |  1 +
>   drivers/gpu/drm/drm_internal.h             |  5 +++++
>   include/Kbuild                             |  1 +
>   include/drm/Makefile                       | 18 ++++++++++++++++++
>   include/drm/amd_asic_type.h                |  3 +++
>   include/drm/bridge/samsung-dsim.h          |  4 +++-
>   include/drm/display/drm_dp_mst_helper.h    |  1 -
>   include/drm/drm_debugfs_crc.h              |  8 +++++++-
>   include/drm/drm_encoder_slave.h            |  3 +++
>   include/drm/drm_format_helper.h            |  1 +
>   include/drm/drm_gem_vram_helper.h          |  1 -
>   include/drm/drm_kunit_helpers.h            |  2 +-
>   include/drm/drm_lease.h                    |  2 ++
>   include/drm/drm_of.h                       |  1 +
>   include/drm/drm_suballoc.h                 |  2 +-
>   include/drm/i2c/ch7006.h                   |  1 +
>   include/drm/i2c/sil164.h                   |  1 +
>   include/drm/i915_gsc_proxy_mei_interface.h |  4 ++--
>   include/drm/i915_hdcp_interface.h          | 18 +++++++++++++-----
>   include/drm/i915_pxp_tee_interface.h       | 19 ++++++++++++-------
>   include/drm/ttm/ttm_bo.h                   | 18 ++++++++++++------
>   include/drm/ttm/ttm_caching.h              |  2 ++
>   include/drm/ttm/ttm_execbuf_util.h         |  7 +++----
>   include/drm/ttm/ttm_kmap_iter.h            |  4 ++--
>   27 files changed, 125 insertions(+), 32 deletions(-)
>   create mode 100644 include/Kbuild
>   create mode 100644 include/drm/Makefile
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

