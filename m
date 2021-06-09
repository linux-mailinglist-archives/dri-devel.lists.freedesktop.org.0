Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5483A207B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 01:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58F26EB59;
	Wed,  9 Jun 2021 23:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DC86EB59
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 23:05:13 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501] (unknown
 [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 059891F4387C;
 Thu, 10 Jun 2021 00:05:10 +0100 (BST)
Subject: Re: [PATCH v4 2/2] drm/doc: document drm_mode_get_plane
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
References: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
 <20210609230039.73307-3-leandro.ribeiro@collabora.com>
Message-ID: <b26a33dd-39ac-48b4-7c9d-512d13ea9acd@collabora.com>
Date: Wed, 9 Jun 2021 20:05:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609230039.73307-3-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/9/21 8:00 PM, Leandro Ribeiro wrote:
> Add a small description and document struct fields of
> drm_mode_get_plane.
> 
> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> ---
>  include/uapi/drm/drm_mode.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a5e76aa06ad5..67bcd8e1931c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -312,16 +312,52 @@ struct drm_mode_set_plane {
>  	__u32 src_w;
>  };
> 
> +/**
> + * struct drm_mode_get_plane - Get plane metadata.
> + *
> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
> + * plane.
> + *
> + * To retrieve the number of formats supported, set @count_format_types to zero
> + * and call the ioctl. @count_format_types will be updated with the value.
> + *
> + * To retrieve these formats, allocate an array with the memory needed to store
> + * @count_format_types formats. Point @format_type_ptr to this array and call
> + * the ioctl again (with @count_format_types still set to the value returned in
> + * the first ioctl call).
> + *
> + * Between one ioctl and the other, the number of formats may change.
> + * Userspace should retry the last ioctl until this number stabilizes. The
> + * kernel won't fill any array which doesn't have the expected length.
> + */

Actually I don't know if this last paragraph applies. For connectors,
for instance, I can see this happening because of hot-plugging. But for
plane formats I have no idea. As in libdrm we have this algorithm, I've
decided to describe it here.

>  struct drm_mode_get_plane {
> +	/**
> +	 * @plane_id: Object ID of the plane whose information should be
> +	 * retrieved. Set by caller.
> +	 */
>  	__u32 plane_id;
> 
> +	/** @crtc_id: Object ID of the current CRTC. */
>  	__u32 crtc_id;
> +	/** @fb_id: Object ID of the current fb. */
>  	__u32 fb_id;
> 
> +	/**
> +	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
> +	 * are created and they receive an index, which corresponds to their
> +	 * position in the bitmask. Bit N corresponds to
> +	 * :ref:`CRTC index<crtc_index>` N.
> +	 */
>  	__u32 possible_crtcs;
> +	/** @gamma_size: Number of entries of the legacy gamma lookup table. */
>  	__u32 gamma_size;
> 
> +	/** @count_format_types: Number of formats. */
>  	__u32 count_format_types;
> +	/**
> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
> +	 * supported by the plane. These formats do not require modifiers.
> +	 */
>  	__u64 format_type_ptr;
>  };
> 
> --
> 2.31.1
> 
> 
