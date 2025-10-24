Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB71C05707
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5569610EA0A;
	Fri, 24 Oct 2025 09:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QgxsyiPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7851510EA0A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761299618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MfM4FRUtlcJmtbsNTeaFiHY2x28gTtqtBZeKbwh4hhU=;
 b=QgxsyiPGaDp7gp+FE+TBK3KlWcoF7ZUK6C8NA0hu2iz7UNYTGyi0QXmr0mR+V8tKQoAix+
 f2evmmBDbjv0H5gu/9FxAyA6QfXFqZljl7wNqqn2Z4rzWUeH76YV5p+PIYzQOFWvuus6Jm
 jYbWLXJUYcfD1iT5YfvqNJo2RnAsEMA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-5KKImw-xP_-oFbT42oyEYw-1; Fri, 24 Oct 2025 05:53:37 -0400
X-MC-Unique: 5KKImw-xP_-oFbT42oyEYw-1
X-Mimecast-MFC-AGG-ID: 5KKImw-xP_-oFbT42oyEYw_1761299616
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47106720618so12078385e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299616; x=1761904416;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MfM4FRUtlcJmtbsNTeaFiHY2x28gTtqtBZeKbwh4hhU=;
 b=WxOBvjMBURLInpwgORf5DGtsSv3jHb6eGiIKjgglGXEI4Gd27YK4u9VbVPWc9N1qpi
 FnGRxWYwmtVA9txNhyQVkt0LK1f9UYLtTTyRctW8h77foS1DcQM/WtulfW2dtN4axApP
 TCCHUTlKSX5WaWX16UOlMZ+JDnMiBDsYJB2+Vd7KAG8KLsBDqonacsPIe71vLsT7w5Op
 sjNzgPNaOwDvPK0KGRKN1Aw5i4XzXTP4YFIo6UhCpXHK7mSd0Og0yBZTgbnmRHTq5Py3
 Y0JG2iTFPDnGTQT/fEEKwMdGM37cxKDyvdlRf1IxQIfdHYUQWqFvj/Ojm4n8WVd/AR8c
 5+kQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7AZJvw/OlW60ro7N11K0bvtv5UA5jmHgjBAPhzrkWQU/AwSxLAenV4VLQ6ycj5n2IjlddHUyrIdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDv+4HTkJaHFYD2po3h2Hw0dUi4z26L7zBuNNGxUeakynCi/nv
 S8a2LpJPg7mUy4D19bb3MZp6/HiEbut2X97ZEujplgNclz83BEHUOSi6UE1P77ys760oMY5q5b3
 QI8LjXAg2fxKK3Ub6WTiK5fmlJ8cCrTLEowmUdfmlA0sGXaAeh24Puac3wVveGTA5G/MefA==
X-Gm-Gg: ASbGncvr0BJym7jjP43nmlPWDR/kwkCUS623I3Xp6dg71aR0DdTGp0ln/Iy41cN+Imu
 GuRJxpowDVCHSl5Bj5cODbZLMTDOpE1+IkZWsuucTt21tPsvXYkOsGczaQxqngYaSqRHxGIh9Fl
 qGzPXvUl6xl8nfgeaeVfeuBQfZcxJCjIrXf9QwpLoK/rdTiVPRCELj9L2k2mLXJpL8lSmYjoDfZ
 dUVa+ePIJsX70JbzEPtTXb8yGk1L7MbaYt5ONj3/XMQKtk2sTAEAEFtLLg2v0a+8i1pdkF/aiKe
 cOc3TOz6WhTVReluiDB7VRNqAR9+LtyASqDMVU9G20DinJLNGVEy8m67Ne7F1e7G3MhIeO/ck3X
 52ZMr/hIUTvW07XTwUftvGU8pR5UpwgpWbJhNZmV9ZjfwEArZmMP4iaO+sA==
X-Received: by 2002:a05:600c:1ca0:b0:471:168f:717a with SMTP id
 5b1f17b1804b1-475d2e84559mr14828395e9.16.1761299615850; 
 Fri, 24 Oct 2025 02:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrWpIk5fPtJQaBUOqbuLg6LOKynRISy3ybOJ2Vo42hxf7aA0YpLztkvhOtyOyFfq+o4GK3XQ==
X-Received: by 2002:a05:600c:1ca0:b0:471:168f:717a with SMTP id
 5b1f17b1804b1-475d2e84559mr14828155e9.16.1761299615418; 
 Fri, 24 Oct 2025 02:53:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494b22536sm80851935e9.5.2025.10.24.02.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:53:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org, jonathan@marek.ca
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] efi/libstub: gop: Initialize screen_info in helper
 function
In-Reply-To: <20251015160816.525825-4-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
 <20251015160816.525825-4-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:53:33 +0200
Message-ID: <87tszo8w2q.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l0ydQ-3ZiIp0LSRS_OWXcxVNKL5rkn9Py6twc4gMcZk_1761299616
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

> Move initialization of screen_info into a single helper function.
> Frees up space in the main setup helper for adding EDID support.
> No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/libstub/gop.c | 76 +++++++++++++-----------------
>  1 file changed, 33 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/gop.c b/drivers/firmware/efi/libstub/gop.c
> index fd32be8dd146..02459ef0f18c 100644
> --- a/drivers/firmware/efi/libstub/gop.c
> +++ b/drivers/firmware/efi/libstub/gop.c
> @@ -367,24 +367,31 @@ static void find_bits(u32 mask, u8 *pos, u8 *size)
>  	*size = __fls(mask) - *pos + 1;
>  }
>  
> -static void
> -setup_pixel_info(struct screen_info *si, u32 pixels_per_scan_line,
> -		 efi_pixel_bitmask_t pixel_info, int pixel_format)
> +static void setup_screen_info(struct screen_info *si, const efi_graphics_output_protocol_t *gop)
>  {
> -	if (pixel_format == PIXEL_BIT_MASK) {
> -		find_bits(pixel_info.red_mask,
> -			  &si->red_pos, &si->red_size);
> -		find_bits(pixel_info.green_mask,
> -			  &si->green_pos, &si->green_size);
> -		find_bits(pixel_info.blue_mask,
> -			  &si->blue_pos, &si->blue_size);
> -		find_bits(pixel_info.reserved_mask,
> -			  &si->rsvd_pos, &si->rsvd_size);
> -		si->lfb_depth = si->red_size + si->green_size +
> -			si->blue_size + si->rsvd_size;
> -		si->lfb_linelength = (pixels_per_scan_line * si->lfb_depth) / 8;
> +	const efi_graphics_output_protocol_mode_t *mode = efi_table_attr(gop, mode);
> +	const efi_graphics_output_mode_info_t *info = efi_table_attr(mode, info);
> +
> +	si->orig_video_isVGA = VIDEO_TYPE_EFI;
> +

Not related with your patch but I dislike so much the name of this field,
since it started as a "is VGA?" bool and ended being an enum afterwards.

But I beleve we discussed this already and decided that it would be too
much churn to change it at this point.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

