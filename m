Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F41A8555A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 09:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036DA10EB0E;
	Fri, 11 Apr 2025 07:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rwmHksLe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IHI26DQs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rwmHksLe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IHI26DQs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D0310EB0F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 07:23:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4BCD01F456;
 Fri, 11 Apr 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744356201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbYnMaK74zEyR7XpV6z7unyhvN8OWc2EYmWo231Sh8k=;
 b=rwmHksLe/Ss6Rd2jhs6+fDQqBi0vkMxNX63ZEP89XB/s/odxWY59rho2MqW6omTd7wJkXs
 XQdhyR+nikc0rnuqSC68ek56zvdcRpIhWL6fcSxgk2VppSvksEONj0sH/Btekm5vXBVsdK
 HflRCJEov8Jvtn3gTnZCEL01IvWIi1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744356201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbYnMaK74zEyR7XpV6z7unyhvN8OWc2EYmWo231Sh8k=;
 b=IHI26DQsZBLwS3BF+DWXXvRDPy3ICQTY3f7kVX9m98sKHy37O940TqbsJkPQEEF+jU5O3V
 pISCrTBLxrpL8lBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744356201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbYnMaK74zEyR7XpV6z7unyhvN8OWc2EYmWo231Sh8k=;
 b=rwmHksLe/Ss6Rd2jhs6+fDQqBi0vkMxNX63ZEP89XB/s/odxWY59rho2MqW6omTd7wJkXs
 XQdhyR+nikc0rnuqSC68ek56zvdcRpIhWL6fcSxgk2VppSvksEONj0sH/Btekm5vXBVsdK
 HflRCJEov8Jvtn3gTnZCEL01IvWIi1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744356201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TbYnMaK74zEyR7XpV6z7unyhvN8OWc2EYmWo231Sh8k=;
 b=IHI26DQsZBLwS3BF+DWXXvRDPy3ICQTY3f7kVX9m98sKHy37O940TqbsJkPQEEF+jU5O3V
 pISCrTBLxrpL8lBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 726A413886;
 Fri, 11 Apr 2025 07:23:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1OCSGmjD+GfqfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Apr 2025 07:23:20 +0000
Message-ID: <6ce4444d-b586-4b78-ab01-f0ad0a97d963@suse.de>
Date: Fri, 11 Apr 2025 09:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] drm: Pass pixel_format+modifier directly to
 drm_get_format_info()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
 <20250410163218.15130-3-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20250410163218.15130-3-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[33];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,arm.com,armlinux.org.uk,samsung.com,gmail.com,kernel.org,pengutronix.de,quicinc.com,poorly.run,somainline.org,denx.de,agner.ch,redhat.com,ideasonboard.com,amd.com,rock-chips.com,sntech.de,nvidia.com,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL6e75e7xiqh135443e1d3zo16)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TAGGED_RCPT(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
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

Hi

Am 10.04.25 um 18:32 schrieb Ville Syrjala:

[...]

>   include/drm/drm_fourcc.h                     | 2 +-

AFAICT you can also remove the forward declaration of struct 
drm_mode_fb_cmd2 from this header.

Best regards
Thomas


>   17 files changed, 46 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index e083021e9e99..558e44a7e627 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -325,7 +325,8 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
>   		return false;
>   	}
>   
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   
>   	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
>   		(mode_cmd->height / afbc_superblock_height);
> diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
> index cf2e88218dc0..85fc2cb50544 100644
> --- a/drivers/gpu/drm/armada/armada_fb.c
> +++ b/drivers/gpu/drm/armada/armada_fb.c
> @@ -86,7 +86,9 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
>   struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
>   	struct drm_file *dfile, const struct drm_mode_fb_cmd2 *mode)
>   {
> -	const struct drm_format_info *info = drm_get_format_info(dev, mode);
> +	const struct drm_format_info *info = drm_get_format_info(dev,
> +								 mode->pixel_format,
> +								 mode->modifier[0]);
>   	struct armada_gem_object *obj;
>   	struct armada_framebuffer *dfb;
>   	int ret;
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index f79fff8209fd..3c6998b74a4f 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -390,16 +390,16 @@ EXPORT_SYMBOL(drm_format_info);
>    */
>   const struct drm_format_info *
>   drm_get_format_info(struct drm_device *dev,
> -		    const struct drm_mode_fb_cmd2 *mode_cmd)
> +		    u32 pixel_format, u64 modifier)
>   {
>   	const struct drm_format_info *info = NULL;
>   
>   	if (dev->mode_config.funcs->get_format_info)
> -		info = dev->mode_config.funcs->get_format_info(mode_cmd->pixel_format,
> -							       mode_cmd->modifier[0]);
> +		info = dev->mode_config.funcs->get_format_info(pixel_format,
> +							       modifier);
>   
>   	if (!info)
> -		info = drm_format_info(mode_cmd->pixel_format);
> +		info = drm_format_info(pixel_format);
>   
>   	return info;
>   }
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index b781601946db..18a0267e374e 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -176,7 +176,7 @@ static int framebuffer_check(struct drm_device *dev,
>   	}
>   
>   	/* now let the driver pick its own format info */
> -	info = drm_get_format_info(dev, r);
> +	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
>   
>   	for (i = 0; i < info->num_planes; i++) {
>   		unsigned int width = drm_format_info_plane_width(info, r->width, i);
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 6f72e7a0f427..8f1213ea0e16 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -159,7 +159,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>   	unsigned int i;
>   	int ret;
>   
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   	if (!info) {
>   		drm_dbg_kms(dev, "Failed to get FB format info\n");
>   		return -EINVAL;
> @@ -501,7 +502,8 @@ static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
>   {
>   	const struct drm_format_info *info;
>   
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   
>   	switch (info->format) {
>   	case DRM_FORMAT_YUV420_8BIT:
> @@ -599,7 +601,8 @@ int drm_gem_fb_afbc_init(struct drm_device *dev,
>   	int ret;
>   
>   	objs = afbc_fb->base.obj;
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   	if (!info)
>   		return -EINVAL;
>   
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 5565464c1734..dff14af68832 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -84,7 +84,8 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>   	int i;
>   
>   	fb->dev = dev;
> -	fb->format = drm_get_format_info(dev, mode_cmd);
> +	fb->format = drm_get_format_info(dev, mode_cmd->pixel_format,
> +					 mode_cmd->modifier[0]);
>   	fb->width = mode_cmd->width;
>   	fb->height = mode_cmd->height;
>   	for (i = 0; i < 4; i++) {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index fc1c5608db96..bcf7b534d1f7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -96,7 +96,9 @@ static struct drm_framebuffer *
>   exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>   		      const struct drm_mode_fb_cmd2 *mode_cmd)
>   {
> -	const struct drm_format_info *info = drm_get_format_info(dev, mode_cmd);
> +	const struct drm_format_info *info = drm_get_format_info(dev,
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>   	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
>   	struct drm_framebuffer *fb;
>   	int i;
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index 1a374702b696..c82e623a2071 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -39,7 +39,8 @@ static int psb_framebuffer_init(struct drm_device *dev,
>   	 * Reject unknown formats, YUV formats, and formats with more than
>   	 * 4 bytes per pixel.
>   	 */
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   	if (!info || !info->depth || info->cpp[0] > 4)
>   		return -EINVAL;
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 74158b9d6503..64521577b05f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -45,7 +45,9 @@ mtk_drm_mode_fb_create(struct drm_device *dev,
>   		       struct drm_file *file,
>   		       const struct drm_mode_fb_cmd2 *cmd)
>   {
> -	const struct drm_format_info *info = drm_get_format_info(dev, cmd);
> +	const struct drm_format_info *info = drm_get_format_info(dev,
> +								 cmd->pixel_format,
> +								 cmd->modifier[0]);
>   
>   	if (info->num_planes != 1)
>   		return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 09268e416843..df2f85c44d55 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -137,7 +137,8 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
>   		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd)
>   {
>   	const struct drm_format_info *info = drm_get_format_info(dev,
> -								 mode_cmd);
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>   	struct drm_gem_object *bos[4] = {0};
>   	struct drm_framebuffer *fb;
>   	int ret, i, n = info->num_planes;
> @@ -168,7 +169,8 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>   		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos)
>   {
>   	const struct drm_format_info *info = drm_get_format_info(dev,
> -								 mode_cmd);
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>   	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_kms *kms = priv->kms;
>   	struct msm_framebuffer *msm_fb = NULL;
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index c183b1112bc4..09329af9b01e 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -95,7 +95,8 @@ mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>   {
>   	const struct drm_format_info *info;
>   
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   	if (!info)
>   		return ERR_PTR(-EINVAL);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index add006fc8d81..a54c3f132c5c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -295,7 +295,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>   		kind = nvbo->kind;
>   	}
>   
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   
>   	for (i = 0; i < info->num_planes; i++) {
>   		height = drm_format_info_plane_height(info,
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 449d521c78fe..e18878068c57 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -338,7 +338,8 @@ struct drm_framebuffer *omap_framebuffer_create(struct drm_device *dev,
>   		struct drm_file *file, const struct drm_mode_fb_cmd2 *mode_cmd)
>   {
>   	const struct drm_format_info *info = drm_get_format_info(dev,
> -								 mode_cmd);
> +								 mode_cmd->pixel_format,
> +								 mode_cmd->modifier[0]);
>   	unsigned int num_planes = info->num_planes;
>   	struct drm_gem_object *bos[4];
>   	struct drm_framebuffer *fb;
> @@ -378,7 +379,8 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>   			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
>   			(char *)&mode_cmd->pixel_format);
>   
> -	format = drm_get_format_info(dev, mode_cmd);
> +	format = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				     mode_cmd->modifier[0]);
>   
>   	for (i = 0; i < ARRAY_SIZE(formats); i++) {
>   		if (formats[i] == mode_cmd->pixel_format)
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index d4a58bd679db..e3a481bbee7b 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -67,7 +67,8 @@ static int radeon_fbdev_create_pinned_object(struct drm_fb_helper *fb_helper,
>   	int height = mode_cmd->height;
>   	u32 cpp;
>   
> -	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd);
> +	info = drm_get_format_info(rdev_to_drm(rdev), mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   	cpp = info->cpp[0];
>   
>   	/* need to align pitch with crtc limits */
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index dcc1f07632c3..bf25286c7665 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -36,7 +36,8 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
>   	const struct drm_format_info *info;
>   	int ret;
>   
> -	info = drm_get_format_info(dev, mode_cmd);
> +	info = drm_get_format_info(dev, mode_cmd->pixel_format,
> +				   mode_cmd->modifier[0]);
>   	if (!info)
>   		return ERR_PTR(-ENOMEM);
>   
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 46170753699d..634c6346d947 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -134,7 +134,9 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
>   					struct drm_file *file,
>   					const struct drm_mode_fb_cmd2 *cmd)
>   {
> -	const struct drm_format_info *info = drm_get_format_info(drm, cmd);
> +	const struct drm_format_info *info = drm_get_format_info(drm,
> +								 cmd->pixel_format,
> +								 cmd->modifier[0]);
>   	struct tegra_bo *planes[4];
>   	struct drm_gem_object *gem;
>   	struct drm_framebuffer *fb;
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index c3f4405d6662..6fc08d884b80 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -309,7 +309,7 @@ const struct drm_format_info *__drm_format_info(u32 format);
>   const struct drm_format_info *drm_format_info(u32 format);
>   const struct drm_format_info *
>   drm_get_format_info(struct drm_device *dev,
> -		    const struct drm_mode_fb_cmd2 *mode_cmd);
> +		    u32 pixel_format, u64 modifier);
>   uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth);
>   uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
>   				     uint32_t bpp, uint32_t depth);

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

