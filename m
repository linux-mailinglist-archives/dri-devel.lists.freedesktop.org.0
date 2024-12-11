Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 260439ED8CA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 22:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561D710EC28;
	Wed, 11 Dec 2024 21:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; secure) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="KMdXaTrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2024 21:40:24 UTC
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl
 [IPv6:2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E9CD10EC28
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 21:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1733952895; bh=jpWuQs4TCVzE3AWJX5bTnxbDG/l1C6uLoxMwR8YzVZM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KMdXaTrS/PNMwJajihaMsUdoElDd8Fp9EoJpegg303HpDzViXoIp/vtjTA9gOgQi4
 VUjjfPXBTYitdf8xALC1XkJsqQjFGirvO64dwgiw/fqbC3dk117wSN3aOGn+SAmjoq
 srGanuO9UkjNr799xqwJoG0EbQq0uSdl+/RbLpqxzzkAJ9F+xVPcGGQIBKz7/OmrwR
 3hYd8We1sUHpnQI/wnbX+Iy5ZmKvYeFuF0XFuV/M0z6hmoEaGg2GY/nwDg/K5YYhte
 +7ashebrqG/ArBBnKajBdB2ngfE+ANUPREC/3qp9bpBuewMZqH/CJE0PmZULtBAExP
 QrdZPQFpsgaXi33lJBlWCpxGnht7Ly3ErMr2oFAMs8mABEKLrvLwJN3gJy8EzjqKbm
 85nQormRvgiWPyIm5cucegked5ELMzhLhqoAm+s/k4ss+sXhq1skZw5CtTPdSoYuKX
 qoh+4vX6m+/fhkWSpG2UkjVB5C0NqWv7jev4u8ypkKBdoPzKVTVARBIl8vVOfgSYDF
 +Oj721eFkmEBgzBhIjx6Jkuf9Pkk+hY/25kOFi977zr9Azib+a3T1z3fzoiEHABxSs
 2fID3XWZcSkxkdKSCFqKSp2sSQsDlyRbZ1+Fq8V28LqrdeTXWxWhIX769JEXDwQ6TM
 Py+O36oJIGc6xcIIC4t4CCBg=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 85B9E16013E;
 Wed, 11 Dec 2024 22:34:55 +0100 (CET)
Message-ID: <90c892fe-e56c-49b0-b8a3-8a7d6d18fb41@ijzerbout.nl>
Date: Wed, 11 Dec 2024 22:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v9,1/6] drm/panic: Move drawing functions to drm_draw
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241204160014.1171469-2-jfalempe@redhat.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241204160014.1171469-2-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Op 04-12-2024 om 16:45 schreef Jocelyn Falempe:
> Move the color conversions, blit and fill functions to drm_draw.c,
> so that they can be re-used by drm_log.
> drm_draw is internal to the drm subsystem, and shouldn't be used by
> gpu drivers.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>
> v5:
>   * Export drm_draw symbols, so they can be used if drm_client_lib is built as module.
>
> v6:
>   * rebase and solve conflict with "drm/panic: Add ABGR2101010 support"
>
> v9:
>   * Rename drm_draw.h to drm_draw_internal.h (Jani Nikula)
>
>   drivers/gpu/drm/Kconfig             |   5 +
>   drivers/gpu/drm/Makefile            |   1 +
>   drivers/gpu/drm/drm_draw.c          | 233 +++++++++++++++++++++++++
>   drivers/gpu/drm/drm_draw_internal.h |  56 ++++++
>   drivers/gpu/drm/drm_panic.c         | 257 +++-------------------------
>   5 files changed, 318 insertions(+), 234 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_draw.c
>   create mode 100644 drivers/gpu/drm/drm_draw_internal.h
>
> [...]
> diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> new file mode 100644
> index 000000000000..cb2ad12bce57
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_draw.c
> @@ -0,0 +1,233 @@
> +[...]
> +void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
> +		     unsigned int height, unsigned int width,
> +		     u16 color)
> +{
> +	unsigned int y, x;
> +
> +	for (y = 0; y < height; y++) {
> +		for (x = 0; x < width; x++) {
> +			unsigned int off = y * dpitch + x * 3;
> +
> +			/* write blue-green-red to output in little endianness */
> +			iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
> +			iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
> +			iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
> +		}
> +	}
> +}
>
u16 is not wide enough for a 24bit color
-- 
Kees
