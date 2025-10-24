Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559AC05690
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 11:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CB510E3B3;
	Fri, 24 Oct 2025 09:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tso8acEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9BF10EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761299248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ArSephldfLwUPIZOEFTFAJsyT1UDLuvR2xDhoRsVk7I=;
 b=Tso8acEImYW1u95sTyeLP3vnN4lU4WK0awg5YB9cU+S7D9IbVQRgGnlC0ksfHt9TcW/jlM
 ghQltQOg9aTjjeCvXIcx6pOLIhyMDsWX24L3+zPHmNkOFhYw38R6K5eq5uXjsAeO64NIbH
 W/ai1FnTEE9Aqg9fZIVxzxPdLzdX7e0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-VVuZrMYmNWS_IVGPyUyoMg-1; Fri, 24 Oct 2025 05:47:27 -0400
X-MC-Unique: VVuZrMYmNWS_IVGPyUyoMg-1
X-Mimecast-MFC-AGG-ID: VVuZrMYmNWS_IVGPyUyoMg_1761299246
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47496b3c1dcso13073375e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 02:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761299246; x=1761904046;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ArSephldfLwUPIZOEFTFAJsyT1UDLuvR2xDhoRsVk7I=;
 b=nerPOsTHoWBhvYgK49Gt+a95jnZIFOOr023oY4Q6SsC5LPV4izjMLuJKoa3sjPQacL
 GI9kWmCzUMhVUqJmNIXlWKlGkB/tqJWfPG8NNlMjX3BEPWQiSEeEWWMqQNYs8XYj515V
 Z+Sjf916nVpnLUARArTryHNNUq9ej1C6zd1o7iRWHfEl5M/0VMseJkdaQJcN+I9CJrQX
 9XdSIIfoAM2eh2bu9Zd8kRb2cBhTrKf+xDmD5+M4PQp97W/oHU0OM0nI8IN//MV0Bogd
 Ll1mi6A8+gibyYcjzDmpvCD0thfvTTzXKdQruIlkBQGOqu/7mXoxbzmrnYTzVyXdlcp1
 fUEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5kHsywQGOjo/zCIn4wqaow6v+o7CgontfEzo8OwRzAPhJoL13IcHIdNx+JnXnI82QFb8fpEAZ6ZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjNkhUD/5+BMgRID/j8f7GJAw3obNg+kzzbJE1of/URMPyCBMp
 r6rAkCzGzecbSNdvCKsU4gBdsI+Vj79CsYHJCoRZcG5m/4yCkMGEIUTr+hM1nFNRRD3EbC/+hSc
 ittMTMEn3LRT4B16xtDNRoY4fKqW+Pr2FbGZzFw9HUW+ObvFGpQr86O5G7Q16EJklowY6SQ==
X-Gm-Gg: ASbGncvKWZKalKX+ZFzDprtnfIFGhkDIzL3RELVGDiuDAqVz9y5fzohShjuMwYS9QoG
 hlP3YxazehBOBpnKjSE8VgdPr8/BjlclKJoaYF9YLxzvgquBKhuH4QYbu9LinoLc0HO0QbJk/qx
 T/v5N6LEeR0i6V2MreCDN8EuRzLyMNIEZ6KI/sbhlAGiR5ZTPVIn7aSnV/v2p38wRIb1L8O2Sce
 f8TgPfA2g7oHwy0D9B+1rzg0KR7oMYKb1iGJJiK0lLLZSlOuzDkcPPfRCdOjjX4a3ExLturJOXs
 MTF/5EefAdn0eHqHZyrLgUP9J9MsI7xw5c3c/iV//GLHekjdo1V7FCyol97x6jrV+pL/oX/GGnb
 kzy3Tb47Kv9kJmXRffQ8rlVp6L7nM6u1KsafTUrzXzWKJpdDkx7aP1IAwKg==
X-Received: by 2002:a05:600c:628f:b0:46f:b32e:5292 with SMTP id
 5b1f17b1804b1-475d2e78ebcmr17248015e9.8.1761299246179; 
 Fri, 24 Oct 2025 02:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvkiM5n2goHpw250gyY/q1kAO+69ianJVaDlPPHq7N60XvGZtLDRIfaJsJf8t7LldVbkuQMA==
X-Received: by 2002:a05:600c:628f:b0:46f:b32e:5292 with SMTP id
 5b1f17b1804b1-475d2e78ebcmr17247715e9.8.1761299245713; 
 Fri, 24 Oct 2025 02:47:25 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cce3bsm8302856f8f.38.2025.10.24.02.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 02:47:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org, jonathan@marek.ca
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] efi/libstub: gop: Find GOP handle instead of GOP data
In-Reply-To: <20251015160816.525825-3-tzimmermann@suse.de>
References: <20251015160816.525825-1-tzimmermann@suse.de>
 <20251015160816.525825-3-tzimmermann@suse.de>
Date: Fri, 24 Oct 2025 11:47:24 +0200
Message-ID: <87wm4k8wcz.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gQ17hEYzpTM9_KSjjYPNg6CeknkctbOlYIIcNrDy7G0_1761299246
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

> The device handle of the GOP device is required to retrieve the
> correct EDID data. Find the handle instead of the GOP data. Still
> return the GOP data in the function arguments, as we already looked
> it up.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/firmware/efi/libstub/gop.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/gop.c b/drivers/firmware/efi/libstub/gop.c
> index 3785fb4986b4..fd32be8dd146 100644
> --- a/drivers/firmware/efi/libstub/gop.c
> +++ b/drivers/firmware/efi/libstub/gop.c
> @@ -402,12 +402,13 @@ setup_pixel_info(struct screen_info *si, u32 pixels_per_scan_line,
>  	}
>  }
>  
> -static efi_graphics_output_protocol_t *find_gop(unsigned long num,
> -						const efi_handle_t handles[])
> +static efi_handle_t find_handle_with_primary_gop(unsigned long num, const efi_handle_t handles[],
> +						 efi_graphics_output_protocol_t **found_gop)
>  {
>  	efi_graphics_output_protocol_t *first_gop;
> -	efi_handle_t h;
> +	efi_handle_t h, first_gop_handle;
>  
> +	first_gop_handle = NULL;
>  	first_gop = NULL;
>

I think the logic of this function could be simplified if you remove some
of the variables. For example, I don't think you need a fist_gop variable
anymore now that you are passing a found_gop variable as a function param.

>  	for_each_efi_handle(h, handles, num) {
> @@ -442,19 +443,25 @@ static efi_graphics_output_protocol_t *find_gop(unsigned long num,
>  		 */
>  		status = efi_bs_call(handle_protocol, h,
>  				     &EFI_CONSOLE_OUT_DEVICE_GUID, &dummy);
> -		if (status == EFI_SUCCESS)
> -			return gop;
> -
> -		if (!first_gop)
> +		if (status == EFI_SUCCESS) {
> +			if (found_gop)
> +				*found_gop = gop;
> +			return h;
> +		} else if (!first_gop_handle) {
> +			first_gop_handle = h;
>  			first_gop = gop;

You can just assign *found_gop = gop here...

> +		}
>  	}
>  
> -	return first_gop;
> +	if (found_gop)
> +		*found_gop = first_gop;

...and then this assignment won't be needed anynmore.

> +	return first_gop_handle;

Also, given that you are calling first_gop_handle to the variable to
store the first gop handle, I would for consistency name the parameter
fist_gop and just drop the local variable with the same name.

But I agree with the general logic of the patch, so regardless of what
you prefer to do:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

