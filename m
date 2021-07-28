Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68D73D8791
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 07:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320C6E03D;
	Wed, 28 Jul 2021 05:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE006E03D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 05:56:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D5B060F91;
 Wed, 28 Jul 2021 05:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627451802;
 bh=SkTFCJePd+lcNKc8+koD7IK+G34mocgYj4IvJM4fn44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q9ANBjbNMZPywJN2UYq05SCuBOhTh8QHCmVyEEeZ4lj9G9Lo7DqXT0AQWx0CTwhuo
 npUVqfPC2/cHcWa7oOmYq7zfHqbYNwvw0P7jiRdASWbUGTLmzBLjVQyTH4VOO1Dawq
 EJzJmvcOAynf4CFmcVLm9WnYMB1CSUQJDDwEt8Fk=
Date: Wed, 28 Jul 2021 07:56:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 25/64] drm/mga/mga_ioc32: Use struct_group() for memcpy()
 region
Message-ID: <YQDxmEYfppJ4wAmD@kroah.com>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-26-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727205855.411487-26-keescook@chromium.org>
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
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 01:58:16PM -0700, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() in struct drm32_mga_init around members chipset, sgram,
> maccess, fb_cpp, front_offset, front_pitch, back_offset, back_pitch,
> depth_cpp, depth_offset, depth_pitch, texture_offset, and texture_size,
> so they can be referenced together. This will allow memcpy() and sizeof()
> to more easily reason about sizes, improve readability, and avoid future
> warnings about writing beyond the end of chipset.
> 
> "pahole" shows no size nor member offset changes to struct drm32_mga_init.
> "objdump -d" shows no meaningful object code changes (i.e. only source
> line number induced differences and optimizations).
> 
> Note that since this includes a UAPI header, struct_group() has been
> explicitly redefined local to the header.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/mga/mga_ioc32.c | 30 ++++++++++++++------------
>  include/uapi/drm/mga_drm.h      | 37 ++++++++++++++++++++++++---------
>  2 files changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mga/mga_ioc32.c b/drivers/gpu/drm/mga/mga_ioc32.c
> index 4fd4de16cd32..fbd0329dbd4f 100644
> --- a/drivers/gpu/drm/mga/mga_ioc32.c
> +++ b/drivers/gpu/drm/mga/mga_ioc32.c
> @@ -38,16 +38,21 @@
>  typedef struct drm32_mga_init {
>  	int func;
>  	u32 sarea_priv_offset;
> -	int chipset;
> -	int sgram;
> -	unsigned int maccess;
> -	unsigned int fb_cpp;
> -	unsigned int front_offset, front_pitch;
> -	unsigned int back_offset, back_pitch;
> -	unsigned int depth_cpp;
> -	unsigned int depth_offset, depth_pitch;
> -	unsigned int texture_offset[MGA_NR_TEX_HEAPS];
> -	unsigned int texture_size[MGA_NR_TEX_HEAPS];
> +	struct_group(always32bit,
> +		int chipset;
> +		int sgram;
> +		unsigned int maccess;
> +		unsigned int fb_cpp;
> +		unsigned int front_offset;
> +		unsigned int front_pitch;
> +		unsigned int back_offset;
> +		unsigned int back_pitch;
> +		unsigned int depth_cpp;
> +		unsigned int depth_offset;
> +		unsigned int depth_pitch;
> +		unsigned int texture_offset[MGA_NR_TEX_HEAPS];
> +		unsigned int texture_size[MGA_NR_TEX_HEAPS];
> +	);
>  	u32 fb_offset;
>  	u32 mmio_offset;
>  	u32 status_offset;
> @@ -67,9 +72,8 @@ static int compat_mga_init(struct file *file, unsigned int cmd,
>  
>  	init.func = init32.func;
>  	init.sarea_priv_offset = init32.sarea_priv_offset;
> -	memcpy(&init.chipset, &init32.chipset,
> -		offsetof(drm_mga_init_t, fb_offset) -
> -		offsetof(drm_mga_init_t, chipset));
> +	memcpy(&init.always32bit, &init32.always32bit,
> +	       sizeof(init32.always32bit));
>  	init.fb_offset = init32.fb_offset;
>  	init.mmio_offset = init32.mmio_offset;
>  	init.status_offset = init32.status_offset;
> diff --git a/include/uapi/drm/mga_drm.h b/include/uapi/drm/mga_drm.h
> index 8c4337548ab5..61612e5ecab2 100644
> --- a/include/uapi/drm/mga_drm.h
> +++ b/include/uapi/drm/mga_drm.h
> @@ -265,6 +265,16 @@ typedef struct _drm_mga_sarea {
>  #define DRM_IOCTL_MGA_WAIT_FENCE    DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_WAIT_FENCE, __u32)
>  #define DRM_IOCTL_MGA_DMA_BOOTSTRAP DRM_IOWR(DRM_COMMAND_BASE + DRM_MGA_DMA_BOOTSTRAP, drm_mga_dma_bootstrap_t)
>  
> +#define __struct_group(name, fields) \
> +	union { \
> +		struct { \
> +			fields \
> +		}; \
> +		struct { \
> +			fields \
> +		} name; \
> +	}
> +
>  typedef struct _drm_mga_warp_index {
>  	int installed;
>  	unsigned long phys_addr;
> @@ -279,20 +289,25 @@ typedef struct drm_mga_init {
>  
>  	unsigned long sarea_priv_offset;
>  
> -	int chipset;
> -	int sgram;
> +	__struct_group(always32bit,
> +		int chipset;
> +		int sgram;
>  
> -	unsigned int maccess;
> +		unsigned int maccess;
>  
> -	unsigned int fb_cpp;
> -	unsigned int front_offset, front_pitch;
> -	unsigned int back_offset, back_pitch;
> +		unsigned int fb_cpp;
> +		unsigned int front_offset;
> +		unsigned int front_pitch;
> +		unsigned int back_offset;
> +		unsigned int back_pitch;
>  
> -	unsigned int depth_cpp;
> -	unsigned int depth_offset, depth_pitch;
> +		unsigned int depth_cpp;
> +		unsigned int depth_offset;
> +		unsigned int depth_pitch;
>  
> -	unsigned int texture_offset[MGA_NR_TEX_HEAPS];
> -	unsigned int texture_size[MGA_NR_TEX_HEAPS];
> +		unsigned int texture_offset[MGA_NR_TEX_HEAPS];
> +		unsigned int texture_size[MGA_NR_TEX_HEAPS];
> +	);
>  
>  	unsigned long fb_offset;
>  	unsigned long mmio_offset;
> @@ -302,6 +317,8 @@ typedef struct drm_mga_init {
>  	unsigned long buffers_offset;
>  } drm_mga_init_t;
>  
> +#undef __struct_group
> +

Why can you use __struct_group in this uapi header, but not the
networking one?

thanks,

greg k-h
