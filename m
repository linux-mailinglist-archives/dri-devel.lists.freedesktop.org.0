Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A3A897A9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381F810E6A7;
	Tue, 15 Apr 2025 09:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hV909Nht";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF7210E6B1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744708452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=;
 b=hV909NhttgNFxlmUgEL0P9s7tqh+sHD3hLjvN033T6h7tiQRat5l01JzrmXJGnSnwnuWhd
 kU6PBwX/SSvTvXAHwnD0XjDyeS5HDg4ebkpiGWFDUrf8xwqOLcrYbpcFS++pNVZANmAMz9
 zLY2atdE+dwffw0vtDqWwqgMwcyEaaE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-9oc_EUWvNwC24kFgPbjVMw-1; Tue, 15 Apr 2025 05:14:11 -0400
X-MC-Unique: 9oc_EUWvNwC24kFgPbjVMw-1
X-Mimecast-MFC-AGG-ID: 9oc_EUWvNwC24kFgPbjVMw_1744708450
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so35537315e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 02:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744708450; x=1745313250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=;
 b=EImfcScPsdZFPjgPmcgoh7AGkyS9sxH4wXUjRVKCzIfDSMoC8/puBKen59hwFknoKC
 ++VkEZy3YopSaKBfePKvxKcfiY2dkqMpzUOEE2uYxhRnFm4pNQorrz8xZUD03Ad+wV1K
 fKGc2hUFht+fLjJgAxk1Cl4Pwr+2rgeHu6gzIdDs4HSXpp1ELxZuWOB/BziO3hGSRyXs
 t3pJRnaz168tU2jArzZ7Sow5IuYAG6kTAjDZesDZGGVGIvpZguBxY5vxZVZokDCh3vNY
 gGq1lqoJTzvJ8AwHpm0bMF+C9UuWsaOdvjd4HHlXSSl4BU20bPDtbbpMH5vGb3J9bjpa
 Muvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnW9NPzAsAigDt4Xc9OWZcbRqTNHVE654f1JxswXgZwdAUaxugFwC6J6z7CBaL0uyFRzoXBUEoKxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgztDjv/1yQEHoGNxWIHqIkovtRhvebYXNxuNUUP7v+3rUn8gs
 cG0WUkR2v31QFdNBQR7lk1/00iZ6Fdn7vDGEuwSxEN00vgpYQivxN3lA3BjKPANbtXQku1WnrCr
 wXRHBo512sVpFo6kCIViEdeQZ0DzEK4QlnP9xmjkFl/5VWwKRaHxRPIFDJRYbo8WrUA==
X-Gm-Gg: ASbGncs/OTkzWdpyrmyF5j7nqgolN26kgXuL4z92njVljLCQ3nWSE3VdyZ9mrZBkOxC
 7FzQO6PLyPNP5Ola8BVscQnYSds40e0VNU2aIaJCLcHgBmoV/PPp748arLr1O/vLBrZf5KV/79M
 iqd7JgNvn5JZX0UcfOiTaNkB/Sz19THqoi+qWdGYVtI8eEcGklsUnFvkpozwuSRi0U0xymz//Gf
 +SWoUgrRUQ7zBvFpafgWs4jJagWzc6vi0HfFubqWmACcOoTeRjeaf9LGq3ShGZ9dn3SSl1ramQb
 ms0+d1A0trXxDmU1U47tsZDDXiqPER3ebthPH/SEp/cYA/69PdE=
X-Received: by 2002:a05:600c:a0b:b0:43c:fceb:91f with SMTP id
 5b1f17b1804b1-43f3a94c707mr121539025e9.11.1744708449846; 
 Tue, 15 Apr 2025 02:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER2bLz18Dd2QrnXzcffJp2/++mALwClLl9NZTgUP+3ai5VKvRqmsyvG3bjrFO1ABqJnqpLWw==
X-Received: by 2002:a05:600c:a0b:b0:43c:fceb:91f with SMTP id
 5b1f17b1804b1-43f3a94c707mr121538555e9.11.1744708449206; 
 Tue, 15 Apr 2025 02:14:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm199454825e9.23.2025.04.15.02.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:14:08 -0700 (PDT)
Message-ID: <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
Date: Tue, 15 Apr 2025 11:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
 <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7geMYaFteYDVme6iscMeopFEEnlqja275UVRMGUdU2A_1744708450
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

On 14/04/2025 21:46, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
>> Hi Miguel,
>>
>> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
>>> Hi Jocelyn, Christian,
>>>
>>> I started build-testing arm 32-bit within my other usual routine
>>> tests, and I hit:
>>>
>>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>      >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>>>      >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
>>> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>
>>> which comes from both these `u64` by `u64`:
>>>
>>>      let out = (self.carry / pow) as u16;
>>>      self.carry = self.carry % pow;
>>>
>>> Christian: I guess we can offer a set of `div64` functions using the C
>>> ones, at least for the time being, and eventually wire the actual
>>> operator with some support from upstream Rust. Or do you have
>>> something else in mind? (i.e. I think you have been discussing
>>> intrinsics lately)
>>
>> I think using the C implementations is fine. Not sure how much the
>> FFI is going to matter for performance, but it should be rare enough
>> that is shouldn't matter (and hopefully we will get cross lang LTO
>> or something similar at some point).
>>
>> We could also just implement the intrinsic(s) ourselves, but then
>> the u64 divisions would be implicit which is probably undesired.
>> We could also rename the intrinsics so they are only usable from
>> specific crates.
>>
>> I think we need the opinion of the some arm people here.
>>
>> CC Russell King and Linus Walleij.
> 
> The kernel has had the general position that u64 by u64 division is
> silly and isn't supported. Several 32-bit architectures including
> 32-bit ARM don't support it.
> 

For this case, the u64 divisor "pow" is a power of 10, so can have only 
a limited number of values. (17, and 9 of them can be used as u32).
Normally when the divisor is known at build time the compiler can 
replace the division by a multiplication and some bit shift.

so for 32bits machine, the match can be rewritten with constants, a bit 
like this:

1..9 => {
      let out = (self.carry / u32::pow(10, self.carry_len));

10 => {
      let out = (self.carry / 10_000_000_000);
       ...
}

11 => {
      let out = (self.carry / 100_000_000_000);
     ...
}

Would that fix this problem?

Best Regards,

-- 

Jocelyn

