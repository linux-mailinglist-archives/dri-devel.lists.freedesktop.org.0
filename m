Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA99B4A73
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 14:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE57A10E262;
	Tue, 29 Oct 2024 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aGM1KrZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CA310E262
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730206892;
 bh=77VPiqN6kINGku2BeJcX3ZcjNS93IWLEBLl2XeaOOn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aGM1KrZ5kGsMwAedCTtrHIqZ8CECe3MCA5++0Wg01NTCVdQLUd+XkYS1t0ZhAxpu0
 73QbWOaIcWj5DYwVdy984cfjE5qu+sHyiAT3R1qVSGPfP8onQ3GxaCxc12Avm+vzr2
 p8tRCvl6VTV6IG5G2WtKr1+6z1h38f9XOzQjqQ/EBr9ZvAk+KXo60iPLBgFfk45t+f
 Zi09v5OERn8f9bwx3kGlJhdSqbi78NyZa9tysnvq42BQHqOf0vZ0D4TAil+o8NQl+D
 rX7tWXi1lWTYG2/8R+egrqswevlhzUVqCqBzJfD5Jr0DDHL5yCtnmBz0YkdIf039xW
 9xbRlcurxbYQw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 716E917E35FA;
 Tue, 29 Oct 2024 14:01:32 +0100 (CET)
Date: Tue, 29 Oct 2024 14:01:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: use defines for sync flags
Message-ID: <20241029140125.0607c26f@collabora.com>
In-Reply-To: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
References: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
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

On Tue, 29 Oct 2024 10:46:29 +0100
Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:

> Enums are always signed, and assigning 1u << 31 to it invokes
> implementation defined behavior. It's not a great idea to depend on this
> in the UAPI, and it turns out no other UAPI does either.
> 
> So let's do what other UAPI does, and use defines instead. This way we
> won't get unexpected issues if compiling user-space with a compiler with
> a different implementation-defined behavior here.

Can we do the same for all flag definitions in this header
(drm_panthor_vm_bind_op_flags, drm_panthor_vm_bind_flags,
drm_panthor_bo_flags and drm_panthor_group_state_flags) to keep things
consistent, and avoid the same situation when we reach the last bit on
those too?

> ---
>  include/uapi/drm/panthor_drm.h | 44 +++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 87c9cb555dd1d..a2e348f901376 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -209,27 +209,39 @@ struct drm_panthor_obj_array {
>  	{ .stride = sizeof((ptr)[0]), .count = (cnt), .array = (__u64)(uintptr_t)(ptr) }
>  
>  /**
> - * enum drm_panthor_sync_op_flags - Synchronization operation flags.
> + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK
> + *
> + * Synchronization handle type mask.
>   */
> -enum drm_panthor_sync_op_flags {
> -	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization handle type mask. */
> -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
> +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK              0xff
>  
> -	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ: Synchronization object type. */
> -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
> +/**
> + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ
> + *
> + * Synchronization object type.
> + */
> +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ           0
>  
> -	/**
> -	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ: Timeline synchronization
> -	 * object type.
> -	 */
> -	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
> +/**
> + * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ
> + *
> + * Timeline synchronization object type.
> + */
> +#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ  1
>  
> -	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> -	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
> +/**
> + * DRM_PANTHOR_SYNC_OP_WAIT
> + *
> + * Wait operation.
> + */
> +#define DRM_PANTHOR_SYNC_OP_WAIT    (0 << 31)
>  
> -	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> -	DRM_PANTHOR_SYNC_OP_SIGNAL = (int)(1u << 31),
> -};
> +/**
> + * DRM_PANTHOR_SYNC_OP_SIGNAL
> + *
> + * Signal operation.
> + */
> +#define DRM_PANTHOR_SYNC_OP_SIGNAL  (1u << 31)
>  
>  /**
>   * struct drm_panthor_sync_op - Synchronization operation.

