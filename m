Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0999D93C4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 10:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF05610E7F3;
	Tue, 26 Nov 2024 09:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IceaiuX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF45310E7F3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732611843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=im/8o06WdRL6AvUGxWnBVgqT+amoAsT42x2YeIRHNPI=;
 b=IceaiuX4bWPY+NayfmDoGeWR8K0WsDaDbQubOBQgdQhUmy8BkXjfsWzM3yzS5GfDI8H9yO
 8ZgNKKcFLiKkHYrWeFsTV6Qzl0uotriQ/NIfSjg9PH//ow2AekeEe7b6oC+agIH9FaxDPr
 jl1Xb7svlzN7hPMntRoUkhwJjenxhok=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21--jgddxdnOMGbTbBd4zRT-w-1; Tue, 26 Nov 2024 04:04:02 -0500
X-MC-Unique: -jgddxdnOMGbTbBd4zRT-w-1
X-Mimecast-MFC-AGG-ID: -jgddxdnOMGbTbBd4zRT-w
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4349d895ef8so21976505e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 01:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732611841; x=1733216641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=im/8o06WdRL6AvUGxWnBVgqT+amoAsT42x2YeIRHNPI=;
 b=jK4Rzyh1gLd61OKV0BARe9fOnDQnJkK5wyr0rzVZ+uV3rBw0sYVhcUeZeji60efdMC
 5pC7aCod9IYMkKtL/YNd+Gcp6Aq1PdKrlRT6QTySIOXoAns0U6O+PzaHlIyILMrFDBs8
 0GJCxv0QOwIFvRk9n4wXBdQPGOOQnKJ6r4KcQpgUwgwdj9bfuFCxKQY0fpMGNW4jt65i
 iwoV0a2EN92bdJhF2NGNDMxV9CErrMEwZaBIyBDZGeznU2x1P5wRjhXhjJZaYagcrc18
 RYieMnNTzY8TQaJ1kdpdCeh3hULnuYHh71RwBQ3O1wfCnPuIAIhs/9jOS2MafEG2dgE+
 D/sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNC7Dkw0y2mF3YOA42SmOp0io8MjfsUVsMDLua932pCDE7l3KhbHPOBkJVbwngz8GuVSXHtpPD22I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz41MusBv09qpo6Lybe8DgU3b3bDAdztDvyqzU1plNo0xCX6Lmx
 d90tit8RLM6CR5l/0n3MNTL2vnYP0fgkOAdnAII1sW2yw9HdA4lI7fcxdaGpgyAt+zCMzBXjZ87
 DVQVssY0B3mS4AoxZ+49DAP2tOTutV+ssHVTHugKqP1RSPUI6cnz2RAlXbDLxigh1gg==
X-Gm-Gg: ASbGnctNBZ5qm1GueKAfNmqywuW4JMp7TsvXyLzfaDYk/EHBPU3AONcqYnzShoZ9dYO
 ej+RLmMxyZCc6LKV8YHm7/fb5RY+OPYzm7l7JAPQwfEs9cFn3qaYkS2m7zsE06WipacUtA67XlS
 Qg0Tomnd/b+O473E0mSh5JFx1VwyYO6rpXrc1TBay3QXxqmkPsLF5feqrwhjHUFM4tCKCvyaUTw
 3+RFBrf1l3Lf06CaZUaCzPAMAWALOHXRD38GU+Zqgb/1feJSoUsPLEbkwdBghSvsKcfwdFCP9r7
 4qZqeLU6DUc1DQ==
X-Received: by 2002:a05:600c:a49:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-433ce4af26bmr148803985e9.32.1732611840671; 
 Tue, 26 Nov 2024 01:04:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqku7owNzsRW4AuiyjR+T5rbYPu8TV/N4RKw6ZJEgH4GkTL9H/M9yM3mzoUSyueykAQvBQkA==
X-Received: by 2002:a05:600c:a49:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-433ce4af26bmr148803685e9.32.1732611840280; 
 Tue, 26 Nov 2024 01:04:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fafeceesm12715211f8f.37.2024.11.26.01.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 01:03:59 -0800 (PST)
Message-ID: <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
Date: Tue, 26 Nov 2024 10:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, stable@vger.kernel.org
References: <20241125233332.697497-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241125233332.697497-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZLzBLYBMmkEmUnzZHt_EBp6-c37-zdhseQ7noErP6Gk_1732611841
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

On 26/11/2024 00:33, Miguel Ojeda wrote:
> Clippy in the upcoming Rust 1.83.0 spots a spurious empty line since the
> `clippy::empty_line_after_doc_comments` warning is now enabled by default
> given it is part of the `suspicious` group [1]:
> 
>      error: empty line after doc comment
>         --> drivers/gpu/drm/drm_panic_qr.rs:931:1
>          |
>      931 | / /// They must remain valid for the duration of the function call.
>      932 | |
>          | |_
>      933 |   #[no_mangle]
>      934 | / pub unsafe extern "C" fn drm_panic_qr_generate(
>      935 | |     url: *const i8,
>      936 | |     data: *mut u8,
>      937 | |     data_len: usize,
>      ...   |
>      940 | |     tmp_size: usize,
>      941 | | ) -> u8 {
>          | |_______- the comment documents this function
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
>          = note: `-D clippy::empty-line-after-doc-comments` implied by `-D warnings`
>          = help: to override `-D warnings` add `#[allow(clippy::empty_line_after_doc_comments)]`
>          = help: if the empty line is unintentional remove it
> 
> Thus remove the empty line.

Thanks for this patch, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Cc: stable@vger.kernel.org
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Link: https://github.com/rust-lang/rust-clippy/pull/13091 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> I added the Fixes and stable tags since it would be nice to keep the 6.12 LTS
> Clippy-clean (since that one is the first that supports several Rust compilers).
> 
>   drivers/gpu/drm/drm_panic_qr.rs | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 09500cddc009..ef2d490965ba 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -929,7 +929,6 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>   ///
>   /// They must remain valid for the duration of the function call.
> -
>   #[no_mangle]
>   pub unsafe extern "C" fn drm_panic_qr_generate(
>       url: *const i8,
> 
> base-commit: b7ed2b6f4e8d7f64649795e76ee9db67300de8eb
> --
> 2.47.0
> 

