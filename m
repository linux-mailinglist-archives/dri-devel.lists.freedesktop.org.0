Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE60B0DEA7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 16:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1010E19E;
	Tue, 22 Jul 2025 14:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d0FqbdSG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tPLgTgax";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dJwwtp5g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NFsJE0Xm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DD910E19E
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 14:31:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C473C1F7CA;
 Tue, 22 Jul 2025 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753194704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pHYWfw/m4PTgtfW0+QFjAYnrHgL2x5x4Pyqks+qkPFw=;
 b=d0FqbdSGTevG2TN5pFlZQ90qZQVxnWGmi2Kki8EG3xPOrCkz2vlbWDuYMuLXh8nv5v9Bbl
 YKJSgfSUETV96WfXAWoHhPhj7rFrkMa7j0TP9PJEu6S8jMaD0GZ7gaUfEaNfp+u9tvx/4G
 CpHuZVcIihh9R5CeiFPNVX98YlSaepc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753194704;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pHYWfw/m4PTgtfW0+QFjAYnrHgL2x5x4Pyqks+qkPFw=;
 b=tPLgTgax3LeXBBkXg9iEQPrMJB3h/CfOdXw+PLKNlO4tTZNje/emJWwhXhXuLWjDjnTzgM
 AMk1Gx6IB2CrTVAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1753194703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pHYWfw/m4PTgtfW0+QFjAYnrHgL2x5x4Pyqks+qkPFw=;
 b=dJwwtp5g79JNBn/H92bwLSKHeZ5EESnXnsWaJYELSHg87c2tYbQOnt1IBmiY6VFW1TY6Wo
 oGdwla49Ywg37F66GwL2pwbFUL5rHzIp42qR4xv2h5YNyJ0pSt4XcWeFcrWXgl+zJMmXVh
 dwQ1JzwU3R+W3io8D2zUdEgboe7SR18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1753194703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pHYWfw/m4PTgtfW0+QFjAYnrHgL2x5x4Pyqks+qkPFw=;
 b=NFsJE0XmnNsSFy7n4DiRUhNWmw8m6YfuzN3qz2jpzG3lKf1kQTwEXCXvd0Y8EdSFTOMcKN
 5D2r6hx/O/3i3uBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 10493132EA;
 Tue, 22 Jul 2025 14:31:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 13/rAc+gf2i7KAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Jul 2025 14:31:43 +0000
Message-ID: <5e569f5a-61b3-40ec-b320-dc1dc69e2413@suse.de>
Date: Tue, 22 Jul 2025 16:31:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/udl: add noblocking dirtyfb support
To: oushixiong1025@163.com, Dave Airlie <airlied@redhat.com>
Cc: Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250722102912.2256895-1-oushixiong1025@163.com>
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
In-Reply-To: <20250722102912.2256895-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_TLS_ALL(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_TO(0.00)[163.com,redhat.com];
 MID_RHS_MATCH_FROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[poorly.run,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,kylinos.cn];
 RCPT_COUNT_SEVEN(0.00)[10]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

Am 22.07.25 um 12:29 schrieb oushixiong1025@163.com:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> [WHY]
> The DIRTYFB IOCTL is blocking by default. In multi-GPU setups, this
> may rate-limit the Primary GPU if the UDL handles damage too slowly.
> For example, in a cloud virtual desktop environment, when a USB
> DisplayLink device is connected to the client, the primary screen's
> refresh rate may significantly degrade. This occurs because the DIRTYFB
> operations must first be transmitted over the network (to the remote host)
> before the actual USB display commands can be executed.
>
> [HOW]
> Add non-blocking DIRTYFB support for UDL as an optional feature.
> Move udl_handle_damage() to a dedicated kthread, and try to merge damage regions
> before processing to prevent display content from lagging behind the latest
> data too much.
>
> In my cloud desktop system environment, the udl_handle_damage() takes up to
> dozens of milliseconds. After using this optional feature, the desktop display
> becomes smoother and more responsive.

Display updates serve as a rate limiter to desktop environments. Take 
away the blocking and your desktop will easily push large amounts of 
updates to the driver without waiting for earlier updates to finish. 
We've especially seen this on virtual gpus with little overhead from I/O 
writes. I've sent out a series to fix that, see 
https://patchwork.freedesktop.org/series/149887/ . This probably first 
needs to be reviewed and prove itself in practice.

The other big problem is that we have a number of drivers with such 
damage threads. Usually all hardware on the slow, serial busses is 
affected. IIRC they usually have issues with lifetime of the involved 
buffers or need extra memcpys. It's time to integrate this into DRM 
helpers and solve the issues for all drivers.

Hence, a soft-NAK until these underlying problems have been addressed.

Best regards
Thomas

>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/udl/udl_drv.c     |   4 +
>   drivers/gpu/drm/udl/udl_drv.h     |  16 ++++
>   drivers/gpu/drm/udl/udl_main.c    |  41 ++++++++++
>   drivers/gpu/drm/udl/udl_modeset.c | 132 ++++++++++++++++++++++++++++++
>   4 files changed, 193 insertions(+)
>
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 1506094..c2fc4b3 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -17,6 +17,10 @@
>   
>   #include "udl_drv.h"
>   
> +int udl_noblocking_damage;
> +MODULE_PARM_DESC(noblocking_damage, "Noblocking damage (1 = enabled, 0 = disabled(default))");
> +module_param_named(noblocking_damage, udl_noblocking_damage, int, 0444);
> +
>   static int udl_usb_suspend(struct usb_interface *interface,
>   			   pm_message_t message)
>   {
> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
> index 282ebd6..6ed4346 100644
> --- a/drivers/gpu/drm/udl/udl_drv.h
> +++ b/drivers/gpu/drm/udl/udl_drv.h
> @@ -21,6 +21,8 @@
>   #include <drm/drm_framebuffer.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_plane.h>
> +#include <linux/list.h>
> +#include <linux/spinlock.h>
>   
>   struct drm_mode_create_dumb;
>   
> @@ -34,6 +36,13 @@ struct drm_mode_create_dumb;
>   
>   struct udl_device;
>   
> +struct damage_work_node {
> +	struct drm_framebuffer *fb;
> +	struct drm_rect *clip;
> +
> +	struct list_head list;
> +};
> +
>   struct urb_node {
>   	struct list_head entry;
>   	struct udl_device *dev;
> @@ -74,10 +83,17 @@ struct udl_device {
>   	int sku_pixel_limit;
>   
>   	struct urb_list urbs;
> +
> +
> +	struct list_head	damage_queue;
> +	spinlock_t		damage_lock;
> +	struct work_struct	damage_work;
>   };
>   
>   #define to_udl(x) container_of(x, struct udl_device, drm)
>   
> +extern int udl_noblocking_damage;
> +
>   static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
>   {
>   	return interface_to_usbdev(to_usb_interface(udl->drm.dev));
> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
> index 3ebe2ce..3de1a06 100644
> --- a/drivers/gpu/drm/udl/udl_main.c
> +++ b/drivers/gpu/drm/udl/udl_main.c
> @@ -9,6 +9,7 @@
>    */
>   
>   #include <drm/drm.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -348,10 +349,50 @@ err:
>   	return ret;
>   }
>   
> +static void udl_free_damage_queue(struct drm_device *dev)
> +{
> +	struct udl_device *udl = to_udl(dev);
> +	struct list_head *entry, *tmp;
> +	struct drm_gem_object *obj;
> +	unsigned long flags;
> +	int i;
> +
> +	if (!udl_noblocking_damage)
> +		return;
> +
> +	udl_noblocking_damage = false;
> +
> +	spin_lock_irqsave(&udl->damage_lock, flags);
> +
> +	list_for_each_safe(entry, tmp, &udl->damage_queue) {
> +		struct damage_work_node *damage;
> +
> +		damage = list_entry(entry, struct damage_work_node, list);
> +		if (damage == NULL)
> +			continue;
> +		list_del(&damage->list);
> +
> +		for (i = 0; i < damage->fb->format->num_planes; ++i) {
> +			obj = drm_gem_fb_get_obj(damage->fb, i);
> +			if (obj)
> +				drm_gem_object_put(obj);
> +		}
> +
> +		drm_framebuffer_put(damage->fb);
> +
> +		kfree(damage->clip);
> +		kfree(damage);
> +	}
> +
> +	spin_unlock_irqrestore(&udl->damage_lock, flags);
> +}
> +
> +
>   int udl_drop_usb(struct drm_device *dev)
>   {
>   	struct udl_device *udl = to_udl(dev);
>   
> +	udl_free_damage_queue(dev);
>   	udl_free_urb_list(dev);
>   	put_device(udl->dmadev);
>   	udl->dmadev = NULL;
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 5a15399..a4a4c4b 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -261,6 +261,124 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
>   	DRM_FORMAT_MOD_INVALID
>   };
>   
> +static void udl_damage_work_func(struct work_struct *work)
> +{
> +	struct udl_device *udl = container_of(work, struct udl_device, damage_work);
> +	struct drm_gem_object *obj;
> +	unsigned long flags;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!list_empty(&udl->damage_queue)) {
> +		struct damage_work_node *damage;
> +
> +		spin_lock_irqsave(&udl->damage_lock, flags);
> +
> +		damage = list_first_entry(&udl->damage_queue,
> +					  struct damage_work_node, list);
> +		list_del(&damage->list);
> +		spin_unlock_irqrestore(&udl->damage_lock, flags);
> +
> +		if (damage->clip && damage->fb) {
> +			struct iosys_map map[DRM_FORMAT_MAX_PLANES];
> +
> +			ret = drm_gem_fb_vmap(damage->fb, map, NULL);
> +			if (ret) {
> +				DRM_ERROR("vmap damage fb error %d\n", ret);
> +				goto free;
> +			}
> +
> +			udl_handle_damage(damage->fb, &map[0], damage->clip);
> +			drm_gem_fb_vunmap(damage->fb, map);
> +
> +free:
> +			for (i = 0; i < damage->fb->format->num_planes; ++i) {
> +				obj = drm_gem_fb_get_obj(damage->fb, i);
> +				if (obj)
> +					drm_gem_object_put(obj);
> +			}
> +
> +			drm_framebuffer_put(damage->fb);
> +
> +			kfree(damage->clip);
> +			kfree(damage);
> +		}
> +	}
> +}
> +
> +void udl_damage_merged(const struct drm_rect *rect, struct drm_rect *dst_rect)
> +{
> +	dst_rect->x1 = min(dst_rect->x1, rect->x1);
> +	dst_rect->y1 = min(dst_rect->y1, rect->y1);
> +	dst_rect->x2 = max(dst_rect->x2, rect->x2);
> +	dst_rect->y2 = max(dst_rect->y2, rect->y2);
> +}
> +
> +static void udl_queue_damage_work(struct udl_device *udl, struct drm_framebuffer *fb,
> +				  const struct drm_rect *clip)
> +{
> +	struct list_head *entry, *tmp;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&udl->damage_lock, flags);
> +
> +	/* Just merge the damage if the same framebuffer damage is already queued */
> +	list_for_each_safe(entry, tmp, &udl->damage_queue) {
> +		struct damage_work_node *dirty_work;
> +
> +		dirty_work = list_entry(entry, struct damage_work_node, list);
> +		if (dirty_work == NULL)
> +			continue;
> +
> +		if (dirty_work->fb == fb) {
> +			/* Merged clips */
> +			udl_damage_merged(clip, dirty_work->clip);
> +			spin_unlock_irqrestore(&udl->damage_lock, flags);
> +
> +			return;
> +		}
> +	}
> +
> +	struct damage_work_node *new_work;
> +	struct drm_rect *new_damage;
> +
> +	new_work = kzalloc(sizeof(*new_work), GFP_KERNEL);
> +	if (!new_work)
> +		goto err;
> +
> +	new_damage = kzalloc(sizeof(*new_damage), GFP_KERNEL);
> +	if (!new_damage)
> +		goto free_work;
> +
> +	memcpy(new_damage, clip, sizeof(*clip));
> +
> +	new_work->fb = fb;
> +	new_work->clip = new_damage;
> +	drm_framebuffer_get(fb);
> +
> +	struct drm_gem_object *obj;
> +	unsigned int i;
> +
> +	for (i = 0; i < fb->format->num_planes; ++i) {
> +		obj = drm_gem_fb_get_obj(fb, i);
> +		if (obj)
> +			drm_gem_object_get(obj);
> +	}
> +
> +	/* Queue a new damage request */
> +	list_add_tail(&new_work->list, &udl->damage_queue);
> +	spin_unlock_irqrestore(&udl->damage_lock, flags);
> +
> +	schedule_work(&udl->damage_work);
> +
> +	return;
> +
> +free_work:
> +	kfree(new_work);
> +err:
> +	spin_unlock_irqrestore(&udl->damage_lock, flags);
> +}
> +
>   static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   						   struct drm_atomic_state *state)
>   {
> @@ -276,6 +394,14 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	if (!fb)
>   		return; /* no framebuffer; plane is disabled */
>   
> +	if (udl_noblocking_damage) {
> +		struct udl_device *udl = to_udl(dev);
> +
> +		drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage);
> +		udl_queue_damage_work(udl, fb, &damage);
> +		return;
> +	}
> +
>   	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>   	if (ret)
>   		return;
> @@ -600,5 +726,11 @@ int udl_modeset_init(struct drm_device *dev)
>   
>   	drm_mode_config_reset(dev);
>   
> +	if (udl_noblocking_damage) {
> +		INIT_LIST_HEAD(&udl->damage_queue);
> +		spin_lock_init(&udl->damage_lock);
> +		INIT_WORK(&udl->damage_work, udl_damage_work_func);
> +	}
> +
>   	return 0;
>   }

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

