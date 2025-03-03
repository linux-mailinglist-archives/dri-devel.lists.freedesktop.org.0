Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F5A4BD35
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 12:01:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE1089131;
	Mon,  3 Mar 2025 11:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bvG68r/p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A9789131
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740999680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtCwBcye9CTrtDuhJsGiK+EHrAB7P75qFAGVXb42+Gc=;
 b=bvG68r/pg3OOdKwLVaCv9dj6gAD3ggAAhq7YyGotdPqxAqv7iuF/wkYLf9ZDrbArrDRVaM
 rnHZ1aBOHJ1guSyJ8DepU+9Dm7lwwiUVl/oSFUgwcbzfYJA9+pJ3eSZPyzgcCoLS5o4OjY
 ttWHVS/UvEDKMRdAwrskJfyeGHYjY7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-coi-91nsPlue600ZEnCv4Q-1; Mon, 03 Mar 2025 06:01:18 -0500
X-MC-Unique: coi-91nsPlue600ZEnCv4Q-1
X-Mimecast-MFC-AGG-ID: coi-91nsPlue600ZEnCv4Q_1740999678
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43bc5a18c52so2659685e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 03:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740999678; x=1741604478;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BtCwBcye9CTrtDuhJsGiK+EHrAB7P75qFAGVXb42+Gc=;
 b=QZsssGIxUUnPHbNIMp4JvqSHLhRzbK+77tvPhVJPI2dhpuBr3+OB/XqzxIUjq3UYGN
 2MR7UhFJQoU/sA6f+8N+7vPc4WVdamnj9ESk+RU7BvAJiTXrEGnNB07KbiQC4M+583PK
 MWuz6E+7gyi+RW/GXSh6S/uTWUgHwrXIfaPbhCbr4XJ1oUIIoNLbWaSFNLPO9vdnQqQ3
 qQjilULbBnXkXi1EmY1k4MNzXGYlwOtu2KKyoTREZ5iedj7c+ckRR5xxdggGWt640Qg3
 HsKyw9Tac3TUEGv05GUHUKJEqHuq+cOTSRTtxMVXq1ifOl3de+VaJ/mRNLiYjgiFNYDN
 6Twg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN/OPQEDVdbmCbcy/rnPpBq5Gtu6x7kRUjAli5Njuu7+daCJ16J4KJ3GXx1aS5LERvYX9KPP16S+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhEqAecPo4R//wE//XGR8VP5qCKKsr792LyIPLQOXjx+aFpSxF
 LibYE5p3LvH6RZj0WeFBxwEkINY6csP/f1a/vC8+T350uEgYYSrpZDNr77x7OA2AqVuTnlSn1Zb
 ucVrOtjwpY1w1TysLcza0ctcMboF5eT6TYPZjNu34Yb7uTKo79N++RPjQ2mOlgIJ3sA==
X-Gm-Gg: ASbGncvj2hOssO6LzJNalEx/rs4WUrB03hRRu9gSxkZpcBq1Xn+NjxASrTp0MfD/k7p
 pBkbU9bAKzfJT2BNN2zJKcndVnRPLIRfagzlxOeVSO81WIIA7UZQFGrH9joLuQhsI4PBXodASP2
 Ow9au3wDr/Ahw9JdM6XheBXUSwZEQBP57IVYIxtXSBGjnSVcc9PNHs4x5ML139JF7U/IawFXD9Q
 UOzDRobX4jNTD8Wb30XwJndg7AAjPx6O5oGtFrenxhtxkNpjqwem5k3pg9zWUeoBP7nyZxocxlY
 HkYYoaNHpL0VUwGSmpz+ZVt98lmrfgZdirgIWySIjM1+Su5kUYEOZ0Y=
X-Received: by 2002:a05:600c:4f10:b0:439:96b2:e9b with SMTP id
 5b1f17b1804b1-43ba66e1e26mr99724985e9.9.1740999677524; 
 Mon, 03 Mar 2025 03:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6f+Z9mG7hrRn65eukLG1T0PhbqLEnUNclLy0PNQV7Wtv++uSsmKJt4PLYypBMANEATE/SJg==
X-Received: by 2002:a05:600c:4f10:b0:439:96b2:e9b with SMTP id
 5b1f17b1804b1-43ba66e1e26mr99724395e9.9.1740999676982; 
 Mon, 03 Mar 2025 03:01:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc596eb90sm17756925e9.17.2025.03.03.03.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 03:01:16 -0800 (PST)
Message-ID: <cdefec43-c290-4460-a1f3-7eecf38aa77b@redhat.com>
Date: Mon, 3 Mar 2025 12:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] panic_qr: use new #[export] macro
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-5-41fbad85a27f@google.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303-export-macro-v3-5-41fbad85a27f@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XmGuwai4jLmR81IIJ1yNGngPydgHDNF4CcIkCwqFDxw_1740999678
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

On 03/03/2025 09:45, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types
>     --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>      |
> 986 | #[export]
>      | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>      |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>      |
>      = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                 found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`
> 
> The signature declarations are moved to a header file so it can be
> included in the Rust bindings helper, and the extern keyword is removed
> as it is unnecessary.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>   drivers/gpu/drm/drm_panic.c     |  5 -----
>   drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
>   include/drm/drm_panic.h         |  7 +++++++
>   rust/bindings/bindings_helper.h |  5 +++++
>   4 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..dee5301dd729 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> -
> -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> -				u8 *tmp, size_t tmp_size);
> -
>   static int drm_panic_get_qr_code_url(u8 **qr_image)
>   {
>   	struct kmsg_dump_iter iter;
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..906943b02beb 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -27,7 +27,10 @@
>   //! * <https://github.com/bjguillot/qr>
>   
>   use core::cmp;
> -use kernel::str::CStr;
> +use kernel::{
> +    prelude::*,
> +    str::CStr,
> +};
>   
>   #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
>   struct Version(usize);
> @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>   ///
>   /// They must remain valid for the duration of the function call.
> -#[no_mangle]
> +#[export]
>   pub unsafe extern "C" fn drm_panic_qr_generate(
>       url: *const kernel::ffi::c_char,
>       data: *mut u8,
> @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * If `url_len` > 0, remove the 2 segments header/length and also count the
>   ///   conversion to numeric segments.
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
> -#[no_mangle]
> -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +///
> +/// # Safety
> +///
> +/// Always safe to call.
> +#[export] // required to be unsafe due to this annotation
> +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>       #[expect(clippy::manual_range_contains)]
>       if version < 1 || version > 40 {
>           return 0;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..ff78d00c3da5 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
>   
>   #endif
>   
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> +			 u8 *tmp, size_t tmp_size);
> +#endif
> +
>   #endif /* __DRM_PANIC_H__ */
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14..607e90a682ca 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -36,6 +36,11 @@
>   #include <linux/workqueue.h>
>   #include <trace/events/rust_sample.h>
>   
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +// Used by #[export] in drivers/gpu/drm/drm_panic_qr.rs
> +#include <drm/drm_panic.h>
> +#endif
> +
>   /* `bindgen` gets confused at certain things. */
>   const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
>   const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
> 

