Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5321B9EA267
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 00:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7306710E366;
	Mon,  9 Dec 2024 23:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XsUHZkPk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047110E366
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 23:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733785517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rtXPjJ/UW99vVDZpFTpb2RZPeH7PKMqMj5zaKL4gx1k=;
 b=XsUHZkPkjVLnVvLDz6Y1u2pq9PuQF2sAqPtt40rAuYyNtZ61oMwb2Y3olADWjcpOIx2LEp
 7SwpgUgO7l5mIDdniI2eFpYqFvF2nFIzRAkjtcuNq8ZAHjdnM1SDjHy6/RpAKqaT2KeD27
 C0ec3rHUmBBRjhHSWrZu1eTNNpGLvSI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-SBvxkJ4qO1Gz_6r5vWKEYA-1; Mon, 09 Dec 2024 18:05:16 -0500
X-MC-Unique: SBvxkJ4qO1Gz_6r5vWKEYA-1
X-Mimecast-MFC-AGG-ID: SBvxkJ4qO1Gz_6r5vWKEYA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-434fa6d522bso6976355e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 15:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733785515; x=1734390315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rtXPjJ/UW99vVDZpFTpb2RZPeH7PKMqMj5zaKL4gx1k=;
 b=DSsHBiQlpXM+JGqtTnKoln5C8oYKBlsnWm/F8XfC/brHQsgPeV0eHEt81entNptFtL
 ISziZ5DFXqKSCsR4+9dRhA7FzYVOFZd7YodtXYZ08oETZ3eIoL8/A3hCLak0GgTQjeof
 Cx4nebrzBsCsho4Ir5i7fbsZZ9A4+VoZplFOC0ArygBcWpVl0LB5Q5vqsTGkA/HMoRzh
 huJt/+ZbcRVwf8iwwXZhls7CobhNaAEIoUt2/ABFdHKduE46rsWPJdIiZMZtozpQCC3m
 kGp3w5Lu4KjnvhjQfhvot5Mn0y3Ky2q0t0xqFctHKVZnrZWFjSIWA31u6mMAAK/jycZJ
 sShQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbUN2ymIi0G1Ey/PHFaGwLPYYCfBkCXgm8dV12fc/CElQY0ibxNPkd7ecL8gL7mzt3hmz1gvhmDhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywq6pYbbZXvvC5vc/orumuNkAnrZ3NpTsZu1a0ReLYi2AWNFIF5
 FWGSRaL60Y+ospdOwSPENBjbGoiGAoll6BgEpQIg49DTawc0tSB4SYX/odNqarIhOZ0Y+/asWOr
 AsxU72gYhllov35qtx9vvevHFCzIiFvsJyB98sJgkbK2Um/QBAs05NwabcD4oHgXGeA==
X-Gm-Gg: ASbGnctoobndlJ3QzaZqRKYT29vbWtkf8PBL6LldS3Kjf8w+88NQ+UgyDJ3qSmGr084
 x0awnet8PcA3AN0+9Eia9ovNLNowPq2beooGkTGpKF3peSI+8uDFC2ztOQVb4HbNNbWZmb16wDa
 2my9uX+4uTqGAwwbCeeWkBF/KGVyyzJBVMtAQT0EC5ewn8AOOfg2N4i4jN1YbQ5yio5MJS2ULMC
 beKEvbKzYNV5KbhVRidxE4VIla6wIgIkdTNjaNVlRdkOwBdoXJHiXmi2DU/NY3dzLdycKElwMgS
 UN9wJ5guzX/MuQ4eTA==
X-Received: by 2002:a05:600c:18a6:b0:434:ea1a:e30c with SMTP id
 5b1f17b1804b1-435021d9c95mr8234885e9.13.1733785515314; 
 Mon, 09 Dec 2024 15:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErGKM+mO4OjrHPaFMSgaVoG1GHOIII5oaFReyZQhrk1MzggllJFKQWOp6TcUYxwWwXNWck1A==
X-Received: by 2002:a05:600c:18a6:b0:434:ea1a:e30c with SMTP id
 5b1f17b1804b1-435021d9c95mr8234565e9.13.1733785514969; 
 Mon, 09 Dec 2024 15:05:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38636e05568sm8337911f8f.39.2024.12.09.15.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 15:05:13 -0800 (PST)
Message-ID: <e544c1c7-8b00-46d4-8d13-1303fd88dca3@redhat.com>
Date: Tue, 10 Dec 2024 00:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: remove spurious empty line to clean warning
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, stable@vger.kernel.org
References: <20241125233332.697497-1-ojeda@kernel.org>
 <fe2a253c-4b2f-4cb3-b58d-66192044555f@redhat.com>
 <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72=PB=r5UV_ekNGV+yewa7tHic8Gs9RTQo=YcB-Lu_nzNQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6hHDRqqtjU7eNMyynXrjlABZVFv_xzwjj2Smcd46R9s_1733785515
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

On 09/12/2024 22:05, Miguel Ojeda wrote:
> On Tue, Nov 26, 2024 at 10:04 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Thanks for this patch, it looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Thanks Jocelyn. I thought DRM would pick this one -- should I pick it
> through rust-fixes?

You can merge it through rust-fixes. I have another patch [1] under 
review that touches this file, but it shouldn't conflict, as the changes 
are far from this line.

How do you test clippy, so I can check I won't introduce another warning 
with this series?

[1]: https://patchwork.freedesktop.org/series/142175/

Best regards,

> 
> Cheers,
> Miguel
> 

