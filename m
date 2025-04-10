Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EDA84AF4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 19:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA4A10E36C;
	Thu, 10 Apr 2025 17:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dNPjhv3a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sTUjbzk1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dNPjhv3a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sTUjbzk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9A410E36C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 17:27:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B13821169;
 Thu, 10 Apr 2025 17:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744306036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BB9GTg+HH7iwp7nl83ae7Eb8vEX3mmd0yH+rpDEshb4=;
 b=dNPjhv3aZOG3DJqBpHIHW27jZ/0qM7lnzhecsl+cPy/1qlInJ78kkLLw+7GSlRCM0s8EMS
 bBg+5GYzwv1miXppAEIM0CrcTkIknFQFnvZD0r1PEpWgvaNNRxvLrFMzm+INpMgM+AXIZ6
 pMPlbIP8KND8aQagqZAUN4P7a0D3+bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744306036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BB9GTg+HH7iwp7nl83ae7Eb8vEX3mmd0yH+rpDEshb4=;
 b=sTUjbzk1XYEST2AiAjGLAzXkSFwufMKwxlvKu+4wvRX+hDot6Y3yjTCbp6CINnd5JH0NbL
 fViuD4Vj2H67qQDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744306036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BB9GTg+HH7iwp7nl83ae7Eb8vEX3mmd0yH+rpDEshb4=;
 b=dNPjhv3aZOG3DJqBpHIHW27jZ/0qM7lnzhecsl+cPy/1qlInJ78kkLLw+7GSlRCM0s8EMS
 bBg+5GYzwv1miXppAEIM0CrcTkIknFQFnvZD0r1PEpWgvaNNRxvLrFMzm+INpMgM+AXIZ6
 pMPlbIP8KND8aQagqZAUN4P7a0D3+bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744306036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BB9GTg+HH7iwp7nl83ae7Eb8vEX3mmd0yH+rpDEshb4=;
 b=sTUjbzk1XYEST2AiAjGLAzXkSFwufMKwxlvKu+4wvRX+hDot6Y3yjTCbp6CINnd5JH0NbL
 fViuD4Vj2H67qQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE16013886;
 Thu, 10 Apr 2025 17:27:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id X5gGOHP/92eCNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 17:27:15 +0000
Message-ID: <b4d3e478-d2f5-40b8-98ac-5aed1dc785d5@suse.de>
Date: Thu, 10 Apr 2025 19:27:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] drm: Do not use import_attach in drivers
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20250317131923.238374-1-tzimmermann@suse.de>
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
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.995]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
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

Ping for additional reviews of this series.

Am 17.03.25 um 14:06 schrieb Thomas Zimmermann:
> Avoid struct drm_gem_object.import_attach in many DRM drivers that
> use it to get the object's dma-buf or test for an imported buffer.
>
> The helper drm_gem_is_imported() tests if a GEM object's buffer
> has been imported into the driver. The corresponding dma-buf is
> referenced by the object itself. Both cases avoid import_attach.
>
> The import_attach field in struct drm_gem_object is an artifact of
> the import process, but should not be used otherwise. This series
> fixes most of the drivers in the DRM misc tree. Other DRM drivers
> can be converted when drm_gem_is_imported() becomes available in
> their tree.
>
> Thomas Zimmermann (15):
>    drm/armada: Test for imported buffers with drm_gem_is_imported()
>    drm/etnaviv: Test for imported buffers with drm_gem_is_imported()
>    drm/etnaviv: Use dma_buf from GEM object instance
>    drm/exynos: Test for imported buffers with drm_gem_is_imported()
>    drm/gud: Test for imported buffers with drm_gem_is_imported()
>    drm/msm: Test for imported buffers with drm_gem_is_imported()
>    drm/omapdrm: Test for imported buffers with drm_gem_is_imported()
>    drm/panfrost: Test for imported buffers with drm_gem_is_imported()
>    drm/panthor: Test for imported buffers with drm_gem_is_imported()
>    drm/rockchip: Test for imported buffers with drm_gem_is_imported()
>    drm/vc4: Test for imported buffers with drm_gem_is_imported()
>    drm/virtio: Test for imported buffers with drm_gem_is_imported()
>    drm/vmwgfx: Test for imported buffers with drm_gem_is_imported()
>    drm/vmwgfx: Use dma_buf from GEM object instance
>    drm/xen: Test for imported buffers with drm_gem_is_imported()
>
>   drivers/gpu/drm/armada/armada_fb.c          |  2 +-
>   drivers/gpu/drm/armada/armada_gem.c         |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  8 ++++----
>   drivers/gpu/drm/exynos/exynos_drm_gem.c     |  4 ++--
>   drivers/gpu/drm/gud/gud_pipe.c              |  2 +-
>   drivers/gpu/drm/msm/msm_drv.c               |  2 +-
>   drivers/gpu/drm/msm/msm_gem.c               |  4 ++--
>   drivers/gpu/drm/msm/msm_gem.h               |  2 +-
>   drivers/gpu/drm/msm/msm_gem_prime.c         |  4 ++--
>   drivers/gpu/drm/omapdrm/omap_gem.c          |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_gem.c     |  2 +-
>   drivers/gpu/drm/panthor/panthor_gem.c       |  2 +-
>   drivers/gpu/drm/panthor/panthor_mmu.c       | 10 +++++-----
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  2 +-
>   drivers/gpu/drm/vc4/vc4_bo.c                |  2 +-
>   drivers/gpu/drm/vc4/vc4_gem.c               |  2 +-
>   drivers/gpu/drm/virtio/virtgpu_plane.c      |  8 ++++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_blit.c        |  4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c         | 12 ++++++------
>   drivers/gpu/drm/xen/xen_drm_front_gem.c     |  2 +-
>   20 files changed, 39 insertions(+), 39 deletions(-)
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

