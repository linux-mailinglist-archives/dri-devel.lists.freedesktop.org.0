Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2B5A01EF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6843C0B6D;
	Wed, 24 Aug 2022 19:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D92210EBB7;
 Fri, 19 Aug 2022 12:09:43 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M8LCq036XzDqQV;
 Fri, 19 Aug 2022 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660910983; bh=9cwGMHOsNRV2uhRdBLv9sLSuJU9oN50Ds7VYSnAqNRc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mH9bxOjdoxuuwUvcC5Booki15a6iW1tXCcs80GiuNQmU8IHDWvhc4SfoUCWgK8hR7
 LV7nsj3oHVWfcGUO0HkSb4ZzP6RIUcphF+d/lYDDWR9I8qjZmgTcUA+7KnmOOvCK0h
 CejOzoi7ZcMyDsQlYuL6r9toQliCNPYSG5yf6kOQ=
X-Riseup-User-ID: EA3B723C754A555E31C1C4ABAFCA6390C26885C1138CD032412A1731A3CA81F1
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M8LCn6GrLz5vcM;
 Fri, 19 Aug 2022 12:09:41 +0000 (UTC)
Message-ID: <71908f5f-6abc-9c9a-8c9a-96af84aa4c75@riseup.net>
Date: Fri, 19 Aug 2022 09:09:38 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] drm: Use original src rect while initializing damage
 iterator
Content-Language: en-US
To: =?UTF-8?Q?Jouni_H=c3=b6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20220715134958.2605746-1-jouni.hogander@intel.com>
 <20220715134958.2605746-2-jouni.hogander@intel.com>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220715134958.2605746-2-jouni.hogander@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Jouni,

On 7/15/22 10:49, Jouni Högander wrote:
> drm_plane_state->src might be modified by the driver. This is done
> e.g. in i915 driver when there is bigger framebuffer than the plane
> and there is some offset within framebuffer. I915 driver calculates
> separate offset and adjusts src rect coords to be relative to this
> offset. Damage clips are still relative to original src coords
> provided by user-space.
> 
> This patch ensures original coordinates provided by user-space are
> used when initiliazing damage iterator.
> 

drm_damage_helper has some KUnit tests on drivers/gpu/drm/tests, and by
applying this patch the drm_damage_helper tests started to fail. Could
you also refactor the drm_damage_helper tests?

To run the tests, you can run:
$ ./tools/testing/kunit/kunit.py run \
--kunitconfig=drivers/gpu/drm/tests \
--kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y \
--kconfig_add CONFIG_VIRTIO_UML=y

There is also some documentation on the DRM KUnit Tests on [1].

[1] https://docs.kernel.org/gpu/drm-internals.html#unit-testing

Best Regards,
- Maíra Canal

> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>> ---
>  drivers/gpu/drm/drm_damage_helper.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> index 937b699ac2a8..d8b2955e88fd 100644
> --- a/drivers/gpu/drm/drm_damage_helper.c
> +++ b/drivers/gpu/drm/drm_damage_helper.c
> @@ -224,6 +224,7 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
>  				   const struct drm_plane_state *old_state,
>  				   const struct drm_plane_state *state)
>  {
> +	struct drm_rect src;
>  	memset(iter, 0, sizeof(*iter));
>  
>  	if (!state || !state->crtc || !state->fb || !state->visible)
> @@ -233,10 +234,12 @@ drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
>  	iter->num_clips = drm_plane_get_damage_clips_count(state);
>  
>  	/* Round down for x1/y1 and round up for x2/y2 to catch all pixels */
> -	iter->plane_src.x1 = state->src.x1 >> 16;
> -	iter->plane_src.y1 = state->src.y1 >> 16;
> -	iter->plane_src.x2 = (state->src.x2 >> 16) + !!(state->src.x2 & 0xFFFF);
> -	iter->plane_src.y2 = (state->src.y2 >> 16) + !!(state->src.y2 & 0xFFFF);
> +	src = drm_plane_state_src(state);
> +
> +	iter->plane_src.x1 = src.x1 >> 16;
> +	iter->plane_src.y1 = src.y1 >> 16;
> +	iter->plane_src.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
> +	iter->plane_src.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
>  
>  	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
>  		iter->clips = NULL;
