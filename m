Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C67ABBE93
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A6910E0AB;
	Mon, 19 May 2025 13:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CfwEZQeY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905910E348
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747659977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYVxcq0nwtZpEAI/P9GEnl1/qOhd/68cDUTPGPM/WOo=;
 b=CfwEZQeYoc12efyXnMGA0akswoN1GZtpBkK2bWm15K4gb+JaVlS6sjltxhuEOU88t9LpRj
 BNBhKOe1jBu1mpKM/5yA3ERapYdWSbjakpIY2Be8u7tLtJIoaalTdizfsPSyEu8UIK8jyq
 UGYQo+WPF0hyePqQX55oHQZy0EqwMfU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-vsh5AsCBPJ-umrumtK_olg-1; Mon, 19 May 2025 09:06:16 -0400
X-MC-Unique: vsh5AsCBPJ-umrumtK_olg-1
X-Mimecast-MFC-AGG-ID: vsh5AsCBPJ-umrumtK_olg_1747659975
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-551b1dc724aso250145e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747659974; x=1748264774;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MYVxcq0nwtZpEAI/P9GEnl1/qOhd/68cDUTPGPM/WOo=;
 b=bXccP0U5mwPpkXB7hhYHJPZ/Jfed6mkaW2UUPValcqzHPHsOWEHqmYCIyKQFZmgqdh
 uQdB0SJ4FbJrKV916AsRxULDuOuMm5NV/QIQuxi45OfO9SKnG4aG6v97CAVg5cvTy58Q
 t49BokdrWghj+KEjJ0RoiP5rabdQ9TkUEoP1/a8I+IlOr1eIRfouBXpkmr22CPSdw0cY
 K/+J7zvgC+HKobNJdRw8wjFY71ItvrRDw0ctgCnIJBwVT1wlL+vgzHjPEGqmwNzwFxbd
 hK5/Nfg93UhZpoGiwZEEFP9MR0G18mPJVr+lO3scMkDplwMxHUIS3fd7Jt0Qs/62HvZ8
 Ygdg==
X-Gm-Message-State: AOJu0Ywztj4WcvzVGjSkWnDOzJeUUiIfXM1/dXwWsX/fhg4iB9grrgGh
 hzZFnfM7oYlwR5Ljq+UjJ6hB0t6a72aH3m08Hy7Uz0siaw0QoXKUPx56xtmqaNOUTgQzzzRpuDx
 v/9+OTHvcKpucNIdaHTC+k3dO7qaNhee/XnmDpUHjEvU++VZA8ox7+rRiRSKuxKPAr5X2qKEJ1G
 GWcw==
X-Gm-Gg: ASbGncvzUxbHcOpqcsERHQZISuy89WYlHPCTsfhy9bxUBIV/G/z9+81+yXabqnPumhj
 9hnYRpMBf2RYggl8939FaFFywvmZRZjAHbXycAOC37Om/zVriaIq3SFajFtf4eTRITIrAknvUlp
 1b/pzwFzkJ9L+j8ASZiUneQpOeuH4VebK+894CWEf4e0eJZX6f9xucfg14ZWBesIh5NiAQqoqIr
 5d/vp1DMqSREkoaXvGI34WYst5zlCbWIG0FRuLmX9JKF9HgZxy/ene3AaWRjAW65NqyqA9v1L/q
 YVOVtUPudnCXeoMwq+5igJ0bdUqcFFxZnwaXM8XZMQ==
X-Received: by 2002:a05:6512:670e:b0:54f:cc0b:158f with SMTP id
 2adb3069b0e04-550e7222314mr3439585e87.40.1747659974023; 
 Mon, 19 May 2025 06:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmjKKDKsb76wg1PQxHdOKjq2RanhhqehyZUq08fKsyX2SU26AMbr+tDLxQ7rEENVBNtY3KLw==
X-Received: by 2002:a05:6000:2211:b0:3a3:70ec:e1fb with SMTP id
 ffacd0b85a97d-3a370ece386mr2626806f8f.29.1747659962223; 
 Mon, 19 May 2025 06:06:02 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca888fcsm13272645f8f.78.2025.05.19.06.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:06:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 airlied@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/5] drm: Add helpers for programming hardware gamma LUTs
In-Reply-To: <20250509083911.39018-2-tzimmermann@suse.de>
References: <20250509083911.39018-1-tzimmermann@suse.de>
 <20250509083911.39018-2-tzimmermann@suse.de>
Date: Mon, 19 May 2025 15:06:00 +0200
Message-ID: <871pskpx6v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ogIi1jE4OvyyMxQNorwOt8QZBByUna11jFQgPSJVEl0_1747659975
X-Mimecast-Originator: redhat.com
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Provide helpers that program hardware gamma LUTs. Tha gamma ramp is
> either provided by the driver or generated by the helper.
>
> The DRM driver exports the GAMMA_LUT property with a fixed number of
> entries per color component, such as 256 on 8-bit-wide components. The
> entries describe the gamma ramp of each individual component. The new
> helper drm_crtc_load_gamma_888() loads such gamma ramp to hardware. The
> hardware uses each displayed pixel's individial components as indeces

I think the correct plural form is either "indexes" and "indices".

> into the hardware gamma table.
>
> For color modes with less than 8 bits per color component, the helpers
> drm_crtc_load_gamma_565_from() and drm_crtc_load_gamma_555_from_888()
> interpolate the provided gamma ramp to reduce it to the correct number
> of entries; 5/6/5 for RGB565-like formats and 5/5/5 for RGB1555-like
> formats.
>
> If no gamma ramp has been provided, drivers can use the new helper
> drm_crtc_fill_gamma_888() to load a default gamma ramp with 256 entries
> per color component. For color modes with less bits, the new helpers
> drm_crtc_fill_gamma_565() and drm_crtc_fill_gamma_555() are available.
> The default gamma ramp uses a gamma factor of 1. Later patches can
> change this. For PCs, a gamma factor of 2.2 is common.
>
> For color modes with palette, drm_crtc_load_palette_8() load an 8-bit
> palette into the hardware. If no palette has been specified,
> drm_crtc_fill_palette_8() load a system-specific default palette. This
> is currently only a grey-scale palette with increasing luminance, but
> later patches can change this. For PCs, a VGA default palette could
> be used.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 206 +++++++++++++++++++++++++++++++
>  include/drm/drm_color_mgmt.h     |  27 ++++
>  2 files changed, 233 insertions(+)
>

Thanks a lot for adding all these helpers. I'm not an expert on gamma LUTs
but the patch looks good to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

