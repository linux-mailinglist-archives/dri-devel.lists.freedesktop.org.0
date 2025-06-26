Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8BEAEA038
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 16:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C6C10E87A;
	Thu, 26 Jun 2025 14:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OdacxGNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED30510E87A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750947549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=;
 b=OdacxGNmuSvP6RzakJuyghRRPHEV/64d8fmphTmlLyj4W9bwmGz5GO0xWr6JXigEVHj6B3
 HPp2CMeT2uD52IDQseRFYjWjbThr8B689oHwmU7HW2p7NA0IPtY1afmzazQmZWfg5L/2D5
 sLpat3Cpdtbg2oefFhpXjKLpEk8oS38=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-m1WJyu77NVWC_hR4xF4L7A-1; Thu, 26 Jun 2025 10:19:04 -0400
X-MC-Unique: m1WJyu77NVWC_hR4xF4L7A-1
X-Mimecast-MFC-AGG-ID: m1WJyu77NVWC_hR4xF4L7A_1750947544
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45320bfc18dso6115335e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 07:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750947544; x=1751552344;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=;
 b=wyBUUjinSWxk3Qr0PDBKnVhfuo7O+RCrERfAudMI7l0cRhV3pzettxX5G7aV7bUlrY
 P/r/B/0HGejKqQiGjHhZnL3T02J7iGT0iJAA4zStdHhzwPqnfTRPD5srr/QPSgqDacDm
 Zq0Up3doUVFDzkItsYQ8bEK6yvwCOBoezC2q70F2q0LD+j/gLrpUOR36mdR7fdr36rje
 58kTUVY1qrr731ng8E7pDs1/nk8R3gcz9ma1GJZgxLSZy/jFk/66MyShuJSiV0pSLPx7
 X97VRjFQ6iYCzTzdtVBrY9/ifnAG1QKw+wigd7FOKkbBhoEqFMFFQSIPbRixX+9b/dKB
 chZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOLEdHiM1fk5bDe0aX/Y2uwtHGAM+Q746i2OBpXoKtBQtUhh7zbzSu/yw7Q0DOFW6tYrxYXmBsiZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHniKF2dgl7B30zKTNpC+Q8PAwP/EaiyaB5yv0Pjamk3H46hT2
 1+v7AH8C7GlqWGxP9+/2yNTF2zhe+ELlSc4oyC3/gj1oxcXRwc5QoWhhKsDth6U1i9GwhWzQKBd
 F8Gk1D1FHL5ObgrpyEd6tguNyA2VQ3d5TnInojqMAtcBnCoytjOZVp5nGmpoPGk4UpKYtaw==
X-Gm-Gg: ASbGncvFj+0LdXz3PoavyW1PyoYUki7hcxEx4rDxXwgU/XxuyJ9/hCbmtP3SibSh86y
 74cesTpkYk9DTJ2B+8RXcP6dMUnCljQMA0lynKTjYbeEbeX1sduj+Wf7uY3v8qaJHLKqhYCxfBV
 64B+0ure8JTKc6hfDvQeorPhFNd97GEnQCk8z+j36qqX2J4sSbCegRl2YqK9zWKAosIdEFVeo3j
 o/O+yxTn2rl4OnNWER+FWCBDyKHKbgZHBllLsoxqMmIOgz06rzyytaFuVZEb62X+GoQyQVTAx9I
 uvEbyMD9TEookhGq2JtnkQxAVZ8NV8pTpvip+IIJ/07s0i8fyKKm4gHNn16KYA==
X-Received: by 2002:a05:600c:35c9:b0:453:79cb:7c86 with SMTP id
 5b1f17b1804b1-4538896ba75mr41350035e9.3.1750947543435; 
 Thu, 26 Jun 2025 07:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX3SUpCYk0Q1rtUXxdiwTxAC1uqwZZn+noU/tSvXGhBzHLk/17+Raj1JTfMd2KuovA5Hm6ZQ==
X-Received: by 2002:a05:600c:35c9:b0:453:79cb:7c86 with SMTP id
 5b1f17b1804b1-4538896ba75mr41349375e9.3.1750947542873; 
 Thu, 26 Jun 2025 07:19:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823c463asm51664655e9.39.2025.06.26.07.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 07:19:02 -0700 (PDT)
Message-ID: <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Date: Thu, 26 Jun 2025 16:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
From: Jocelyn Falempe <jfalempe@redhat.com>
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
 <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
In-Reply-To: <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y4Uj_4K9k-G1evppl6rtuq5OtgcrHx8PHS-EKX2_O-k_1750947544
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

On 25/06/2025 00:18, Jocelyn Falempe wrote:
> On 24/06/2025 20:55, Andrei Lalaev wrote:
>> On 18.04.25 18:48, Jocelyn Falempe wrote:
>>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>>> to use a simple fifo with decimal digits as u8 instead.
>>> This is slower but should compile on all architecture.
>>>
>>> Link: https://lore.kernel.org/dri-devel/ 
>>> CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/ 
>>> drm_panic_qr.rs
>>> index 6025a705530e..dd55b1cb764d 100644
>>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>           SegmentIterator {
>>>               segment: self,
>>>               offset: 0,
>>> -            carry: 0,
>>> -            carry_len: 0,
>>> +            decfifo: Default::default(),
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>>> +const MAX_FIFO_SIZE: usize = 19;
>>> +
>>> +/// A simple Decimal digit FIFO
>>> +#[derive(Default)]
>>> +struct DecFifo {
>>> +    decimals: [u8; MAX_FIFO_SIZE],
>>> +    len: usize,
>>> +}
>>> +
>>> +impl DecFifo {
>>> +    fn push(&mut self, data: u64, len: usize) {
>>> +        let mut chunk = data;
>>> +        for i in (0..self.len).rev() {
>>> +            self.decimals[i + len] = self.decimals[i];
>>> +        }
>>> +        for i in 0..len {
>>> +            self.decimals[i] = (chunk % 10) as u8;
>>> +            chunk /= 10;
>>> +        }
>>> +        self.len += len;
>>> +    }
>>> +
>>> +    /// Pop 3 decimal digits from the FIFO
>>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>>> +        if self.len == 0 {
>>> +            None
>>> +        } else {
>>> +            let poplen = 3.min(self.len);
>>> +            self.len -= poplen;
>>> +            let mut out = 0;
>>> +            let mut exp = 1;
>>> +            for i in 0..poplen {
>>> +                out += self.decimals[self.len + i] as u16 * exp;
>>> +                exp *= 10;
>>> +            }
>>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>>           }
>>>       }
>>>   }
>>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>   struct SegmentIterator<'a> {
>>>       segment: &'a Segment<'a>,
>>>       offset: usize,
>>> -    carry: u64,
>>> -    carry_len: usize,
>>> +    decfifo: DecFifo,
>>>   }
>>>   impl Iterator for SegmentIterator<'_> {
>>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>>                   }
>>>               }
>>>               Segment::Numeric(data) => {
>>> -                if self.carry_len < 3 && self.offset < data.len() {
>>> -                    // If there are less than 3 decimal digits in 
>>> the carry,
>>> -                    // take the next 7 bytes of input, and add them 
>>> to the carry.
>>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>>> +                    // If there are less than 3 decimal digits in 
>>> the fifo,
>>> +                    // take the next 7 bytes of input, and push them 
>>> to the fifo.
>>>                       let mut buf = [0u8; 8];
>>>                       let len = 7.min(data.len() - self.offset);
>>>                       
>>> buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>>                       let chunk = u64::from_le_bytes(buf);
>>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as 
>>> u32);
>>> -                    self.carry = chunk + self.carry * pow;
>>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>>                       self.offset += len;
>>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>>> -                }
>>> -                match self.carry_len {
>>> -                    0 => None,
>>> -                    len => {
>>> -                        // take the next 3 decimal digits of the carry
>>> -                        // and return 10bits of numeric data.
>>> -                        let out_len = 3.min(len);
>>> -                        self.carry_len -= out_len;
>>> -                        let pow = u64::pow(10, self.carry_len as u32);
>>> -                        let out = (self.carry / pow) as u16;
>>> -                        self.carry %= pow;
>>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>>> -                    }
>>>                   }
>>> +                self.decfifo.pop3()
>>>               }
>>>           }
>>>       }
>>>
>>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
>>
>> Hi Jocelyn,
>>
>> Apologies for reviving this old thread, but I'm still encountering
>> the same issue with the latest master (78f4e737a53e).
>>
>> When compiling this module for ARM32 (multi_v7_defconfig),
>> I get the following error:
>>
>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced 14 more times
>>      >>> did you mean: __aeabi_uidivmod
>>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>
>> Since no one else has reported this in two months, I’m wondering
>> if this might be a configuration issue on my end.
> 
> Ok, that's surprising, the lines 391 and 392 are:
> 
> self.decimals[i] = (chunk % 10) as u8;
> chunk /= 10;
> 
> So the compiler should be smart enough to do that without using a division.
> I will try to reproduce, and see if I can fix that.

I reproduced the issues, it looks like clang doesn't do the optimization 
on ARM32:

https://github.com/llvm/llvm-project/issues/37280

So I've made a quick test with the following changes, and it builds:


diff --git a/drivers/gpu/drm/drm_panic_qr.rs 
b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..57bd3c6465bb 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -381,6 +381,20 @@ struct DecFifo {
      len: usize,
  }

+fn div10(val: u64) -> u64
+{
+    let val_h = val >> 32;
+    let val_l = val & 0xFFFFFFFF;
+    let b_h: u64 = 0x66666666;
+    let b_l: u64 = 0x66666667;
+
+    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
+    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
+    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
+
+    tmp3 >> 2
+}
+
  impl DecFifo {
      fn push(&mut self, data: u64, len: usize) {
          let mut chunk = data;
@@ -389,7 +403,7 @@ fn push(&mut self, data: u64, len: usize) {
          }
          for i in 0..len {
              self.decimals[i] = (chunk % 10) as u8;
-            chunk /= 10;
+            chunk = div10(chunk);
          }
          self.len += len;
      }


Best regards,

-- 

Jocelyn

> 
> Best regards,
> 
>>
>> Thanks a lot!
>>
> 

