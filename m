Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7FE3A2C05
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 14:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64F6ED0D;
	Thu, 10 Jun 2021 12:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D266ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:53:07 +0000 (UTC)
IronPort-SDR: e1GuF3MAhtRVcitvwl/RXZ8R0q9Shaxci3v6oqChJcUcFtBupikriemEwwuZabhrfJXJjN1dVL
 aMp5V2hsUK0w==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203443658"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="203443658"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 05:53:07 -0700
IronPort-SDR: U7F7sDom4M6IBRFU89nDx5JtjY/bIIv32bjkzusj0AV9NPFRFJdM6FWQNsN+Nt/anBJYS+EzxR
 lYFfwsA8cZBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="441208367"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 10 Jun 2021 05:53:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Jun 2021 15:53:03 +0300
Date: Thu, 10 Jun 2021 15:53:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH v4 2/2] drm/doc: document drm_mode_get_plane
Message-ID: <YMILL6H4ARAxQwSi@intel.com>
References: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
 <20210609230039.73307-3-leandro.ribeiro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210609230039.73307-3-leandro.ribeiro@collabora.com>
X-Patchwork-Hint: comment
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 09, 2021 at 08:00:39PM -0300, Leandro Ribeiro wrote:
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

Can't happen.

> + * Userspace should retry the last ioctl until this number stabilizes. The
> + * kernel won't fill any array which doesn't have the expected length.
> + */
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

Should be marked deprecated. There is no plane gamma in the current uapi.

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

-- 
Ville Syrjälä
Intel
