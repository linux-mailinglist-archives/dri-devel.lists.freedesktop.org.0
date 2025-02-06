Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE1A2ABF0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C7F10E87F;
	Thu,  6 Feb 2025 14:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2710E87F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 14:56:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2969B12FC;
 Thu,  6 Feb 2025 06:57:03 -0800 (PST)
Received: from [10.1.30.52] (e122027.cambridge.arm.com [10.1.30.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0E83F58B;
 Thu,  6 Feb 2025 06:56:36 -0800 (PST)
Message-ID: <42a52543-5461-4be0-9af7-268af69b0801@arm.com>
Date: Thu, 6 Feb 2025 14:56:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: Beata Michalska <beata.michalska@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250204232824.3819437-1-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250204232824.3819437-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 04/02/2025 23:28, Rob Herring (Arm) wrote:
> Use an enum instead of #defines for panthor IOCTLs. This allows the
> header to be used with Rust code as bindgen can't handle complex
> defines.

Sounds like something that needs to be improved in bindgen...
Never-the-less for this particular case I think it's fine.

Reviewed-by: Steven Price <steven.price@arm.com>

> Cc: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
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

