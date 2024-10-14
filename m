Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB9B99C3F5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE6810E3D4;
	Mon, 14 Oct 2024 08:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="REvDx4nr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32F310E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728895646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EHHrpd04LCN5U9FT9iT5XYMMgwb+6uYYFSdfvRXUjCQ=;
 b=REvDx4nr4WZSGevG2htoUjgMmLiuSyAqqPUwXN+xgNMDV4cQbl81mpAtpGmc5HxU+s96HO
 F5NdeyE36gC27ku/HyUJgqjXZMp8k3lMD3uzRNiU68864LaZ5St65+F/sMtymlNxagSeD3
 isyXajv1bHZkRetx3xozT3VoUc63J8I=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-h0y0IGTSPxqLTmJQtIQLTg-1; Mon, 14 Oct 2024 04:47:23 -0400
X-MC-Unique: h0y0IGTSPxqLTmJQtIQLTg-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-539eaa0561bso788665e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728895642; x=1729500442;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EHHrpd04LCN5U9FT9iT5XYMMgwb+6uYYFSdfvRXUjCQ=;
 b=gn5fOCvk7Sxj1vETSyeLTC9cYfjM57iOqQj7uOZGOuZxwCracjVD+AOgqCw0oAd+Es
 DN0Ltad7ZpEDbWoyRRyQ5e5FXl5AQOujz1BANX25gP0Uh5hC7lQcL+856yQBG/ylMx7L
 KA5mFR0ZkBAuDSMXuCOdWXQmkL0l09okU5WFHqlnaakySXlCH6LzvDJvMDTKUDgOlc3K
 lJuRInJOdavVJFol0oQo6maFjKfgGABSSzKp0+eayTNQRBoVRrCwSO5qU7tJQA7Y6vsE
 GDyZhxCnJF2jy08wCb3MskC9yIP0chnWOxq1Gw0Ap2ai0Os0tM/3Xw2fIKI5rZ13ZaHJ
 zbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWehpqqKO4Oc1zU+le2mluuqZVfEKebOzznwNi7rsPWBjd9GaUSuZeDwhJrKM6TUF2GnKFqBhE5yHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzN8fl92cQvurTRNeC8x/oy+U0fV+wfb+B0gBDU2zUXUwlcP/Wh
 uO07Trp+rXAuWjAsF0oyVg7L9gCCAZ+hYYgVZzxl/S7JCzUp4cSdRb5vRB+VHQLW2HQfbg1L4Ok
 +SQDPYzhQzUbeIuHhSCKyewLLeWSPEXoiHtDdTlMYJ1U6413KNigmZN0wxyDWqLJWcg==
X-Received: by 2002:a05:6512:3da3:b0:539:8b02:8f1d with SMTP id
 2adb3069b0e04-539e551635bmr2803372e87.30.1728895641639; 
 Mon, 14 Oct 2024 01:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNGzizcYSea0we+7mFRqxFtVg7tJgmmDdbFHqE+mDRdFYzekLDQxwTxv+nzZLoG0jBJLv5ag==
X-Received: by 2002:a05:6512:3da3:b0:539:8b02:8f1d with SMTP id
 2adb3069b0e04-539e551635bmr2803341e87.30.1728895641192; 
 Mon, 14 Oct 2024 01:47:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6d0217sm10791478f8f.60.2024.10.14.01.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:47:20 -0700 (PDT)
Message-ID: <08d47408-e15d-448f-9fa6-41a3d2ec953f@redhat.com>
Date: Mon, 14 Oct 2024 10:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/panic: correctly indent continuation of line in
 list item
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
 <20241012075312.16342-5-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-5-witcher@wiredspace.de>
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
> It is common practice in Rust to indent the next line the same amount of
> space as the previous one if both belong to the same list item. Clippy
> checks for this with the lint `doc_lazy_continuation`.
> 
> error: doc list item without indentation
>     --> drivers/gpu/drm/drm_panic_qr.rs:979:5
>      |
> 979 | /// conversion to numeric segments.
>      |     ^
>      |
>      = help: if this is supposed to be its own paragraph, add a blank line
>      = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_lazy_continuation
>      = note: `-D clippy::doc-lazy-continuation` implied by `-D warnings`
>      = help: to override `-D warnings` add `#[allow(clippy::doc_lazy_continuation)]`
> help: indent this line
>      |
> 979 | ///   conversion to numeric segments.
>      |     ++
> 
> Indent the offending line by 2 more spaces to remove this Clippy error.

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
> index 5b2386a515fa..58c46f366f76 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -976,7 +976,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `url_len`: Length of the URL.
>   ///
>   /// * If `url_len` > 0, remove the 2 segments header/length and also count the
> -/// conversion to numeric segments.
> +///   conversion to numeric segments.
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
>   #[no_mangle]
>   pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {

