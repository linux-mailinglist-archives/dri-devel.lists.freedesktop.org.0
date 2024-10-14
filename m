Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485299C3D7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B710E0BE;
	Mon, 14 Oct 2024 08:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OAXrzAXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1802E10E0BE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728895508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IwPdK057Cp2nQLCke3sfXHwalbY2C/QTU6X8kPub9I8=;
 b=OAXrzAXURLauZmbILHQ3ZHhrK+2E8NVeKajyYnm2UTzGE6dTzKcq0x9MQi0j0ER3MDPVOC
 HYeePC32eY4RUX0d5aKs9427mahy73dNEeLfxNXJHukbD+FMVbM8p03+2qGy8CihlN45LF
 f9JWwpcYvyUA8+l4OyrJJRymWe1Tslo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-eDDv8HNlMGWhqUzueBEu2w-1; Mon, 14 Oct 2024 04:45:05 -0400
X-MC-Unique: eDDv8HNlMGWhqUzueBEu2w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d49887a2cso2028685f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728895504; x=1729500304;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IwPdK057Cp2nQLCke3sfXHwalbY2C/QTU6X8kPub9I8=;
 b=rSam4SeSfgwJO1FTvBBIgLY1LX1W19FLJrWxbsgdCiISCJcTAuyIjx8tXe4XQ7dQMp
 zY2vG1Al+h3U5RZv3d45AYvjfAprPOK2eBkZlr2bLd2r6AfOAnUpM4koCZ+lypN/UPRK
 VEgq+H7utKKdu1yi7uRCYBjurJuQPhHRWFfkUlevixCqHP0Tx3nITlnPkLyIHfHVGk6H
 DtMzlygaZWZnxDpE+R+eh3tZ2W7D7+s1X00s0lPEEUHi2taSjKZ3Yf8yiu0dkb9FI9Lu
 iIfu/UcEltf1mSH9I9QMgzOMltjNa4dhea8dT3WWxFh57hYUv8bJw5TNwQ7Em4Ef8WU2
 OZyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0zBZ6k588avMVjaLvRBa7/KJ/zI3FdwCy4kfsN/Vz8hCvxzUN+mJd+lD0AT2DYwr/g62DABUKM+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzAk63WvLUy1BSQL7ahPlldcJx26dXjdx4TSg0xoTnXo4G06JR3
 Yv9lgpXklr9IlArxbe1HgUOpQFHi0mPoXIllfuniQeGaweXQRajyQ0+N0DZif4gwrtMfN1+hsou
 GYcQGHI9EoqqNxphmzP83FTNnELdo6OEJjVfqV/j6W7EdZgHr4Qzvh5G5mp2PWNH/xA==
X-Received: by 2002:a05:6000:410b:b0:37d:5251:e5ad with SMTP id
 ffacd0b85a97d-37d5251e61emr10001929f8f.2.1728895503945; 
 Mon, 14 Oct 2024 01:45:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi2hL5R0Qzddqsq5A+5TzAAhKxmoPEGTna582tFhlN51HBFUK8Usw3/Lf3VB1BnJ+qqSmzBg==
X-Received: by 2002:a05:6000:410b:b0:37d:5251:e5ad with SMTP id
 ffacd0b85a97d-37d5251e61emr10001893f8f.2.1728895503470; 
 Mon, 14 Oct 2024 01:45:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311835d784sm113938295e9.46.2024.10.14.01.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:45:03 -0700 (PDT)
Message-ID: <89f24f92-de2d-4303-a189-9e5bc1eba02a@redhat.com>
Date: Mon, 14 Oct 2024 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-1-witcher@wiredspace.de>
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
> Rust's standard library's `std::iter::Iterator` trait provides a function
> `find` that finds the first element that satisfies a predicate.
> The function `Version::from_segments` is doing the same thing but is
> implementing the same logic itself.
> Clippy complains about this in the `manual_find` lint:
> 
>      error: manual implementation of `Iterator::find`
>         --> drivers/gpu/drm/drm_panic_qr.rs:212:9
>          |
>      212 | /         for v in (1..=40).map(|k| Version(k)) {
>      213 | |             if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
>      214 | |                 return Some(v);
>      215 | |             }
>      216 | |         }
>      217 | |         None
>          | |____________^ help: replace with an iterator: `(1..=40).map(|k| Version(k)).find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_find
>          = note: `-D clippy::manual-find` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::manual_find)]`
> 
> Use `Iterator::find` instead to make the intention clearer.

Thanks for this patch, and the whole series.

It's a nice cleanup.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn


> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas Böhler <witcher@wiredspace.de>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 1ef56cb07dfb..76decf49e678 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -209,12 +209,9 @@
>   impl Version {
>       /// Returns the smallest QR version than can hold these segments.
>       fn from_segments(segments: &[&Segment<'_>]) -> Option<Version> {
> -        for v in (1..=40).map(|k| Version(k)) {
> -            if v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum() {
> -                return Some(v);
> -            }
> -        }
> -        None
> +        (1..=40)
> +            .map(Version)
> +            .find(|&v| v.max_data() * 8 >= segments.iter().map(|s| s.total_size_bits(v)).sum())
>       }
>   
>       fn width(&self) -> u8 {

