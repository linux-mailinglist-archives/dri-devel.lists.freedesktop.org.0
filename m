Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4153C9B467D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 11:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B9F10E095;
	Tue, 29 Oct 2024 10:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62A0410E095
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 10:15:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F88513D5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 03:16:11 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3B193F528
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 03:15:41 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:15:39 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: use defines for sync flags
Message-ID: <ZyC1y1dSh1sgalLL@e110455-lin.cambridge.arm.com>
References: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
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

On Tue, Oct 29, 2024 at 10:46:29AM +0100, Erik Faye-Lund wrote:
> Enums are always signed, and assigning 1u << 31 to it invokes
> implementation defined behavior. It's not a great idea to depend on this
> in the UAPI, and it turns out no other UAPI does either.
> 
> So let's do what other UAPI does, and use defines instead. This way we
> won't get unexpected issues if compiling user-space with a compiler with
> a different implementation-defined behavior here.

You're missing the signoff.

Best regards,
Liviu

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
> -- 
> 2.45.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
