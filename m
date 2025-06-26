Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102DAEA871
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5826B10E156;
	Thu, 26 Jun 2025 20:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMlg7+zo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E6B10E29A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 15:16:19 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-45377776935so11520685e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750950978; x=1751555778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZYbv5E+bbRXfoXv2F6AaS7viJ98wzUfV0UPEECnLnoo=;
 b=aMlg7+zoK8zrVblpOuWtP5JAlBj36rtsfDsFwUaq9x30xemGtvdanzyr//UaQ2ptwD
 KMXhFggFFW/KHXuptdDuZJBYG/Kx3QLQRYCfwdDD7PNA/DQaKS6YxL4/ow0LbskP0sQA
 PczqdaVKV/pf+XEpxO7w5+FKRs5U6hTUdOQLLFL+HTaWRHbqWrJPjSE98llOkp9vzKGh
 j3y2aFP2Hud2+cu4cpE9y+QQQMo4cgK5pRSMXt/feJiayjoholjNmMYTxbbdq5v3+ASd
 mRiURgq7lCM5m9uKrKxwgE0oi5ObfMDa+uN3c1nBILzjrOj+lTJETNd90UWDgxD3f/F2
 ORJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750950978; x=1751555778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYbv5E+bbRXfoXv2F6AaS7viJ98wzUfV0UPEECnLnoo=;
 b=AJawGMWOpvHXEwDUHKa6i1t9re9FHmB95vM1jmkgYCvQ98DzrgT9W+kbrDTtTZKON+
 r25U+9D+UE+kQAeMOnkRjLlqtYhLicC6ml/dwOZ5OXtdMFRzls2vxnNy9xiOcB2+pWsF
 6SWxkp/6qMhCxPl7IOYsc5SmFX4Mdaiw3/mQSnyaOF/F/MF20S/uXNwnDruGuyIo0Ska
 APHdUnqV5mQe1FK9uZnHFzReS1qF440gNkOAJNv5ubC6+9GTuIxlDyPU3U8C03GB/61v
 IJb5MVzX4k9xAXEccdA50D86cvPmRDezMIXKNPVNmhK6E8ZBU2sbcISziuzgXhSi+npu
 Q2Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGvArKhFURPw0eCYepXnmou1xllOETKxwKFvk0o33Jl0pl5H03Ef1PopcdZqKyrHIkdbBzGxvmuXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdHrf2jqGf9uXl5cQObxKiRZMM12PdNuqojEBi0Y31VUDmY9En
 b+PuYg898uEaadBPEUKA7L6za2HLmhYVSx56uRJQpCt+jlZjcifjlvyK
X-Gm-Gg: ASbGncv1s9Oz4YhIFXDp7mwjwKZ0W3giB4Ht1GlDje4B9F5eZDAEn+MuoLPpzVujC4X
 OcWaJqmaUb13q1p/yMTVgNf1M5Bwt2mT5cUiOSuVceRh5i4oROhI08UTu6f0ELLEVMujEGt/ApN
 P68A8MNr0Q6D/eJcgf2/m1KFQeVPQ2ozKGkqa1pAmxg4o5P1RFCQp4E0IZ4gPtBE2kXGvkHU3Ib
 dfis1G6ejKb7t428gHink5v4guRWqTWO47s+GoTMXOcnBNuLpteFxNg6/xIv8N4LNR9vhRGN5zD
 kSQ71wfLghBWXj5KU6gsBdbj4I4k5Xx22JLL4KQ98EkG+0exIWJTAelZxUF2rDTF0rbnzzscQFS
 FdZ1TNjsQyl/nk260RVepXjXEFvpPua72pr+NfXR2ZsNq/DSOto21V/nXpcMANu/uW7GUQuXuEX
 UvnlnAna0YAJp8+aI0SET+j95y0Bey9h6ZeldtzduADidSrUgae0AZAiEp
X-Google-Smtp-Source: AGHT+IHkN6kst/2U0cI5ffj5ZypcrsRm6UjSAT4J4Pq42ykGcoxP+OW0hFReQqb4pCc9CMehOs7PNw==
X-Received: by 2002:a05:600c:5306:b0:441:d2d8:bd8b with SMTP id
 5b1f17b1804b1-45381aaa03fmr73036515e9.8.1750950977009; 
 Thu, 26 Jun 2025 08:16:17 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e103:2700:ebc0:27a3:cde8:9846?
 (2a02-8388-e103-2700-ebc0-27a3-cde8-9846.cable.dynamic.v6.surfer.at.
 [2a02:8388:e103:2700:ebc0:27a3:cde8:9846])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a72dasm22725015e9.16.2025.06.26.08.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 08:16:16 -0700 (PDT)
Message-ID: <5f01c181-515e-4cff-bf8a-81c620886cd2@gmail.com>
Date: Thu, 26 Jun 2025 17:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
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
 <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
 <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Content-Language: en-US
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Jun 2025 20:52:12 +0000
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

On 26.06.25 16:19, Jocelyn Falempe wrote:
> On 25/06/2025 00:18, Jocelyn Falempe wrote:
>> On 24/06/2025 20:55, Andrei Lalaev wrote:
>>> On 18.04.25 18:48, Jocelyn Falempe wrote:
>>>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>>>> to use a simple fifo with decimal digits as u8 instead.
>>>> This is slower but should compile on all architecture.
>>>>
>>>> Link: https://lore.kernel.org/dri-devel/ CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/ drm_panic_qr.rs
>>>> index 6025a705530e..dd55b1cb764d 100644
>>>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>>>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>>>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>>           SegmentIterator {
>>>>               segment: self,
>>>>               offset: 0,
>>>> -            carry: 0,
>>>> -            carry_len: 0,
>>>> +            decfifo: Default::default(),
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>>>> +const MAX_FIFO_SIZE: usize = 19;
>>>> +
>>>> +/// A simple Decimal digit FIFO
>>>> +#[derive(Default)]
>>>> +struct DecFifo {
>>>> +    decimals: [u8; MAX_FIFO_SIZE],
>>>> +    len: usize,
>>>> +}
>>>> +
>>>> +impl DecFifo {
>>>> +    fn push(&mut self, data: u64, len: usize) {
>>>> +        let mut chunk = data;
>>>> +        for i in (0..self.len).rev() {
>>>> +            self.decimals[i + len] = self.decimals[i];
>>>> +        }
>>>> +        for i in 0..len {
>>>> +            self.decimals[i] = (chunk % 10) as u8;
>>>> +            chunk /= 10;
>>>> +        }
>>>> +        self.len += len;
>>>> +    }
>>>> +
>>>> +    /// Pop 3 decimal digits from the FIFO
>>>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>>>> +        if self.len == 0 {
>>>> +            None
>>>> +        } else {
>>>> +            let poplen = 3.min(self.len);
>>>> +            self.len -= poplen;
>>>> +            let mut out = 0;
>>>> +            let mut exp = 1;
>>>> +            for i in 0..poplen {
>>>> +                out += self.decimals[self.len + i] as u16 * exp;
>>>> +                exp *= 10;
>>>> +            }
>>>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>>>           }
>>>>       }
>>>>   }
>>>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>>   struct SegmentIterator<'a> {
>>>>       segment: &'a Segment<'a>,
>>>>       offset: usize,
>>>> -    carry: u64,
>>>> -    carry_len: usize,
>>>> +    decfifo: DecFifo,
>>>>   }
>>>>   impl Iterator for SegmentIterator<'_> {
>>>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>>>                   }
>>>>               }
>>>>               Segment::Numeric(data) => {
>>>> -                if self.carry_len < 3 && self.offset < data.len() {
>>>> -                    // If there are less than 3 decimal digits in the carry,
>>>> -                    // take the next 7 bytes of input, and add them to the carry.
>>>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>>>> +                    // If there are less than 3 decimal digits in the fifo,
>>>> +                    // take the next 7 bytes of input, and push them to the fifo.
>>>>                       let mut buf = [0u8; 8];
>>>>                       let len = 7.min(data.len() - self.offset);
>>>>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>>>                       let chunk = u64::from_le_bytes(buf);
>>>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
>>>> -                    self.carry = chunk + self.carry * pow;
>>>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>>>                       self.offset += len;
>>>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>>>> -                }
>>>> -                match self.carry_len {
>>>> -                    0 => None,
>>>> -                    len => {
>>>> -                        // take the next 3 decimal digits of the carry
>>>> -                        // and return 10bits of numeric data.
>>>> -                        let out_len = 3.min(len);
>>>> -                        self.carry_len -= out_len;
>>>> -                        let pow = u64::pow(10, self.carry_len as u32);
>>>> -                        let out = (self.carry / pow) as u16;
>>>> -                        self.carry %= pow;
>>>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>>>> -                    }
>>>>                   }
>>>> +                self.decfifo.pop3()
>>>>               }
>>>>           }
>>>>       }
>>>>
>>>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
>>>
>>> Hi Jocelyn,
>>>
>>> Apologies for reviving this old thread, but I'm still encountering
>>> the same issue with the latest master (78f4e737a53e).
>>>
>>> When compiling this module for ARM32 (multi_v7_defconfig),
>>> I get the following error:
>>>
>>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ drm_panic_qr.rs:392)
>>>      >>>               drivers/gpu/drm/drm_panic_qr.o: (<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ drm_panic_qr.rs:392)
>>>      >>>               drivers/gpu/drm/drm_panic_qr.o: (<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ drm_panic_qr.rs:392)
>>>      >>>               drivers/gpu/drm/drm_panic_qr.o: (<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>      >>> referenced 14 more times
>>>      >>> did you mean: __aeabi_uidivmod
>>>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>>
>>> Since no one else has reported this in two months, I’m wondering
>>> if this might be a configuration issue on my end.
>>
>> Ok, that's surprising, the lines 391 and 392 are:
>>
>> self.decimals[i] = (chunk % 10) as u8;
>> chunk /= 10;
>>
>> So the compiler should be smart enough to do that without using a division.
>> I will try to reproduce, and see if I can fix that.
> 
> I reproduced the issues, it looks like clang doesn't do the optimization on ARM32:
> 
> https://github.com/llvm/llvm-project/issues/37280
> 
> So I've made a quick test with the following changes, and it builds:
> 
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..57bd3c6465bb 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,20 @@ struct DecFifo {
>      len: usize,
>  }
> 
> +fn div10(val: u64) -> u64
> +{
> +    let val_h = val >> 32;
> +    let val_l = val & 0xFFFFFFFF;
> +    let b_h: u64 = 0x66666666;
> +    let b_l: u64 = 0x66666667;
> +
> +    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +    tmp3 >> 2
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk = data;
> @@ -389,7 +403,7 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>          }
>          self.len += len;
>      }
> 
> 
> Best regards,
> 

Compiles for me too on clang 20.1.6.

Thanks a lot!


-- 
Best regards,
Andrei Lalaev
