Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1634A4BC89
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6F510E178;
	Mon,  3 Mar 2025 10:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="AkzaOg0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223D210E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:38:48 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ab78e6edb99so591834566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1740998325; x=1741603125; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WWO2EgXbq+zvviCN6nQ8SuxKO9LcyLd8SMLZLc5FWnc=;
 b=AkzaOg0nMx9MKfQOupqNp5Nks195mR9+uuUcOZwSbgtwi+BqgPdUqXTt7nEGQ7F53C
 sco2KGPQymLdm4z6SenH+wq8Z7Nrk8N8UqEAPOWkE8N28b++mrK4+VBPubJ2d2TjOPJt
 Jzjbcb0qz1KhrmN5u4KnRkn4OfkjuD6K887ziqg7JIhe5TiwPi0/VcO3yCkgKRV4yYHX
 25xmUU7+PHgenAA+n9Ah8Fvk0+scLc0MR02sH/lJZ5K2/MCZwTgCEHRz9X/jA9Es8rdS
 zEV+Tr0Sf0tT+/3akIsn5WH8g96o4xV62Nf26rSSpjEg1l5EdIuFYIEGPv80m2eTpcaF
 m1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740998325; x=1741603125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WWO2EgXbq+zvviCN6nQ8SuxKO9LcyLd8SMLZLc5FWnc=;
 b=YifdJIq0SO16yHmdmcOxF/IMdc9HM2hoZVvIkIcZHEkS5ZbOK4ZxSOoQWEE/e+5Sib
 EWbQ/M4Nzp39At+2R+jdoyZzXY7FglbecvNu8tRYAYzqfiwi0QlmBuD/tI3vsAF15RrO
 neSSPVeL3UihqnqYKRD8fHs3avQCE7PxUwDe7fDyvPjqcGba21BFavKu/PapZ/hNtCF/
 gMZNaw6ZHn6IphFlB3oETyZrlv29hpZKs1Td7bqWGaJu04pNpsDIuL8Ya6JdBhHzQny8
 Ih5IWqlmdZ9He2nXzdT6LaACHOEssq999USvMuNn5yhTxm3XkL22Lqvcr+bfR27dGR76
 fbzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzAigXcEx3YnFNR4XzEHuJZmT+Ma3OkQ00ZijeIzZvUR3rD5JYDs4vjI9D7lltN9mxrGddW79Lg2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5urmlYekLDt5g8JXZL4+XUC03W8RmU6drYMKF+y7fV5L77NHa
 IcYMPT5T7WCwaH0QPnwV4IiK5OTwYBlVfyHgT05PQc6BdTHkVSgfA61O6vMimjc=
X-Gm-Gg: ASbGncu7tODDBRiP966FS1P7PWXe3sMJO/nPKt9YNHaemkrnSwAmd52AVppoeqhR0tV
 uzj3NF+M5RXaytq3vsSxWEypwOmD2VTynf3y/Ea8GkHPofAdaXz+j+eLRRtE77/wbsDSlfa8kZj
 yHINJC6GQgWpBFwUUajuND9Dx2GTw/KX1Z/qncNEKQV2b+JAeEPOW7dIb67JPUUAF0K6dytUWJS
 AxBdQPSTgiiMn7xZG9M/QCLP/irfLzZCdn40qjdMH9y1D0djsGyIenz+lUBkpqQ5ai0m+s7C+cq
 E6rsYhKkAnU8JKwoWDBOGsLLpofI4hqpQhARCY0Kco8tmc0=
X-Google-Smtp-Source: AGHT+IEc717PDdGk4gN5GFyTbXEJWA7c/lYSctH5VoUkyx7imqa5/ZkaLkBrdFhlx2/vtXyNY8DZ4A==
X-Received: by 2002:a17:907:7288:b0:abf:5922:b7a8 with SMTP id
 a640c23a62f3a-abf5922dccamr1161597766b.41.1740998324968; 
 Mon, 03 Mar 2025 02:38:44 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac052702e83sm131063866b.21.2025.03.03.02.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 02:38:44 -0800 (PST)
Date: Mon, 3 Mar 2025 11:38:42 +0100
From: Petr Mladek <pmladek@suse.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/5] rust: fix signature of rust_fmt_argument
Message-ID: <Z8WGslnV1i1l822H@pathway.suse.cz>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-1-41fbad85a27f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-export-macro-v3-1-41fbad85a27f@google.com>
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

On Mon 2025-03-03 08:45:12, Alice Ryhl wrote:
> Without this change, the rest of this series will emit the following
> error message:
> 
> error[E0308]: `if` and `else` have incompatible types
>   --> <linux>/rust/kernel/print.rs:22:22
>    |
> 21 | #[export]
>    | --------- expected because of this
> 22 | unsafe extern "C" fn rust_fmt_argument(
>    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
>    |
>    = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
>               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`
> 
> The error may be different depending on the architecture.
> 
> To fix this, change the void pointer argument to use a const pointer,
> and change the imports to use crate::ffi instead of core::ffi for
> integer types.
> 
> Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
