Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06F9608AA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 13:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C37910E04B;
	Tue, 27 Aug 2024 11:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeow2nWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664FA10E04B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724758130; x=1756294130;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=d90TXzTP3A+To80jVZKfpieNInMLPsGe/4wRJhsp//Y=;
 b=eeow2nWFJYu7GkqRG+llpZgiLdA6PVlhI9+JJpruWIjit3Sg5Bkm+jvc
 yh5W5bLwiTdpjxtMZmXgRZyxqXDYMwzAalxoMP8Ek3AzdmKQnDcfEiaqz
 thVeY7dmDnd3/hv8Q88OaxNPwcERhWXYmt/8q/M66taZPdNVEh46YIgwl
 Do1N6V465Z/mEU6K9fcQqaGimyB5nC3P4LI5Vilnj6aiEpOrsc+7HHmq8
 C2kRcbAgarCRbZ1HfNhESt9CD6biOEd19zUo6WWKqxn36YPFagSSl3yJU
 Lp88oeGw8ptJ81pCt7oNcERVuRbleAHrA9SwvGTKztKKeiJx1J95OHDRL A==;
X-CSE-ConnectionGUID: NRJ3xd1zQnmFJ7zt+igQsQ==
X-CSE-MsgGUID: 2FcRsHGvQweN4hK2uN/VEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23353811"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="23353811"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 04:28:50 -0700
X-CSE-ConnectionGUID: rFZ4liGSTwC/snF/A5ieDg==
X-CSE-MsgGUID: iiTmoQYAScyAXasxedXCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62667024"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 04:28:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH resend] drm/vboxvideo: Replace fake VLA at end of
 vbva_mouse_pointer_shape with real VLA
In-Reply-To: <20240827104523.17442-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240827104523.17442-1-hdegoede@redhat.com>
Date: Tue, 27 Aug 2024 14:28:44 +0300
Message-ID: <87jzg2yzkj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 27 Aug 2024, Hans de Goede <hdegoede@redhat.com> wrote:
> Replace the fake VLA at end of the vbva_mouse_pointer_shape shape with
> a real VLA to fix a "memcpy: detected field-spanning write error" warning:
>
> [   13.319813] memcpy: detected field-spanning write (size 16896) of single field "p->data" at drivers/gpu/drm/vboxvideo/hgsmi_base.c:154 (size 4)
> [   13.319841] WARNING: CPU: 0 PID: 1105 at drivers/gpu/drm/vboxvideo/hgsmi_base.c:154 hgsmi_update_pointer_shape+0x192/0x1c0 [vboxvideo]
> [   13.320038] Call Trace:
> [   13.320173]  hgsmi_update_pointer_shape [vboxvideo]
> [   13.320184]  vbox_cursor_atomic_update [vboxvideo]
>
> Note as mentioned in the added comment it seems the original length
> calculation for the allocated and send hgsmi buffer is 4 bytes too large.
> Changing this is not the goal of this patch, so this behavior is kept.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Resend, can I get an ack from someone to push this to drm-misc-next please ?
>
> (this has been tested with a vboxsvga adapter in a vbox vm)
> ---
>  drivers/gpu/drm/vboxvideo/hgsmi_base.c | 10 +++++++++-
>  drivers/gpu/drm/vboxvideo/vboxvideo.h  |  4 +---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_base.c b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> index 8c041d7ce4f1..87dccaecc3e5 100644
> --- a/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> +++ b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> @@ -139,7 +139,15 @@ int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
>  		flags |= VBOX_MOUSE_POINTER_VISIBLE;
>  	}
>  
> -	p = hgsmi_buffer_alloc(ctx, sizeof(*p) + pixel_len, HGSMI_CH_VBVA,
> +	/*
> +	 * The 4 extra bytes come from switching struct vbva_mouse_pointer_shape
> +	 * from having a 4 bytes fixed array at the end to using a proper VLA
> +	 * at the end. These 4 extra bytes were not subtracted from sizeof(*p)
> +	 * before the switch to the VLA, so this way the behavior is unchanged.
> +	 * Chances are these 4 extra bytes are not necessary but they are kept
> +	 * to avoid regressions.
> +	 */
> +	p = hgsmi_buffer_alloc(ctx, sizeof(*p) + pixel_len + 4, HGSMI_CH_VBVA,

Nitpick, struct_size(p, data, pixel_len + 4) is a better choice for VLAs
than open coding.

Either way, and FWIW,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


BR,
Jani.


>  			       VBVA_MOUSE_POINTER_SHAPE);
>  	if (!p)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> index f60d82504da0..79ec8481de0e 100644
> --- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
> @@ -351,10 +351,8 @@ struct vbva_mouse_pointer_shape {
>  	 * Bytes in the gap between the AND and the XOR mask are undefined.
>  	 * XOR mask scanlines have no gap between them and size of XOR mask is:
>  	 * xor_len = width * 4 * height.
> -	 *
> -	 * Preallocate 4 bytes for accessing actual data as p->data.
>  	 */
> -	u8 data[4];
> +	u8 data[];
>  } __packed;
>  
>  /* pointer is visible */

-- 
Jani Nikula, Intel
