Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD07A7132D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386DE10E67D;
	Wed, 26 Mar 2025 08:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fwWp4HsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C710E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp6ldcpoWWjyOch/UcmJgG6NfRrTGecDwu8agxJe33E=;
 b=fwWp4HsCwL1qUJ5j0bySpYAkXKlMANiEC9qwF+txWSjMZdgTV3qNWXsZvzFx57GuRpUW97
 nqZ48tp8cB+5/oIidXRi1Wl1OAUJ02rXVETo2u2cgbXZFUEGMG04R5Dar/HDLWKCu4rsl7
 y6UZWBHQQ2KDMlO550AJIIRT5VrjAh4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-e_csaGxWPAGv4wqn4f6HBw-1; Wed, 26 Mar 2025 04:57:02 -0400
X-MC-Unique: e_csaGxWPAGv4wqn4f6HBw-1
X-Mimecast-MFC-AGG-ID: e_csaGxWPAGv4wqn4f6HBw_1742979421
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf172ff63so41435185e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979421; x=1743584221;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lp6ldcpoWWjyOch/UcmJgG6NfRrTGecDwu8agxJe33E=;
 b=MlB4IzT5KsHdee/q1VL7KlPhqfqdKiv9yIum1ctynYDYJkAor4crJP4dWM5dv+CuUT
 NxjKJi1kVEUt0gp9dculHqosgnBN/gbdrTaIzMkk7+TVtjqTj+drnxHIk+5vW3rlkUgN
 /YFIM9R7aYuwzbSYFZCKJ2MoZWAmOBHG/3l62VTmHzUgtftNXk61NTcafzBEGTYh5mYP
 Q+3ntM2TgXwpgJNkQTVqc55Nn2mDp0E2iOcQJgWyc7wPgHi0rXBYu9eevXDNUg3obPlb
 fkQkJZ5Z1aS/c4DefeZIXZ6ACp/ddpVgz+siy1AOYt+hAjq06MwtdWd4nYHiPYpYpSZF
 7K7Q==
X-Gm-Message-State: AOJu0YzJGjnGKfzDNaoJomsVFpyi+xsKBoaGZVZFXyV7KzXhAlOic/tJ
 /Pu4/uPftrDyMFzaPDHskXCismMln1q7qhNVwl7Qto+wcqKDBRxVhO98x4Lip2kZ1Dj6yg8Nz7M
 UxpGCg3QAbc1k6Ri/lfvybjhJcwNPALTImvV4eJ4AddfzHvjChbLIciXE1jGbBkCZ7A==
X-Gm-Gg: ASbGncsTsPbWioUxre5l8b+lVwe2sBvCEmX495/HdzLZduVNLmpgX0pbwOdulY17yfz
 jf2QpGp4MNggQh208wzNVN5WmlG2EXuWuvoO5/nSLifCamMEm3dvYnwaNanQqHSO7fsNtA1disD
 nrHuw9hhadi9qwdtQEAlr6Fnt5kOdHKBSYCv0kndJQ3au9WE7SUB40arzZE4mSIPpX/Xsa3L1Ea
 G3v0n8kEORfRAVigRHyHuRWfOuNM1yqnJOJ1KNdfIASKhA3QNYvz9GINK1yMxH2Dy1IJuisUVnQ
 eTtuNbd6ogbRbiYorUZqOqmTXkPtD7IeUfLVUvNjXsBwMSGFzclgSsM=
X-Received: by 2002:a05:600c:470f:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-43d509e190fmr191120295e9.4.1742979421006; 
 Wed, 26 Mar 2025 01:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgz59mqTjIXoStsHeKtSmouuoLlKpkTgqytUm4zHwpucEpVywqpT0Uzowya1VBRm8hKtjfzA==
X-Received: by 2002:a05:600c:470f:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-43d509e190fmr191120055e9.4.1742979420527; 
 Wed, 26 Mar 2025 01:57:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd18365sm175581705e9.13.2025.03.26.01.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:57:00 -0700 (PDT)
Message-ID: <045e1b12-b42a-4123-9247-94cf7ce751e3@redhat.com>
Date: Wed, 26 Mar 2025 09:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/format-helper: Optimize 32-to-16-bpp conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-8-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pflhryZkdQNHZJVwBo-iWhHucPgCYIn1Yw_L1I7ljFw_1742979421
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 25/03/2025 11:31, Thomas Zimmermann wrote:
> For ease of implementation, existing line-conversion functions
> for 16-bit formats write each pixel individually. Optimize the
> performance by writing mulitple pixels in single 64-bit and 32-bit
> stores.

With the commit message typo fixed, mulitple => multiple

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c | 40 ++++++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index b9c9c712aa9c..66137df85725 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -262,10 +262,48 @@ static __always_inline void drm_fb_xfrm_line_32to16(void *dbuf, const void *sbuf
>   						    unsigned int pixels,
>   						    u32 (*xfrm_pixel)(u32))
>   {
> -	__le16 *dbuf16 = dbuf;
> +	__le64 *dbuf64 = dbuf;
> +	__le32 *dbuf32;
> +	__le16 *dbuf16;
>   	const __le32 *sbuf32 = sbuf;
>   	const __le32 *send32 = sbuf32 + pixels;
>   
> +#if defined(CONFIG_64BIT)
> +	/* write 4 pixels at once */
> +	send32 -= pixels & GENMASK(1, 0);
> +	while (sbuf32 < send32) {
> +		u32 pix[4] = {
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +		};
> +		/* write output bytes in reverse order for little endianness */
> +		u64 val64 = ((u64)xfrm_pixel(pix[0])) |
> +			    ((u64)xfrm_pixel(pix[1]) << 16) |
> +			    ((u64)xfrm_pixel(pix[2]) << 32) |
> +			    ((u64)xfrm_pixel(pix[3]) << 48);
> +		*dbuf64++ = cpu_to_le64(val64);
> +	}
> +	send32 += pixels & GENMASK(1, 1);
> +#endif
> +
> +	/* write 2 pixels at once */
> +	dbuf32 = (__le32 __force *)dbuf64;
> +	while (sbuf32 < send32) {
> +		u32 pix[2] = {
> +			le32_to_cpup(sbuf32++),
> +			le32_to_cpup(sbuf32++),
> +		};
> +		/* write output bytes in reverse order for little endianness */
> +		u32 val32 = xfrm_pixel(pix[0]) |
> +			   (xfrm_pixel(pix[1]) << 16);
> +		*dbuf32++ = cpu_to_le32(val32);
> +	}
> +	send32 += pixels & GENMASK(0, 0);
> +
> +	/* write trailing pixel */
> +	dbuf16 = (__le16 __force *)dbuf32;
>   	while (sbuf32 < send32)
>   		*dbuf16++ = cpu_to_le16(xfrm_pixel(le32_to_cpup(sbuf32++)));
>   }

