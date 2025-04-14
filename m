Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBCA87BF7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 11:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098210E03F;
	Mon, 14 Apr 2025 09:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f2IE+SLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194F710E03F;
 Mon, 14 Apr 2025 09:35:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso46837125e9.3; 
 Mon, 14 Apr 2025 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744623327; x=1745228127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ReQI8fCjbqB0sMWedrxivkrJnzKXv16ZXvVj7cgD7w=;
 b=f2IE+SLiZpnz1DM+pC7aDPQw9P1kbdvohZjfWc2Ew5/218kl0/ehVET92Z/bxP+ntg
 zwEagH5TF3zUXbmrH1XxMwAGZdg27GRu7DF5uNxSgCssOoKrZZsHioYD0hT6JaMDmEDs
 9igiQSYsGPHCgG0XV5/r/WkLLVP8ssxScJnOY2WTxAknv+JLDYG9mYUg/e69PRg17kBI
 Bc9EDuzAS+kHrGjlElfIN4edXT+f1TxHsvZuQ6PSc0d+jiANVv00HX7/AMUWYNP9TcG7
 NaY/WzVUOLysx7r8poha5E/h7gDwJl56MSoQSQSw3dbcEh2J/9dmOh6lsP0fT1bsXRp1
 jq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744623327; x=1745228127;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ReQI8fCjbqB0sMWedrxivkrJnzKXv16ZXvVj7cgD7w=;
 b=n1S85Oiru/rd2Uh9ELRXa7NOvecjU6nw9bc1TXeMFF1GJNHibb6HO034zSwM2jasYQ
 FNC4lehqpkpdaM/VDx5Cihl0BShG/E0ENevSL9/Dbn4WB/1Hk/askRIFDa+DpANGx3p0
 SO/UxqGzO1T01UY32GQSgHbTnwSq5IZHTH2x3cDM8hH85tDeUOLPhQbwRd0973krwATq
 0wMjsQ96npaO8VtfS6OQ0jlTtgGC/YpsHnBDKzNEq9Q/zxiztuarGwlooYu0fD1CDM0C
 8kPx+kJ5a3NixHVc9rnf6i+c+bck2eIzPxYmJV0/WBp6nDlxfh7n/cx1pkWKwmxmgzvk
 KTwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqsRFR52zdyqlIk0sXeIMUimCgWf2MvxtRuR1o8ufgZnqwawVwAE9gFXh2jreHkDYdzd54I7or@lists.freedesktop.org,
 AJvYcCXhp/xtrkoOZtU0NoypGSBl3sabEv/fFtFbivDSYVr1+DmFkK5V9mF2NhClunDX/Y/1dlypOCMvaM/F@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEa/9WPifuRfcQnA28VBIGqGl1kHwhn6zmKqP16QgEP2hldDVF
 em/3Vf8J5OSYqdLf1bDJP9SE+erYoPlR37xhwBg4xt2hLyyQvbyt
X-Gm-Gg: ASbGncuIFBcMIe6J8ZJ9HsKZjRt0kK5UBMpGuU5Z8c1XROKjFVU3JHqAASzpHgVXj40
 jSVNN2XMpZZN4rraqbKm0YCMbNOL0Q+iYneqO4t4uU/XIe7iKhUQAnhZYTfP0E0/caIzNdfFxWN
 x3w4LTXtKEEcjznvj3ilnx8ZtUGtqWHNcvMNuA/CMwlIVSZCKoQQIw9aDiX8MInhlwSi41nPm31
 rrAl4O6wJfIDTRnbI7m6jifRHkRdeIzJPQ+k5fJQi6+3M0M+MrUzBU8mD4BgtkIjgZWcDCvu4pp
 ZyaGF3b0Z3eCXUxoDVPgllmDZQ6KIAIYGUT6JIVEXqwQJhSfiAs8zl+RlyUP32n9U0mN2A==
X-Google-Smtp-Source: AGHT+IFiIGr5NntN9eiv+X0gsiCw+Hdtz7/Xb6Uz5r7mI+EQClj1RzPK0mSFcrdIvisSut9yt1ZlrA==
X-Received: by 2002:a7b:c047:0:b0:43c:ec97:75db with SMTP id
 5b1f17b1804b1-43f41fffc3amr55868505e9.11.1744623327064; 
 Mon, 14 Apr 2025 02:35:27 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338db0dsm175261215e9.7.2025.04.14.02.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 02:35:26 -0700 (PDT)
Message-ID: <44f0bf71-c689-46de-bfdc-e4a24b9fb921@gmail.com>
Date: Mon, 14 Apr 2025 11:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: Fedor Pchelkin <pchelkin@ispras.ru>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Denis Arefev <arefev@swemel.ru>, Alex Deucher <alexander.deucher@amd.com>,
 Simona Vetter <simona@ffwll.ch>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>
References: <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com>
 <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com>
 <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com>
 <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
 <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
 <b7286f30-15ac-4803-b204-0fe6f2423f73@amd.com>
 <fgd6hrllcwj2guhr4mwzfblhausluczprlbjqhsqiqeshoq2g2@jgi4rgufn6wx>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <fgd6hrllcwj2guhr4mwzfblhausluczprlbjqhsqiqeshoq2g2@jgi4rgufn6wx>
Content-Type: text/plain; charset=UTF-8
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

Am 13.04.25 um 13:31 schrieb Fedor Pchelkin:
> On Thu, 10. Apr 11:07, Christian König wrote:
>> Am 09.04.25 um 19:27 schrieb Linus Torvalds:
>>> The VM layer allows larger allocations. But the "this is a simple
>>> allocation, choose kmalloc or vmalloc automatically based on size"
>>> helper says "you are being simple, I'm going to check your arguments
>>> are actually sane".
>>>
>>> So the drm code can easily have a function that validates the input
>>> for your specific cases, and then you (a) don't need the helper
>>> function that does the overflow protection and (b) don't want it.
>>>
>>> But it should actually validate arguments for real sanity at that
>>> point. Not just open-code kvmalloc() without the sanity check.
>> Yeah, exactly that has been proposed by driver maintainers before and we just rejected it on the subsystem maintainers level.
>>
>> For this particular use case here I will propose some hopefully high enough hard coded limit, but I can't guarantee that this will work for all use cases.
> FWIW, the current code anyway has this limit being some sort of 4Gb, not
> more.
>
> The resulting calculation of `bytes` wraps at 32 bits albeit itself being
> of type *unsigned long*.

Yeah that is a *much* more serious bug. Thanks for pointing that out.

This should probably be using size_t here and applying the limit to the bo_number before the calculation.

And a bo_info_size which doesn't match the expected size should be rejected and not worked around like it currently is.

Thanks,
Christian.

>
> 	/* copy the handle array from userspace to a kernel buffer */
> 	r = -EFAULT;
> 	if (likely(info_size == in->bo_info_size)) {
> 		unsigned long bytes = in->bo_number *
> 			in->bo_info_size;
>
> 		if (copy_from_user(info, uptr, bytes))
> 			goto error_free;
>

