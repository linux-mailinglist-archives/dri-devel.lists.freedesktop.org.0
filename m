Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E13390824
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F02E6EA94;
	Tue, 25 May 2021 17:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD7789FA5;
 Tue, 25 May 2021 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Subject:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zmoLsFOrzQDEdiV5XVjjW7fW8PfWEsE+4/phaTnnNd4=; b=XF5ttKXYKr1qN7YE0Frd4A+b3i
 efyuHSAnRS6oyytUeN0cM+PV1Rbrvb1PVxK165Z2Dyf48pucFlicJMryShYcnXZ6PWWhGYjwf5h45
 zsQQvpAs2XP0WOvbIhuuCY+A2T3KVPGpKYMPhdZEcYdunZlOF4cYkqY2aiFCUSQq57OTAU12jsHVK
 6UIdLmlKTK6liXp+tNiASQEJ05ZAGwzzO+FkySlqQZjlWWeBQeoL28BsyJXRdPS0+txcPsbZ47YIf
 KX5p4Z5J2MjwKDPbKaZoITp1B4P0pSAJ/iQ01wm/AwMBL2cwfApNBwXkLm2XCR/qnro8KsS0oH55J
 8dAcOdWQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=64708)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1llbA9-0003uA-GQ; Tue, 25 May 2021 19:48:17 +0200
To: daniel.vetter@ffwll.ch
References: <20210521090959.1663703-10-daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/11] drm/simple-helper:
 drm_gem_simple_display_pipe_prepare_fb as default
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9d855dc6-5825-4666-6d70-e5f3f880c592@tronnes.org>
Date: Tue, 25 May 2021 19:48:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-10-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
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
Cc: airlied@linux.ie, daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> It's tedious to review this all the time, and my audit showed that
> arcpgu actually forgot to set this.
>
> Make this the default and stop worrying.
>
> Again I sprinkled WARN_ON_ONCE on top to make sure we don't have
> strange combinations of hooks: cleanup_fb without prepare_fb doesn't
> make sense, and since simpler drivers are all new they better be GEM
> based drivers.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++--
>  include/drm/drm_simple_kms_helper.h     |  7 +++++--
>  2 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c
b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 0b095a313c44..1a97571d97d9 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -9,6 +9,8 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -225,8 +227,14 @@ static int drm_simple_kms_plane_prepare_fb(struct
drm_plane *plane,
>  	struct drm_simple_display_pipe *pipe;
>
>  	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
> -	if (!pipe->funcs || !pipe->funcs->prepare_fb)
> -		return 0;
> +	if (!pipe->funcs || !pipe->funcs->prepare_fb) {
> +		if (WARN_ON_ONCE(drm_core_check_feature(plane->dev, DRIVER_GEM)))

Shouldn't this check be inverted? Looks like it warns on GEM drivers.

With that considered:

Acked-by: Noralf Trønnes <noralf@tronnes.org>

Hopefully this reply will thread correctly, I had to reply from lore (I
wasn't cc'ed) and I don't know if Thunderbird sets In-Reply-To. I'm not
subscribed to dri-devel anymore since I'm winding down my Linux work and
dri-devel is such a high volume list.

Noralf

> +			return 0;
> +
> +		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
> +
> +		return drm_gem_simple_display_pipe_prepare_fb(pipe, state);
> +	}
>
>  	return pipe->funcs->prepare_fb(pipe, state);
>  }
