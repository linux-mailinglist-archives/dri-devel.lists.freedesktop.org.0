Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D623927312
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E4210EA66;
	Thu,  4 Jul 2024 09:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FUHeSxHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFABD10EA66
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720085408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4uXprkwlvPamWZYVoqyTd1YcwUNvxNCyRkcYrhT/QQ=;
 b=FUHeSxHY2ESRnvmoxdW7544dtjC6tVYRT21dvWdrGr0MmwLuL5IZoHZFEAilSNy0uu1Mu3
 xodSfXSgH5KNqay23E4YF7ipmApUYZWjcKsYs6OhLAAoLdNfwq/TRh7JFeWdtkgqbXPRxY
 HbgNcDBgnXomb6jfYo5XDQkpG1KAHAY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-OknBdYumN7yYl5VBsIA6TA-1; Thu, 04 Jul 2024 05:30:06 -0400
X-MC-Unique: OknBdYumN7yYl5VBsIA6TA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52ea0d8adfcso380058e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 02:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720085405; x=1720690205;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4uXprkwlvPamWZYVoqyTd1YcwUNvxNCyRkcYrhT/QQ=;
 b=VI/5OTtm6bFD5Hd+cIul068Qop5nEyIx7kIH8yqWv1d/lhHhApS2U9oqa9on+v8nyu
 YLJ/SekyUXUEmV4/3wzegC0zHDr1n8mrvUq+mGusU+vsI0/ssWwik1jU7kPJ6DNWmxzR
 1pkJNVeTuz61xjfH0aYx4YFGEqH4ApqY1oa4LrB2HHNXYUN8PTOAI4Tf34F7NTZIBdBG
 QLoW+bT/2xgzFQuDNb749XhwgTVanqan5eKXGSVN27AxaThsON01q4NbXQA7MDhJQ2ht
 Q7PZQjLoLzshBIFc9cxr/Yuc119WhZ/X4wB1YD6kxGx50i3+j/GJBCaAR2WV5hD3KHN3
 7j3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3n/NXSZWrP/JCq/Wwo2We6V5/Nuj2/ALDzvDan0G438nkVmp+nISbXhgUfYWkJH2lWBPLQyAw0v/ku1jiUxjSkcURpF8umlspuWKd5nk2
X-Gm-Message-State: AOJu0YzAWh6+8iXqg5FRxnE8ESB5BfFwuzFj1weBArnfcZW9/xvM+ZHg
 NDXKO7hxqjPPGqFd6yON77lo6N0ooJIdTFG4n1s3LAoDl325qkuEPjZCVOfOrT2eC2gKLNdRImW
 PtgUpWMix+wCcycwu70K68d67jIz78SIUsRF7xNkOVIFZxMjPWzW68uIXCmSAvtu2gmQhF6kWNk
 Fm
X-Received: by 2002:a05:6512:47c:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-52ea06bacccmr764761e87.45.1720085404902; 
 Thu, 04 Jul 2024 02:30:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDFDIi+xuW7Jy4FRnZjDg1+mTBblmfBJkFovRI6uIWmzL2R/6mOOqlUN8xD5v+Gn3jiKKuLA==
X-Received: by 2002:a2e:9b89:0:b0:2ee:4da5:be67 with SMTP id
 38308e7fff4ca-2ee8ec7b181mr6771311fa.0.1720085384344; 
 Thu, 04 Jul 2024 02:29:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d50b0sm16650195e9.7.2024.07.04.02.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 02:29:43 -0700 (PDT)
Message-ID: <df3b1122-1c05-4bd5-bbbd-2e7cff2934aa@redhat.com>
Date: Thu, 4 Jul 2024 11:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/panic: Add a qr_code panic screen
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
References: <20240703154309.426867-1-jfalempe@redhat.com>
 <CAH5fLgiMJZYhSiBVc7r3HP0VTCNVG=FuD68v-ni4=54t5vVPwQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgiMJZYhSiBVc7r3HP0VTCNVG=FuD68v-ni4=54t5vVPwQ@mail.gmail.com>
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



On 04/07/2024 11:18, Alice Ryhl wrote:
> On Wed, Jul 3, 2024 at 5:44 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> This series adds a new panic screen, with the kmsg data embedded in a QR-code.
>>
>> The main advantage of QR-code, is that you can copy/paste the debug data to a bug report.
>>
>> The QR-code encoder is written in rust, and is very specific to drm_panic.
>> The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
>> The rust code uses a few rust core API, and provides only two C entry points.
>> There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.
>>
>> If you want to see what it looks like, I've put a few screenshots here:
>> https://github.com/kdj0c/panic_report/issues/1
>>
>> --
>>
>> Jocelyn
>>
>>
>> Jocelyn Falempe (4):
>>    drm/panic: Add integer scaling to blit()
>>    drm/rect: add drm_rect_overlap()
>>    drm/panic: simplify logo handling
>>    drm/panic: Add a qr_code panic screen
>>
>>   drivers/gpu/drm/Kconfig         |  29 +
>>   drivers/gpu/drm/Makefile        |   1 +
>>   drivers/gpu/drm/drm_drv.c       |   3 +
>>   drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
>>   drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
>>   include/drm/drm_panic.h         |   4 +
>>   include/drm/drm_rect.h          |  15 +
>>   7 files changed, 1340 insertions(+), 39 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_panic_qr.rs
>>
>>
>> base-commit: 3f5ea7ed705e8effe9cfabf912e769ccb6b7d389
> 
> I tried to apply this patch, but I can't find this commit, nor could I
> find any tag that it applies on.

Sorry, it's the drm-misc-next branch of 
git@gitlab.freedesktop.org:drm/misc/kernel.git

> 
> Alice
> 

