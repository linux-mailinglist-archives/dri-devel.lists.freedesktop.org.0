Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8BC95020
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 14:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BD910E26D;
	Sun, 30 Nov 2025 13:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KGBmiUQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C5410E267
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 13:48:10 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-94863b3620cso126212139f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 05:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764510489; x=1765115289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eiQ3eFN12BMemKB9ngyDX/zYtCqwPFyCoway1CJnXQo=;
 b=KGBmiUQ7RThdWebxJtTti8LVZ6Xqg8KnV16X4ZVtql68qgwo/hAutGnOr9p433uaiV
 +v5Gn3cyR0Fp8t9Ro0YYKtETOI35pGj1nV16q0wnm/ICLNlve3qfqjIE4M9xCd6QJCCf
 IJ2eSBa5udTE/ymEhEuHtBdCvHRr6lWXeOe19HXRfRQ3O7dowtdkAplyUJqD1w2ep/pd
 4MHCGFONpDgWBKkhHk0wRkRLx6/MsKoH0l4Un27BZGYkr5aeWPA+YY8uvquFWQhkshkL
 lHDS1KgF/f0jdgczcTvxgY3jV86Sz98z0O4ZQ1IdW2aV9LQG5rINPk4EUi7a6f3EK8FH
 OEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764510489; x=1765115289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eiQ3eFN12BMemKB9ngyDX/zYtCqwPFyCoway1CJnXQo=;
 b=ndoUfnOKmP1dQ5VlmgNi4eE7avIt/7DwYy9IslmSp+fZOnpGRZJRvxqBOpWmhf93dJ
 GxOVV5J0VEMG7kyQs8RrXw8gzbZ9w+sF2x/MPOmxPPhoRqqpV+t2kH0rXKcZw2RaX2a6
 cZO/sr3/jbbj2L2fyNX3ECFZNOqVHHr6q0MgbnVD4GJFsEtEfs/uLeidgU3Zw2Jy6+wx
 zHhIgbkPy66b0MXKl2uwC9lzk5uKg35gZiOw9l0a6bIRVncYVNtt8XNCh/OXJl8YFlzG
 Ewnh8o1gvqbhU3HTkvD8Ek4lYFy6K6UywnY7VZpw4tJs8pNlYhl70x71PCl55wiMKPa8
 WHpg==
X-Gm-Message-State: AOJu0YwIV7AO1cXpEdE6cj52gFA+U+cNaXJjHt4Wcr8K2KytRhKVZMDE
 ut93FR/52l3lSXBvQfzRYjlPCOatpnnOxigWSAsNcguH3zLsLEzpZjbV
X-Gm-Gg: ASbGnctoLXobdZ2SqaVh7s9+0Uq8NOUB/LL28qyd2EuljCUPNqtQk723D6s2xIK9xbP
 lIMgxpgqGiZp0tiF4cBCKkrvv96pd3x3zGejxWNV0dsvrUcYgsVXcB/OWPCQv27CBKYjHz7AvGu
 BDJC6qCiVfNE2NVX9EyVil/1Yh1ClD88Kk2Jij2RyLf3+Yj6tRbqDlWVQiRtdCoOp5YGKz8fTa2
 q1qSavwenbnyYBlhREK7nBZngV/volsL6syLdFI2ET372tCDSU6KSEVdIF7mnOYBPpxl4pQg3Xs
 juOEh/ik5XIXLAHRs7AFNCRbdp+PfSNA/2NLgxIwLWw6HpNMaGSqAlk6qlwgHy+uHbAbGlaQWWz
 rabpHF908fAoYF/miQyhhQnqkwF4Jus77zIuCWoPtyJ+1oBN9CD7XALc3t2QhU7uHOUqc7e7Wue
 SSRQdv+4rKhQ7JGeLCsyiDVFyn
X-Google-Smtp-Source: AGHT+IHoHXUfTkF+vaS1pnIVRKSps09fJdophVLtTYQOKUkmnHvUYngKhUIxBBlieYeLEpnP+wV2vA==
X-Received: by 2002:a05:6638:8805:b0:5b7:c969:85f3 with SMTP id
 8926c6da1cb9f-5b967a01c06mr35061717173.4.1764510489137; 
 Sun, 30 Nov 2025 05:48:09 -0800 (PST)
Received: from ?IPV6:2601:40a:8000:28d9::dbf? ([2601:40a:8000:28d9::dbf])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b9bc767d6fsm4592649173.34.2025.11.30.05.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Nov 2025 05:48:08 -0800 (PST)
Message-ID: <7462992a-fdc1-44ff-9604-ca5a9feaef07@gmail.com>
Date: Sun, 30 Nov 2025 08:48:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: use static ids for ACP platform devs
To: Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 sunil.khatri@amd.com, boyuan.zhang@amd.com
References: <20250325210517.2097188-1-bradynorander@gmail.com>
 <CADnq5_MNBUY=jWbnq-gZQ_4_M_sBJGAgMD0bj2cMdnkoU9G=HA@mail.gmail.com>
 <9ab05b38-6f77-4b0b-8a1b-8314e2873047@gmail.com>
 <CADnq5_No+w+tco9j35GBM3+CYBTo018eLwWec278d3VBJHPQxw@mail.gmail.com>
Content-Language: en-US
From: Brady Norander <bradynorander@gmail.com>
In-Reply-To: <CADnq5_No+w+tco9j35GBM3+CYBTo018eLwWec278d3VBJHPQxw@mail.gmail.com>
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

On 11/10/25 14:14, Alex Deucher wrote:
> On Tue, Mar 25, 2025 at 7:11 PM Brady Norander <bradynorander@gmail.com> wrote:
>>
>> On 3/25/25 6:12 PM, Alex Deucher wrote:
>>>
>>> While you are at it, can you take a look at
>>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c and
>>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c as well?
>>>
>>> Alex
>>
>> I think it makes more sense to handle that in a separate patch as it is
>> an unrelated ip block.
> 
> Sure. Can you send a patch to fix those up as well if needed?
> 
> Alex

Sorry to nag again, but can we look into getting this patch merged? The 
ASoC patch has already been merged and it would be nice to have audio 
working on this platform.
