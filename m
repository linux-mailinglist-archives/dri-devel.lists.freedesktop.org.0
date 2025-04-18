Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8BA93A23
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8986310E21B;
	Fri, 18 Apr 2025 15:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RBkxJ7rs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3190210E21B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744991558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wc26qQbycqhuxkUDZ6Sh+SUpqvdXJSaAUblqosEd3s=;
 b=RBkxJ7rs+bHQRHjBns8WravIrSxw0RsnREP+QW67VIp1CMI2bNz/e8C48wAbLrPNGxp9vc
 CIVYHAUvaxxEm2xTL9AlVDjWtIOhTRTfIViyaJp8oWcukbD4dAVii8ge7DOxxt2/heErjX
 pIcbKAG5MQCqYJoFQjsO2p2+5YCsLGM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-tSZkVD4bMv2J-DAgN_qZfA-1; Fri, 18 Apr 2025 11:52:36 -0400
X-MC-Unique: tSZkVD4bMv2J-DAgN_qZfA-1
X-Mimecast-MFC-AGG-ID: tSZkVD4bMv2J-DAgN_qZfA_1744991552
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43d3b211d0eso14752365e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744991552; x=1745596352;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1wc26qQbycqhuxkUDZ6Sh+SUpqvdXJSaAUblqosEd3s=;
 b=j9LNC3GYvITwLSyH31Xxga8puwaTwJYRKs95/jxVUijHUZiTnwv9x5BgaNcjEX85Az
 BgfFg8hQTZHZU3qrrrl4bTj2uung8/GhXpJcgorTa11hEGasIN4oJBUUM+tf5aOE4N/3
 bLEHdihr9GtcwoT35e48fAekHn6PFYQpMjBG675OAdpaOgwTtXF2Ac/F/KqqVhrgJptF
 Dm14zx+zWx3BOGPwXSGVBUG19DB+7xS1vonQriimKXuD1RklDkohGmKCHINE+uM6SZ9l
 MHIBkLqrHeW0QVeaQTApictGctauEaZidv64idP0XrzsUjNcvFT0HqtokrT6nkrNB7yh
 vA1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6m8AnrtiI9N2J+RxfcyvL/wr7HG94GkMb0WLDxuCQJ0EATgZ8CMfXL2mccwCOYf+GjffFzTGowI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpvrS113LQQoJgg7Kt2oQqmPyb80Lz6tcIw+GxQjN8VP+moCPf
 RBKPqXISpKqHA3z0aNE0+uWZSWj6diPGmT5xH9Z0y4aQBfHkwE2hgD3ZCOnhVOXkP4JvSG4m8Ev
 hU5RIgsQAY9KlmK7yoFpdGAcSk5myyAb7cQ0+p6iFIu+TecEjIf8GgVLDLZffhvh70A==
X-Gm-Gg: ASbGnctCItlSc25kW33xggE/aAaLm+nd96BjGCHVjkL5IhmPUWJhIvA/AxlWFe5QEdK
 e1CRKI++Pqq92tuQsfhpCUS1ndVD795/C8qzRFWQ3CeKfrcGdNWoCSy76sCrdOrl+6vTXBKHNbS
 4yG9yG6c+0TBWFIlZPKFAtnf2HaWhmZe0JUNVW/CnJsG5Ut80HDBhF83NUbti9MXj4HkE12vnVJ
 KsHVd+swanAVd4qgQnQb7bGJlRQW58eqYVWYIJzqsHPeddtHVRZK3cAyY1qmG6niUAAQ6+TsXUN
 JqKyRWv4FcnpwWZ7+TPq7Mc3IdELt2DhTVqbAdDltr2WSr6y4Hc=
X-Received: by 2002:a05:6000:1886:b0:38d:e3da:8b4f with SMTP id
 ffacd0b85a97d-39efbd007c0mr2568848f8f.0.1744991551752; 
 Fri, 18 Apr 2025 08:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8hJOtqgZKvHmMFX8Sr5+SXl0HJhOYBEusxbHJ4Nl8XaJ3wP71Jpwu6vFmp9aQLWT50/PDaw==
X-Received: by 2002:a05:6000:1886:b0:38d:e3da:8b4f with SMTP id
 ffacd0b85a97d-39efbd007c0mr2568820f8f.0.1744991551365; 
 Fri, 18 Apr 2025 08:52:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa433191sm3168492f8f.31.2025.04.18.08.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 08:52:30 -0700 (PDT)
Message-ID: <7be276bc-4c55-4144-ac29-b734b1f44667@redhat.com>
Date: Fri, 18 Apr 2025 17:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: use `///` for private items too
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20250416122106.2554208-1-ojeda@kernel.org>
 <CANiq72msZ7FUo0=KXQjMkXjfm3jVaNhhVDCu_BFXRTL_xC0vog@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72msZ7FUo0=KXQjMkXjfm3jVaNhhVDCu_BFXRTL_xC0vog@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J3pPaVKlmtt4kalyitM2oeRn5NwxkPHT8wgi-gVVNqQ_1744991552
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

On 16/04/2025 14:24, Miguel Ojeda wrote:
> On Wed, Apr 16, 2025 at 2:21 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>>
>> `///` should still be used for private items [1]. Some of the items in
>> this file do so already, so do it for a few other clear candidates in
>> the file.

I just pushed it to drm-misc-next

Thanks,

-- 

Jocelyn



>>
>> Link: https://lore.kernel.org/rust-for-linux/20250416112454.2503872-1-ojeda@kernel.org/ [1]
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Sorry, I forgot the Cc: Jocelyn (it could be nice to have a
> `MAINTAINERS` entry for this one).
> 
> Cheers,
> Miguel
> 

