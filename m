Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0AEAA71F0
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481610E8C9;
	Fri,  2 May 2025 12:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eMiY5CnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD25F10E8C9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746188639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=;
 b=eMiY5CnHgBV3BqVWTEiybwwGwgXl4peuSp7r3t1BLa879Vwunc5SS/cecCOYNhG1oOmxbi
 /ctJSyu52OyCBT+fYkMaR4vpEQ45WWY6MZn4MH+QYzVTkh43YbezERDl1QtShAgSqD4yIo
 EjdTsV8t/tcahLZFDZldxu7ne4Jsot4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-wNEWSVsxNFeTQVomBl_GSw-1; Fri, 02 May 2025 08:23:58 -0400
X-MC-Unique: wNEWSVsxNFeTQVomBl_GSw-1
X-Mimecast-MFC-AGG-ID: wNEWSVsxNFeTQVomBl_GSw_1746188637
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d5ca7c86aso11039985e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 05:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746188637; x=1746793437;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=;
 b=dvc2G4lCvWGQ5jRLdp5V4U/2AUsqqVLoRUtDnvxV7iFWtopvo1GMXj1BbhyvQVcZU8
 wrNGa2gCeyvbtFXE4FqpSNjb2AQB6ARD8EbQJGyWQIQGnViKUoa0mszpdbi+QrKI0Hig
 SE+WZPnk3qyw4M4yjYPZuIVIXnxDC/29xb43yuKC46HXQWr0PygENWoLyRnok8k4wDAh
 p5V28Gw/avwSLgDUHAL/hdzu3XzKBvXCj5HqXur9sV3G6TcaCmgPhWNrzPYIEB+VvOnu
 W3Tqu/U2lcXwfcH3Ji4TEkHwvw1jzrYu01LrO5XGyLVxXutJKoJdyEqmtyycuD9Xgq2Z
 aIXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuC/jGT8paj08UnMRNwY8/aHdoYKuyqpO59D1tYQbZHO+dO///dZQ8LvKfmyLnqt2P2GFQvtfbkRw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi4pbtNt3R8rHoXhrPSw6EqtCC6qFwWeDxnFua1oRCYHVlvq2h
 XsfL2NOfM4WKrqPJRUw0JzstRK/BZyb3dvUk9e2mzGQ9VenclGD0f0euDS+Fd+hfBgjjL8yKvdY
 o7mFsWXS09FNEz2dOr9i5nl3hWsri8ypeWu73OAAKIDh18R4B5NkN+XCHl9rSEiFFIQ==
X-Gm-Gg: ASbGncs21laE+bIqgjC01RDIsByJX3qqNC2ITxU3FGYTIw0W44s638gwb/TcA1t9/Ot
 /FJyjogOpc7TE9zZsGqfJnWqUzIXrQFf7u79eiiwM9tUP8iP1TuF30huT319JgQfhT3pNr1Fc7X
 4DgSPUYdCsXrEtmV8AiPDnSoWekBSX3yD408lZELNUelUralz++k446C5UIG7c/0IbXhjsru1cH
 Kc5nsFfFXLXqVe6GF861qKLNUBsAHWTuEjOU3RffIOe95H4Ln42IgesSx11zcFv/h8QWvtYmnaT
 HGMyqKGv0y0HQ/m14DTGW2ySoQvLqlmLUUwws9AepWDAJmxLCD0=
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441bbf34052mr18719405e9.26.1746188637009; 
 Fri, 02 May 2025 05:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtBSWT/9rJ58YwwQsHRZD3aEJKNHkUCm3Vq3qVD5xLR8Kf9BbRNg4RYaf53PhVsYbqWhK/OA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441bbf34052mr18719135e9.26.1746188636561; 
 Fri, 02 May 2025 05:23:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28718sm89479975e9.36.2025.05.02.05.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 05:23:56 -0700 (PDT)
Message-ID: <847a72c8-ea80-4aaa-b439-ab7649dcebd0@redhat.com>
Date: Fri, 2 May 2025 14:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250418165059.560503-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MHpMk4dbB9MFfc9Qwy68-67-s5gKyNtsI6rl8Ow_QKM_1746188637
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

On 18/04/2025 18:48, Jocelyn Falempe wrote:
> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.

I applied it to drm-misc/drm-misc-next.

Thanks for the reviews.

-- 

Jocelyn
> 
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>   1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 6025a705530e..dd55b1cb764d 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>           SegmentIterator {
>               segment: self,
>               offset: 0,
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
>           }
>       }
>   }
> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>   struct SegmentIterator<'a> {
>       segment: &'a Segment<'a>,
>       offset: usize,
> -    carry: u64,
> -    carry_len: usize,
> +    decfifo: DecFifo,
>   }
>   
>   impl Iterator for SegmentIterator<'_> {
> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>                   }
>               }
>               Segment::Numeric(data) => {
> -                if self.carry_len < 3 && self.offset < data.len() {
> -                    // If there are less than 3 decimal digits in the carry,
> -                    // take the next 7 bytes of input, and add them to the carry.
> +                if self.decfifo.len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the fifo,
> +                    // take the next 7 bytes of input, and push them to the fifo.
>                       let mut buf = [0u8; 8];
>                       let len = 7.min(data.len() - self.offset);
>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>                       let chunk = u64::from_le_bytes(buf);
> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> -                    self.carry = chunk + self.carry * pow;
> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>                       self.offset += len;
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
>                   }
> +                self.decfifo.pop3()
>               }
>           }
>       }
> 
> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18

