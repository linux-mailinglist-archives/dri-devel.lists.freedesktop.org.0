Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F6C29097
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008D310E04F;
	Sun,  2 Nov 2025 14:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bdtZYyTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787A210E052
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 14:56:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso987459f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762095379; x=1762700179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WNRp8GBQqKKuNk9ZiQRhReDm9E3VEBrBLSW1DlgX55M=;
 b=bdtZYyTK2fdKMwaLxsrsXgRtVU970xOA7S+9X3r4gGNzV7p8r0UUj4QhP5PVTgjdxB
 nMs0lJmpvZOXDW8xCsY9jFVqEq/7CGSEDRGBABnGP/n8/n4nGiUQfRehML2Eguru8F6J
 bfVR2BnxudgYWqp7GaRWcQl360V16SGtsRzwlKK5YGuuRk+vpU5+pFDbvp3Nq4nlmAZi
 52z5hX3gw8iPy4dgdTwlq0foP+DDFanvJyPvgAwccXsUJdHWYdhb8aWJql63Oqec1+6G
 WTl/ge66OhgZ4ASSOJk7UvOu1FDy+QRBOaP8UFQAd92DXnlYixj667uBwZPFdhLwLlNy
 3Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762095379; x=1762700179;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WNRp8GBQqKKuNk9ZiQRhReDm9E3VEBrBLSW1DlgX55M=;
 b=fXrYfaLoa3rOaTAUMW0Bjes3tcqm0omZxC+WQ2g2dShVwQ7B7nAf9lgaIz9IP2y6hT
 oT5jPKi22x4cqBSkMKqyEtSdMrNCW8WG9cZzmW79Yfj9nvtwLI4biw3MrDFm1eyeXsuD
 HLN0xJssM55OaIlg3Pp385BC0jDYjqK8GZFzhYldapr+HWaFJdep7hvcQRn9Q0DEQ32a
 jeh/7vH8ftYgGVm1EBmHcwREKLNofsYGSNjNc+TiQCuKOxWsNOMT4OQBWCjS7Qys1+Dr
 Al9vXVAj4I0PC3QaFlv96T281eRniXy+vvQsSWqfsXDa1qyPofbzLYEtWX0Z8Jiau2Aw
 eSbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6ZRk4NcwZz+ub4XOXxFoUkrqxNqpfzARF09V8eZMozHDJNzqznI4yvo9IihTss3baHTAOQ6yz97k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiFn7LUFoGPvFTj+xbUcBcwUrnwUGGFOMJSvC6bfKQWEhdaJcx
 jFXij65mm0E2RjSCj6PoJWI5BdqDG/6N779hHhMuuBd90uWin8/fK0ko
X-Gm-Gg: ASbGncvttfDKuvLikSQsOIfzErTALnSaqcYPaqLe1QrJKa0dw55S4ksBLU1nv0FZtAo
 nveCKY/S+cNfr3SNU/ZTaDRUSnU46u9fyDLZECVdLX+JdNObqO6sQA7uF3xBwgbO1VFvFhyQh6P
 JrsQ63yXQY6bCLuzuCBZFJg7ucOyoYO/sOoxiARqT3e4Xu8BBJU/cvb0kTbDuIzmpUl1Yae6H+x
 dUt+Zk2Sx/Ief/ImYRz0rlIlSObdYHtODWMqMGtre7RhQ619kS+wWIytPRQs7c02ttS0inXFjSp
 2dWDeYHoyWzQIp7+4tY3LjJFCksib5ZwlIBUdV9Qmh0/FHIouBHgWmXqezSVCesQCHCaZ0V7hjv
 x78jRJIq+RYYmxun+WR3Gq5ByFZGXqkuIjm2MDSCP3B/Bu2d6HF2GN26efm5rIb5yHKJqZHClmX
 BI55DmHi7+UtCUxGO+na6djSgmchjGl7hePxtqvzpaCcKVHzw663L5/dQaKxwiDxxrJkE=
X-Google-Smtp-Source: AGHT+IEAwtgyxniTz4Ai5mtawKx2HjkKK2OW7gZ2ITGD+2oJ/4ffgGzrS5E/3uRYJ89wkLzNjfq3hg==
X-Received: by 2002:a05:6000:1a85:b0:429:d2a9:5dea with SMTP id
 ffacd0b85a97d-429d2a95f05mr675088f8f.15.1762095378417; 
 Sun, 02 Nov 2025 06:56:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13f2b5asm14807337f8f.40.2025.11.02.06.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Nov 2025 06:56:18 -0800 (PST)
Message-ID: <51200cc6-042a-4e83-81b0-720385c67bb5@gmail.com>
Date: Sun, 2 Nov 2025 15:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nova-core: Simplify `DmaObject::from_data` in
 nova-core/dma.rs
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <20251023205146.196042-2-delcastillodelarosadaniel@gmail.com>
 <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <DDXC0YKKJJT4.18JQ1MJQ7I31Y@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Alexandre,

On 11/1/25 12:46, Alexandre Courbot wrote:
> On Fri Oct 24, 2025 at 5:51 AM JST, Daniel del Castillo wrote:
>> This patch solves one of the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> It uses the `write` method from `CoherentAllocation`.
>>
>> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
>>
>> ---
>>
>> V1 -> V2: Split previous patch into two. One per reference to COHA.
>>           Added more details in Safety comment. Let me know your thoughts
>>           Kept the original map to avoid a temporary variable
>> ---
>>  drivers/gpu/nova-core/dma.rs | 15 +++------------
>>  1 file changed, 3 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
>> index 94f44bcfd748..620d31078858 100644
>> --- a/drivers/gpu/nova-core/dma.rs
>> +++ b/drivers/gpu/nova-core/dma.rs
>> @@ -26,18 +26,9 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>>  
>>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
>>          Self::new(dev, data.len()).map(|mut dma_obj| {
>> -            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
>> -            // SAFETY:
>> -            // - `dma_obj`'s size is at least `data.len()`.
>> -            // - We have just created this object and there is no other user at this stage.
>> -            unsafe {
>> -                core::ptr::copy_nonoverlapping(
>> -                    data.as_ptr(),
>> -                    dma_obj.dma.start_ptr_mut(),
>> -                    data.len(),
>> -                );
>> -            }
>> -
>> +            // SAFETY: We have just allocated the DMA memory, we are the only users and
>> +            // we haven't made the device aware of the handle yet.
>> +            unsafe { dma_obj.write(data, 0)? }
> 
> This doesn't build for me:
> 
>     error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `core::ops::FromResidual`)
>       --> ../drivers/gpu/nova-core/dma.rs:31:44
>       |
>     28 |         Self::new(dev, data.len()).map(|mut dma_obj| {
>       |                                        ------------- this function should return `Result` or `Option` to accept `?`
>     ...
>     31 |             unsafe { dma_obj.write(data, 0)? }
>       |                                            ^ cannot use the `?` operator in a closure that returns `dma::DmaObject`
> 
> Could you double-check? I guess you will need to change the `map` into
> `and_then`.

You are totally right. I'm not sure what happened. I'll fix it. Thanks!
