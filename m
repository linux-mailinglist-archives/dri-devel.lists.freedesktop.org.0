Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99EA07E93
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 18:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F37F10EEB3;
	Thu,  9 Jan 2025 17:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="h/D1DK2/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB3210EEEB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 17:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736443057; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FMpUXLC1XrWffqWGQYxHhGkgkmqBZu2gQwKEDs/gaU/44dE8/dvRMyn0JjmL1XBMFzw10N7VgX2WqMq8h0Pwy27iPJEQ7OZsPZsD4Z4IHU2dtvYwIL3PG1hJ43hGUct9w2+Nt2TswFk0Hf3EwFSF1YcLyNirEm13t1877ztmtsc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736443057;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+yG4OPAZpwIkncDT1rYy9OAueHzOXEav9rjjTgZquuo=; 
 b=f/SVc2ZysbCWixcukR+OmomYl5cUBboXuvbEt9BjaDjcb6hlHcaU8Zuu+8fK5+OkFWX0d5bXF81PB9CRZmrBZ2EhU0ajMTl93KEZhlIBCDMt7mG93XJAyMYsK+VVXiXb6gbcq7I9DMfGLX9HFwYHpH08gfbkSPQGNztLRNgEFDs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736443057; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=+yG4OPAZpwIkncDT1rYy9OAueHzOXEav9rjjTgZquuo=;
 b=h/D1DK2/sEp3O4fYtPnOcu6U7Qt2MZ/NFxcO3KiGLsuKYXpP1GnPRjG+K8SxqTbb
 Fsx/C3z9hGYki0tV5S24WzXgWVHyivk+jPE2DJiGgWdT2LBEec/tvYJSrFwF9f+fZvy
 TxjTtErNOvO4FbW9oyEyjoEA/boTP/cFfs/glKok=
Received: by mx.zohomail.com with SMTPS id 1736443055727574.1082045890414;
 Thu, 9 Jan 2025 09:17:35 -0800 (PST)
Date: Thu, 9 Jan 2025 17:17:31 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] drm/file: Add driver-specific memory region key
 printing helper
Message-ID: <x5ywvy7nimvbdhuag67zrex6tjvkx2qzmepziyh2uj5fxpomjy@mpbxdpsjg6hf>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
 <20250108210259.647030-3-adrian.larumbe@collabora.com>
 <a4775792-f193-4694-82c2-c5c4c13e3cea@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4775792-f193-4694-82c2-c5c4c13e3cea@ursulin.net>
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

On 09.01.2025 13:05, Tvrtko Ursulin wrote:
> On 08/01/2025 21:02, Adrián Larumbe wrote:
> > This is motivated by the desire of some dirvers (eg. Panthor) to print the
> > size of internal memory regions with a prefix that reflects the driver
> > name, as suggested in the previous documentation commit.
> > 
> > That means a minor refactoring of print_size() was needed so as to make it
> > more generic in the format of key strings it takes as input.
> > 
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > ---
> >   drivers/gpu/drm/drm_file.c | 60 +++++++++++++++++++++++++++++++++-----
> >   include/drm/drm_file.h     |  2 ++
> >   2 files changed, 54 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index cb5f22f5bbb6..5deae4cffa79 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -830,8 +830,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
> >   }
> >   EXPORT_SYMBOL(drm_send_event);
> > -static void print_size(struct drm_printer *p, const char *stat,
> > -		       const char *region, u64 sz)
> > +static void print_size(struct drm_printer *p, const char *key, u64 sz)
> >   {
> >   	const char *units[] = {"", " KiB", " MiB"};
> >   	unsigned u;
> > @@ -842,9 +841,54 @@ static void print_size(struct drm_printer *p, const char *stat,
> >   		sz = div_u64(sz, SZ_1K);
> >   	}
> > -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> > +	drm_printf(p, "%s:\t%llu%s\n", key, sz, units[u]);
> >   }
> > +#define KEY_LEN 1024
> > +#define DRM_PREFIX "drm"
> > +
> > +static void
> > +print_size_region(struct drm_printer *p, const char *stat,
> > +		  const char *region, u64 sz)
> > +{
> > +	char key[KEY_LEN+1] = {0};
> 
> A kilobyte of stack makes me a bit uneasy.
> 
> Would it not work to make print_size take a prefix and also avoid string
> operations? Something like, not compile tested:

This looks good to me, I had insisted we mandate a maximum key length, but
like you said on IRC there's truly no need for this.

> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 2289e71e2fa2..efa4593babbc 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct
> drm_pending_event *e)
>  }
>  EXPORT_SYMBOL(drm_send_event);
> 
> -static void print_size(struct drm_printer *p, const char *stat,
> -		       const char *region, u64 sz)
> +static void
> +drm_fdinfo_print_size(struct drm_printer *p,
> +		      const char *prefix,
> +		      const char *stat,
> +		      const char *region,
> +		      u64 sz)
>  {
>  	const char *units[] = {"", " KiB", " MiB"};
>  	unsigned u;
> @@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char
> *stat,
>  		sz = div_u64(sz, SZ_1K);
>  	}
> 
> -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> +	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
> +		   prefix, stat, region, sz, units[u]);
>  }
> +EXPORT_SYMBOL(drm_fdinfo_print_size);
> 
>  int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
>  {
> @@ -868,17 +874,23 @@ void drm_print_memory_stats(struct drm_printer *p,
>  			    enum drm_gem_object_status supported_status,
>  			    const char *region)
>  {
> -	print_size(p, "total", region, stats->private + stats->shared);
> -	print_size(p, "shared", region, stats->shared);
> +	const char *prefix = "drm";
> +
> +	drm_fdinfo_print_size(p, prefix, "total", region,
> +			      stats->private + stats->shared);
> +	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
> 
>  	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
> -		print_size(p, "active", region, stats->active);
> +		drm_fdinfo_print_size(p, prefix, "active", region,
> +				      stats->active);
> 
>  	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> -		print_size(p, "resident", region, stats->resident);
> +		drm_fdinfo_print_size(p, prefix, "resident", region,
> +				      stats->resident);
> 
>  	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> -		print_size(p, "purgeable", region, stats->purgeable);
> +		drm_fdinfo_print_size(p, prefix, "purgeable", region,
> +				      stats->purgeable);
>  }
>  EXPORT_SYMBOL(drm_print_memory_stats);
> 
> ?
> 
> Regards,
> 
> Tvrtko
> 
> > +
> > +	if (strnlen(stat, KEY_LEN) + strnlen(region, KEY_LEN) +
> > +	    strlen(DRM_PREFIX) + 2 > KEY_LEN)
> > +		return;
> > +
> > +	snprintf(key, sizeof(key), "%s-%s-%s", DRM_PREFIX, stat, region);
> > +	print_size(p, key, sz);
> > +}
> > +
> > +/**
> > + * drm_driver_print_size - A helper to print driver-specific k:v pairs
> > + * @p: The printer to print output to
> > + * @file: DRM file private data
> > + * @subkey: Name of the key minus the driver name
> > + * @sz: Size value expressed in bytes
> > + *
> > + * Helper to display key:value pairs where the value is a numerical
> > + * size expressed in bytes. It's useful for driver-internal memory
> > + * whose objects aren't exposed to UM through a DRM handle.
> > + */
> > +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> > +			   const char *subkey, u64 sz)
> > +{
> > +	char key[KEY_LEN+1] = {0};
> > +	char *drv_name = file->minor->dev->driver->name;
> > +
> > +	if (strnlen(subkey, KEY_LEN) + strlen(drv_name) + 1 > KEY_LEN)
> > +		return;
> > +
> > +	snprintf(key, sizeof(key), "%s-%s", drv_name, subkey);
> > +	print_size(p, key, sz);
> > +}
> > +EXPORT_SYMBOL(drm_driver_print_size);
> > +
> > +#undef DRM_PREFIX
> > +#undef KEY_LEN
> > +
> >   /**
> >    * drm_print_memory_stats - A helper to print memory stats
> >    * @p: The printer to print output to
> > @@ -858,15 +902,15 @@ void drm_print_memory_stats(struct drm_printer *p,
> >   			    enum drm_gem_object_status supported_status,
> >   			    const char *region)
> >   {
> > -	print_size(p, "total", region, stats->private + stats->shared);
> > -	print_size(p, "shared", region, stats->shared);
> > -	print_size(p, "active", region, stats->active);
> > +	print_size_region(p, "total", region, stats->private + stats->shared);
> > +	print_size_region(p, "shared", region, stats->shared);
> > +	print_size_region(p, "active", region, stats->active);
> >   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> > -		print_size(p, "resident", region, stats->resident);
> > +		print_size_region(p, "resident", region, stats->resident);
> >   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> > -		print_size(p, "purgeable", region, stats->purgeable);
> > +		print_size_region(p, "purgeable", region, stats->purgeable);
> >   }
> >   EXPORT_SYMBOL(drm_print_memory_stats);
> > diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> > index f0ef32e9fa5e..07da14859289 100644
> > --- a/include/drm/drm_file.h
> > +++ b/include/drm/drm_file.h
> > @@ -494,6 +494,8 @@ struct drm_memory_stats {
> >   enum drm_gem_object_status;
> > +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> > +			   const char *subkey, u64 sz);
> >   void drm_print_memory_stats(struct drm_printer *p,
> >   			    const struct drm_memory_stats *stats,
> >   			    enum drm_gem_object_status supported_status,

Adrian Larumbe
