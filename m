Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940ACA6EC10
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E632310E517;
	Tue, 25 Mar 2025 09:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hJKOv3x9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771CC10E517
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742893346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wj1IChreYTEW7S1AiPXdgyUmHcauFp5NeY4Eqtc9FGw=;
 b=hJKOv3x9LSrXF23YoQlw2ngGe9MmiGZu3lzlPMCmDQtt4SEmI2bqnr7KK84hA+g2WhFlY6
 nNT7pKOAQiDO8jmglkRG5o2w1gdLRCtPP1nhqk+mksE3LIE1cGWWfECUSSFRIhF4wiElMf
 CpZNR1eSdCQEyi8IhG0EvOLeDpRzzAk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-vqPCxHfuNOS-mOkLopWEXg-1; Tue, 25 Mar 2025 05:02:24 -0400
X-MC-Unique: vqPCxHfuNOS-mOkLopWEXg-1
X-Mimecast-MFC-AGG-ID: vqPCxHfuNOS-mOkLopWEXg_1742893343
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-39123912ff0so2333967f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 02:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742893343; x=1743498143;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wj1IChreYTEW7S1AiPXdgyUmHcauFp5NeY4Eqtc9FGw=;
 b=krl8t/dMadO+xI95uxTYUU5QpwfLgkkUkPgFzKIUaWTfXawb6uXC9BU277zHkBD2qX
 MYcOxapITLwhV18I10yNVQ3qhJ7lOGb9fdIZ8q5d2uyuczkcEj/lVScuMeApMv/R2QIe
 bB19i5KIdRHlOs++u99UlDvkc2rmyREW6vl7LGb9uUPwrvyjMV9LwVQItYS5cTs+aFzQ
 ZebCXVABusndFLX1czdPz7OqG9irZkXHR9zsZ1bulL7a6sluTpiPFejOpmWISkIaEOg1
 E0ThW7Tg6C67I4N9oKEn0TRBG41+AO7iaYnfnd0rJvjX7LMv3YQf0JoEXzUmOkz9Su1F
 iVDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7vCRZ+QV4X/5lVF7TKBrhsbig/F9PSk4IN5R/eKV0a36BcUshMLRiuPbzRXz2PKO8NJH5fSeQATY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxezWm9iWY67c1WwGiKOz4BTEoTNWcs2aGS3GqeOMO6vEWPYHEi
 23dlOlq1riLTNePjthShFWQZb1nmMt080QDnar0klqGfES2E97LMHqDSZkMA67jL1zwvT4rxvi6
 vAPYqIGnywKQlxLYNhn1g1irwC0EizP3JRCi91Protelosevi7EsfdzWWyCZgmuJkEw==
X-Gm-Gg: ASbGncuJ1oPqPtrbs4MN3tTLt5PvRy89bumNPtTgGjEoo0un8sviUIehmGVpbwRiujq
 /CKIZzGhtNt/u7lyGEOs6F6ZJ76305cV7HAXVzEa3qBNGZgXbUiAagFt2dS0iEgDNoJV0oWTuTm
 ocDhAn5lhbomaDHqdMUXrIV3wMmxFe/4iiZwAC0zvOIbRfCmZW29yvAQKRVIi5hnlTDiVR8yIG/
 mjgwummQ65m3cT7zsX9gBTMFPijF6rEo6Flie3H2GMFY0K2IpBlrZiafkbdzLTBtsQ5sDWVfo/B
 9VJ5eKQVl3mCv9qNJS/tqr7OpMChxTClPm4gxX7AEww5T4FePshynqk=
X-Received: by 2002:a05:6000:410a:b0:390:e8d4:6517 with SMTP id
 ffacd0b85a97d-3997f8ff121mr13032931f8f.21.1742893343064; 
 Tue, 25 Mar 2025 02:02:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmIfLZm7khPWjwEcKM+sZzsNS9/OV7LqARaa/EFUtim00jKs/LTQtUTCr53eUD4BnsaUPNvA==
X-Received: by 2002:a05:6000:410a:b0:390:e8d4:6517 with SMTP id
 ffacd0b85a97d-3997f8ff121mr13032888f8f.21.1742893342596; 
 Tue, 25 Mar 2025 02:02:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b409fsm13375318f8f.50.2025.03.25.02.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:02:22 -0700 (PDT)
Message-ID: <2628502d-5b43-41da-978f-66a68623889d@redhat.com>
Date: Tue, 25 Mar 2025 10:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drm/panic: add missing space
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250324210359.1199574-1-ojeda@kernel.org>
 <20250324210359.1199574-2-ojeda@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250324210359.1199574-2-ojeda@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A_SgI18QkhazYCnniBeJNPDJkRdUlwH45VdE9L_RPRE_1742893343
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

On 24/03/2025 22:03, Miguel Ojeda wrote:
> Add missing space in sentence.
> 
> This was found using the Clippy `doc_markdown` lint, which we may want
> to enable.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index ecd87e8ffe05..9bd4d131f033 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -5,7 +5,7 @@
>   //! It is called from a panic handler, so it should't allocate memory and
>   //! does all the work on the stack or on the provided buffers. For
>   //! simplification, it only supports low error correction, and applies the
> -//! first mask (checkerboard). It will draw the smallest QRcode that can
> +//! first mask (checkerboard). It will draw the smallest QR code that can
>   //! contain the string passed as parameter. To get the most compact
>   //! QR code, the start of the URL is encoded as binary, and the
>   //! compressed kmsg is encoded as numeric.

