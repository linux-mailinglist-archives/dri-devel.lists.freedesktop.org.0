Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F8DA2CA4B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753BD10EB89;
	Fri,  7 Feb 2025 17:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="exoVW02j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D98C10EB92
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1738949815;
 bh=fcpm8zPo3t6of/QhUdAYAl07owRMtxY3+gOrEtI6YWw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=exoVW02jeexZbuX6mheZygHMwFFf+/EVtzbAUB74lRSEEJFBEYxPjYKEDzndF5JDY
 X1k8Z9+gNFuw6g7TiNF0RjWtkJvyMkB3zBgO+g76aYEECEz7SZt44mSps9XppaAwiO
 6Bi/H8XlfziQ64dS7BCZa+q8lM4HICX4/LiLh+68X0ZgGfnAdUiJN+yuo2HGSrGEjK
 OV/v/0pnyoEDH+ElvroIgHM3Yc+2/lvucEBAyttMIB4SfeXK4MQ52qAAlElY/b01rz
 PqNRMtI/iGM0U5DNp1l9vPGdXiDVa4rl0Bp8MoVIblLppA8pcEb/48bDeuHOE1PeyD
 Usc5bfC34ASKQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FDB217E02AF;
 Fri,  7 Feb 2025 18:36:55 +0100 (CET)
Date: Fri, 7 Feb 2025 18:36:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Beata
 Michalska <beata.michalska@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
Message-ID: <20250207183647.2bc1e5ed@collabora.com>
In-Reply-To: <20250204232824.3819437-1-robh@kernel.org>
References: <20250204232824.3819437-1-robh@kernel.org>
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

On Tue,  4 Feb 2025 17:28:24 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Use an enum instead of #defines for panthor IOCTLs. This allows the
> header to be used with Rust code as bindgen can't handle complex
> defines.
> 
> Cc: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Queued to drm-misc-next.

> ---
>  include/uapi/drm/panthor_drm.h | 86 +++++++++++++++++-----------------
>  1 file changed, 44 insertions(+), 42 deletions(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index b99763cbae48..97e2c4510e69 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -129,48 +129,6 @@ enum drm_panthor_ioctl_id {
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
>  };
>  
> -/**
> - * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> - * @__access: Access type. Must be R, W or RW.
> - * @__id: One of the DRM_PANTHOR_xxx id.
> - * @__type: Suffix of the type being passed to the IOCTL.
> - *
> - * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
> - * values instead.
> - *
> - * Return: An IOCTL number to be passed to ioctl() from userspace.
> - */
> -#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
> -	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
> -			   struct drm_panthor_ ## __type)
> -
> -#define DRM_IOCTL_PANTHOR_DEV_QUERY \
> -	DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query)
> -#define DRM_IOCTL_PANTHOR_VM_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create)
> -#define DRM_IOCTL_PANTHOR_VM_DESTROY \
> -	DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy)
> -#define DRM_IOCTL_PANTHOR_VM_BIND \
> -	DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind)
> -#define DRM_IOCTL_PANTHOR_VM_GET_STATE \
> -	DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state)
> -#define DRM_IOCTL_PANTHOR_BO_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create)
> -#define DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET \
> -	DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset)
> -#define DRM_IOCTL_PANTHOR_GROUP_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create)
> -#define DRM_IOCTL_PANTHOR_GROUP_DESTROY \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy)
> -#define DRM_IOCTL_PANTHOR_GROUP_SUBMIT \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit)
> -#define DRM_IOCTL_PANTHOR_GROUP_GET_STATE \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state)
> -#define DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
> -#define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
> -	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
> -
>  /**
>   * DOC: IOCTL arguments
>   */
> @@ -1019,6 +977,50 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>  
> +/**
> + * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> + * @__access: Access type. Must be R, W or RW.
> + * @__id: One of the DRM_PANTHOR_xxx id.
> + * @__type: Suffix of the type being passed to the IOCTL.
> + *
> + * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
> + * values instead.
> + *
> + * Return: An IOCTL number to be passed to ioctl() from userspace.
> + */
> +#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
> +	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
> +			   struct drm_panthor_ ## __type)
> +
> +enum {
> +	DRM_IOCTL_PANTHOR_DEV_QUERY =
> +		DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query),
> +	DRM_IOCTL_PANTHOR_VM_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create),
> +	DRM_IOCTL_PANTHOR_VM_DESTROY =
> +		DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy),
> +	DRM_IOCTL_PANTHOR_VM_BIND =
> +		DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind),
> +	DRM_IOCTL_PANTHOR_VM_GET_STATE =
> +		DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state),
> +	DRM_IOCTL_PANTHOR_BO_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create),
> +	DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET =
> +		DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset),
> +	DRM_IOCTL_PANTHOR_GROUP_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create),
> +	DRM_IOCTL_PANTHOR_GROUP_DESTROY =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy),
> +	DRM_IOCTL_PANTHOR_GROUP_SUBMIT =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit),
> +	DRM_IOCTL_PANTHOR_GROUP_GET_STATE =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state),
> +	DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
> +	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
> +		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

