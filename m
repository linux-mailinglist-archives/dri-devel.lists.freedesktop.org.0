Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09E8AE722E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 00:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B30B10E630;
	Tue, 24 Jun 2025 22:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OAmF2xk+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4810E62E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750803521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=;
 b=OAmF2xk+pxJHePkTUzLG/lkf6vl+4Gy1QCX6tO3WZryJtOMwvH5+mVJ5NUhY50X+uCmEmP
 Cq+qb2BRbr9MNiT/v9UInhYyzjQBwCTn+7sbs4wlQwc1ma6gSuAfTzbg9G1oJGWhiAVtcZ
 0q7oKDmD/+uv9OFtn3uD5IeM+8T2fjk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-nJSsXHUdMqCWngG1HDOVCA-1; Tue, 24 Jun 2025 18:18:39 -0400
X-MC-Unique: nJSsXHUdMqCWngG1HDOVCA-1
X-Mimecast-MFC-AGG-ID: nJSsXHUdMqCWngG1HDOVCA_1750803517
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a50816cc58so416972f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 15:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750803517; x=1751408317;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=;
 b=T4yZePFAyOybokQ8a8ozISiOPEbHWTXxP3+1eOvOpnR5dt+v8VtqYcafxALR5+x0NS
 5wRXkoFWVuO97Fx0ruQy4DWb0we9LkfU3pKxKff574XA7EPC7K+tCTF7fqiSp+oOauaf
 Yx76CScaCf+rI8KSBl+blBEw5tdynEYBt6MDI5lM6cgddoXW4dLeu6AcX6PcrIQEFVpq
 iJNa815D64fiPU29/kIXE85In+bvi3+2Tft588BUBXwEucHQZ4IDLmLSKQVDLdZTAZ2S
 ZIm2GylXD4keyWwHZWCOFd3T9pY6zq4n+wBFa2zw4QTE9SWvX1JU0n+dM97N70OGP8Mb
 4hdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4EJ9oR6d2nA2srqsDLW6hZ1P3HC9QaBY48T0GsDIr28IerypnevbOHlukRCcjgslD97HbTxTGUvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE1OdVuZAlNZCcJlfAI6wlh03aHmQnrZrJMoeoBXlN//D9OaAk
 tFIA6fEQF9UxW0FOcxjx4IEI6kYbW0jVYlwQFnybr4IRsquSRR6UbcCogzSb7+pCdGj4juMobSP
 SmO8TRnYIYmyev+QnpmU445f5F5MYO0mHg9XVdl8SwrpwM0xpHfPVAVpVwpGSHcN+ydKGUg==
X-Gm-Gg: ASbGncvaRTNyh/PlKxzLSZcCboX2XFmiqUm76VrA3291UJhEb/LrlBIIhmwdjsu8ukO
 4gLEZoPTkwS6nzADyULn4bqcVFIqk6GwtBcxileffj37BRraxhcHcdqGHHUl+D2wpv4U5qoMASu
 89wSTGFBmawHBvMmr8uTtbKFuWdvF6tgHmVvugE2BGy0PMyTcela0fgzlIQr5YfHgOlI5o60AIE
 nH3UHabVRTy2qx4p2T3de0RfUs8RQ39p9KIfbbXZyeQP14v1+Ev9wk31KECbiLdwyaJ/gKz3He1
 03EqJJFeST9PQmuuJAd49vxZxBuQrE/2CNgRdZGsyWvVEdH4INoVNssmlkIO7g==
X-Received: by 2002:a05:6000:4a04:b0:3a4:fc52:f5d4 with SMTP id
 ffacd0b85a97d-3a6ed66e660mr259027f8f.47.1750803517058; 
 Tue, 24 Jun 2025 15:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaiZu6Jnvv4KZOV08AX5p0ZetFt8VZ3DH1c9WqbbWm4WIsdHnH3J35vd6e6Y8A8S4HPKSng==
X-Received: by 2002:a05:6000:4a04:b0:3a4:fc52:f5d4 with SMTP id
 ffacd0b85a97d-3a6ed66e660mr259010f8f.47.1750803516581; 
 Tue, 24 Jun 2025 15:18:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382373c86sm1501705e9.33.2025.06.24.15.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 15:18:36 -0700 (PDT)
Message-ID: <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
Date: Wed, 25 Jun 2025 00:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Andrei Lalaev <andrey.lalaev@gmail.com>
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
References: <20250418165059.560503-1-jfalempe@redhat.com>
 <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7NGPr74rtbqrZSyneEFr_2XLmvRFMpMLwLo0-S5zLcs_1750803517
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

On 24/06/2025 20:55, Andrei Lalaev wrote:
> On 18.04.25 18:48, Jocelyn Falempe wrote:
>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>> to use a simple fifo with decimal digits as u8 instead.
>> This is slower but should compile on all architecture.
>>
>> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> index 6025a705530e..dd55b1cb764d 100644
>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>           SegmentIterator {
>>               segment: self,
>>               offset: 0,
>> -            carry: 0,
>> -            carry_len: 0,
>> +            decfifo: Default::default(),
>> +        }
>> +    }
>> +}
>> +
>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>> +const MAX_FIFO_SIZE: usize = 19;
>> +
>> +/// A simple Decimal digit FIFO
>> +#[derive(Default)]
>> +struct DecFifo {
>> +    decimals: [u8; MAX_FIFO_SIZE],
>> +    len: usize,
>> +}
>> +
>> +impl DecFifo {
>> +    fn push(&mut self, data: u64, len: usize) {
>> +        let mut chunk = data;
>> +        for i in (0..self.len).rev() {
>> +            self.decimals[i + len] = self.decimals[i];
>> +        }
>> +        for i in 0..len {
>> +            self.decimals[i] = (chunk % 10) as u8;
>> +            chunk /= 10;
>> +        }
>> +        self.len += len;
>> +    }
>> +
>> +    /// Pop 3 decimal digits from the FIFO
>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>> +        if self.len == 0 {
>> +            None
>> +        } else {
>> +            let poplen = 3.min(self.len);
>> +            self.len -= poplen;
>> +            let mut out = 0;
>> +            let mut exp = 1;
>> +            for i in 0..poplen {
>> +                out += self.decimals[self.len + i] as u16 * exp;
>> +                exp *= 10;
>> +            }
>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>           }
>>       }
>>   }
>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>   struct SegmentIterator<'a> {
>>       segment: &'a Segment<'a>,
>>       offset: usize,
>> -    carry: u64,
>> -    carry_len: usize,
>> +    decfifo: DecFifo,
>>   }
>>   
>>   impl Iterator for SegmentIterator<'_> {
>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>                   }
>>               }
>>               Segment::Numeric(data) => {
>> -                if self.carry_len < 3 && self.offset < data.len() {
>> -                    // If there are less than 3 decimal digits in the carry,
>> -                    // take the next 7 bytes of input, and add them to the carry.
>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>> +                    // If there are less than 3 decimal digits in the fifo,
>> +                    // take the next 7 bytes of input, and push them to the fifo.
>>                       let mut buf = [0u8; 8];
>>                       let len = 7.min(data.len() - self.offset);
>>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>                       let chunk = u64::from_le_bytes(buf);
>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
>> -                    self.carry = chunk + self.carry * pow;
>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>                       self.offset += len;
>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>> -                }
>> -                match self.carry_len {
>> -                    0 => None,
>> -                    len => {
>> -                        // take the next 3 decimal digits of the carry
>> -                        // and return 10bits of numeric data.
>> -                        let out_len = 3.min(len);
>> -                        self.carry_len -= out_len;
>> -                        let pow = u64::pow(10, self.carry_len as u32);
>> -                        let out = (self.carry / pow) as u16;
>> -                        self.carry %= pow;
>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>> -                    }
>>                   }
>> +                self.decfifo.pop3()
>>               }
>>           }
>>       }
>>
>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
> 
> Hi Jocelyn,
> 
> Apologies for reviving this old thread, but I'm still encountering
> the same issue with the latest master (78f4e737a53e).
> 
> When compiling this module for ARM32 (multi_v7_defconfig),
> I get the following error:
> 
>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced 14 more times
>      >>> did you mean: __aeabi_uidivmod
>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
> 
> Since no one else has reported this in two months, I’m wondering
> if this might be a configuration issue on my end.

Ok, that's surprising, the lines 391 and 392 are:

self.decimals[i] = (chunk % 10) as u8;
chunk /= 10;

So the compiler should be smart enough to do that without using a division.
I will try to reproduce, and see if I can fix that.

Best regards,

> 
> Thanks a lot!
> 

