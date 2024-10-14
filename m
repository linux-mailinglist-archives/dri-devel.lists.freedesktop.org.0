Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3250F99C3F0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79C610E3D3;
	Mon, 14 Oct 2024 08:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XrxrFZMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662AA10E3D3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728895617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/17f4khffk+a9y0XW4KJellwKrhnUx2dF476/iSdd00=;
 b=XrxrFZMYPdgwZWqaEKFjgWG2B1bj7iXy4Uyn820FDcbCVgx0TUn4JTnaYeXYsh+iW+TnKi
 um54tK2yrHDAlJUynicA7x45CChWtD5mciadwnO/yzHmLoiR8AjgtZoYI/E7/+wq9oBF9z
 6QreLKmNbjL+ABIx/qqwO0vv05Mh4rs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-CQJckxI0MpaFygUSanoETQ-1; Mon, 14 Oct 2024 04:46:56 -0400
X-MC-Unique: CQJckxI0MpaFygUSanoETQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4311cf79381so19208785e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 01:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728895615; x=1729500415;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/17f4khffk+a9y0XW4KJellwKrhnUx2dF476/iSdd00=;
 b=bHhrHiAjmJUYRh9HNQTh+tJ/D1tQojS/KogX7GAkfI+Y+MkNzOu3reWHvxEcW5jp5j
 I/KwzPM/dhzABXj8u8QlJ09XvSrzeMcpd772UCMumMGnQnz4dQapEMs6TfcnmGoVODGz
 wvNynY7zOWO7y2d+kFLTEB2pIluz3umdRq5Ke+l3oBL7JjZEd05DDjRlmcgWl64kwKXT
 VixDPZwavT9mSBQ4NbTxsif1Rq7UVW/JBDD411G1hXb6is/HAiausPkidnyWtmMFf5NC
 READ4syknijtgbjehgXpnTVvqQYETw4XXmactZJI8xSj8lgiKoPeUNq5GkkXx2a8F4x4
 svBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/DvTwOK8hY69c5mzDjY1kroSGFREIOlGuP0SV9dTeMXBDq9A7LQCpCe+cfEW/WzNvTO2KxMLH1F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTz5uSsCC4x8IoqELnEQ5olu4cGshA7M8PlXum/Bl+XgZtdQEG
 AA65CKMr018lZIo4xfyF/4G9EFGE1Gn9tZmMsfbJdA0JaytG9zRyZ7h+dzu5XW4pA6q7jxK6XuG
 QErORmkAVKAZMvn7LtNfn09+KTm/9cKoBU1jrkWWexiLXc5T2kjDjJlhPcY95l577Cw==
X-Received: by 2002:a05:600c:5122:b0:42f:8d36:855e with SMTP id
 5b1f17b1804b1-4311deb5f47mr107761145e9.5.1728895614956; 
 Mon, 14 Oct 2024 01:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5+HN0adeJaut1njpYq1VgQZ9Iv8AmOEw6fVQ/n2dMmXK2yIQhe+TWXeg5VBlE+i0XklLQA==
X-Received: by 2002:a05:600c:5122:b0:42f:8d36:855e with SMTP id
 5b1f17b1804b1-4311deb5f47mr107760845e9.5.1728895614550; 
 Mon, 14 Oct 2024 01:46:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4311835d8f6sm114344035e9.44.2024.10.14.01.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 01:46:54 -0700 (PDT)
Message-ID: <15e27af8-6ad2-4e53-9503-5f1b8904baa1@redhat.com>
Date: Mon, 14 Oct 2024 10:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/panic: remove redundant field when assigning value
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
 <20241012075312.16342-4-witcher@wiredspace.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241012075312.16342-4-witcher@wiredspace.de>
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
> Rust allows initializing fields of a struct without specifying the
> attribute that is assigned if the variable has the same name. In this
> instance this is done for all other attributes of the struct except for
> `data`.
> Remove the redundant `data` in the assignment to be consistent.

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
> index 767a8eb0acec..5b2386a515fa 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -489,7 +489,7 @@ fn new<'a>(segments: &[&Segment<'_>], data: &'a mut [u8]) -> Option<EncodedMsg<'
>           data.fill(0);
>   
>           let mut em = EncodedMsg {
> -            data: data,
> +            data,
>               ec_size,
>               g1_blocks,
>               g2_blocks,

