Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEDAE7840
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 09:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE0B10E686;
	Wed, 25 Jun 2025 07:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="id7iS4Dz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EED410E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 18:55:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so1170195e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750791318; x=1751396118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=;
 b=id7iS4DzlZ0hQbyYhlyw3HPrsidXIj+jXaT0sv67kAhPKFI1TVg0bxgqU4eF7TOGta
 qEYj4z3ofgYwWSCpngXEIL2fWzxb6sP6AndQ46iYSH14JSVjV/WQIb0C7kzwFmqU2TEc
 kr3xi1+vO0AI/qlmNnPtxCzRUa+WYXnuChC+EtRvhce9dGvh9vyExhKTdgF80O/UWt7L
 CLHdPP0fk432+uEVIOIS6qi2FvKrym0MaoddCkkfnplXQRCFCLbhVQMJe0b+99N+pDx9
 qgnTkoSaPpti5Trhq8OVqhATj822lFuf8ZVoUT1UFIsc2Xy7hdpQPTNCEpgisU1XtysV
 8zPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750791318; x=1751396118;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=;
 b=bDMAjl53u6fOvsQuYHCOJeNknWHdqN4NI9C6jZ2MrEejXHSl4Cj1QwMgATakQe7lPi
 5HeFKcKKDJQJlVBZWCdA1KkIEI+bose8a7lVP4bAvy7suRsXUTvic7+yoJjOfZhAiZWH
 jiQoV6nF3IiwK7l2i0PUmPwmRWopYYnmrbU8mVunWBzUyvz1VFebiskPBkOmtHc97uKf
 X//IbpLYISILUJbHbYaj51jVGV6X37rodLElskXUM6NUCo+zIDsGy0ZrESCHzQY6sXI7
 5GldLdHS1h0KjUYtRIbMxZT+ohwuW2NVjVretq7K8OUcLlYvofyjxQEgutaGB/bJ0BE3
 UOVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOmEYx2hRAuM+LwfB4jy7SriDqFOfrsrLK8kCI39W3IoOub9yCxOkleXspPNqjFu/r6JjxjAFcDRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNeBJQEtM93Mh1uRwKzF3A4/Odf51uMrraaUcV/IOqR2ozl+gp
 7rC405cy4dPYOkermCEyCtxlJIijW4M7hjjB9XS/73siaHGAd5TvCMfb
X-Gm-Gg: ASbGncvaA67XDp5+aaViHTpORF+QnmTvvOmImQX8gQ3h1TmMkSiYE6uoFoQOdN0cwt8
 Xu9HTfE/UhUrk9uVUD88dq1G9DGAA0bQaoJEZcvxYtb4vD6EEoun6X6nSAcpr8evbSsVtx6TGEj
 gian6qlHW4jv5DW6xTVNlVFOmTVbVc+cVdmQNDFcHjYSHXXb6I4/1TNRKbQUqq5elEjhudh2S8b
 SfjHMFaK0Qy9uEWwr6xLvTl2KF8bTkw16qUKuWrzhQ/BHWlFGJGjZgWnnTB/HPYExx7OOlez9nV
 FxcUHZaZ+FgzemhNjY37G55Gn4uAGqhaIA3tnO0+5RaR0lnZ8w4GTx01ys9yYMmbujyfU3bScr/
 GtcZti/fLKKyKcZxrQlXzpYDzGuaPtchLqAHsiig83aW1FfMKIVTQxdIOW4420TY/U2pxypvRzI
 n7w/MmeToJOnfTYIX1zUpz5XOAVGlheRAWxKCJgCZzlMii3A==
X-Google-Smtp-Source: AGHT+IHuRDhw6LNCJ4OejonKx4egSddQ5nzG9XYg2236H0JRfL7fwXed/J43zaU7m7WIujs3FcbfQA==
X-Received: by 2002:a05:600c:8214:b0:453:69dc:2621 with SMTP id
 5b1f17b1804b1-45381bbcd22mr387435e9.12.1750791318115; 
 Tue, 24 Jun 2025 11:55:18 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e103:2700:ebc0:27a3:cde8:9846?
 (2a02-8388-e103-2700-ebc0-27a3-cde8-9846.cable.dynamic.v6.surfer.at.
 [2a02:8388:e103:2700:ebc0:27a3:cde8:9846])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535ead2a5fsm184027565e9.34.2025.06.24.11.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 11:55:17 -0700 (PDT)
Message-ID: <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
Date: Tue, 24 Jun 2025 20:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
References: <20250418165059.560503-1-jfalempe@redhat.com>
Content-Language: en-US
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Simona Vetter <simona@ffwll.ch>,
 Paolo Bonzini <pbonzini@redhat.com>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Jun 2025 07:15:12 +0000
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

On 18.04.25 18:48, Jocelyn Falempe wrote:
> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.
> 
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 6025a705530e..dd55b1cb764d 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>          SegmentIterator {
>              segment: self,
>              offset: 0,
> -            carry: 0,
> -            carry_len: 0,
> +            decfifo: Default::default(),
> +        }
> +    }
> +}
> +
> +/// Max fifo size is 17 (max push) + 2 (max remaining)
> +const MAX_FIFO_SIZE: usize = 19;
> +
> +/// A simple Decimal digit FIFO
> +#[derive(Default)]
> +struct DecFifo {
> +    decimals: [u8; MAX_FIFO_SIZE],
> +    len: usize,
> +}
> +
> +impl DecFifo {
> +    fn push(&mut self, data: u64, len: usize) {
> +        let mut chunk = data;
> +        for i in (0..self.len).rev() {
> +            self.decimals[i + len] = self.decimals[i];
> +        }
> +        for i in 0..len {
> +            self.decimals[i] = (chunk % 10) as u8;
> +            chunk /= 10;
> +        }
> +        self.len += len;
> +    }
> +
> +    /// Pop 3 decimal digits from the FIFO
> +    fn pop3(&mut self) -> Option<(u16, usize)> {
> +        if self.len == 0 {
> +            None
> +        } else {
> +            let poplen = 3.min(self.len);
> +            self.len -= poplen;
> +            let mut out = 0;
> +            let mut exp = 1;
> +            for i in 0..poplen {
> +                out += self.decimals[self.len + i] as u16 * exp;
> +                exp *= 10;
> +            }
> +            Some((out, NUM_CHARS_BITS[poplen]))
>          }
>      }
>  }
> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>  struct SegmentIterator<'a> {
>      segment: &'a Segment<'a>,
>      offset: usize,
> -    carry: u64,
> -    carry_len: usize,
> +    decfifo: DecFifo,
>  }
>  
>  impl Iterator for SegmentIterator<'_> {
> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>                  }
>              }
>              Segment::Numeric(data) => {
> -                if self.carry_len < 3 && self.offset < data.len() {
> -                    // If there are less than 3 decimal digits in the carry,
> -                    // take the next 7 bytes of input, and add them to the carry.
> +                if self.decfifo.len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the fifo,
> +                    // take the next 7 bytes of input, and push them to the fifo.
>                      let mut buf = [0u8; 8];
>                      let len = 7.min(data.len() - self.offset);
>                      buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>                      let chunk = u64::from_le_bytes(buf);
> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> -                    self.carry = chunk + self.carry * pow;
> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>                      self.offset += len;
> -                    self.carry_len += BYTES_TO_DIGITS[len];
> -                }
> -                match self.carry_len {
> -                    0 => None,
> -                    len => {
> -                        // take the next 3 decimal digits of the carry
> -                        // and return 10bits of numeric data.
> -                        let out_len = 3.min(len);
> -                        self.carry_len -= out_len;
> -                        let pow = u64::pow(10, self.carry_len as u32);
> -                        let out = (self.carry / pow) as u16;
> -                        self.carry %= pow;
> -                        Some((out, NUM_CHARS_BITS[out_len]))
> -                    }
>                  }
> +                self.decfifo.pop3()
>              }
>          }
>      }
> 
> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18

Hi Jocelyn,

Apologies for reviving this old thread, but I'm still encountering
the same issue with the latest master (78f4e737a53e).

When compiling this module for ARM32 (multi_v7_defconfig),
I get the following error:

    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced 14 more times
    >>> did you mean: __aeabi_uidivmod
    >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

Since no one else has reported this in two months, I’m wondering
if this might be a configuration issue on my end.

Thanks a lot!

-- 
Best regards,
Andrei Lalaev
