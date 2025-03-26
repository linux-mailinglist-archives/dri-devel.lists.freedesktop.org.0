Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD6A7132E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BBE10E67F;
	Wed, 26 Mar 2025 08:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iHAlTj8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACFB10E67F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742979439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+qErHAQjwUHavvlddPgsEFoqcIAaFDIQOs5cTnyVHw=;
 b=iHAlTj8YNfeC7QeGVX0kKooRNYV7iG10vnX3gdTstNpgEsFw3kVmXSBBUu5fnvXMlanDWq
 Hu66MNFM+acy+Htyk8FiSTjpQC7aNu6PABHS5YHF3Y/eWKl1pq73zawn+GK6PG367kldLT
 cBCZ2ooh8Lfe0erb++v806MKrE08M2o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-vyyQkClXMxO88SP6VGvaLw-1; Wed, 26 Mar 2025 04:57:18 -0400
X-MC-Unique: vyyQkClXMxO88SP6VGvaLw-1
X-Mimecast-MFC-AGG-ID: vyyQkClXMxO88SP6VGvaLw_1742979437
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3912fe32b08so3336093f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 01:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742979437; x=1743584237;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+qErHAQjwUHavvlddPgsEFoqcIAaFDIQOs5cTnyVHw=;
 b=LrJ5ri+5BTrJKaau5hTtVIHl0LN/LntWvF1s0LWvVvyKmtcty822dFnibhcrdgVr5D
 ROltJftMDXxdNo+JB7O/BRrbk/cTeBw7oSajN1j0zC+R60saf/lpH6iS5awEuZ85ErYh
 0O2kWaVgUpvIP9wLqIbYv/gcDyeR6BikCiKKBYkmNbZ+SPkAoM1WCnV0uL8kN1l2KUs3
 NEUBuh13ParNz9skv3ELSa2kogIHV9YbmsWDRRxwIsQTBmbiU/C6sDtAW7YZND0xbWmo
 NJYLZGJvH8BTJEV65BdcDKMX8NlZtF9Zn8BUVhPdtnI/z3jj6hLkmSLh3FkzZDsBX7u+
 Kb1Q==
X-Gm-Message-State: AOJu0Yz3A13zgQAJFGSQucXFYs98cY/0bnqjGb8Mc+pnapiTM1UyPNu4
 gocSVpAA9+w1gCMeTmY/aO/iF5bNQPjAxpko/jNvVbJdQiN9IcEaWmRzxxzUySycrjpfatXHrVn
 BtLnXBHXpd7VIuIWO3IdKBJ+73PNR8I7QVOaF8NEvDJSqv9+iR5a8jFgnGTiLvKb7DQ==
X-Gm-Gg: ASbGnctWWJp6oSCUA7vizdgdQqM3bQXg11yLOzTG3QwSDxDFLFqot6hmj5ai+XWJCmp
 t+6RYfZQRk7Z87smm3zOXvJO95jkQkko8BPonkWJVcvl1QnHKt0b4CeYJ59vdbcGrQqwS3Bj1/F
 GjJrD2mbhjs7m8COAYAkLhENYnhtlvM4Od7DSrGrvewoOjc4IIUa3713AHgRNYIFUwGGOuRzDg0
 53kR4wHJigkyDeV7b7nwCAxt0JrJ+PoVo8WohssU9qjSVh8kOso+E0VRa0Y20mTc3D+ckdlPyU3
 jP2I22X4bPrQpd42ShD8D4Wb9RC1dxVAbefqGwPxwoh2AYL+r0YkZII=
X-Received: by 2002:a05:6000:1ace:b0:39a:ca59:a626 with SMTP id
 ffacd0b85a97d-39aca59a880mr4543457f8f.28.1742979436966; 
 Wed, 26 Mar 2025 01:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP6/iIGc7JXHHWbh3exMsrOSfK+NbW4AIotYpVY37/XSBWqfAtlkLRQwR0mTz7jfYcTLGW8A==
X-Received: by 2002:a05:6000:1ace:b0:39a:ca59:a626 with SMTP id
 ffacd0b85a97d-39aca59a880mr4543431f8f.28.1742979436554; 
 Wed, 26 Mar 2025 01:57:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e65e0sm16493419f8f.61.2025.03.26.01.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:57:16 -0700 (PDT)
Message-ID: <7132217e-be22-4e87-87ca-375249dc38cd@redhat.com>
Date: Wed, 26 Mar 2025 09:57:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/format-helper: Optimize 32-to-8-bpp conversion
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250325110407.81107-1-tzimmermann@suse.de>
 <20250325110407.81107-9-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250325110407.81107-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AMtuHZhcwtanF_NKp4caLyAPqcixVnap6F4XVCC1MWM_1742979437
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
> for 8-bit formats write each pixel individually. Optimize the
> performance by writing mulitple pixels in a single 32-bit store.

With the commit message typo fixed, mulitple => multiple

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_format_helper.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index 66137df85725..73833db28c3c 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -250,10 +250,31 @@ static __always_inline void drm_fb_xfrm_line_32to8(void *dbuf, const void *sbuf,
>   						   unsigned int pixels,
>   						   u32 (*xfrm_pixel)(u32))
>   {
> -	u8 *dbuf8 = dbuf;
> +	__le32 *dbuf32 = dbuf;
> +	u8 *dbuf8;
>   	const __le32 *sbuf32 = sbuf;
>   	const __le32 *send32 = sbuf32 + pixels;
>   
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
> +		u32 val32 = xfrm_pixel(pix[0]) |
> +			   (xfrm_pixel(pix[1]) << 8) |
> +			   (xfrm_pixel(pix[2]) << 16) |
> +			   (xfrm_pixel(pix[3]) << 24);
> +		*dbuf32++ = cpu_to_le32(val32);
> +	}
> +	send32 += pixels & GENMASK(1, 0);
> +
> +	/* write trailing pixels */
> +	dbuf8 = (u8 __force *)dbuf32;
>   	while (sbuf32 < send32)
>   		*dbuf8++ = xfrm_pixel(le32_to_cpup(sbuf32++));
>   }

