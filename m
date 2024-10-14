Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FB99C3E1
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9091510E3D0;
	Mon, 14 Oct 2024 08:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aBqoZXri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DCB10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728895545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kt7ZpUw00t5zKHLBBAr1PrwMsK/5xgdQaLql2aMEo1M=;
 b=aBqoZXriQE1tm1tfWF0MMLTqVHWyKQj+b7iLx6ny2EYCHbZPFsxYLafa62edunr1YBh3Y7
 LEHzFKx1cL06rb8502EeBvF5ulk21jsROdzhoJLJ0ttCU16tALxTWQQ+NjR4PTBcJaUh7Q
 x7Pt795J/zPyobaVHTDIdCbqkvhEw1A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-1zNOdPqdOGOQyGGav1IGkg-1; Mon, 14 Oct 2024 04:45:43 -0400
X-MC-Unique: 1zNOdPqdOGOQyGGav1IGkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4311db0f3f1so19373355e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728895542; x=1729500342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kt7ZpUw00t5zKHLBBAr1PrwMsK/5xgdQaLql2aMEo1M=;
 b=KLNodiARNd51n3cAWF5fSjhTr6Oljuqpn+o4mO02HlanZxfplx9IMypiwll1i1sXVg
 q/kH6dYSslwxgzDwvo1FFMydVeAhjAo5lFJdyf94Vcfcu28a7OSRq8u7+n/d//lUwpUQ
 tOV1aSvyEyiYWclpv3tFJo4VwsBsOSGl0TCvsHL4UI2SofHpRsl3X/SyE10TfESLnDrk
 tDESO5AeXVGdL8HBT7FZsdXGt6eOxk7to8ajlbuopRPcjnP5lX2HCIVDCimZu+bmWmR0
 15QNg+TaO46Yt+90VpU3IpBFUGquRD4JiXPEtCpBEcB4xOShKwSj12ckqOAmWklzOJJW
 WPNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2cM1RU+6Ultvo+udAIy9EdBqhydzF/5pwc9vBkKuiM8+qAMagqs9ZKzng3FMKkItVhs+k6WA+yhY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf+t4ENpVo4xR1UW0DZahMEP40H5g22CdImfhmpedkzqw+IOXI
 8lmxbxTogrVJOghE9huWxhmxNTfTJMhRmxALO46JO9wspLbvXBh1i61fe+zNx9fR+GwtkyW32px
 4qOf3R44MposGj7wZs44oDogZNf9EaOym/7a8C3PqoqeodrPPwNiALIdKMEwQUKdGuA==
X-Received: by 2002:a05:600c:5122:b0:42c:b22e:fc2e with SMTP id
 5b1f17b1804b1-4311dede4efmr85784495e9.15.1728895542627; 
 Mon, 14 Oct 2024 01:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtqRSS2nbZ+gemMvRsJ39NH+QcIg8oMuQO5fsBN4pOW3+HQjIjgY4dj/+hR8uAckTbY4WSxw==
X-Received: by 2002:a05:600c:5122:b0:42c:b22e:fc2e with SMTP id
 5b1f17b1804b1-4311dede4efmr85784285e9.15.1728895542180; 
 Mon, 14 Oct 2024 01:45:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a8802sm10762445f8f.21.2024.10.14.01.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:45:41 -0700 (PDT)
Message-ID: <db18fcea-7dfe-4edc-8e3a-8078860656b3@redhat.com>
Date: Mon, 14 Oct 2024 10:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/panic: remove unnecessary borrow in
 alignment_pattern
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <20241012075312.16342-2-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-2-witcher@wiredspace.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/10/2024 09:52, Thomas Böhler wrote:
> The function `alignment_pattern` returns a static reference to a `u8`
> slice. The borrow of the returned element in `ALIGNMENT_PATTERNS` is
> already a reference as defined in the array definition above so this
> borrow is unnecessary and removed by the compiler. Clippy notes this in
> `needless_borrow`:
> 
>      error: this expression creates a reference which is immediately dereferenced by the compiler
>         --> drivers/gpu/drm/drm_panic_qr.rs:245:9
>          |
>      245 |         &ALIGNMENT_PATTERNS[self.0 - 1]
>          |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: change this to: `ALIGNMENT_PATTERNS[self.0 - 1]`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_borrow
>          = note: `-D clippy::needless-borrow` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::needless_borrow)]`
> 
> Remove the unnecessary borrow.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 76decf49e678..7adfaa3d6222 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -239,7 +239,7 @@ fn g1_blk_size(&self) -> usize {
>       }
>   
>       fn alignment_pattern(&self) -> &'static [u8] {
> -        &ALIGNMENT_PATTERNS[self.0 - 1]
> +        ALIGNMENT_PATTERNS[self.0 - 1]
>       }
>   
>       fn poly(&self) -> &'static [u8] {

