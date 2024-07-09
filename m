Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D71C92BE1B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 17:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CC210E595;
	Tue,  9 Jul 2024 15:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VpG2S/ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107610E595
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720538469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNH/JUvn0+ysUAMzZYQyKI5q+v9u1tHdkHt4atLO+0o=;
 b=VpG2S/ts8GYxgQdqza1G0JD4GSGVhvTjjmPKbX7t9Yl8lNJicbMcKtLu3x9t2+mHUKyuNw
 TstWwpcHelBx2srTFN9rNVBsbz55XeoJAsqW8PKHZSYzX4T+ezgh3JvfK7g50Byszcu4IA
 UyEd3Hu8Fc84oWUbb3MAKaZQT6UKQGM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-5vYGYcMSNoiz7yVPpruFpQ-1; Tue, 09 Jul 2024 11:21:06 -0400
X-MC-Unique: 5vYGYcMSNoiz7yVPpruFpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3678fbf4aa7so3111888f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 08:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538465; x=1721143265;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qNH/JUvn0+ysUAMzZYQyKI5q+v9u1tHdkHt4atLO+0o=;
 b=u3BQCV+cE4vEFRfA8r/Trfn+EPY++E7bJ1PoJlZPiSFEdGzRF3ACT9/AAqVn54Nu8M
 8qs73FvgA7Y/W7K5yopVwykYpPRI1Sv8IWtYopR3CIVvTDFMgDubHs1mIwXGzWJ7ZMc2
 I7Mopyr/skKj0l7qwIdwlSrrWhZX/z4i7WLFjRdN3QyrAIbn1ySXpcC0zY+aqakr4d/c
 Z+KPYikRfqxoN06OQGZqxo//7s+D58wQufOE2CZnSYutuE1rWPJ0F15ivI9ebvPxDJti
 5MO1wBkDFYKtL7JN9kdxuqsqP/UkjdZfk/NP8VHGwf38r5iYdZ5DHz+8cgRB25KO2sjq
 GkWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6NWUW4aYmPJc4094FUbSXmuQKeUzbBVLVmzFxmZZk30w6V6iBrgKehMf09PaymfoktHULKZsLKKFkAoHmtb/ZRYUDo0DHHjBzUsHmIp6V
X-Gm-Message-State: AOJu0YznxtyDCYIzlMKbRIWNn94OXHdt3FKi8nyOsaws00mJ/MS9ZuJ/
 STUIxkWcN1xyMVoridB14lGVobiFp/t6n08nN1VD4XhQRLz9wIi6C/TGDYSr08He0dnldL/PwaB
 B9m8OOsS2zomUnxT6c2URIrgj5ga4ZaeI8s5U9EaPdkNUf1mFdFVsuAnpwEPn28d6RQ==
X-Received: by 2002:a5d:4346:0:b0:366:eedd:afd1 with SMTP id
 ffacd0b85a97d-367cead16d5mr1592580f8f.45.1720538465140; 
 Tue, 09 Jul 2024 08:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjxstTzYlo6ovTn9c0sF83judiGODYb/KLS0GR0HfYpANxaSpYmj1/aVoq/4YjEMxcvUDI8A==
X-Received: by 2002:a5d:4346:0:b0:366:eedd:afd1 with SMTP id
 ffacd0b85a97d-367cead16d5mr1592553f8f.45.1720538464661; 
 Tue, 09 Jul 2024 08:21:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7df5esm2868162f8f.22.2024.07.09.08.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:21:03 -0700 (PDT)
Message-ID: <a09beb08-ab58-4718-807a-112800fbefeb@redhat.com>
Date: Tue, 9 Jul 2024 17:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <CAH5fLgh5fb_NYUNPPXYepJg=pbmHAb+-+sOrCxc0n=fiNjTFTw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgh5fb_NYUNPPXYepJg=pbmHAb+-+sOrCxc0n=fiNjTFTw@mail.gmail.com>
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



On 09/07/2024 11:41, Alice Ryhl wrote:
> On Tue, Jul 9, 2024 at 10:45 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> This patch adds a new panic screen, with a QR code and the kmsg data
>> embedded.
>> If DRM_PANIC_SCREEN_QR_CODE_URL is set, then the kmsg data will be
>> compressed with zlib and encoded as a numerical segment, and appended
>> to the url as a url parameter. This allows to save space, and put
>> about ~7500 bytes of kmsg data, in a V40 QR code.
>> Linux distributions can customize the url, and put a web frontend to
>> directly open a bug report with the kmsg data.
>>
>> Otherwise the kmsg data will be encoded as binary segment (ie raw
>> ascii) and only a maximum of 2953 bytes of kmsg data will be
>> available in the QR code.
>>
>> You can also limit the QR code size with DRM_PANIC_SCREEN_QR_VERSION.
>>
>> v2:
>>   * Rewrite the rust comments with Markdown (Alice Ryhl)
>>   * Mark drm_panic_qr_generate() as unsafe (Alice Ryhl)
>>   * Use CStr directly, and remove the call to as_str_unchecked()
>>     (Alice Ryhl)
>>   * Add a check for data_len <= data_size (Greg KH)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> [...]
> 
>> +/// drm_panic_qr_generate()
>> +///
>> +/// C entry point for the rust QR Code generator.
>> +///
>> +/// Write the QR code image in the data buffer, and return the qrcode size, or 0
>> +/// if the data doesn't fit in a QR code.
>> +///
>> +/// * `url` The base url of the QR code. It will be encoded as Binary segment.
>> +/// * `data` A pointer to the binary data, to be encoded. if url is NULL, it
>> +///    will be encoded as binary segment, otherwise it will be encoded
>> +///    efficiently as a numeric segment, and appended to the url.
>> +/// * `data_len` Length of the data, that needs to be encoded.
>> +/// * `data_size` Size of data buffer, it should be at least 4071 bytes to hold
>> +///    a V40 QR-code. It will then be overwritten with the QR-code image.
>> +/// * `tmp` A temporary buffer that the QR-code encoder will use, to write the
>> +///    segments and ECC.
>> +/// * `tmp_size` Size of the temporary buffer, it must be at least 3706 bytes
>> +///    long for V40.
>> +///
>> +/// # Safety
>> +///
>> +/// * `url` must be null or point at a nul-terminated string.
>> +/// * `data` must be valid for reading and writing for `data_size` bytes.
>> +/// * `data_len` must be less than `data_size`.
>> +/// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
> 
> You don't allow data_len == data_size?

In fact, the QR code will always be larger than the data you want to put 
into, because it adds segment header/length and ECC, so it doesn't make 
sense in practice to have data_len == data_size.
data_size must be at least 4071 bytes, and the maximum data_len you can 
put in a V40 is 3703 bytes.

> 
>> +#[no_mangle]
>> +pub unsafe extern "C" fn drm_panic_qr_generate(
>> +    url: *const i8,
>> +    data: *mut u8,
>> +    data_len: usize,
>> +    data_size: usize,
>> +    tmp: *mut u8,
>> +    tmp_size: usize,
>> +) -> u8 {
>> +    if data_size <= 4071 || tmp_size <= 3706 || data_len > data_size {
>> +        return 0;
>> +    }
> 
> Since you explicitly check the data_len, it does not *need* to be a
> safety requirement (but it can be). Even if it's wrong, violating the
> requirement does not lead to memory safety.

Ok, that makes sense, I will move it to the previous section.
> 
>> +    // Safety: data must be a valid pointer for reading and writing data_size bytes.
>> +    let data_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(data, data_size) };
>> +    // Safety: tmp must be a valid pointer for reading and writing tmp_size bytes.
>> +    let tmp_slice: &mut [u8] = unsafe { core::slice::from_raw_parts_mut(tmp, tmp_size) };
> 
> These safety comments explain why these calls are dangerous, but
> that's not what safety comments should do. They should explain why
> this particular call is okay. In this case, it's because the caller of
> drm_panic_qr_generate must follow the documented safety requirements
> of the current function. The wording could look like this:
> 
> // SAFETY: Due to the safety requirements on this function, the caller
> ensures that tmp is a valid pointer for reading and writing tmp_size
> bytes.
> 
> The wording is not much different, but it's an important distinction.

Ok, I will update it, and add the expected lifetime as Miguel pointed out.
> 
> (Also, safety comments are written SAFETY: not Safety:)
> 
>> +    if url.is_null() {
>> +        match EncodedMsg::new(&[&Segment::Binary(&data_slice[0..data_len])], tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    } else {
>> +        // Safety: url must be a valid pointer to a nul-terminated string.
>> +        let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
> 
> // SAFETY: The caller ensures that url is a valid pointer to a
> nul-terminated string.

ok
> 
>> +        let segments = &[
>> +            &Segment::Binary(url_cstr.as_bytes()),
>> +            &Segment::Numeric(&data_slice[0..data_len]),
>> +        ];
>> +        match EncodedMsg::new(segments, tmp_slice) {
>> +            None => 0,
>> +            Some(em) => {
>> +                let qr_image = QrImage::new(&em, data_slice);
>> +                qr_image.width
>> +            }
>> +        }
>> +    }
>> +}
> 
> Alice
> 

Best regards,

-- 

Jocelyn

