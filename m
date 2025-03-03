Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42734A4BAFC
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8810E3A8;
	Mon,  3 Mar 2025 09:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ad9CTKT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F19910E3A8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740994944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MBVVdo3tOVYaEl+zgFn8dQqxk+vyBv3FmhJQbHVALgc=;
 b=Ad9CTKT1C5RNt5mN31DOPTZzsar50zRlv0pcZ+VOnvDXxFVSIFfwwLKW856GCSZVRjwq1Q
 GoVnG4LL8xzvN6fCFb89ZHwULgmKLciW8OCCFZc2jyQWxMmVdaWNuLzvAFKj9K0wkcvID6
 By2DgvootjDcTylkagJrPRoYvqQk2zY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-HKWpuq4lN9uzTZjXR_5Amw-1; Mon, 03 Mar 2025 04:42:13 -0500
X-MC-Unique: HKWpuq4lN9uzTZjXR_5Amw-1
X-Mimecast-MFC-AGG-ID: HKWpuq4lN9uzTZjXR_5Amw_1740994932
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394040fea1so20467935e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 01:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740994932; x=1741599732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBVVdo3tOVYaEl+zgFn8dQqxk+vyBv3FmhJQbHVALgc=;
 b=vbnqkaeMcNoE6a8XU1fal/+bE/wEs8b2BQsL0frdUDW/bL5np8VfsXYkh78S3WM/4B
 O3/qALhWmF+m6ZO+e5kfnPDd88v/i/0mLB7YFSxg7jrnTkkoSaYQqEcO+JQ7YrGDG+WL
 ASwCZ88U6+8iEoDW2Zq6xwTqqWO0wlk4OvjgTcKRnJuvJa1ufFDYqffX7Bm8WF5VaWbR
 p+rzq8Eu+hdrWy34r6Ohc1hYVBiDr2WS//jEMNCaa3clwMX8KmkxvoD3evh8EWbcv4js
 mTJb0KLvsSvzv12sTXLr5+xon+Io3XI4hXKknml2ZKg4KgSkTAU0omBnyaA1aqm0An1y
 k3XA==
X-Gm-Message-State: AOJu0Yxezh2I+3gm/eFm73Atvj41szhxji9g7bBQMBBJOqLLFYqQlv50
 CDeXp0lHtUSvkANJF2AkwyL1UdhX6PQxlQXmEVEoqvFeCDxrUBm5fqbqQphSl6ZfRIdc1Pl61g2
 IGx3kLGfdnGDmYIOGX6cLP7e1nlaJDNfsyNWyYbcMOQ5W0J5oh2OROLU0ex2tigB6zg==
X-Gm-Gg: ASbGncuU6+bb8jdhgOdqCSFitLNEv1+T5O740zVinPKZaBO6BZsoTMIPyAu3UIMXfOm
 NngQYCVCiJ9W31W+oryWdgo+XO+QQlN5OYJkfz+mfygcrzkAWvKvWVX6lg6LWj5fHurlNLAuUF7
 4M457bHKt8jv4478ICD8mKcsU6PGvvFYEuAbyKaIkhjTvoZEJ/ztQnfXUHcS53X2UkNOCKLMZY4
 jV67IsdElpu9AalVzT8LwBbywYqkbfY0UCzAyVYOqPNdpj+wtnKrvgEBq9AFZ+kTIkhQtudHJaV
 DeShVEUETEooSf9gU2laVEOf1h1Ewy0P+CUNH075jAqBt1gkTnRu0mk=
X-Received: by 2002:a05:600c:b4f:b0:43b:c638:3433 with SMTP id
 5b1f17b1804b1-43bc63837a3mr9723125e9.12.1740994932369; 
 Mon, 03 Mar 2025 01:42:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDYmizeCfEPwnub6ZUt8HoyBNoVBgCgnBfss7JKJMNfK/DcWCCY9SyISgPNOR5yKhrWm25LA==
X-Received: by 2002:a05:600c:b4f:b0:43b:c638:3433 with SMTP id
 5b1f17b1804b1-43bc63837a3mr9722845e9.12.1740994931899; 
 Mon, 03 Mar 2025 01:42:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6a6csm14062502f8f.30.2025.03.03.01.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 01:42:11 -0800 (PST)
Message-ID: <739acf08-6978-41f3-a4db-724acc03ba06@redhat.com>
Date: Mon, 3 Mar 2025 10:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: clean Clippy warning
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
References: <20250303093242.1011790-1-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303093242.1011790-1-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6cf7TURz0k82H8wIV4yQ7NOzXo77JxdTvEplJbYuUxU_1740994932
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

On 03/03/2025 10:32, Miguel Ojeda wrote:
> Clippy warns:
> 
>      error: manual implementation of an assign operation
>         --> drivers/gpu/drm/drm_panic_qr.rs:418:25
>          |
>      418 |                         self.carry = self.carry % pow;
>          |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: replace it with: `self.carry %= pow`
>          |
>          = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#assign_op_pattern
> 
> Thus clean it up.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: dbed4a797e00 ("drm/panic: Better binary encoding in QR code")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 62cb8a162483..3b0dd59781d4 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -415,7 +415,7 @@ fn next(&mut self) -> Option<Self::Item> {
>                           self.carry_len -= out_len;
>                           let pow = u64::pow(10, self.carry_len as u32);
>                           let out = (self.carry / pow) as u16;
> -                        self.carry = self.carry % pow;
> +                        self.carry %= pow;
>                           Some((out, NUM_CHARS_BITS[out_len]))
>                       }
>                   }
> 
> base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1

