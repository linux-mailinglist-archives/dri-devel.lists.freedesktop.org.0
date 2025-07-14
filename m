Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C177BB037EF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3600610E409;
	Mon, 14 Jul 2025 07:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RtHEPuWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EC710E3FB;
 Mon, 14 Jul 2025 06:10:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2350fc2591dso36817295ad.1; 
 Sun, 13 Jul 2025 23:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752473439; x=1753078239; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OfFqMeZyU9HS+WHoyGh+rEgFUDR1EqSVoqNyn1ejI2E=;
 b=RtHEPuWtp9KcLoqxKxeWOlgQsQL/wyJQF7HxfRAAJLLNgljG1c/jvkdnli3ilwS2//
 SFDWGzXEmdgUJyDN8JtZCRbWxenz2J8HZGgWgJuKNlKM7PDRxLO2swF/4YcDbrbPeuy9
 UfCIU2hX2li5HgXMupxNOtFYpi3ShJCPEpbaw7gRcZRMgrGr6BxvxsAIB/vSE1nbiCWs
 VrDghWxVmvCZQ+swXnSp3gm5BEVlMWObDYZV3uaGsyX9xzs4uQqzzXC+/yf0ncIAWHiM
 7C71yNV6ib/U8LmA2h5FMg92jSGRP/PiRKb+0FTPjRuJZOYx3TPWuHJwiNBROpvsVSUp
 ztCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752473439; x=1753078239;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OfFqMeZyU9HS+WHoyGh+rEgFUDR1EqSVoqNyn1ejI2E=;
 b=gisIm1vaMrSArbdClyAJfjD9IuaSoYsfgdyJA6dseDE+SLeRA3AbJZWrruTzt2ICX4
 WCdAArdZdxV3JixD7aZjlCSjlVrVocjZuj7ipt0jotCkYbMbFPX6WvqEr4uwA8X8RYe7
 GZP+SRzFG1VMvT2cGLFs+0b9wrhzPSwCohehh+qpE+OmPne+EcnqnSZtlZ17tyfYzkPP
 ZAI69U3FZ/NSALUEJZr2Quysc3vRNPNwKKVDv8+AsHsfPkvipL6fw9W3RIaKrBZVTMYG
 lfYQ9OMxs7GtsgL7yCbX62t/C4E02lSQvwtgj3XWUxN9CXThlV+CAm/RxlatBzZ2HQQm
 P/Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU4pHyT2WMCJLzRFJDn911nnt7wFtpwylz2Z4CGtwdh175EKH9Rb6stcr1YkRsGAd4g050RobvxvU=@lists.freedesktop.org,
 AJvYcCX7D4zUaqWZ5Ys2s7NyrN/BtF3snsX+ximbF4fZBPHm/Tsk4++U+Gmvr++P9DXK8T5eYzcQWywLKg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzdswIxMqOaG0tHDR+fkzoyHSkYbDCewIZlzLhV/YdETPq7ZLU
 8sjoKcg3+hy0Tr+9sMiL/vWRn5q5zQCN1FlKOAG7irToEgqzQJNBUm3S
X-Gm-Gg: ASbGncuuYpYegFRMFT6rFP8K4IyTnBx+EJ4KmmCDhj1BYdotFZipFrt20mWYq0WCTKU
 3OwpgLONw9lOff6patr67XQjoZx3Pw2/EawLJoPyZ0ZVxatQD1+tGTvSVnWhb/dDwSlIdw9v1DG
 zyBS1JnKUNso0/75rRObLzqAxDclLYmjgKSq03XQsz7DFdGeytgTkxMJg+S2pu/Q+Nj7DQjdwbX
 ik6Unxx4BEGeKtsQGyNBDsW/a3pIKw0FCObX/VzCkV9Vv37fJh8WMH2i/3Cvc3GLBt1/ix/6gW1
 a06Fyp+aCAfOnyGA/5biDopwm/B9F2pTTxRav47FLZERIvUzNJhprnF/AjHeJPLHesLGOPG4Ieq
 oRT7WbRXJlnbWUohE5zY/H9B0FAyETKqQm8sFSyuCwT2t88rarUHIrVyqOJmjMbSMtZhE
X-Google-Smtp-Source: AGHT+IEh5rmOi9OTdgxMZ+ZYCCwxnVNNOCtSZ7HLSFh73cHwYUInliH9Wmy7ojp7o6gQDl2FOpbi5w==
X-Received: by 2002:a17:902:f606:b0:23c:6d5e:db4e with SMTP id
 d9443c01a7336-23de2f47919mr267449435ad.8.1752473438744; 
 Sun, 13 Jul 2025 23:10:38 -0700 (PDT)
Received: from ?IPV6:2001:569:514a:9100:3f23:7b0f:f6a2:1ebd?
 ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de43655fbsm83226305ad.239.2025.07.13.23.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jul 2025 23:10:38 -0700 (PDT)
Message-ID: <cda61d51-ad85-4464-a637-426b960a83c6@gmail.com>
Date: Sun, 13 Jul 2025 23:10:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: define named constants for magic numbers
To: Alexandre Courbot <acourbot@nvidia.com>, dakr@kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250713025108.9364-2-krakow20@gmail.com>
 <20250713025108.9364-4-krakow20@gmail.com>
 <DBBG6Q86XAAQ.43DPC0D210TI@nvidia.com>
Content-Language: en-US
From: Rhys Lloyd <krakow20@gmail.com>
In-Reply-To: <DBBG6Q86XAAQ.43DPC0D210TI@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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

On 7/13/25 8:11 PM, Alexandre Courbot wrote:
> On Sun Jul 13, 2025 at 11:51 AM JST, Rhys Lloyd wrote:
>> Introduce an associated constant `MIN_LEN` for each struct that checks
>> the length of the input data in its constructor against a magic number.
>>
>> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> As I mentioned in [1], I think this would be better addressed by working
> in terms of `sizeof` upon the relevant structures, after making them
> `#[repr(C)]`. It might require splitting them a bit since some contain
> other data (or we can maybe turn them into DSTs).
>
> [1] https://lore.kernel.org/rust-for-linux/DB97X8JAJFI4.3G1I8ZPC1MWLS@nvidia.com/

As far as I can tell, only one of the five structs with `MIN_LEN` have 
the same layout in-memory as they do in the `data` byte slice, that 
being `BitHeader`.  Perhaps `#[repr(packed)]` could be used for 
`PmuLookupTableEntry`, sacrificing alignment, but that is undesirable as 
it comes with its own footguns such as unaligned loads.  The other 
structs include optional values and vectors which do not have the same 
encoding when reading from the `data` byte slice as they do in memory.  
I have worked with DSTs before, but I don't recommend them for 
non-library code since they are not first-class citizens in Rust.  
Notably the fat pointer is not resized when taking a reference to the 
unsized struct field, and constructing such objects is cumbersome.  
Also, in the current version of Rust (1.88), DSTs cannot yet live 
comfortably on the stack.

This patch can be dropped if it's not valuable enough to warrant the 
change, I only made it because of your comment here: 
https://gitlab.freedesktop.org/drm/nova/-/merge_requests/4#note_2999761

