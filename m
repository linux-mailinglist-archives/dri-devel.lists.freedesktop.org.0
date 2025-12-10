Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5DCB1E75
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 05:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC1210E657;
	Wed, 10 Dec 2025 04:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FssJlhHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEC610E657
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 04:26:43 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-343806688c5so5189472a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 20:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765340803; x=1765945603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tk/No+Mm3I+u10bIGMU4QecHhYZtSqoq4vJuDZr7ifY=;
 b=FssJlhHwVcIIcmYfGWS1sSL/YcJB9jb/dQNPfkReOAeuUEAsQv7yVMR9ILNdg1ySqD
 gLZe4a4htGiYtS8HLZT3gDa2P7iRboExsbiuWahMiQBfKu+xE6vKFi1yhQq+kOu1iESS
 so9pOF3Dj3Lx677vj3urQscDiUGjV/qgW1FzKQ1+kPkmxrTNMd9ErrMvTcalo2FSpjxg
 HHdnzaRfquXQXtsxZbd0cRvMzvPMOGXfTNJIZgkSJMemdxA9KbIBtoC9h92pRfj2e6HN
 nrutOEtTvX18KqLHQ7tNdiBgP+UXb4/ioqFNd4ymHy2NXIrV71+5k7u/jaKlxY0Dig31
 /zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765340803; x=1765945603;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tk/No+Mm3I+u10bIGMU4QecHhYZtSqoq4vJuDZr7ifY=;
 b=VKm6b4grfNEdPT7+RsaDLL7+q0HTYf9VEELsq9TIeMk/BM0TSB8lfA+JMFh4GqnbAu
 jdcsQYif0Ust4VaaxsRNemC2sndWxX+AYgar6pR2zJ2wVJ1PUMYAMyMbTbIuTlawvO+X
 xJInOAQUgYL+zMle/3VlVWK7+lr8lrRX/w81yoPpoqNPQgylHIiXEGOkWFgLya8g8wMD
 KKLWoN2gn67eAssEAuf+frKIPDO21GEHIb/ObKomRgkcgaLR3PNlHteGN+o0GpZBLoCV
 b8TnxPPJOSWvEsOidnQH9xb34b+cQaEVG+JDcvJ/RsHAKgKDMH1cnUC8JRXSV3gLfouT
 qioQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTzuMFf90Brehno3015bQTjstCTnnla8Cv2zMwInR1WFmeEugvfM9m4jCp3rG+Bsxe158PprwbQus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkafQRj6TvOWZWwXEaKt3i5jtLIMlOvHLDHKY/v0kFTj3pxslm
 EZkyIBX9a8yt3GL5yqPtFxKAQ1b90gPHIJaXBXeWwJGPgNPgmln+Ay5y
X-Gm-Gg: AY/fxX62Siornry8ZxLVTUEF06Fwx1ZqGu+V3NUmJE5fgJb/mDE/n4bTXskjDB40q4a
 JFwPPBpYI8n+TYAcBm1w5DJr9cEzAe/s2HaoIp7qSys2LqIOKCYjyfDUXxPiwP0MSATQUFqfLt6
 YCfo7t0Cdq8kDdYh8J69I/e9kUIb+c3VWQKG0JFwWSnwqF53Lxn9MndZcMJ269RGSzmGWmhnc4F
 lcwYyKxs/Yx5ypnlz4vVOXO2ChDZjNpAX0YwoL2gF/uEbCTv/36PmN3Uu64X8KxboDsbhNJm9P0
 4fVxKLbQHUjRquMoLxB/rn5A5on7QjVb6EZvHIGZt4Ncs+g0rIaDbw3Uv8DBYurpCnyhWG8CADm
 ML2Ivaayzp2R1bAM5mOLQvF4o09Etyf4AkgVi9919kM8YvqBuj2a17G9265990ZQQTj8OgP9kvl
 k1sjaZTJ4EwFC7vb/kIxtvsXoIQhzYzX6ciSPj2Cik1ZRU7L+D5mUNo2IDTDsrX1+6E5cF4FQ=
X-Google-Smtp-Source: AGHT+IEkCPOkyg0imXvpe+yjarzV/1sk/8YYfqF82dhTlKcX5BeBSLcY5y7rsJgrq/q2KnhrIhD0uw==
X-Received: by 2002:a17:90b:5252:b0:343:684c:f8ad with SMTP id
 98e67ed59e1d1-34a72808b72mr1162287a91.4.1765340802654; 
 Tue, 09 Dec 2025 20:26:42 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:b90d:2938:bd7a:289f?
 ([2601:1c0:5780:9200:b90d:2938:bd7a:289f])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34a70926cd8sm971106a91.12.2025.12.09.20.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 20:26:42 -0800 (PST)
Message-ID: <d71e2795-f918-482b-af0e-18376f8ca835@gmail.com>
Date: Tue, 9 Dec 2025 20:26:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] fbdev: Guard sysfs interfaces under CONFIG_FB_DEVICE
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy@kernel.org, gregkh@linuxfoundation.org
References: <20251209042744.7875-1-chintanlike@gmail.com>
 <19e8a1b0-75e3-4c8d-911a-15fd70f60bea@suse.de>
 <f5d50007-5b48-47cb-8133-72fca274d562@gmx.de>
 <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAHp75Vds8GP+daMe9WcEbOaNT91kMHUjidzGUN-1_kVDuWBtLw@mail.gmail.com>
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



On 12/9/25 06:25, Andy Shevchenko wrote:
> On Tue, Dec 9, 2025 at 10:23 AM Helge Deller <deller@gmx.de> wrote:
>> On 12/9/25 08:27, Thomas Zimmermann wrote:
> 
> ...
> 
>> This whole series adds a whole lot of ifdef'ery, which I think is the
>> worst approach. It makes the code less readable and leads to two code
>> paths, which may trigger different build errors depending on the config.
>>
>> I'm sure it must be possible to do the same without adding more #ifdefs,
>> e.g. by introducing a function like   dev_of_fbinfo(fbinfo)  which
>> simply returns NULL for the FB_DEVICE=n case.  Then, that value can be tested
>> like
>>          if (dev_of_fbinfo(fbinfo))
>>                  {...do-the-things...}
>> For the FB_DEVICE=n case this will then be optimized out by the compiler,
>> while you still have full compiler syntax checking.
>>
>> Thoughts?
> 
> I second you. I am also not a fan of ifdeffery when it can be avoided.
> 

Thank you for the review! Will do the change.
