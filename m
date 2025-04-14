Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56329A89984
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7110E6FD;
	Tue, 15 Apr 2025 10:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VRJVZ2Qz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7056210E318
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 19:21:48 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so34073945e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744658507; x=1745263307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=;
 b=VRJVZ2QzTHlPLdfVKysGGjbXlkDuiaKFU1CNv3Ij+OUiH6OHDKrx03e7JeZEqpDcHr
 M5ktZDxgKtC24otsLjPZYESKwUvRPCK/fzzxLghYbtMBP/N5iDI9wpIA7giDSByeQBjk
 6sB9hTmx5yxmZonOBZJ8A/azQxfz3RGUVeFOkS/wNMPzZsOXg+ORNC/M+0sp+Ej+2QNr
 AaEQ/It/tQM5OUCmfDPjRSLU/IhHyma0TTQMJCHVi+y7wInKMCUl5GBHCfaF6PVl7V+m
 H4pXaD8P9vrwJ0C15jjPDjcY88NC1Mo0UM+gW/QG2H3VSszDJeaTDwh7rga4IN91vJAt
 UKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744658507; x=1745263307;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=;
 b=WGn4cMI00yvTn12W5ve5IENbdpfxzfCe2ohiCvDbY77sKmuPXkeUdHQ8BXuK0xt+x0
 bLqijUfh/mI1p7bToAbmRKXZ62Deby9XQaCqho0mBA0NScwfFBhRjvGDfnPOQoLQkan4
 +edgzloPw72HbMrwQEbgoMAu0GLZjJr1yeZFl7UDZE7l8z+TAjzLBFOGNU82au6ad3qP
 3vAE5VFqbJ5QQ124MQh+qAotmWExO7J9Oa8O7ueM3pK0F6iNKwn63TBVemWRrxfVWQnS
 FI9frpbNF53D9+YILQURE0Iiwhjr91aP6olzyIgcNQ5xzzcKMzNGdXax4bMuaG/hxssK
 sMqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnl76F1s/5vOp1IvCHQ5pWe3vNcKJboR3nXnjoYGrOyktVZhlNgLkMX1YnJ2QdtRr79IlDqoe5ezU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsQNNcquss4MQ2dgha+0Kujo2SogiR7DI+0P5pZS8IS+y/q8DH
 o71y5gkdlEkU/S9b02J99dDUsTGJtm/lBDqdD0gytCTrdg3MJRaJ
X-Gm-Gg: ASbGnct02L1/krt4fy4AyO9zD3/QX5CReC0YqgvvyiFpv7LicVgT8UuUSNgSsQ9APSG
 xzWkl67joEv6WUsnp6tf4UzdulW77g7/m2iuOqimn5uDise/r0YHZhLYbnHlS+wKLxsUNfz7MWZ
 d8P71JULspCBnBuyKOdXHn26ULybIUGn+gPLfOGrc0zEzMYW6IwBPKX15jt/9H9f5rS53+0tFd0
 KYzWvFFh4BdmKppiQ1BrdLD8wTrZgLrJjgaaFoePtWvL6ApevRaYKqwX/AWdB9MdGXRN17IFnf8
 MMvrPuxV0TTEfFUpZ4c5PwzJPr2970mQN26fcglrl4bZu1bHhS3A3w==
X-Google-Smtp-Source: AGHT+IHrtPJf7tJJ5VJyh1jOHcx4HFwLVSxBmFMH5rzu041anN5yYzVbiM1Y436XhCJ6X/gw2IidJQ==
X-Received: by 2002:a05:600c:1c8e:b0:439:6118:c188 with SMTP id
 5b1f17b1804b1-43f3a95c43amr105045055e9.19.1744658506479; 
 Mon, 14 Apr 2025 12:21:46 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f206269c8sm193445625e9.16.2025.04.14.12.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 12:21:46 -0700 (PDT)
Message-ID: <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
Date: Mon, 14 Apr 2025 21:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 15 Apr 2025 10:08:37 +0000
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

Hi Miguel,

On 14.04.25 8:14 PM, Miguel Ojeda wrote:
> Hi Jocelyn, Christian,
> 
> I started build-testing arm 32-bit within my other usual routine
> tests, and I hit:
> 
>     ld.lld: error: undefined symbol: __aeabi_uldivmod
>     >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>     >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
> 
> which comes from both these `u64` by `u64`:
> 
>     let out = (self.carry / pow) as u16;
>     self.carry = self.carry % pow;
> 
> Christian: I guess we can offer a set of `div64` functions using the C
> ones, at least for the time being, and eventually wire the actual
> operator with some support from upstream Rust. Or do you have
> something else in mind? (i.e. I think you have been discussing
> intrinsics lately)

I think using the C implementations is fine. Not sure how much the
FFI is going to matter for performance, but it should be rare enough
that is shouldn't matter (and hopefully we will get cross lang LTO 
or something similar at some point).

We could also just implement the intrinsic(s) ourselves, but then 
the u64 divisions would be implicit which is probably undesired.
We could also rename the intrinsics so they are only usable from 
specific crates. 

I think we need the opinion of the some arm people here.

CC Russell King and Linus Walleij.


I'm not sure what could be done in upstream rust to help here
and that would probably need be a very specific features for the
kernel.


Cheers
Chrisitan
