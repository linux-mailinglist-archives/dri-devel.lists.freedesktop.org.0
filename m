Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F93C0146C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 15:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B9E10E8FD;
	Thu, 23 Oct 2025 13:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="h3/2VkoI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ME/7p8ou";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K/X2RGOT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IqmoN06N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F199810E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 13:13:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8327D21196;
 Thu, 23 Oct 2025 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761225198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VjyzPpbvI5fhxQYesxK6omzD3LUeRTF6x2me5bgnC6s=;
 b=h3/2VkoIvy4pRQU2gTt3fNBwV0Bpbbc6fEDrsTopCy+Oc9ygrJlyzxkj+XUv+evYCkFIsX
 XycuwAXQ7Qr3XRqgrQIrq/nrl/HVtboKu1jsbnqODHI+radDjly+yvVE9QAVk+sXSp6sdL
 AfNrxoqCJZN6Ab3GnOJxOg46wyWHjHc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761225198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VjyzPpbvI5fhxQYesxK6omzD3LUeRTF6x2me5bgnC6s=;
 b=ME/7p8ouKJM9GLK5zhVbPES1FQGzbPB+WtDCNwBbPItYzwxarZUw8UUgzdVjgfMPfWzy1b
 Yu7qcwHlW+gndTCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761225194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VjyzPpbvI5fhxQYesxK6omzD3LUeRTF6x2me5bgnC6s=;
 b=K/X2RGOTD97ojVmDnp2/TWG7VX3nK6sy3QfPe0O8Mf5iX9n6Nk297EBdyPdTc/AapSJ6o8
 Bl2axhNH1SuvJBA+cfo1A0JnrYpCZ0bUumGG8QeuE9uOq7XJiI3rrpcKofro9GX3cTLgq9
 2YxSqVAJLHedFD4negyZJ4pi5s8BNjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761225194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VjyzPpbvI5fhxQYesxK6omzD3LUeRTF6x2me5bgnC6s=;
 b=IqmoN06Nrak9Ra4aXuBALYij0axCl7XBGCZZGAeI9W8NWeYnuuI1W93KWKfSM4xXHTrj9x
 vlmNPTouyAONGzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B38713285;
 Thu, 23 Oct 2025 13:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id e0oYCeop+mjlGwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Oct 2025 13:13:14 +0000
Message-ID: <b984815e-b115-49a2-951c-e4ab8049cecc@suse.de>
Date: Thu, 23 Oct 2025 15:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/client: Add client free callback to unprepare
 fb_helper
To: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-2-tzimmermann@suse.de>
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
In-Reply-To: <20251009132006.45834-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[13]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_NONE(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Acked by Jani via irc to go through  drm-misc

Am 09.10.25 um 15:16 schrieb Thomas Zimmermann:
> Add free callback to struct drm_client_funcs. Invoke function to
> free the client memory as part of the release process. Implement
> free for fbdev emulation.
>
> Fbdev emulation allocates and prepares client memory in
> drm_fbdev_client_setup(). The release happens in fb_destroy from
> struct fb_ops. Multiple implementations of this callback exist in
> the various drivers that provide fbdev implementation. Each of them
> needs to follow the implementation details of the fbdev setup code.
>
> Adding a free callback for the client puts the unprepare and release
> of the fbdev client in a single place.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
>   drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
>   drivers/gpu/drm/drm_client.c               |  4 ++++
>   drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
>   drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
>   drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
>   drivers/gpu/drm/gma500/fbdev.c             |  3 ---
>   drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
>   drivers/gpu/drm/msm/msm_fbdev.c            |  2 --
>   drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
>   drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
>   drivers/gpu/drm/tegra/fbdev.c              |  2 --
>   include/drm/drm_client.h                   | 10 ++++++++++
>   14 files changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
> index cb53cc91bafb..22e2081bfa04 100644
> --- a/drivers/gpu/drm/armada/armada_fbdev.c
> +++ b/drivers/gpu/drm/armada/armada_fbdev.c
> @@ -28,8 +28,6 @@ static void armada_fbdev_fb_destroy(struct fb_info *info)
>   	fbh->fb->funcs->destroy(fbh->fb);
>   
>   	drm_client_release(&fbh->client);
> -	drm_fb_helper_unprepare(fbh);
> -	kfree(fbh);
>   }
>   
>   static const struct fb_ops armada_fb_ops = {
> diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
> index f894ba52bdb5..5336accab1b6 100644
> --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> @@ -13,16 +13,28 @@
>    * struct drm_client_funcs
>    */
>   
> +static void drm_fbdev_client_free(struct drm_client_dev *client)
> +{
> +	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> +
> +	drm_fb_helper_unprepare(fb_helper);
> +	kfree(fb_helper);
> +}
> +
>   static void drm_fbdev_client_unregister(struct drm_client_dev *client)
>   {
>   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
>   
>   	if (fb_helper->info) {
> +		/*
> +		 * Fully probed framebuffer device
> +		 */
>   		drm_fb_helper_unregister_info(fb_helper);
>   	} else {
> +		/*
> +		 * Partially initialized client, no framebuffer device yet
> +		 */
>   		drm_client_release(&fb_helper->client);
> -		drm_fb_helper_unprepare(fb_helper);
> -		kfree(fb_helper);
>   	}
>   }
>   
> @@ -88,6 +100,7 @@ static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_con
>   
>   static const struct drm_client_funcs drm_fbdev_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_fbdev_client_free,
>   	.unregister	= drm_fbdev_client_unregister,
>   	.restore	= drm_fbdev_client_restore,
>   	.hotplug	= drm_fbdev_client_hotplug,
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 3fa38d4ac70b..fe9c6d7083ea 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -168,6 +168,10 @@ void drm_client_release(struct drm_client_dev *client)
>   
>   	drm_client_modeset_free(client);
>   	drm_client_close(client);
> +
> +	if (client->funcs && client->funcs->free)
> +		client->funcs->free(client);
> +
>   	drm_dev_put(dev);
>   }
>   EXPORT_SYMBOL(drm_client_release);
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 8bd626ef16c7..c6196293e424 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -57,8 +57,6 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
>   	drm_client_buffer_vunmap(fb_helper->buffer);
>   	drm_client_framebuffer_delete(fb_helper->buffer);
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops drm_fbdev_dma_fb_ops = {
> @@ -92,8 +90,6 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb_info *info)
>   	drm_client_buffer_vunmap(fb_helper->buffer);
>   	drm_client_framebuffer_delete(fb_helper->buffer);
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops drm_fbdev_dma_shadowed_fb_ops = {
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index 1e827bf8b815..51573058df6f 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -65,8 +65,6 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
>   	drm_client_buffer_vunmap(fb_helper->buffer);
>   	drm_client_framebuffer_delete(fb_helper->buffer);
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops drm_fbdev_shmem_fb_ops = {
> diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
> index 85feb55bba11..ccf460fbc1f0 100644
> --- a/drivers/gpu/drm/drm_fbdev_ttm.c
> +++ b/drivers/gpu/drm/drm_fbdev_ttm.c
> @@ -53,8 +53,6 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *info)
>   	drm_client_framebuffer_delete(fb_helper->buffer);
>   
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops drm_fbdev_ttm_fb_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 93de25b77e68..a3bd21a827ad 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -42,8 +42,6 @@ static void exynos_drm_fb_destroy(struct fb_info *info)
>   	drm_framebuffer_remove(fb);
>   
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops exynos_drm_fb_ops = {
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
> index a6af21514cff..bc92fa24a1e2 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -84,9 +84,6 @@ static void psb_fbdev_fb_destroy(struct fb_info *info)
>   	drm_gem_object_put(obj);
>   
>   	drm_client_release(&fb_helper->client);
> -
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops psb_fbdev_fb_ops = {
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index 3fbdf75415cc..d5f26c8bb102 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -146,8 +146,6 @@ static void intel_fbdev_fb_destroy(struct fb_info *info)
>   	drm_framebuffer_remove(fb_helper->fb);
>   
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   __diag_push();
> diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
> index b5969374d53f..aad6fb77f0de 100644
> --- a/drivers/gpu/drm/msm/msm_fbdev.c
> +++ b/drivers/gpu/drm/msm/msm_fbdev.c
> @@ -52,8 +52,6 @@ static void msm_fbdev_fb_destroy(struct fb_info *info)
>   	drm_framebuffer_remove(fb);
>   
>   	drm_client_release(&helper->client);
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
>   }
>   
>   static const struct fb_ops msm_fb_ops = {
> diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> index 948af7ec1130..b5df2923d2a6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
> @@ -103,8 +103,6 @@ static void omap_fbdev_fb_destroy(struct fb_info *info)
>   	drm_framebuffer_remove(fb);
>   
>   	drm_client_release(&helper->client);
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
> index dc81b0c2dbff..4df6c9167bf0 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -184,8 +184,6 @@ static void radeon_fbdev_fb_destroy(struct fb_info *info)
>   	radeon_fbdev_destroy_pinned_object(gobj);
>   
>   	drm_client_release(&fb_helper->client);
> -	drm_fb_helper_unprepare(fb_helper);
> -	kfree(fb_helper);
>   }
>   
>   static const struct fb_ops radeon_fbdev_fb_ops = {
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 1b70f5e164af..91aece6f34e0 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -53,8 +53,6 @@ static void tegra_fbdev_fb_destroy(struct fb_info *info)
>   	drm_framebuffer_remove(fb);
>   
>   	drm_client_release(&helper->client);
> -	drm_fb_helper_unprepare(helper);
> -	kfree(helper);
>   }
>   
>   static const struct fb_ops tegra_fb_ops = {
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index bdd845e383ef..eecb8d6e15c7 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -28,6 +28,16 @@ struct drm_client_funcs {
>   	 */
>   	struct module *owner;
>   
> +	/**
> +	 * @free:
> +	 *
> +	 * Called when the client gets unregistered. Implementations should
> +	 * release all client-specific data and free the memory.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*free)(struct drm_client_dev *client);
> +
>   	/**
>   	 * @unregister:
>   	 *

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


