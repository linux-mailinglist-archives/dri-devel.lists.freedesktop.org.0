Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3BB11F81
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 15:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A4410E36D;
	Fri, 25 Jul 2025 13:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TNXVP7mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8194A10E1FA;
 Fri, 25 Jul 2025 12:20:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-454f428038eso19532145e9.2; 
 Fri, 25 Jul 2025 05:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753446043; x=1754050843; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VA1aVk5ATgGwWP5YvZwY73Pqu6/2aciSmLuZYBAcU5o=;
 b=TNXVP7mouv7n/Crc0jr2LN9LYVBGhNMTOhR8j4BKcCsdICTgWtl3DxhYKekzVwbm3H
 D5Dj/YGT3MrYoxvZPxTogz5u15oXPOGnTlSPqIR86ToeSckwuyh9c6aM6vNx/Ed3k8Jx
 KR7lTkpmYj7iJMVU+jwI3xoSLzIgyk0YXYIgojpQ3B2x0lA3Yp3vFSJUG46gxG+UDnQw
 0/uuHwwqqvFc9tLieZcgwlnS5zueJhgV8ACE6i6UVJpSuQxePTd7C3H+8R1blyQKWRhB
 xA3w6JGSs5JfUGCxIm5uofMk5SdTdykdZCrMG0L6hHTdNbkJsz18AsMnUy7/yTM5kfW6
 BZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753446043; x=1754050843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VA1aVk5ATgGwWP5YvZwY73Pqu6/2aciSmLuZYBAcU5o=;
 b=tRMSwXGyFBhjXkg+kY4I54nDot+FI2DWuZvcZBpm1/8AeVGNCHpfrnMXcK5MTifOjx
 q6Uz5DoXIlNhqg4BimE+h0qLEDr+kZxz9UHGkw0GJWsL71V+ozARq2nSf0CWO4THCE8T
 z2RXJWwTk4VA9jBUv7/LW5B5sCFUO7u1SVwSjguWstHYCLQkFXhtbidI2wlefCbJpmY3
 ZMQyWTtXdv9yr6Ck7D6WqaQJH58ZnxzZoOs1jmd5cyLjf1QmBxP2itkQJz1nwJUo7CpK
 naQtTWFYSss4PQOplNPHwxKh5cP4rI5ig3W5IZbwJQYQVo7Ggy0/MBbv/46gwpPA7oRX
 FvHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjo7ieol/nGuZj7Bm/1OKVxEmZkQZJrajsRvdkbIHsqjGwmHwJYK0gmTLgFfV28+RdHSXj/tgPUy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZGw6h77C2tH40Ed3BE8GKTT91yEudHbNdrahx2UKmqHx6LTub
 IAE6MnMQwLXyhJ8ughZqVRzQXHXhUwqqwcBdVCDct4spcxSRWTKxVrJv
X-Gm-Gg: ASbGncsBjQ+Z9W+Tr9IR8Rw38k4nxpVmhGnWLUwDCEWmvtN9OgzbcpThd2aw/rcDCHE
 hNWjwvBZeW/5XSxVvd8QzZRK2rsAMNuKXde1kIS6hP7Yg1dJjnAaKNeZiRTr8tEYh5PxL9Svse/
 TknC+4UpgcZLmKA08n5ZsFis6riH8Gn7XytdQSWD9q1AKMhCCDrNEJs+oSMUOAvHham9JSHFNLN
 dBzsd1osdZfZGFQ8TRIbw0eO26ZWB0TF6L7b+7OBOFVfala5Ic8BVc6u8UWCuFH8QXS7sD++uEr
 N5JwxeZnRxULEjdWRhJHmh2l2D32nYZbkXFKtZWCfM9oV10hIC7N+RIJrwG9Y0wkWHqpWICmxij
 jzdrQ00Lnm3dy/syi+V/tOhoLaGKsYJppzoY=
X-Google-Smtp-Source: AGHT+IHSdaknPrqijioY9HDWLiOWQTIycCby2q675AueD5MlPYeEPC0uzrUjYIL3oulhKhqiN6JSTw==
X-Received: by 2002:a05:600c:8b11:b0:456:1d34:97a with SMTP id
 5b1f17b1804b1-4587631561fmr18307095e9.9.1753446042665; 
 Fri, 25 Jul 2025 05:20:42 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3587::1ad1? ([2001:871:22a:3587::1ad1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054f686sm51705225e9.14.2025.07.25.05.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 05:20:42 -0700 (PDT)
Message-ID: <5b2951af-517b-4d5c-887f-417f486fd9a2@gmail.com>
Date: Fri, 25 Jul 2025 14:20:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: nova-drm: fix 32-bit arm build
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20250724165441.2105632-1-ojeda@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250724165441.2105632-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Jul 2025 13:46:19 +0000
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

Hi Miguel,

On 24.07.25 6:54 PM, Miguel Ojeda wrote:
> In 32-bit arm, the build fails with:
> 
>     error[E0308]: mismatched types
>       --> drivers/gpu/drm/nova/file.rs:42:28
>        |
>     42 |         getparam.set_value(value);
>        |                  --------- ^^^^^ expected `u64`, found `u32`
>        |                  |
>        |                  arguments to this method are incorrect
>        |
>     note: method defined here
>       --> drivers/gpu/drm/nova/uapi.rs:29:12
>        |
>     29 |     pub fn set_value(&self, v: u64) {
>        |            ^^^^^^^^^        ------
>     help: you can convert a `u32` to a `u64`
>        |
>     42 |         getparam.set_value(value.into());
>        |                                 +++++++
> 
> The reason is that `Getparam::set_value` takes a `u64` (from the UAPI),
> but `pci::Device::resource_len()` returns a `resource_size_t`, which is a
> `phys_addr_t`, which may be 32- or 64-bit.
> 
> Thus add an `into()` call to support the 32-bit case, while allowing the
> Clippy lint that complains in the 64-bit case where the type is the same.
> 
> Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> As discussed, it may be best to have a newtype, or at least a function
> to perform this -- here it is the minimal fix nevertheless.

I agree we should at least have a specific conversion function, but for now:

Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Cheers Christian


