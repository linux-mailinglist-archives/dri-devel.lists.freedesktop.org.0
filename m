Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8DC8DB87
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBEF10E7EC;
	Thu, 27 Nov 2025 10:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1eA2td5w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8vn7znc1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rp7bLQIq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X9glcilp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91A10E7D8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 10:18:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E59A65BCCE;
 Thu, 27 Nov 2025 10:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764238721; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0rByKwB3i5tQOEi/2sgQILFnrLbcJIVPfur1LgUAsyE=;
 b=1eA2td5wsVKN9h/lhgLGYBbs1VHCO1+O69Cn4B59p6kafEwON5gko/+XgKnVKU48rCO6D/
 hYLbxFBcOn7mVShzoR9eCQfsJSwRnuFib3QTyTLnfdrnu+5uQ43niGUyDOgE32+D330UYx
 cxw8mgaCL5tBmTMqwJIJcDlRB4jAQeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764238721;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0rByKwB3i5tQOEi/2sgQILFnrLbcJIVPfur1LgUAsyE=;
 b=8vn7znc1ZCsva0mBcryWKzZod6f3R94ij+EGQa1+5uvQhnEh8hPxKF8rCqZCYKeUUTPLDU
 i3GhzuJNrTSftPCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764238720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0rByKwB3i5tQOEi/2sgQILFnrLbcJIVPfur1LgUAsyE=;
 b=rp7bLQIqoMXcqsvn26CegxBBXdsWnTr+hkxHio3WbV0En6Rm/vi6ExpuVEg+hE149M/rhj
 k+23jGXNfrj1cARKGFppyqNcrxRJ+f7I1CjDrtTqaT2wMMjejKw62NySiQieGuYhUGoIWE
 YsqKc+8GjcpDEzrOIQpdXFeEfCWwu54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764238720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0rByKwB3i5tQOEi/2sgQILFnrLbcJIVPfur1LgUAsyE=;
 b=X9glcilpex+jr0X9YnA/L0uPP4d875+6XUbBQdF3FAGGRBZYjj3XtV98KqVHPIrqpIlWZh
 ZRT/kDSbS67ykWBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F20C3EA63;
 Thu, 27 Nov 2025 10:18:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /S6iJYAlKGmSFAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Nov 2025 10:18:40 +0000
Message-ID: <59c5a8a5-6d6e-4394-a3a3-9fa640ba849c@suse.de>
Date: Thu, 27 Nov 2025 11:18:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000
 soc chipset
To: Chu Guangqing <chuguangqing@inspur.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251014072421.4486-1-chuguangqing@inspur.com>
 <20251014072421.4486-2-chuguangqing@inspur.com>
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
In-Reply-To: <20251014072421.4486-2-chuguangqing@inspur.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[inspur.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[yaina.de:email, suse.com:url, yhgch.com:url,
 suse.de:mid, imap1.dmz-prg2.suse.org:helo, yhgch_driver.name:url]
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



Am 14.10.25 um 09:24 schrieb Chu Guangqing:
> add support for ZX1000 BMC soc chipset
>
> The ZX1000 (Z106) chip is a self-developed server management chip of the
> "Zhixin Series" by Yunhai Guochuang. It can monitor the operating status of
> servers in real time and perform various remote management operations on
> servers, including remote system installation, restart, power-on and
> power-off. It supports instruction sets of mainstream processor
> architectures such as X86, ARM, and LoongArch, with fully open firmware and
> software interfaces that are compatible with the third-party application
> ecosystem.
>
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>   MAINTAINERS                            |   6 +
>   drivers/gpu/drm/Kconfig                |   2 +
>   drivers/gpu/drm/Makefile               |   1 +
>   drivers/gpu/drm/yhgch/Kconfig          |  11 +
>   drivers/gpu/drm/yhgch/Makefile         |   4 +
>   drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 391 +++++++++++++++++++++++++
>   drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 309 +++++++++++++++++++
>   drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 ++++
>   drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 +++++++
>   drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 +++++++++++++
>   drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 137 +++++++++
>   11 files changed, 1234 insertions(+)
>   create mode 100644 drivers/gpu/drm/yhgch/Kconfig
>   create mode 100644 drivers/gpu/drm/yhgch/Makefile
>   create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_de.c
>   create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.c
>   create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.h
>   create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
>   create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_regs.h
>   create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 520fb4e379a3..76c7e52a3ccb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27781,6 +27781,12 @@ S:	Maintained
>   F:	Documentation/input/devices/yealink.rst
>   F:	drivers/input/misc/yealink.*
>   
> +YHGCH DRM DRIVER
> +M:	Chu Guangqing <chuguangqing@inspur.com>
> +S:	Maintained
> +W:	https://www.yhgch.com
> +F:	drivers/gpu/drm/yhgch
> +
>   Z8530 DRIVER FOR AX.25
>   M:	Joerg Reuter <jreuter@yaina.de>
>   L:	linux-hams@vger.kernel.org
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f7ea8e895c0c..8e0b1d12c81f 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
>   
>   source "drivers/gpu/drm/imagination/Kconfig"
>   
> +source "drivers/gpu/drm/yhgch/Kconfig"
> +
>   config DRM_HYPERV
>   	tristate "DRM Support for Hyper-V synthetic video device"
>   	depends on DRM && PCI && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4dafbdc8f86a..f344e0173b29 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -231,6 +231,7 @@ obj-y			+= solomon/
>   obj-$(CONFIG_DRM_SPRD) += sprd/
>   obj-$(CONFIG_DRM_LOONGSON) += loongson/
>   obj-$(CONFIG_DRM_POWERVR) += imagination/
> +obj-$(CONFIG_DRM_YHGCH)  += yhgch/
>   
>   # Ensure drm headers are self-contained and pass kernel-doc
>   hdrtest-files := \
> diff --git a/drivers/gpu/drm/yhgch/Kconfig b/drivers/gpu/drm/yhgch/Kconfig
> new file mode 100644
> index 000000000000..887cb66aa305
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/Kconfig
> @@ -0,0 +1,11 @@
> +config DRM_YHGCH
> +    tristate "DRM Support for YHGCH BMC"
> +    depends on DRM && PCI && MMU
> +    select DRM_CLIENT_SELECTION
> +    select DRM_KMS_HELPER
> +    select DRM_GEM_SHMEM_HELPER
> +    help
> +        Choose this option if you have a YHGCH ZX1000 chipset.
> +        If M is selected the module will be called yhgch-drm.
> +        IF Y is selected the module will be built into the kernel.
> +        IF N is selected the module will be excluded from the kernel.
> diff --git a/drivers/gpu/drm/yhgch/Makefile b/drivers/gpu/drm/yhgch/Makefile
> new file mode 100644
> index 000000000000..30de2fd27f18
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/Makefile
> @@ -0,0 +1,4 @@
> +yhgch-drm-y := yhgch_drm_drv.o yhgch_drm_de.o yhgch_drm_vdac.o yhgch_drm_i2c.o
> +
> +obj-$(CONFIG_DRM_YHGCH) += yhgch-drm.o
> +
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_de.c b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> new file mode 100644
> index 000000000000..333b42d32907
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_de.c
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/delay.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_fourcc.h>
> +
> +#include <drm/drm_vblank.h>

Alphabetical sorting please.

> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +struct yhgch_dislay_pll_config {
> +	u64 hdisplay;
> +	u64 vdisplay;
> +	u32 pll1_config_value;
> +	u32 pll2_config_value;
> +};
> +
> +static const struct yhgch_dislay_pll_config yhgch_pll_table[] = {
> +	{ 640, 480, CRT_PLL1_NS_25MHZ, CRT_PLL2_NS_25MHZ },
> +	{ 800, 600, CRT_PLL1_NS_40MHZ, CRT_PLL2_NS_40MHZ },
> +	{ 1024, 768, CRT_PLL1_NS_65MHZ, CRT_PLL2_NS_65MHZ },
> +	{ 1280, 1024, CRT_PLL1_NS_108MHZ, CRT_PLL2_NS_108MHZ },
> +	{ 1920, 1080, CRT_PLL1_NS_148MHZ, CRT_PLL2_NS_148MHZ },
> +};
> +
> +static int yhgch_plane_atomic_check(struct drm_plane *plane,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> +										 plane);
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +
> +	if (!new_plane_state->visible)
> +		return 0;

Please remove this test for visibility. Visibility is determined by the 
call to drm_atomic_helper_check_plane_state(). Calling this helper is 
mandatory IIRC.
> +
> +	if (new_plane_state->crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, true);
> +}
> +
> +static void yhgch_handle_damage(void __iomem *addr_base, struct iosys_map *src,
> +				struct drm_framebuffer *fb,
> +				struct drm_rect *clip)
> +{
> +	struct iosys_map dst;
> +
> +	iosys_map_set_vaddr_iomem(&dst, addr_base);
> +	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
> +	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> +}
> +
> +static void yhgch_plane_atomic_update(struct drm_plane *plane,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(plane->dev);
> +	struct drm_atomic_helper_damage_iter iter;
> +	struct drm_rect damage;
> +	u32 reg;
> +	s64 gpu_addr = 0;
> +	u32 line_l;
> +
> +	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
> +	drm_atomic_for_each_plane_damage(&iter, &damage) {
> +		yhgch_handle_damage(priv->vram_base, shadow_plane_state->data, fb, &damage);
> +	}

If your device imported the GEM buffer object from another device, you 
need to tell that device when you're accessing the buffer. Wrapping this 
loop in drm_gem_fb_begin_cpu_access() and _end_cpu_access() will do 
that. See [1] for a pattern to adopt. Otherwise, you might see incorrect 
output.

[1] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-11-14/drivers/gpu/drm/ast/ast_mode.c#L561

> +
> +	fb->pitches[0] = (fb->pitches[0] + 15) & ~15;

Never (!) write fb->pitches by yourself.

 From this code, it appears that your pitch needs to be aligned to 16 
bytes. You need to set this when you allocate the buffer. See my comment 
on yhgch_dumb_create() below.

> +
> +	writel(gpu_addr, priv->mmio + YHGCH_CRT_FB_ADDRESS);
> +
> +	reg = fb->width * fb->format->cpp[0];

cpp is deprecated. Please use

reg = drm_format_info_min_pitch(fb->format, 0, fb->width)


> +
> +	line_l = fb->pitches[0];

> +	writel(FIELD_PREP(YHGCH_CRT_FB_WIDTH_WIDTH_MASK, reg) |
> +	       FIELD_PREP(YHGCH_CRT_FB_WIDTH_OFFS_MASK, line_l),
> +	       priv->mmio + YHGCH_CRT_FB_WIDTH);
> +
> +	/* SET PIXEL FORMAT */
> +	reg = readl(priv->mmio + YHGCH_CRT_DISP_CTL);
> +	reg &= ~YHGCH_CRT_DISP_CTL_FORMAT_MASK;
> +	reg |= FIELD_PREP(YHGCH_CRT_DISP_CTL_FORMAT_MASK,
> +			   fb->format->cpp[0] * 8 / 16);
> +	writel(reg, priv->mmio + YHGCH_CRT_DISP_CTL);
> +}
> +
> +static const u32 channel_formats1[] = {
> +	DRM_FORMAT_RGB565, DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XRGB8888,
> +};

One format per line. RGB888 should really go last here.  User space will 
pick the formats from top to bottom, but usually doesn't support RGB888 
well.

> +
> +static struct drm_plane_funcs yhgch_plane_funcs = {
> +	.update_plane = drm_atomic_helper_update_plane,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.destroy = drm_plane_cleanup,
> +	DRM_GEM_SHADOW_PLANE_FUNCS,
> +};
> +
> +static const struct drm_plane_helper_funcs yhgch_plane_helper_funcs = {
> +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.atomic_check = yhgch_plane_atomic_check,
> +	.atomic_update = yhgch_plane_atomic_update,
> +};
> +
> +static void yhgch_crtc_dpms(struct drm_crtc *crtc, u32 dpms)
> +{
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(crtc->dev);
> +	u32 reg;
> +
> +	reg = readl(priv->mmio + YHGCH_CRT_DISP_CTL);
> +	reg &= ~YHGCH_CRT_DISP_CTL_DPMS_MASK;
> +	reg |= FIELD_PREP(YHGCH_CRT_DISP_CTL_DPMS_MASK, dpms);
> +	reg &= ~YHGCH_CRT_DISP_CTL_TIMING_MASK;
> +	if (dpms == YHGCH_CRT_DPMS_ON)
> +		reg |= YHGCH_CRT_DISP_CTL_TIMING(1);
> +	writel(reg, priv->mmio + YHGCH_CRT_DISP_CTL);
> +}
> +
> +static void yhgch_crtc_atomic_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *old_state)
> +{
> +	u32 reg;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(crtc->dev);
> +
> +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_MODE0);
> +
> +	/* Enable display power gate & LOCALMEM power gate */
> +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> +	reg |= YHGCH_CURR_GATE_LOCALMEM(1);
> +	reg |= YHGCH_CURR_GATE_DISPLAY(1);
> +	yhgch_set_current_gate(priv, reg);
> +	yhgch_crtc_dpms(crtc, YHGCH_CRT_DPMS_ON);
> +}
> +
> +static void yhgch_crtc_atomic_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *old_state)
> +{
> +	u32 reg;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(crtc->dev);
> +
> +	yhgch_crtc_dpms(crtc, YHGCH_CRT_DPMS_OFF);
> +
> +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_SLEEP);
> +
> +	/* Enable display power gate & LOCALMEM power gate */
> +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> +	reg |= YHGCH_CURR_GATE_LOCALMEM(0);
> +	reg |= YHGCH_CURR_GATE_DISPLAY(0);
> +	yhgch_set_current_gate(priv, reg);
> +}
> +
> +static enum drm_mode_status
> +yhgch_crtc_mode_valid(struct drm_crtc *crtc,
> +		      const struct drm_display_mode *mode)
> +{
> +	size_t i = 0;
> +	int vrefresh = drm_mode_vrefresh(mode);
> +
> +	if (vrefresh < 59 || vrefresh > 61)
> +		return MODE_NOCLOCK;
> +
> +	for (i = 0; i < ARRAY_SIZE(yhgch_pll_table); i++) {
> +		if (yhgch_pll_table[i].hdisplay == mode->hdisplay &&
> +		    yhgch_pll_table[i].vdisplay == mode->vdisplay)
> +			return MODE_OK;
> +	}
> +
> +	return MODE_BAD;
> +}
> +
> +static void set_vclock_yhgch(struct drm_device *dev, u64 pll)
> +{
> +	u32 val;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	val = readl(priv->mmio + CRT_PLL1_NS);
> +	val &= ~(CRT_PLL1_NS_OUTER_BYPASS(1));
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	val = CRT_PLL1_NS_INTER_BYPASS(1) | CRT_PLL1_NS_POWERON(1);
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	writel(pll, priv->mmio + CRT_PLL1_NS);
> +
> +	usleep_range(1000, 2000);
> +
> +	val = pll & ~(CRT_PLL1_NS_POWERON(1));
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	usleep_range(1000, 2000);
> +
> +	val &= ~(CRT_PLL1_NS_INTER_BYPASS(1));
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +
> +	usleep_range(1000, 2000);
> +
> +	val |= CRT_PLL1_NS_OUTER_BYPASS(1);
> +	writel(val, priv->mmio + CRT_PLL1_NS);
> +}
> +
> +static void get_pll_config(u64 x, u64 y, u32 *pll1, u32 *pll2)
> +{
> +	size_t i;
> +	size_t count = ARRAY_SIZE(yhgch_pll_table);
> +
> +	for (i = 0; i < count; i++) {
> +		if (yhgch_pll_table[i].hdisplay == x &&
> +		    yhgch_pll_table[i].vdisplay == y) {
> +			*pll1 = yhgch_pll_table[i].pll1_config_value;
> +			*pll2 = yhgch_pll_table[i].pll2_config_value;
> +			return;
> +		}
> +	}
> +}
> +
> +/*
> + * This function takes care the extra registers and bit fields required to
> + * setup a mode in board.
> + * Explanation about Display Control register:
> + * FPGA only supports 7 predefined pixel clocks, and clock select is
> + * in bit 4:0 of new register 0x802a8.
> + */
> +static u32 display_ctrl_adjust(struct drm_device *dev,
> +			       struct drm_display_mode *mode,
> +			       u32 ctrl)
> +{
> +	u64 w, h;
> +	u32 pll1;		/* bit[31:0] of PLL */
> +	u32 pll2;		/* bit[63:32] of PLL */
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	w = mode->hdisplay;
> +	h = mode->vdisplay;
> +
> +	get_pll_config(w, h, &pll1, &pll2);
> +	writel(pll2, priv->mmio + CRT_PLL2_NS);
> +	set_vclock_yhgch(dev, pll1);
> +
> +	/*
> +	 * yhgch has to set up the top-left and bottom-right
> +	 * registers as well.
> +	 * Note that normal chip only use those two register for
> +	 * auto-centering mode.
> +	 */
> +	writel(FIELD_PREP(YHGCH_CRT_AUTO_CENTERING_TL_TOP_MASK, 0) |
> +	       FIELD_PREP(YHGCH_CRT_AUTO_CENTERING_TL_LEFT_MASK, 0),
> +	       priv->mmio + YHGCH_CRT_AUTO_CENTERING_TL);
> +
> +	writel(FIELD_PREP(YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM_MASK, h - 1) |
> +	       FIELD_PREP(YHGCH_CRT_AUTO_CENTERING_BR_RIGHT_MASK, w - 1),
> +	       priv->mmio + YHGCH_CRT_AUTO_CENTERING_BR);
> +
> +	/*
> +	 * Assume common fields in ctrl have been properly set before
> +	 * calling this function.
> +	 * This function only sets the extra fields in ctrl.
> +	 */
> +
> +	/* Set bit 25 of display controller: Select CRT or VGA clock */
> +	ctrl &= ~YHGCH_CRT_DISP_CTL_CRTSELECT_MASK;
> +	ctrl &= ~YHGCH_CRT_DISP_CTL_CLOCK_PHASE_MASK;
> +
> +	ctrl |= YHGCH_CRT_DISP_CTL_CRTSELECT(YHGCH_CRTSELECT_CRT);
> +
> +	/* clock_phase_polarity is 0 */
> +	ctrl |= YHGCH_CRT_DISP_CTL_CLOCK_PHASE(0);
> +	ctrl |= FIELD_PREP(YHGCH_CRT_DISP_CTL_FORMAT_MASK, 2);
> +
> +	writel(ctrl, priv->mmio + YHGCH_CRT_DISP_CTL);
> +
> +	return ctrl;
> +}
> +
> +static void yhgch_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	u32 val;
> +	struct drm_display_mode *mode = &crtc->state->mode;
> +	struct drm_device *dev = crtc->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +	u32 width = mode->hsync_end - mode->hsync_start;
> +	u32 height = mode->vsync_end - mode->vsync_start;
> +
> +	//writel(format_pll_reg(), priv->mmio + YHGCH_CRT_PLL_CTRL);
> +	writel(FIELD_PREP(YHGCH_CRT_HORZ_TOTAL_TOTAL_MASK, mode->htotal - 1) |
> +	       FIELD_PREP(YHGCH_CRT_HORZ_TOTAL_DISP_END_MASK, mode->hdisplay - 1),
> +	       priv->mmio + YHGCH_CRT_HORZ_TOTAL);
> +
> +	writel(FIELD_PREP(YHGCH_CRT_HORZ_SYNC_WIDTH_MASK, width) |
> +	       FIELD_PREP(YHGCH_CRT_HORZ_SYNC_START_MASK, mode->hsync_start - 1),
> +	       priv->mmio + YHGCH_CRT_HORZ_SYNC);
> +
> +	writel(FIELD_PREP(YHGCH_CRT_VERT_TOTAL_TOTAL_MASK, mode->vtotal - 1) |
> +	       FIELD_PREP(YHGCH_CRT_VERT_TOTAL_DISP_END_MASK, mode->vdisplay - 1),
> +	       priv->mmio + YHGCH_CRT_VERT_TOTAL);
> +
> +	writel(FIELD_PREP(YHGCH_CRT_VERT_SYNC_HEIGHT_MASK, height) |
> +	       FIELD_PREP(YHGCH_CRT_VERT_SYNC_START_MASK, mode->vsync_start - 1),
> +	       priv->mmio + YHGCH_CRT_VERT_SYNC);
> +
> +	val = FIELD_PREP(YHGCH_CRT_DISP_CTL_VSYNC_PHASE_MASK, 0);
> +	val |= FIELD_PREP(YHGCH_CRT_DISP_CTL_HSYNC_PHASE_MASK, 0);
> +	val |= YHGCH_CRT_DISP_CTL_TIMING(1);
> +	val |= YHGCH_CRT_DISP_CTL_PLANE(1);
> +
> +	display_ctrl_adjust(dev, mode, val);
> +}
> +
> +static void yhgch_crtc_atomic_begin(struct drm_crtc *crtc,
> +				    struct drm_atomic_state *old_state)
> +{
> +	u32 reg;
> +	struct drm_device *dev = crtc->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_MODE0);
> +
> +	/* Enable display power gate & LOCALMEM power gate */
> +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> +	reg |= YHGCH_CURR_GATE_DISPLAY(1);
> +	reg |= YHGCH_CURR_GATE_LOCALMEM(1);
> +	yhgch_set_current_gate(priv, reg);
> +}

Runs on every single pageflip. I could be wrong, but power mgmt most 
likely doesn't belong here.  I've already seen such code in 
crtc_atomic_enable, where actually belongs. Could atomic_begin maybe 
removed?


> +
> +static const struct drm_crtc_funcs yhgch_crtc_funcs = {
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.set_config = drm_atomic_helper_set_config,
> +	.destroy = drm_crtc_cleanup,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static const struct drm_crtc_helper_funcs yhgch_crtc_helper_funcs = {
> +	.mode_set_nofb = yhgch_crtc_mode_set_nofb,
> +	.atomic_begin = yhgch_crtc_atomic_begin,
> +	.atomic_enable = yhgch_crtc_atomic_enable,
> +	.atomic_disable = yhgch_crtc_atomic_disable,
> +	.mode_valid = yhgch_crtc_mode_valid,
> +};
> +
> +int yhgch_de_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct drm_crtc *crtc = &priv->crtc;
> +	struct drm_plane *plane = &priv->primary_plane;
> +	int ret;
> +
> +	ret = drm_universal_plane_init(dev, plane, 1, &yhgch_plane_funcs,
> +				       channel_formats1,
> +				       ARRAY_SIZE(channel_formats1),
> +				       NULL,
> +				       DRM_PLANE_TYPE_PRIMARY,
> +				       NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init plane: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_plane_helper_add(plane, &yhgch_plane_helper_funcs);
> +	drm_plane_enable_fb_damage_clips(plane);
> +
> +	ret = drm_crtc_init_with_planes(dev, crtc, plane,
> +					NULL, &yhgch_crtc_funcs, NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init crtc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(crtc, &yhgch_crtc_helper_funcs);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_drv.c b/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> new file mode 100644
> index 000000000000..e9f2b5e8a7e2
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_drv.c
> @@ -0,0 +1,309 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/bitfield.h>
> +
> +#include <linux/aperture.h>
> +#include <drm/clients/drm_client_setup.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_fbdev_ttm.h>
> +
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_fbdev_shmem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_module.h>
> +#include <drm/drm_vblank.h>
> +
> +#include <drm/drm_probe_helper.h>

Again, alphabetical sorting. Here and in other files.

> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +DEFINE_DRM_GEM_FOPS(yhgch_fops);
> +
> +int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
> +		      struct drm_mode_create_dumb *args)

Make this a static function please.

> +{
> +	args->width = ALIGN(args->width, 8);

Aligning width is not possible, as it's purely a user-space parameter. 
According to atomic_update, the pitch needs to be aligned to 16 bytes.

In the latest drm-misc, we have a helper to do the alignment for you. 
[2] Call

drm_mode_size_dumb(dev, args, SZ_16, 0)

to align the pitch. See [3] for a real-world example.

[2] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-11-14/drivers/gpu/drm/drm_dumb_buffers.c#L120
[3] 
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-11-14/drivers/gpu/drm/omapdrm/omap_gem.c#L588

> +	return drm_gem_shmem_dumb_create(file, dev, args);
> +}
> +
> +static struct drm_driver yhgch_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,

Alphabetic

> +	.fops = &yhgch_fops,
> +	.name = "yhgch",
> +	.desc = "yhgch drm driver",
> +	.major = 3,
> +	.minor = 1,
> +	.dumb_create = yhgch_dumb_create,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
> +};
> +
> +static int __maybe_unused yhgch_pm_suspend(struct device *dev)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_suspend(drm_dev);
> +}
> +
> +static int __maybe_unused yhgch_pm_resume(struct device *dev)
> +{
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_resume(drm_dev);
> +}
> +
> +static const struct dev_pm_ops yhgch_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(yhgch_pm_suspend,
> +				yhgch_pm_resume)
> +};
> +
> +static const struct drm_mode_config_funcs yhgch_mode_funcs = {
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +	.fb_create = drm_gem_fb_create_with_dirty,
> +};
> +
> +static int yhgch_kms_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	int ret;
> +
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	dev->mode_config.min_width = 0;
> +	dev->mode_config.min_height = 0;
> +	dev->mode_config.max_width = 1920;
> +	dev->mode_config.max_height = 1200;
> +	dev->mode_config.preferred_depth = 24;
> +	dev->mode_config.prefer_shadow = 1;

Clear this line. Your driver does not prefer a shadow buffer.

> +	dev->mode_config.funcs = &yhgch_mode_funcs;
> +
> +	ret = yhgch_de_init(priv);
> +	if (ret) {
> +		drm_err(dev, "failed to init de: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = yhgch_vdac_init(priv);
> +	if (ret) {
> +		drm_err(dev, "failed to init vdac: %d\n", ret);
> +		return ret;
> +	}

> +	drm_kms_helper_poll_init(dev);

To make connector polling work, you also need to set connector->polled = 
DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT in 
yhgch_vdac_init() . Maybe test your code before submitting it.
> +
> +	return 0;
> +}
> +
> +/*
> + * It can operate in one of three modes: power mode 0, power mode 1 or Sleep
> + * mode.
> + */
> +void yhgch_set_power_mode(struct yhgch_drm_private *priv, u32 power_mode)
> +{
> +	unsigned int control_value = 0;
> +	void __iomem *mmio = priv->mmio;
> +	u32 input = 1;
> +
> +	if (power_mode > YHGCH_PW_MODE_CTL_MODE_SLEEP)
> +		return;
> +
> +	if (power_mode == YHGCH_PW_MODE_CTL_MODE_SLEEP)
> +		input = 0;
> +
> +	control_value = readl(mmio + YHGCH_POWER_MODE_CTRL);
> +	control_value &= ~(YHGCH_PW_MODE_CTL_MODE_MASK |
> +			   YHGCH_PW_MODE_CTL_OSC_INPUT_MASK);
> +	control_value |= FIELD_PREP(YHGCH_PW_MODE_CTL_MODE_MASK, power_mode);
> +	control_value |= FIELD_PREP(YHGCH_PW_MODE_CTL_OSC_INPUT_MASK, input);
> +	writel(control_value, mmio + YHGCH_POWER_MODE_CTRL);
> +}
> +
> +void yhgch_set_current_gate(struct yhgch_drm_private *priv, unsigned int gate)
> +{
> +	u32 gate_reg;
> +	u32 mode;
> +	void __iomem *mmio = priv->mmio;
> +
> +	/* Get current power mode. */
> +	mode = (readl(mmio + YHGCH_POWER_MODE_CTRL) &
> +		YHGCH_PW_MODE_CTL_MODE_MASK) >> YHGCH_PW_MODE_CTL_MODE_SHIFT;
> +
> +	switch (mode) {
> +	case YHGCH_PW_MODE_CTL_MODE_MODE0:
> +		gate_reg = YHGCH_MODE0_GATE;
> +		break;
> +
> +	case YHGCH_PW_MODE_CTL_MODE_MODE1:
> +		gate_reg = YHGCH_MODE1_GATE;
> +		break;
> +
> +	default:
> +		gate_reg = YHGCH_MODE0_GATE;
> +		break;
> +	}
> +	writel(gate, mmio + gate_reg);
> +}
> +
> +static void yhgch_hw_config(struct yhgch_drm_private *priv)
> +{
> +	u32 reg;
> +
> +	/* On hardware reset, power mode 0 is default. */
> +	yhgch_set_power_mode(priv, YHGCH_PW_MODE_CTL_MODE_MODE0);
> +
> +	/* Enable display power gate & LOCALMEM power gate */
> +	reg = readl(priv->mmio + YHGCH_CURRENT_GATE);
> +	reg &= ~YHGCH_CURR_GATE_DISPLAY_MASK;
> +	reg &= ~YHGCH_CURR_GATE_LOCALMEM_MASK;
> +	reg |= YHGCH_CURR_GATE_DISPLAY(1);
> +	reg |= YHGCH_CURR_GATE_LOCALMEM(1);
> +
> +	yhgch_set_current_gate(priv, reg);
> +
> +	/*
> +	 * Reset the memory controller. If the memory controller
> +	 * is not reset in chip,the system might hang when sw accesses
> +	 * the memory.The memory should be resetted after
> +	 * changing the MXCLK.
> +	 */
> +	reg = readl(priv->mmio + YHGCH_MISC_CTRL);
> +	reg &= ~YHGCH_MSCCTL_LOCALMEM_RESET_MASK;
> +	reg |= YHGCH_MSCCTL_LOCALMEM_RESET(0);
> +	writel(reg, priv->mmio + YHGCH_MISC_CTRL);
> +
> +	reg &= ~YHGCH_MSCCTL_LOCALMEM_RESET_MASK;
> +	reg |= YHGCH_MSCCTL_LOCALMEM_RESET(1);
> +
> +	writel(reg, priv->mmio + YHGCH_MISC_CTRL);
> +}
> +
> +static int yhgch_hw_map(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	resource_size_t ioaddr, iosize;
> +
> +	ioaddr = pci_resource_start(pdev, 1);
> +	iosize = pci_resource_len(pdev, 1);
> +	priv->mmio = devm_ioremap(dev->dev, ioaddr, iosize);
> +	if (!priv->mmio) {
> +		drm_err(dev, "Cannot map mmio region\n");
> +		return -ENOMEM;
> +	}
> +
> +	ioaddr = pci_resource_start(pdev, 0);
> +	iosize = pci_resource_len(pdev, 0);
> +	priv->vram_base = devm_ioremap_wc(dev->dev, ioaddr, iosize);
> +	if (!priv->vram_base) {
> +		drm_err(dev, "Cannot map vram region\n");
> +		return -ENOMEM;
> +	}
> +	return 0;
> +}
> +
> +static int yhgch_hw_init(struct yhgch_drm_private *priv)
> +{
> +	int ret;
> +
> +	ret = yhgch_hw_map(priv);
> +	if (ret)
> +		return ret;
> +	yhgch_hw_config(priv);
> +	return 0;
> +}
> +
> +static int yhgch_pci_probe(struct pci_dev *pdev,
> +			   const struct pci_device_id *ent)
> +{
> +	struct yhgch_drm_private *priv;
> +	struct drm_device *dev;
> +	int ret;
> +
> +	ret = aperture_remove_conflicting_pci_devices(pdev, yhgch_driver.name);
> +
> +	if (ret)
> +		return ret;
> +
> +	priv = devm_drm_dev_alloc(&pdev->dev, &yhgch_driver,
> +				  struct yhgch_drm_private, dev);
> +
> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
> +
> +	dev = &priv->dev;
> +	pci_set_drvdata(pdev, dev);
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		drm_err(dev, "failed to enable pci device: %d\n", ret);
> +		goto err_return;
> +	}
> +
> +	ret = yhgch_hw_init(priv);
> +	if (ret)
> +		goto err_return;
> +
> +	ret = yhgch_kms_init(priv);
> +	if (ret)
> +		goto err_return;
> +
> +	ret = pci_enable_msi(pdev);
> +	if (ret)
> +		drm_warn(dev, "enabling MSI failed: %d\n", ret);
> +	/* reset all the states of crtc/plane/encoder/connector */
> +	drm_mode_config_reset(dev);
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret) {
> +		drm_err(dev, "failed to register drv for userspace access: %d\n",
> +			ret);
> +		goto err_return;
> +	}
> +	drm_client_setup(dev, NULL);
> +
> +	return 0;
> +
> +err_return:
> +	return ret;
> +}
> +
> +static void yhgch_pci_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *dev = pci_get_drvdata(pdev);
> +
> +	drm_dev_unregister(dev);
> +	drm_dev_put(dev);
> +}
> +
> +static void yhgch_pci_shutdown(struct pci_dev *pdev)
> +{
> +	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
> +}
> +
> +static struct pci_device_id yhgch_pci_table[] = {
> +	{ 0x1bd4, 0x0750, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0 },
> +	{ 0, }
> +};
> +
> +static struct pci_driver yhgch_pci_driver = {
> +	.name = "yhgch-drm",
> +	.id_table = yhgch_pci_table,
> +	.probe = yhgch_pci_probe,
> +	.remove = yhgch_pci_remove,
> +	.shutdown = yhgch_pci_shutdown,
> +	.driver.pm = &yhgch_pm_ops,
> +};
> +
> +drm_module_pci_driver(yhgch_pci_driver);
> +
> +MODULE_DEVICE_TABLE(pci, yhgch_pci_table);
> +MODULE_AUTHOR("Chu Guangqing <chuguangqing@inspur.com>");
> +MODULE_DESCRIPTION("DRM Driver for YHGCH ZX1000 BMC. company website: https://www.yhgch.com");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("3.1");
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_drv.h b/drivers/gpu/drm/yhgch/yhgch_drm_drv.h
> new file mode 100644
> index 000000000000..1b8b1e5b0a43
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_drv.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef YHGCH_DRM_DRV_H
> +#define YHGCH_DRM_DRV_H
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c-algo-bit.h>
> +#include <linux/i2c.h>
> +#include <linux/version.h>
> +#include <linux/bitfield.h>
> +#include <drm/drm_framebuffer.h>
> +#include <drm/drm_encoder.h>
> +
> +struct yhgch_ddc {
> +	struct yhgch_drm_private *priv;
> +	struct i2c_adapter adapter;
> +	struct i2c_algo_bit_data bit_data;
> +};
> +
> +struct yhgch_drm_private {
> +	/* hw */
> +	void __iomem *mmio;
> +	void __iomem *vram_base;
> +
> +	/* drm */
> +	struct drm_device dev;
> +	struct drm_plane primary_plane;
> +	struct drm_crtc crtc;
> +	struct drm_encoder encoder;
> +	struct drm_connector connector;
> +};
> +
> +static inline struct yhgch_drm_private *to_yhgch_drm_private(struct drm_device *dev)
> +{
> +	return container_of(dev, struct yhgch_drm_private, dev);
> +}
> +
> +void yhgch_set_power_mode(struct yhgch_drm_private *priv,
> +			  u32 power_mode);
> +void yhgch_set_current_gate(struct yhgch_drm_private *priv,
> +			    u32 gate);
> +
> +int yhgch_de_init(struct yhgch_drm_private *priv);
> +int yhgch_vdac_init(struct yhgch_drm_private *priv);
> +int yhgch_mm_init(struct yhgch_drm_private *yhgch);
> +struct i2c_adapter *yhgch_ddc_create(struct yhgch_drm_private *priv);
> +
> +int yhgch_dumb_create(struct drm_file *file, struct drm_device *dev,
> +		      struct drm_mode_create_dumb *args);
> +
> +#endif
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_i2c.c b/drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
> new file mode 100644
> index 000000000000..7bbe9a0540d4
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/delay.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "yhgch_drm_drv.h"
> +
> +#define GPIO_DATA		0x0802A0
> +#define GPIO_DATA_DIRECTION	0x0802A4
> +
> +#define I2C_SCL_MASK		BIT(0)
> +#define I2C_SDA_MASK		BIT(1)
> +
> +static void yhgch_set_i2c_signal(void *data, u32 mask, int value)
> +{
> +	struct yhgch_ddc *ddc = data;
> +	struct yhgch_drm_private *priv = ddc->priv;
> +	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if (value) {
> +		tmp_dir &= ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	} else {
> +		u32 tmp_data = readl(priv->mmio + GPIO_DATA);
> +
> +		tmp_data &= ~mask;
> +		writel(tmp_data, priv->mmio + GPIO_DATA);
> +
> +		tmp_dir |= mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +}
> +
> +static int yhgch_get_i2c_signal(void *data, u32 mask)
> +{
> +	struct yhgch_ddc *ddc = data;
> +	struct yhgch_drm_private *priv = ddc->priv;
> +	u32 tmp_dir = readl(priv->mmio + GPIO_DATA_DIRECTION);
> +
> +	if ((tmp_dir & mask) != mask) {
> +		tmp_dir &= ~mask;
> +		writel(tmp_dir, priv->mmio + GPIO_DATA_DIRECTION);
> +	}
> +
> +	return (readl(priv->mmio + GPIO_DATA) & mask) ? 1 : 0;
> +}
> +
> +static void yhgch_ddc_setsda(void *data, int state)
> +{
> +	yhgch_set_i2c_signal(data, I2C_SDA_MASK, state);
> +}
> +
> +static void yhgch_ddc_setscl(void *data, int state)
> +{
> +	yhgch_set_i2c_signal(data, I2C_SCL_MASK, state);
> +}
> +
> +static int yhgch_ddc_getsda(void *data)
> +{
> +	return yhgch_get_i2c_signal(data, I2C_SDA_MASK);
> +}
> +
> +static int yhgch_ddc_getscl(void *data)
> +{
> +	return yhgch_get_i2c_signal(data, I2C_SCL_MASK);
> +}
> +
> +static void yhgch_ddc_release(struct drm_device *dev, void *res)
> +{
> +	struct yhgch_ddc *ddc = res;
> +
> +	i2c_del_adapter(&ddc->adapter);
> +}
> +
> +struct i2c_adapter *yhgch_ddc_create(struct yhgch_drm_private *priv)
> +{
> +	int ret = 0;
> +	struct yhgch_ddc *ddc;
> +	struct drm_device *dev = &priv->dev;
> +
> +	ddc = drmm_kzalloc(dev, sizeof(struct yhgch_ddc), GFP_KERNEL);
> +	if (!ddc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ddc->adapter.owner = THIS_MODULE;
> +	ddc->priv = priv;
> +	snprintf(ddc->adapter.name, I2C_NAME_SIZE, "INS i2c bit bus");
> +	ddc->adapter.dev.parent = priv->dev.dev;
> +	i2c_set_adapdata(&ddc->adapter, ddc);
> +	ddc->adapter.algo_data = &ddc->bit_data;
> +
> +	ddc->bit_data.udelay = 20;
> +	ddc->bit_data.timeout = usecs_to_jiffies(2000);
> +	ddc->bit_data.data = ddc;
> +	ddc->bit_data.setsda = yhgch_ddc_setsda;
> +	ddc->bit_data.setscl = yhgch_ddc_setscl;
> +	ddc->bit_data.getsda = yhgch_ddc_getsda;
> +	ddc->bit_data.getscl = yhgch_ddc_getscl;
> +
> +	ret = i2c_bit_add_bus(&ddc->adapter);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	ret = drmm_add_action_or_reset(&priv->dev, yhgch_ddc_release, ddc);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &ddc->adapter;
> +}
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_regs.h b/drivers/gpu/drm/yhgch/yhgch_drm_regs.h
> new file mode 100644
> index 000000000000..cecb6173a445
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_regs.h
> @@ -0,0 +1,208 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef YHGCH_DRM_HW_H
> +#define YHGCH_DRM_HW_H
> +
> +/* register definition */
> +#define YHGCH_MISC_CTRL				0x4
> +
> +#define YHGCH_MSCCTL_LOCALMEM_RESET(x)		((x) << 6)
> +#define YHGCH_MSCCTL_LOCALMEM_RESET_MASK	0x40
> +
> +#define YHGCH_CURRENT_GATE			0x000040
> +#define YHGCH_CURR_GATE_DISPLAY(x)		((x) << 2)
> +#define YHGCH_CURR_GATE_DISPLAY_MASK		0x4
> +
> +#define YHGCH_CURR_GATE_LOCALMEM(x)		((x) << 1)
> +#define YHGCH_CURR_GATE_LOCALMEM_MASK		0x2
> +
> +#define YHGCH_MODE0_GATE			0x000044
> +#define YHGCH_MODE1_GATE			0x000048
> +#define YHGCH_POWER_MODE_CTRL			0x00004C
> +
> +#define YHGCH_PW_MODE_CTL_OSC_INPUT(x)		((x) << 3)
> +#define YHGCH_PW_MODE_CTL_OSC_INPUT_MASK	0x8
> +
> +#define YHGCH_PW_MODE_CTL_MODE(x)		((x) << 0)
> +#define YHGCH_PW_MODE_CTL_MODE_MASK		0x03
> +#define YHGCH_PW_MODE_CTL_MODE_SHIFT		0
> +
> +#define YHGCH_PW_MODE_CTL_MODE_MODE0		0
> +#define YHGCH_PW_MODE_CTL_MODE_MODE1		1
> +#define YHGCH_PW_MODE_CTL_MODE_SLEEP		2
> +
> +//#define YHGCH_CRT_PLL_CTRL                   0x000060
> +
> +#define YHGCH_PLL_CTRL_BYPASS(x)		((x) << 18)
> +#define YHGCH_PLL_CTRL_BYPASS_MASK		0x40000
> +
> +#define YHGCH_PLL_CTRL_POWER(x)			((x) << 17)
> +#define YHGCH_PLL_CTRL_POWER_MASK		0x20000
> +
> +#define YHGCH_PLL_CTRL_INPUT(x)			((x) << 16)
> +#define YHGCH_PLL_CTRL_INPUT_MASK		0x10000
> +
> +#define YHGCH_PLL_CTRL_POD(x)			((x) << 14)
> +#define YHGCH_PLL_CTRL_POD_MASK			0xC000
> +
> +#define YHGCH_PLL_CTRL_OD(x)			((x) << 12)
> +#define YHGCH_PLL_CTRL_OD_MASK			0x3000
> +
> +#define YHGCH_PLL_CTRL_N(x)			((x) << 8)
> +#define YHGCH_PLL_CTRL_N_MASK			0xF00
> +
> +#define YHGCH_PLL_CTRL_M(x)			((x) << 0)
> +#define YHGCH_PLL_CTRL_M_MASK			0xFF
> +
> +#define YHGCH_CRT_DISP_CTL			0x80200
> +
> +#define YHGCH_CRT_DISP_CTL_DPMS(x)		((x) << 30)
> +#define YHGCH_CRT_DISP_CTL_DPMS_MASK		0xc0000000
> +
> +#define YHGCH_CRT_DPMS_ON			0
> +#define YHGCH_CRT_DPMS_OFF			3
> +
> +#define YHGCH_CRT_DISP_CTL_CRTSELECT(x)		((x) << 25)
> +#define YHGCH_CRT_DISP_CTL_CRTSELECT_MASK	0x2000000
> +
> +#define YHGCH_CRTSELECT_CRT			1
> +
> +#define YHGCH_CRT_DISP_CTL_CLOCK_PHASE(x)	((x) << 14)
> +#define YHGCH_CRT_DISP_CTL_CLOCK_PHASE_MASK	0x4000
> +
> +#define YHGCH_CRT_DISP_CTL_VSYNC_PHASE(x)	((x) << 13)
> +#define YHGCH_CRT_DISP_CTL_VSYNC_PHASE_MASK	0x2000
> +
> +#define YHGCH_CRT_DISP_CTL_HSYNC_PHASE(x)	((x) << 12)
> +#define YHGCH_CRT_DISP_CTL_HSYNC_PHASE_MASK	0x1000
> +
> +#define YHGCH_CRT_DISP_CTL_TIMING(x)		((x) << 8)
> +#define YHGCH_CRT_DISP_CTL_TIMING_MASK		0x100
> +
> +#define YHGCH_CRT_DISP_CTL_PLANE(x)		((x) << 2)
> +#define YHGCH_CRT_DISP_CTL_PLANE_MASK		4
> +
> +#define YHGCH_CRT_DISP_CTL_FORMAT(x)		((x) << 0)
> +#define YHGCH_CRT_DISP_CTL_FORMAT_MASK		0x03
> +
> +#define YHGCH_CRT_FB_ADDRESS			0x080204
> +
> +#define YHGCH_CRT_FB_WIDTH			0x080208
> +#define YHGCH_CRT_FB_WIDTH_WIDTH(x)		((x) << 16)
> +#define YHGCH_CRT_FB_WIDTH_WIDTH_MASK		0x3FFF0000
> +#define YHGCH_CRT_FB_WIDTH_OFFS(x)		((x) << 0)
> +#define YHGCH_CRT_FB_WIDTH_OFFS_MASK		0x3FFF
> +
> +#define YHGCH_CRT_HORZ_TOTAL			0x08020C
> +#define YHGCH_CRT_HORZ_TOTAL_TOTAL(x)		((x) << 16)
> +#define YHGCH_CRT_HORZ_TOTAL_TOTAL_MASK		0xFFF0000
> +
> +#define YHGCH_CRT_HORZ_TOTAL_DISP_END(x)	((x) << 0)
> +#define YHGCH_CRT_HORZ_TOTAL_DISP_END_MASK	0xFFF
> +
> +#define YHGCH_CRT_HORZ_SYNC			0x080210
> +#define YHGCH_CRT_HORZ_SYNC_WIDTH(x)		((x) << 16)
> +#define YHGCH_CRT_HORZ_SYNC_WIDTH_MASK		0xFF0000
> +
> +#define YHGCH_CRT_HORZ_SYNC_START(x)		((x) << 0)
> +#define YHGCH_CRT_HORZ_SYNC_START_MASK		0xFFF
> +
> +#define YHGCH_CRT_VERT_TOTAL			0x080214
> +#define YHGCH_CRT_VERT_TOTAL_TOTAL(x)		((x) << 16)
> +#define YHGCH_CRT_VERT_TOTAL_TOTAL_MASK		0x7FFF0000
> +
> +#define YHGCH_CRT_VERT_TOTAL_DISP_END(x)	((x) << 0)
> +#define YHGCH_CRT_VERT_TOTAL_DISP_END_MASK	0x7FF
> +
> +#define YHGCH_CRT_VERT_SYNC			0x080218
> +#define YHGCH_CRT_VERT_SYNC_HEIGHT(x)		((x) << 16)
> +#define YHGCH_CRT_VERT_SYNC_HEIGHT_MASK		0x3F0000
> +
> +#define YHGCH_CRT_VERT_SYNC_START(x)		((x) << 0)
> +#define YHGCH_CRT_VERT_SYNC_START_MASK		0x7FF
> +
> +/* Hardware Cursor */
> +#define YHGCH_HWC_ADDRESS                   0x080230
> +#define YHGCH_HWC_ADDRESS_ENABLE(x)         ((x) << 31)
> +#define YHGCH_HWC_ADDRESS_ENABLE_MASK       0x80000000
> +#define YHGCH_HWC_ADDRESS_ADDRESS(x)        ((x) << 0)
> +#define YHGCH_HWC_ADDRESS_ADDRESS_MASK      0xFFFFFFF
> +
> +#define YHGCH_HWC_LOCATION                  0x080234
> +#define YHGCH_HWC_LOCATION_TOP(x)           ((x) << 27)
> +#define YHGCH_HWC_LOCATION_TOP_MASK         0x8000000
> +#define YHGCH_HWC_LOCATION_Y(x)             ((x) << 16)
> +#define YHGCH_HWC_LOCATION_Y_MASK           0x7FF0000
> +#define YHGCH_HWC_LOCATION_LEFT(x)          ((x) << 11)
> +#define YHGCH_HWC_LOCATION_LEFT_MASK        0x800
> +#define YHGCH_HWC_LOCATION_X(x)             ((x) << 0)
> +#define YHGCH_HWC_LOCATION_X_MASK           0x7FF
> +
> +#define YHGCH_HWC_COLOR_12                  0x080238
> +#define YHGCH_HWC_COLOR_12_2_RGB(x)         ((x) << 16)
> +#define YHGCH_HWC_COLOR_12_2_RGB_MASK       0xFFFF0000
> +#define YHGCH_HWC_COLOR_12_1_RGB(x)         ((x) << 0)
> +#define YHGCH_HWC_COLOR_12_1_RGB_MASK       0xFFFF
> +
> +#define YHGCH_HWC_COLOR_3                   0x08023C
> +#define YHGCH_HWC_COLOR_3_RGB(x)            ((x) << 0)
> +#define YHGCH_HWC_COLOR_3_RGB_MASK          0xFFFF
> +
> +/* Auto Centering */
> +#define YHGCH_CRT_AUTO_CENTERING_TL		0x080280
> +#define YHGCH_CRT_AUTO_CENTERING_TL_TOP(x)	((x) << 16)
> +#define YHGCH_CRT_AUTO_CENTERING_TL_TOP_MASK	0x7FF0000
> +
> +#define YHGCH_CRT_AUTO_CENTERING_TL_LEFT(x)	((x) << 0)
> +#define YHGCH_CRT_AUTO_CENTERING_TL_LEFT_MASK	0x7FF
> +
> +#define YHGCH_CRT_AUTO_CENTERING_BR		0x080284
> +#define YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM(x)	((x) << 16)
> +#define YHGCH_CRT_AUTO_CENTERING_BR_BOTTOM_MASK	0x7FF0000
> +
> +#define YHGCH_CRT_AUTO_CENTERING_BR_RIGHT(x)	((x) << 0)
> +#define YHGCH_CRT_AUTO_CENTERING_BR_RIGHT_MASK	0x7FF
> +
> +/* register to control panel output */
> +#define YHGCH_DISPLAY_CONTROL_HISILE		0x80288
> +#define YHGCH_DISPLAY_CONTROL_FPVDDEN(x)	((x) << 0)
> +#define YHGCH_DISPLAY_CONTROL_PANELDATE(x)	((x) << 1)
> +#define YHGCH_DISPLAY_CONTROL_FPEN(x)		((x) << 2)
> +#define YHGCH_DISPLAY_CONTROL_VBIASEN(x)	((x) << 3)
> +
> +#define YHGCH_RAW_INTERRUPT			0x80290
> +#define YHGCH_RAW_INTERRUPT_VBLANK(x)		((x) << 2)
> +#define YHGCH_RAW_INTERRUPT_VBLANK_MASK		0x4
> +
> +#define YHGCH_RAW_INTERRUPT_EN			0x80298
> +#define YHGCH_RAW_INTERRUPT_EN_VBLANK(x)	((x) << 2)
> +#define YHGCH_RAW_INTERRUPT_EN_VBLANK_MASK	0x4
> +
> +/* register and values for PLL control */
> +#define CRT_PLL1_NS				0x802a8
> +#define CRT_PLL1_NS_OUTER_BYPASS(x)		((x) << 30)
> +#define CRT_PLL1_NS_INTER_BYPASS(x)		((x) << 29)
> +#define CRT_PLL1_NS_POWERON(x)			((x) << 24)
> +
> +#define CRT_PLL1_NS_25MHZ			0x00006691	//640x480
> +#define CRT_PLL1_NS_40MHZ			0x00004580	//800x600
> +#define CRT_PLL1_NS_65MHZ			0x00002568	//1024x768
> +#define CRT_PLL1_NS_83MHZ			0x000027bb	//1280x800
> +#define CRT_PLL1_NS_106MHZ			0x000027ef	//1440x900
> +#define CRT_PLL1_NS_108MHZ			0x000027f2	//1280x1024
> +#define CRT_PLL1_NS_146MHZ			0x00001575	//1680x1050
> +#define CRT_PLL1_NS_148MHZ			0x0000145f	//1920x1080
> +#define CRT_PLL1_NS_193MHZ			0x000018f7	//1920x1200
> +
> +#define CRT_PLL2_NS				0x802ac
> +#define CRT_PLL2_NS_25MHZ			0x0
> +#define CRT_PLL2_NS_40MHZ			0x0
> +#define CRT_PLL2_NS_65MHZ			0x0
> +#define CRT_PLL2_NS_83MHZ			0x0
> +#define CRT_PLL2_NS_106MHZ			0x0
> +#define CRT_PLL2_NS_108MHZ			0x0
> +#define CRT_PLL2_NS_146MHZ			0x0
> +#define CRT_PLL2_NS_148MHZ			0x0
> +#define CRT_PLL2_NS_193MHZ			0x0
> +
> +#endif
> diff --git a/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> new file mode 100644
> index 000000000000..2de95c887b62
> --- /dev/null
> +++ b/drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/io.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "yhgch_drm_drv.h"
> +#include "yhgch_drm_regs.h"
> +
> +static int yhgch_connector_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +	const struct drm_edid *drm_edid;
> +
> +	drm_edid = drm_edid_read(connector);
> +	if (drm_edid) {
> +		drm_edid_connector_update(connector, drm_edid);
> +		count =  drm_edid_connector_add_modes(connector);
> +		drm_edid_free(drm_edid);
> +		if (count)
> +			goto out;

Don't do the goto here. Simple call drm_edid_free().

> +	} else {
> +		drm_edid_connector_update(connector, NULL);
> +	}
> +
> +	count = drm_add_modes_noedid(connector,
> +				     connector->dev->mode_config.max_width,
> +				     connector->dev->mode_config.max_height);
> +	drm_set_preferred_mode(connector, 1024, 768);

These two calls belong into the else branch. If you have an EDID, please 
don't try to make up your own defaults.

> +
> +out:
> +	drm_edid_free(drm_edid);

This only belongs into the if branch. You also have a double free on 
drm_edid in that case. I wonder how you did not notice.


> +	return count;

Returning 0 here is not a problem. DRM will try several steps to figure 
out the display modes, and eventually fallback to defaults.

Best regards
Thomas

> +}
> +
> +static int yhgch_connector_helper_detect_from_ddc(struct drm_connector *connector,
> +						  struct drm_modeset_acquire_ctx *ctx,
> +						  bool force)
> +{
> +	if (drm_connector_helper_detect_from_ddc(connector, ctx, force)
> +			!= connector_status_connected) {
> +		drm_dbg_kms(connector->dev, "ddc detect failed, force connect\n");
> +	}
> +	return connector_status_connected;
> +}
> +
> +static const struct drm_connector_helper_funcs
> +	yhgch_connector_helper_funcs = {
> +	.get_modes = yhgch_connector_get_modes,
> +	.detect_ctx = yhgch_connector_helper_detect_from_ddc,
> +};
> +
> +static const struct drm_connector_funcs yhgch_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void yhgch_encoder_enable(struct drm_encoder *encoder)
> +{
> +	u32 reg;
> +	struct drm_device *dev = encoder->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	reg = readl(priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +	reg |= YHGCH_DISPLAY_CONTROL_FPVDDEN(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_PANELDATE(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_FPEN(1);
> +	reg |= YHGCH_DISPLAY_CONTROL_VBIASEN(1);
> +	writel(reg, priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +}
> +
> +static void yhgch_encoder_disable(struct drm_encoder *encoder)
> +{
> +	u32 reg = 0, regmask = 0;
> +	struct drm_device *dev = encoder->dev;
> +	struct yhgch_drm_private *priv = to_yhgch_drm_private(dev);
> +
> +	reg = readl(priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +	regmask |= YHGCH_DISPLAY_CONTROL_FPVDDEN(1);
> +	regmask |= YHGCH_DISPLAY_CONTROL_PANELDATE(1);
> +	regmask |= YHGCH_DISPLAY_CONTROL_FPEN(1);
> +	regmask |= YHGCH_DISPLAY_CONTROL_VBIASEN(1);
> +	reg &= ~regmask;
> +	writel(reg, priv->mmio + YHGCH_DISPLAY_CONTROL_HISILE);
> +}
> +
> +static const struct drm_encoder_helper_funcs yhgch_encoder_helper_funcs = {
> +	.enable = yhgch_encoder_enable,
> +	.disable = yhgch_encoder_disable,
> +};
> +
> +int yhgch_vdac_init(struct yhgch_drm_private *priv)
> +{
> +	struct drm_device *dev = &priv->dev;
> +	struct drm_encoder *encoder = &priv->encoder;
> +	struct drm_crtc *crtc = &priv->crtc;
> +	struct drm_connector *connector = &priv->connector;
> +	struct i2c_adapter *ddc;
> +	int ret;
> +
> +	ddc = yhgch_ddc_create(priv);
> +	if (IS_ERR(ddc)) {
> +		ret = PTR_ERR(ddc);
> +		drm_err(dev, "failed to create ddc: %d\n", ret);
> +		return ret;
> +	}
> +
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret) {
> +		drm_err(dev, "failed to init encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_encoder_helper_add(encoder, &yhgch_encoder_helper_funcs);
> +
> +	ret = drm_connector_init_with_ddc(dev, connector,
> +					  &yhgch_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA,
> +					  ddc);
> +	if (ret) {
> +		drm_err(dev, "failed to init connector: %d\n", ret);
> +		return ret;
> +	}
> +	drm_connector_helper_add(connector, &yhgch_connector_helper_funcs);
> +
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	return 0;
> +}

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


