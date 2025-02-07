Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD878A2C9BF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 18:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6C410E295;
	Fri,  7 Feb 2025 17:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G7Dj6uJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5589C10EB81
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738947950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ulmIneXvWeKn842sM/NUdtiQkyckXgWBWcAxTArN7Vo=;
 b=G7Dj6uJbZJDCIiPrk3LtSoA8Hc8btyIVNB+I6v7UAt57RN9UszaguwOYs7MQQzC3aOEcRt
 GNgYcnp1VQLSqDIQEkB8JdGo8lDXStZ/vMxvOQ9gDdNPdkKIJe/SjHLqCfcuzZ3cmmLOm4
 LcK0ElLZXydUd9zkSgpwYrL528DzvLg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-vUUXbzmtPAO0jcLGRUQJJA-1; Fri, 07 Feb 2025 12:05:48 -0500
X-MC-Unique: vUUXbzmtPAO0jcLGRUQJJA-1
X-Mimecast-MFC-AGG-ID: vUUXbzmtPAO0jcLGRUQJJA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38c5d9530ebso1719769f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 09:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947947; x=1739552747;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ulmIneXvWeKn842sM/NUdtiQkyckXgWBWcAxTArN7Vo=;
 b=Vb4gf8RV5HM87cAQZla5V088Ck8sIqG/LHhF8E1dm5hvQ40JVxT6xHyUMxLTF/deu5
 FVG4+DbLsSfaiBDDuO+iHrQiUXv5jmCMkl4JXs67n2UbzGNhqigaSZjtTwF/8fH1UFEd
 5+6sfYa6z9NvRbhwOWt5xO4/3ab/V4c4tss0BFAkxktiN6dZGvRQeJWKnvhwRfERm07A
 ywja+7CorNK4VTMWmUvRg31AXQF9qFeQbN2KB6LHEM+H4XqBXjUF4pZUpbIV9hu2H5ls
 0Jfvae7gRCTisXkQhUxifuUYxhZHl4W2WLuJ5AAgzbfDa4ue9HsHl5H6nW5UlWW6P/hR
 efuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ59+G6ge3/Cc1XiCvuMj0fk3+7BD448qthM0SMyX05cmG4JItWLBmcuGp9AkWl9krXZRpjG8M6Rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfEvq0KU8wBpubK58haKQX2zarhkDcVlVQHDvNtgpaGNahy6aZ
 PP/kaEir94w1rqLVh0nI/5lyQ4WyVeZtg/9OuABN9+7ZzGHxPdXEt/auN4DY+/ccdZ9sV5P6Aan
 0ZUKdsou33jDHNK2svuZjdnMXaFSKV4PGgIPJQnApKA5qQUI/oJNWNbeEUatQOmlEFw==
X-Gm-Gg: ASbGncs4S1kShmLtPE6PPZp7CkH/wXcXbEMOfArTqvKWJgOTfAwKnco7Iu0ehditUOI
 8tkTIPK1zHVQqzdcheOKcpPXhf+QUQXqVY0xobETlmmpjPr5GSXyB8Gm9+nJknec6GF2v/T8RtI
 o6do5QjBXXt9h1JCdKCoNDzURtvY98ZYwm+cD5KMYxvIrft+e0elm4f0NFkmqlbW0pvZeQIFufc
 Y0Q6C8zdN/mLF3kU36NBSqrSjdPWm62Nt3FAtWUqJHiPSLh9xgbZlPdkSpNKusHPjVDQ+cPErX3
 8gzhoHRTNfcx3GeKTI7jH1FmjLnE0osQsryhYnVppbDu
X-Received: by 2002:a5d:6c6f:0:b0:38d:d0ea:b04c with SMTP id
 ffacd0b85a97d-38dd0eab247mr760428f8f.38.1738947947378; 
 Fri, 07 Feb 2025 09:05:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUXkaH3F2I8hXAZSIfpLvryKrg2+hMGrYhKNpmj5opskHd+9X1jWEJI0aIzgAEMdsoZJPkjw==
X-Received: by 2002:a5d:6c6f:0:b0:38d:d0ea:b04c with SMTP id
 ffacd0b85a97d-38dd0eab247mr760352f8f.38.1738947946678; 
 Fri, 07 Feb 2025 09:05:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db1150csm97455655e9.39.2025.02.07.09.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 09:05:45 -0800 (PST)
Message-ID: <56364bd9-2a6f-40f5-972c-f62898284a5c@redhat.com>
Date: Fri, 7 Feb 2025 18:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Better binary encoding in QR code
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250128165254.893204-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250128165254.893204-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oK_enxpuYz5kaqb9kFPdS2bO0wCQV6fah7jpsowboWY_1738947948
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

On 28/01/2025 17:52, Jocelyn Falempe wrote:
> The current encoding, is done by converting 13bits of input into 4
> decimal digits, that are then encoded efficiently using the numeric
> encoding of the QR code specification.
> The Fido v2.2 specification [1] uses a similar approach for its
> QR-initiated authentication. The only difference is that it converts
> 7 bytes (56bits) of input into 17 decimal digits. The benefit is that
> the algorithm doesn't require to split input bytes into 13bits chunk,
> and the ratio is a bit better.
> This improvement was proposed by Jó Ágila Bitsch in [2].
> drm_panic is still young, and the QR code feature is not widely used,
> so it's still time to switch to a common algorithm, shared with a
> widely used standard.
> I also changed the name of the url parameter, from zl= to z=, so the
> website can keep backward compatibility if needed.
> 
> [1] https://fidoalliance.org/specs/fido-v2.2-rd-20230321/fido-client-to-authenticator-protocol-v2.2-rd-20230321.html#hybrid-qr-initiated
> [2] https://github.com/kdj0c/panic_report/issues/2
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

As it had no reviews for 2 months, I've got an Acked-by from Maxime 
Ripard off-list, and pushed it to drm-misc-next.

Thanks,

-- 

Jocelyn


> ---
> 
> v2:
>   * Add comments for the SegmentIterator numeric encoding.
>   
>   
>   drivers/gpu/drm/drm_panic.c     |   2 +-
>   drivers/gpu/drm/drm_panic_qr.rs | 108 +++++++++++---------------------
>   2 files changed, 36 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..ab42a2b1567d 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -499,7 +499,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&zl=",
> +	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 09500cddc009..477de4101c3e 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -13,12 +13,13 @@
>   //! The binary data must be a valid URL parameter, so the easiest way is
>   //! to use base64 encoding. But this wastes 25% of data space, so the
>   //! whole stack trace won't fit in the QR code. So instead it encodes
> -//! every 13bits of input into 4 decimal digits, and then uses the
> +//! every 7 bytes of input into 17 decimal digits, and then uses the
>   //! efficient numeric encoding, that encode 3 decimal digits into
> -//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
> -//! into 40bits in the QR code, so wasting only 2.5%. And the numbers are
> +//! 10bits. This makes 168bits of compressed data into 51 decimal digits,
> +//! into 170bits in the QR code, so wasting only 1.17%. And the numbers are
>   //! valid URL parameter, so the website can do the reverse, to get the
> -//! binary data.
> +//! binary data. This is the same algorithm used by Fido v2.2 QR-initiated
> +//! authentication specification.
>   //!
>   //! Inspired by these 3 projects, all under MIT license:
>   //!
> @@ -26,7 +27,6 @@
>   //! * <https://github.com/erwanvivien/fast_qr>
>   //! * <https://github.com/bjguillot/qr>
>   
> -use core::cmp;
>   use kernel::str::CStr;
>   
>   #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
> @@ -296,35 +296,11 @@ fn version_info(&self) -> u32 {
>   /// Padding bytes.
>   const PADDING: [u8; 2] = [236, 17];
>   
> -/// Get the next 13 bits of data, starting at specified offset (in bits).
> -fn get_next_13b(data: &[u8], offset: usize) -> Option<(u16, usize)> {
> -    if offset < data.len() * 8 {
> -        let size = cmp::min(13, data.len() * 8 - offset);
> -        let byte_off = offset / 8;
> -        let bit_off = offset % 8;
> -        // `b` is 20 at max (`bit_off` <= 7 and `size` <= 13).
> -        let b = (bit_off + size) as u16;
> -
> -        let first_byte = (data[byte_off] << bit_off >> bit_off) as u16;
> -
> -        let number = match b {
> -            0..=8 => first_byte >> (8 - b),
> -            9..=16 => (first_byte << (b - 8)) + (data[byte_off + 1] >> (16 - b)) as u16,
> -            _ => {
> -                (first_byte << (b - 8))
> -                    + ((data[byte_off + 1] as u16) << (b - 16))
> -                    + (data[byte_off + 2] >> (24 - b)) as u16
> -            }
> -        };
> -        Some((number, size))
> -    } else {
> -        None
> -    }
> -}
> -
>   /// Number of bits to encode characters in numeric mode.
>   const NUM_CHARS_BITS: [usize; 4] = [0, 4, 7, 10];
> -const POW10: [u16; 4] = [1, 10, 100, 1000];
> +/// Number of decimal digits required to encode n bytes of binary data.
> +/// eg: you need 15 decimal digits to fit 6 bytes of binary data.
> +const BYTES_TO_DIGITS: [usize; 8] = [0, 3, 5, 8, 10, 13, 15, 17];
>   
>   enum Segment<'a> {
>       Numeric(&'a [u8]),
> @@ -360,13 +336,9 @@ fn character_count(&self) -> usize {
>           match self {
>               Segment::Binary(data) => data.len(),
>               Segment::Numeric(data) => {
> -                let data_bits = data.len() * 8;
> -                let last_chars = match data_bits % 13 {
> -                    1 => 1,
> -                    k => (k + 1) / 3,
> -                };
> -                // 4 decimal numbers per 13bits + remainder.
> -                4 * (data_bits / 13) + last_chars
> +                let last_chars = BYTES_TO_DIGITS[data.len() % 7];
> +                // 17 decimal numbers per 7bytes + remainder.
> +                17 * (data.len() / 7) + last_chars
>               }
>           }
>       }
> @@ -403,7 +375,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>   struct SegmentIterator<'a> {
>       segment: &'a Segment<'a>,
>       offset: usize,
> -    carry: u16,
> +    carry: u64,
>       carry_len: usize,
>   }
>   
> @@ -422,40 +394,30 @@ fn next(&mut self) -> Option<Self::Item> {
>                   }
>               }
>               Segment::Numeric(data) => {
> -                if self.carry_len == 3 {
> -                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
> -                    self.carry_len = 0;
> -                    self.carry = 0;
> -                    Some(out)
> -                } else if let Some((bits, size)) = get_next_13b(data, self.offset) {
> -                    self.offset += size;
> -                    let new_chars = match size {
> -                        1 => 1,
> -                        k => (k + 1) / 3,
> -                    };
> -                    if self.carry_len + new_chars > 3 {
> -                        self.carry_len = new_chars + self.carry_len - 3;
> -                        let out = (
> -                            self.carry * POW10[new_chars - self.carry_len]
> -                                + bits / POW10[self.carry_len],
> -                            NUM_CHARS_BITS[3],
> -                        );
> -                        self.carry = bits % POW10[self.carry_len];
> -                        Some(out)
> -                    } else {
> -                        let out = (
> -                            self.carry * POW10[new_chars] + bits,
> -                            NUM_CHARS_BITS[self.carry_len + new_chars],
> -                        );
> -                        self.carry_len = 0;
> -                        Some(out)
> +                if self.carry_len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the carry,
> +                    // take the next 7 bytes of input, and add them to the carry.
> +                    let mut buf = [0u8; 8];
> +                    let len = 7.min(data.len() - self.offset);
> +                    buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
> +                    let chunk = u64::from_le_bytes(buf);
> +                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> +                    self.carry = chunk + self.carry * pow;
> +                    self.offset += len;
> +                    self.carry_len += BYTES_TO_DIGITS[len];
> +                }
> +                match self.carry_len {
> +                    0 => None,
> +                    len => {
> +                        // take the next 3 decimal digits of the carry
> +                        // and return 10bits of numeric data.
> +                        let out_len = 3.min(len);
> +                        self.carry_len -= out_len;
> +                        let pow = u64::pow(10, self.carry_len as u32);
> +                        let out = (self.carry / pow) as u16;
> +                        self.carry = self.carry % pow;
> +                        Some((out, NUM_CHARS_BITS[out_len]))
>                       }
> -                } else if self.carry_len > 0 {
> -                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
> -                    self.carry_len = 0;
> -                    Some(out)
> -                } else {
> -                    None
>                   }
>               }
>           }
> 
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b

