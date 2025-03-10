Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AAA5908D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 11:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53B10E3DA;
	Mon, 10 Mar 2025 10:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RZ2RO//6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACF110E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741600796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQ+pSa8sIsuU2xtscwDYe98bcGEdRUw/0m+Fk+VSrb8=;
 b=RZ2RO//6RxQogMA7wAoYUgNmZb8FWUcNzFWqnqozw8PmUg6DF8aubLv5bwDy2BczAxBt7S
 m/Dfp0LiRXTzZ5pJoWscdSGSoK0271mi1r2029jCstZIEnwDx7/o2WCeR5lTtLxM+2lwnK
 nDol/79+OfO+PTzJxCGG6Nl6Hoasuz0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-LNgtVdDFORuosDV3X_1CLA-1; Mon, 10 Mar 2025 05:59:54 -0400
X-MC-Unique: LNgtVdDFORuosDV3X_1CLA-1
X-Mimecast-MFC-AGG-ID: LNgtVdDFORuosDV3X_1CLA_1741600794
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-39135d31ca4so1241888f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 02:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741600794; x=1742205594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQ+pSa8sIsuU2xtscwDYe98bcGEdRUw/0m+Fk+VSrb8=;
 b=N4s7qA7ocM9tW08cO4GE83uIZuA8Nw93MnwcdRmTg0iGtBYlVFH5WX65lGhD8Gsvs4
 j7HRja4JpJJWsfvuuMPuRTpWgbaGZNmw1HOiYf6avcK7uBB4uB1q5fcySJ07d/1Thc84
 ufwWDEmyomaWvGggscCzBNnXCJgqDDkpWIcLNxvh+9OIFsgoLi/aSqvZRqjqxTgEjq6q
 3+uDXp0J8xlZ7LHwqRvid7otLVoA1+br+7hYnMWDt6ZbWF2kXZ7XrPIzUe0Kic6JxAZc
 fRExMV+kTOLmApbV5wR9D3dAWXmkSp3mYk7W3Dacv2e+wuxY1iKgV8HVgJ0ukGRLhwiL
 Ia0g==
X-Gm-Message-State: AOJu0YwBxiv1HU7u8ZDRtXeCZfWG3/HPeDPFIHIB2lyi8Iqr7C5CBRnu
 7ZVGrpn0/zexqKZ+CDDsovZYYgeAg5bDjgiWEwEQGBY2QooMV6bD1S3ghEyccNciIU9uCwvA08O
 b3oLFrvD6EijBYXXQa1hCOMc6sTrfzPwuzSmfJM6BJ1ftzrxColn3fRCnXfyPNt2/+A==
X-Gm-Gg: ASbGncs7JCTxAEsIiillsjGuE7SozXun0NSYOcWogK9Km2/C6biqBnabayqUWZ7oXtV
 SqE2Rrdde3n4kwTQDHmuR5IXftVRuqkl9tmfKWYANyJA+7zxsH/8Whv0tfMFzw+2CuMV/8vqfAN
 cHoAWUDQDhxXO8PKML2frNPdj0a6cS+lCPzL8h4LUEH/p7MJVXKXHIq3JL4Y5fut1M8y69HYxtt
 zV9wh9+PP7FH1MA6/1nl6jnSpTKswCfslvFl9VLgpFu6p8D3uHj1yWzLa6JG+Fl00dpBeHO7bfd
 EUHptu3Ln4Ja6z9lG2ggiG5ewvCuz78u8sdnFUxibRzGe4uda4sHg3o=
X-Received: by 2002:a05:6000:184b:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-3913af2e472mr5013409f8f.18.1741600793709; 
 Mon, 10 Mar 2025 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX9wDZkgqzcXWNadk7lA63fXqzI59Xv6gjXmdznaOhUQyAtcnnGk1X47jRovjSDv9uACyJBg==
X-Received: by 2002:a05:6000:184b:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-3913af2e472mr5013370f8f.18.1741600793351; 
 Mon, 10 Mar 2025 02:59:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfa52sm14018794f8f.21.2025.03.10.02.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:59:52 -0700 (PDT)
Message-ID: <ca830ba6-5e02-446e-87d8-4e120c357312@redhat.com>
Date: Mon, 10 Mar 2025 10:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: clean Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250303093242.1011790-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qX_SrclpzYOWo5jXZ6KU__GkcYXFMPCDv0GwbMAzuds_1741600794
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

On 03/03/2025 10:32, Miguel Ojeda wrote:
> Clippy warns:
> 
>      error: manual implementation of an assign operation
>         --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>          |
>      418 |                         self.carry = self.carry % pow;
>          |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: replace it with: `self.carry %= pow`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#assign_op_pattern
> 
> Thus clean it up.

Applied to drm-misc-next (because dbed4a797e00 is only present in this 
branch).

Thanks for your contribution.

-- 

Jocelyn

> 
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 62cb8a162483..3b0dd59781d4 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -415,7 +415,7 @@ fn next(&mut self) -> Option<Self::Item> {
>                           self.carry_len -= out_len;
>                           let pow = u64::pow(10, self.carry_len as u32);
>                           let out = (self.carry / pow) as u16;
> -                        self.carry = self.carry % pow;
> +                        self.carry %= pow;
>                           Some((out, NUM_CHARS_BITS[out_len]))
>                       }
>                   }
> 
> base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1

