Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFF6A58D46
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8B710E3AB;
	Mon, 10 Mar 2025 07:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BP6Mwt64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F3E10E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741592998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5kIvy1af+TbHcL/hyxVpb8RVtEt62vD4Y3oqmjYEDE=;
 b=BP6Mwt64RLUDxOMxBB3CcuNXlXZSwrXHViNDfYrshT0PCdmxepR/Pd9Ym4NdzZcsjrdhji
 nV402H9hfbY5fXcYB2WTkIKCGY2FUD+TglI/GNClL0EMbGwRH+32VrxgAjbztSL+A5EE/p
 xwxHNsjso1Td5DrHQyBSelWy2quTmxk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-ivP2Li4fMgmjxqFproChPw-1; Mon, 10 Mar 2025 03:49:55 -0400
X-MC-Unique: ivP2Li4fMgmjxqFproChPw-1
X-Mimecast-MFC-AGG-ID: ivP2Li4fMgmjxqFproChPw_1741592994
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf5196c25so3408905e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 00:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741592994; x=1742197794;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u5kIvy1af+TbHcL/hyxVpb8RVtEt62vD4Y3oqmjYEDE=;
 b=INyjt1yGQMhGvRR7bgFBWvyY+2MImIezqwNHxzAYiAySB2gN6Tdu+T1MZl09tfNHVr
 jgk1zDadZ6jflAvf5BiPEXa0zAv+zNLfZNyaCYQy560qpH8GXEbl4kdf1TNNtiuqrnmf
 m5RAdYzWlnd11nWCMkE0W5c6iABok2EKbBhQYOFzjAQe3Z2/r3n2IEf4Xo/HhQCPI4Pw
 POLlv5pAigrBdRLdPxBnkGUKKmRcqdOs5Dj7FFVx/GAH8bL53+xhYwmen/ikFTzHMNeq
 MzN100ekdhm82jSv5u6hVfZgDuj6TwO9m0TCtwv8jARG0PYKev9Z2XjueYFYRNH0aW77
 fa3A==
X-Gm-Message-State: AOJu0Yy7KsBfeWmXK0dTIWY8dkwi5oU+qm2QkHZyQLci9WyPhBW14NkJ
 PR+kzPl3BHHvCjEth74rzoQ0bTiXApnc41uW6r8f/FXWYYouRzCqNj//yphl/og1c/vGSgPW9Tk
 cp3eGKM67TAt3WoS6hh7frNbifkYq1cdgL4IbIaBF++N+QinhjET6ZIlrjiQ+gIDV+w==
X-Gm-Gg: ASbGncvfOYT5k2z1oBLdNZZWh1mHFQHEppsjUceWybSyQ/yMQpDOVWNbKLY4Oz6lKZ2
 dSm5+eMCHGoiA2ldyW1+Zt20d2fE6Jhc13peZLZPfvYa6TEnV00Q3NM/1Su0gew5UKyPdVR+L+T
 +tK57nVVUTPHPvwJQNFLG6v4uTYrgeqY6LPmAiZHTsd9M6qQT6KsjSkQAANM5+ekpujbr/zuXAf
 cFjQEippHR9+Bah5e9zHzeMhvPIKmFQrXuOGLI5+zllPtJFjwBhIqICbapDqMteIqbNHQy38u1C
 uWQhYTlNPjquJfQ3nuKpsOGqKsDCYbhv2C5IYO/goet59t5LK2sFbMg=
X-Received: by 2002:a5d:6d09:0:b0:391:34:4fa9 with SMTP id
 ffacd0b85a97d-39132b56eccmr8992845f8f.0.1741592994109; 
 Mon, 10 Mar 2025 00:49:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFGDJo2dCkSOhn/W3s56Mf4MrQ0JYSQmeOFCRJ3rj6SEOpkuthbr1LKEQhE5Wn257lq7BmQQ==
X-Received: by 2002:a5d:6d09:0:b0:391:34:4fa9 with SMTP id
 ffacd0b85a97d-39132b56eccmr8992816f8f.0.1741592993752; 
 Mon, 10 Mar 2025 00:49:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01cd31sm14138878f8f.52.2025.03.10.00.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 00:49:52 -0700 (PDT)
Message-ID: <7fa51125-3015-446a-93b1-57b07a7ee8f5@redhat.com>
Date: Mon, 10 Mar 2025 08:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: use `div_ceil` to clean Clippy warning
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
References: <20250301231602.917580-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R9IV-ZZ-e_EwIbO9CXjV6M94jzUWvle0-_ZPcPiHQdg_1741592994
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

On 02/03/2025 00:16, Miguel Ojeda wrote:
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
> 
>      error: manually reimplementing `div_ceil`
>         --> drivers/gpu/drm/drm_panic_qr.rs:548:26
>          |
>      548 |         let pad_offset = (offset + 7) / 8;
>          |                          ^^^^^^^^^^^^^^^^ help: consider using `.div_ceil()`: `offset.div_ceil(8)`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#manual_div_ceil
> 
> And similarly for `stride`. Thus apply the suggestion to both.
> 
> The behavior (and thus codegen) is not exactly equivalent [1][2], since
> `div_ceil()` returns the right value for the values that currently
> would overflow.

I pushed both patches to drm-misc-fixes, with the "Cc" tag added.

Thanks a lot for your contributions.

-- 

Jocelyn
> 
> Link: https://github.com/rust-lang/rust-clippy/issues/14333 [1]
> Link: https://godbolt.org/z/dPq6nGnv3 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..8bb5e52d75cc 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -545,7 +545,7 @@ fn add_segments(&mut self, segments: &[&Segment<'_>]) {
>           }
>           self.push(&mut offset, (MODE_STOP, 4));
>   
> -        let pad_offset = (offset + 7) / 8;
> +        let pad_offset = offset.div_ceil(8);
>           for i in pad_offset..self.version.max_data() {
>               self.data[i] = PADDING[(i & 1) ^ (pad_offset & 1)];
>           }
> @@ -659,7 +659,7 @@ struct QrImage<'a> {
>   impl QrImage<'_> {
>       fn new<'a, 'b>(em: &'b EncodedMsg<'b>, qrdata: &'a mut [u8]) -> QrImage<'a> {
>           let width = em.version.width();
> -        let stride = (width + 7) / 8;
> +        let stride = width.div_ceil(8);
>           let data = qrdata;
>   
>           let mut qr_image = QrImage {
> 
> base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6

