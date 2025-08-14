Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F2B25BFC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B15D10E7F1;
	Thu, 14 Aug 2025 06:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T2VGHng1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E5410E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755153704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S9gfDC3XT5JH5+UXZeFk4ANri2tI0Wf8QHIFMwTkbME=;
 b=T2VGHng17F5SY6iCp5pK+euKwcgnV75cVj4baojPFzjz9NmI+R7mlZ7n1UzWGj511OtLK8
 7z1YBI36XXY4fVLjgeyBc1lxOMqLUtEVSH3gEHxMTsYpGgXvaxrIKYaPV4XMJXk5xy5CyH
 A6U4txTsIM4BLbL2RyrGIBIXbPnVeqY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-4me4kWkdN6ulqreR2DF7fA-1; Thu, 14 Aug 2025 02:41:42 -0400
X-MC-Unique: 4me4kWkdN6ulqreR2DF7fA-1
X-Mimecast-MFC-AGG-ID: 4me4kWkdN6ulqreR2DF7fA_1755153701
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b0cfbafso3421595e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 23:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755153701; x=1755758501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S9gfDC3XT5JH5+UXZeFk4ANri2tI0Wf8QHIFMwTkbME=;
 b=WlWojSYnjAYMYh4ecp/wu/IRBTzNg06fNs1nsTocrDQiErluPUvA1wbhJEuRlXNFfL
 KaznLb9Sx60lLlO3opQVmbfvHMzorncvWVfWOj8rISIIaQxWGrY2O1J4rAe3yope2pWF
 wCirpwYmjMahMtYsEQTgXqNjYYD1zhx1gQlaEZMabrh2fclggdkRjy5pN20q82YMldZp
 eI/wEKkt2pbuRIXsbpKVXkddXpNlpmgT0UAzFpQnEsBi7Lgv7CB8j2mAPHecghJBmg21
 TGiivV00jEVHn0jbOWT/vAOARrnWrGXPfX/+QDAps8yc3j+z2esSO+j6iO+n57itOjdH
 UHbg==
X-Gm-Message-State: AOJu0YxBIhcRQaJP9DAsVDODjKIkviUYYUWuspi5NCBEw2E575ku6G15
 oILmYqFKl8Fa6keXX4kgXRmlCcCxDt3xEe5KGi+yoSBSHZGuD1UyR/AGXMZ0b50BDQJNZdvKiC1
 KR0b0AU08PCAcAR1nACT325GmZZIZPwPkQO333WAvDbdnwqLSM5VBwHJBDMIEUgVWkfvWRQ==
X-Gm-Gg: ASbGncs/pxVNnP5L0m17E9R54BvLoXAvKxIvbT/1pLugMpjJsLWuWeWsot8ElhWHdit
 FkfRs+wn52QOi5WSgLaRU8azJ4B8kYtBVrtOsUEZjsz9ybsuWsErspR7ckP7R9yPl68xt+l0r6L
 SH1HtglPZnSh0S5eRslJg5jegiz+rCzn8iwoJTh2Kw0siHcRrifhaTU592RJ33PLr9xb3NhcitH
 R0IAG3E6vhDhEtBQ8O5IGZv2McD4HCJEf2QgfEbF2o6o0INNlwGIwz6Bs8fDsP/pHrOrnuRDYXQ
 kTvxlqsIGX25ClnINUbhQzN0rlno0KImBJbKD+Ef8YuJToOFueR1r361TipmwAYIyZEq7L0AOWs
 MXIQ=
X-Received: by 2002:a05:6000:40c7:b0:3b7:8a49:eed0 with SMTP id
 ffacd0b85a97d-3b9f1a13965mr1378466f8f.22.1755153701042; 
 Wed, 13 Aug 2025 23:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpLaxNWs2oFsAZSrN9kqR+39ayEAZmpXcMUMLGDC+7HLlsr/ah//p96eCfa0Qd8T4sw00vYQ==
X-Received: by 2002:a05:6000:40c7:b0:3b7:8a49:eed0 with SMTP id
 ffacd0b85a97d-3b9f1a13965mr1378416f8f.22.1755153700568; 
 Wed, 13 Aug 2025 23:41:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bc932sm9252735e9.3.2025.08.13.23.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 23:41:39 -0700 (PDT)
Message-ID: <0f3a72c0-f52f-4ccc-acd8-861824fb762d@redhat.com>
Date: Thu, 14 Aug 2025 08:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] drm/panic: use `core::ffi::CStr` method names
To: Tamir Duberstein <tamird@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Len Brown <lenb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org
References: <20250813-core-cstr-fanout-1-v3-0-545c14bc44ff@gmail.com>
 <20250813-core-cstr-fanout-1-v3-1-545c14bc44ff@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-1-545c14bc44ff@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zpwibbSPoUWCE6Z3gIloyWpBYBlC9Vv4hdoNI49kSY8_1755153701
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

On 13/08/2025 17:41, Tamir Duberstein wrote:
> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoid methods that only exist on the latter.

Thanks, it looks good to me.

Acked-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 09a9b452e8b7..10bc5bb16992 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -948,7 +948,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>           // nul-terminated string.
>           let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
>           let segments = &[
> -            &Segment::Binary(url_cstr.as_bytes()),
> +            &Segment::Binary(url_cstr.to_bytes()),
>               &Segment::Numeric(&data_slice[0..data_len]),
>           ];
>           match EncodedMsg::new(segments, tmp_slice) {
> 

