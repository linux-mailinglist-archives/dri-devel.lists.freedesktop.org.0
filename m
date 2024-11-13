Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723629C77E0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9FB10E72F;
	Wed, 13 Nov 2024 15:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="G9U4BFnB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFCB10E72F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731513279;
 bh=geD7iSZf4S0UxUEmT31yjxhizFB5eqxAd2X19B0iZa8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G9U4BFnB/GiAGkF+67Trt4CTS82ZmzOJoYi+mrMvU5G78gnHrOlzoPcbEqB7g37V8
 PlFQbEMp7sV4ma692YIXf+mfZG1kjA9V8jJwLS2djfJoOt+5d7z4cH8q0Ixv1Rl2/m
 PXNEPI6xi5adv4tlng6/B8IhFQJtQEt7Zc1TSwaAB8YInzaXRsrHdgc7TqYEu1z5YL
 9awrHW0q/pY/M7Gf2KPrjvuNf+2izpWPVW9jO+juCSnjOXtB6Jp974lFDaQWoLoq37
 szBTRVeU+fUVluPhGZtOqTTvly55rwwq/Qg1yXW7I8o+fRgwbeLchPzuXWViyBgvMQ
 xjaLH3f7Pd6Tg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 60C2C17E36F0;
 Wed, 13 Nov 2024 16:54:39 +0100 (CET)
Date: Wed, 13 Nov 2024 16:54:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/5] drm/panthor: Be robust against runtime PM resume
 failures in the suspend path
Message-ID: <20241113165434.2843abe7@collabora.com>
In-Reply-To: <20241113154257.1971284-3-boris.brezillon@collabora.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-3-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 13 Nov 2024 16:42:54 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> @@ -74,7 +76,8 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	 */
>  	mutex_unlock(&ptdev->unplug.lock);
>  
> -	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> +	ret = pm_runtime_get_sync(ptdev->base.dev);
> +	drm_WARN_ON(&ptdev->base, ret < 0);
>  
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
> @@ -85,7 +88,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	panthor_gpu_unplug(ptdev);
>  
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> -	pm_runtime_put_sync_suspend(ptdev->base.dev);
> +
> +	/* If the resume failed, we don't need to suspend here. */
> +	if (!ret)
> +		pm_runtime_put_sync_suspend(ptdev->base.dev);

Okay, I always get confused by pm_runtime_get_sync(). Turns out the
refcount is incremented even if pm_runtime_get_sync() fails, so we
should call pm_runtime_put_sync_suspend() unconditionally here.
