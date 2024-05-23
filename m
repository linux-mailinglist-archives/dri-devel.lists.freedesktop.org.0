Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17BF8CCD38
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B07010E163;
	Thu, 23 May 2024 07:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hMyrkE2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7EC10E163
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716450259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BUPRxsG0lee6X0ozMWyWF1yoduWzT1ag0lBWcroAlIM=;
 b=hMyrkE2jzNn2zQDQ3eHJofD53X2+Z1qfQ4zgNapeOlU7kpdyuroZ/Bcvho2w34D5ev0Bg4
 ag3D1gTUYNthBlWTqGj0HIJWKErbmL0poeKmxiRd0YjFSMsREXMuY0/fXpqgccPQ/S4A65
 W7iGO4DTfSbcIzKmhXHfV2vU+ugh33c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-_ueeKMMwOMSKCQ1riItJRw-1; Thu, 23 May 2024 03:44:17 -0400
X-MC-Unique: _ueeKMMwOMSKCQ1riItJRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4201f100188so61664015e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 00:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716450256; x=1717055056;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUPRxsG0lee6X0ozMWyWF1yoduWzT1ag0lBWcroAlIM=;
 b=gqB6/aAC8PZwEQyVhE4KbCd2OlFqXUwVaOUfiKyRh/UFA/lVaeoNzGKYRpVa3K94tg
 J8qGzuHCFO4YI4qcNEags0nXj2lwVw3Y4YD7Zrsd5TtmACT9cUzhe1ucxOT5A1eyVV4d
 jeKXj2cSYbNKy8X/laKVNFpJ5ikXIx+e3CCzTHciq+Il/8uddYPDqmF/vNRRi+8tHMLB
 HtE6pOAX2J5m2hbOZepiVcM4AwcozfffdWkXoLsyphgVDrLjN4mGK503KAutbnnoMHPr
 EWU6v7kjbgrqNI6u+2cjyadcBzKLCA0T9OvYLutkjfRIOu1Qgbv+pJbIE66JPPWqNvDm
 0EgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJbZyQCjSnhuV9t4eZ/aUo79iAa9UVLFyBg3ACS2qlSZaOn7KeEexYGsj9pZqjgAFea6cpLcc/bk89O4KmxJdm85P3aCwalWr5CjF5efZr
X-Gm-Message-State: AOJu0YwJgmFQmLDOrqMvocnvBUSVfDCnGyIGCBuD0M2fIEfO3dviRWe3
 MJYhzZF7OhZJ5huUdagoAuSvpHT0DW612Guh0MQeKdMX6co0yT0O4Ye4hT4zmBE/m57MbOoJzx4
 UPQ66u+878U/utEsmHIC1K/LkB3XN0Dwx3q+0sDt8rgdLJmHOxJgU2KCRzcANzCd2dQ==
X-Received: by 2002:a05:600c:2947:b0:41f:e098:53e with SMTP id
 5b1f17b1804b1-420fd31083amr27056075e9.17.1716450256101; 
 Thu, 23 May 2024 00:44:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk3lD+wZLMMaz635PL4osaIq4QCatQkplX5jwmS6LoKO9qEjin7bpnwYhHR7EVFBt4ufBq9A==
X-Received: by 2002:a05:600c:2947:b0:41f:e098:53e with SMTP id
 5b1f17b1804b1-420fd31083amr27055935e9.17.1716450255539; 
 Thu, 23 May 2024 00:44:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100f1f07bsm17055825e9.13.2024.05.23.00.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:44:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: fix drm_test_fb_xrgb8888_to_xrgb2101010 on
 big endian
In-Reply-To: <20240522054427.3393986-1-airlied@gmail.com>
References: <20240522054427.3393986-1-airlied@gmail.com>
Date: Thu, 23 May 2024 09:44:14 +0200
Message-ID: <877cflgegh.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

Dave Airlie <airlied@gmail.com> writes:

Hello Dave,

> From: Dave Airlie <airlied@redhat.com>
>
> This test is failing for me on s390x and there is a report on the list from ppc64.
>
> This aligns it with the argb test that doesn't fail.
>
> Fixes: 15bda1f8de5d ("drm/tests: Add calls to drm_fb_blit() on supported format conversion tests")
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 08992636ec05..d4ce2d7ced4e 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -991,7 +991,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  		NULL : &result->dst_pitch;
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  
>  	buf = dst.vaddr; /* restore original value of buf */
> @@ -1002,6 +1002,8 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  	blit_result = drm_fb_blit(&dst, dst_pitch, DRM_FORMAT_XRGB2101010, &src, &fb,
>  				  &params->clip, &fmtcnv_state);
>  
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
> +
>  	KUNIT_EXPECT_FALSE(test, blit_result);
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  }

Looks good to me, and as you said it makes the test consistent with the
drm_fb_xrgb8888_to_argb2101010() test that didn't fail for you on s390x.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

