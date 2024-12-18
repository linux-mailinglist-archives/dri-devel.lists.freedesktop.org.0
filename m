Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AE69F5BF0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 01:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3084210E148;
	Wed, 18 Dec 2024 00:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D2OOyrro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335C610E148;
 Wed, 18 Dec 2024 00:58:24 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2167141dfa1so2223535ad.1; 
 Tue, 17 Dec 2024 16:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734483504; x=1735088304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EfBvshGIgI6H6oqesdN6j1BTdra0NtGVRlFJMwaLpRc=;
 b=D2OOyrrocG6DDXhLQa6j7VgKv83taGBqgn59a7aU7LeSjBwC8/8PuNdYzqPKR/RObM
 GsLYh+wYhJvR8WaCSJkHKw1tzYpLaORqiA50E5bWMZVrvQEodfhICrM4SygZf3CmPcLn
 n9kJe0IDXRm8XfaHpSP/lwr7cDQZ3SIZhUAOI8eeuNVohfJ7y7/IXSmbe7Xfbwas+/9X
 Pe0p0EJWErn07z97kVN4ppdvC11QQ7Nq4kX6p/9rcJdWZh7ZO2LGq1ej++V1M9AhYn8g
 SuC60yLUq2VAZNaZMQ3/xBM7DVeSd09wpgGTsDOYkLiTWZovr4m+uKSEHifBTgGwBMyF
 UM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734483504; x=1735088304;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfBvshGIgI6H6oqesdN6j1BTdra0NtGVRlFJMwaLpRc=;
 b=l+9JtlgR9b0xTDLRfc5TFQFhRxX3yVcKOJz8y122XKdNJV1examzNi6cPbhEGSr1yJ
 z7sdNWhqRDes+cmwY7dRkaSekQeMDgsrwSsmWI0ZXRVYXt2Txr2ZXhLz4DrFNnktfhv4
 w3Zinlpx9sDVOIfZbvqdNsPc8E2de78S3toVc9IkpVYCyyqzccZCnpmX4ewnWev6Yzqg
 8i6xhEaxY4b6H0a8CKvUqMXHJAzMhhhbM/Y7tOdN/ZxJ/WBDa46L+oadq5Ptfp4p4XRa
 mdGGtDRrLpUd23mle6jnfOTGkwXtnAnGCfiLadZy5TtnTQu3wQNzH2+CwcO4a420v/Zn
 oR/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU46/ArFNMnts90nesThQejPer7eZOdXep0djy3GQY0/eiAuXMQ65/WAiWKX3V5pOKHiWfUhZuT@lists.freedesktop.org,
 AJvYcCXI4KnjkLwwzzZ6KpcbxgOVkqJH+yONdddS9pqa40UbwEhMGYHd2DR+j45GfvIdKa+IEeyLGpyiKoR9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjFVn2jyoAUf/sMRoWaj0DN5sBuB4rY1/qR1L49KFwpW8Jdh2W
 f4eUuuzmiYVh6kjrjPLOXQLDwXkrQ5du8r9q5WQq/cgKV8OJIkx6+QG4lA==
X-Gm-Gg: ASbGncv5RFk+HWm2GZ4utOC2obM3wuHQGFzc12fiTINUlzav0JtpV9fwRLZDD3ArnE6
 9snvs86v8CD5y3qLu3xPRhxWniaab2Yd5uhMQQle6OKTlrlJuH0ExmO/99WGwFJjHIUg5egiWBF
 6ynVqimGhyxitVxet0F9TZhUJqb0mfKrdfKb0UtuNnSBWJ247lCTdl5drjE7lIm0aHtMzk72rNA
 c1xpQQjhZAsdcxZkfKQdn84rf+eRCsWeRTJkkS3LX7OBSkhOP/QgvaJKeYMMpTqVxhEp1ZEjiPv
 JQicJFKSknodo9uGkB84ydK2ptIcUw==
X-Google-Smtp-Source: AGHT+IHEYhdi7KGk/qTekImIW9C/2rhYQ3V8mRMkmV6Ii2jvKrK1Mvr/C3pHDPUaNERkuDlZ2eS+eg==
X-Received: by 2002:a17:903:32cf:b0:215:758c:52e8 with SMTP id
 d9443c01a7336-218d72940c3mr14491725ad.12.1734483503594; 
 Tue, 17 Dec 2024 16:58:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1e63896sm65301465ad.223.2024.12.17.16.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 16:58:22 -0800 (PST)
Message-ID: <20913178-9f85-4342-98bc-15ef7d1d9f3e@roeck-us.net>
Date: Tue, 17 Dec 2024 16:58:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.12 000/172] 6.12.6-rc1 review
To: Christian Heusel <christian@heusel.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
 f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, srw@sladewatkins.net,
 rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20241217170546.209657098@linuxfoundation.org>
 <6177fdae-91f3-4170-a6ee-41c46d5703a5@heusel.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <6177fdae-91f3-4170-a6ee-41c46d5703a5@heusel.eu>
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

On 12/17/24 15:43, Christian Heusel wrote:
> On 24/12/17 06:05PM, Greg Kroah-Hartman wrote:
>> This is the start of the stable review cycle for the 6.12.6 release.
>> There are 172 patches in this series, all will be posted as a response
>> to this one.  If anyone has any issues with these being applied, please
>> let me know.
>>
>> Responses should be made by Thu, 19 Dec 2024 17:05:03 +0000.
>> Anything received after that time might be too late.
> 
> Hey everyone,
> 
> when testing the 6.12.6-rc1 release candidate on my Steam Deck I have
> found that the following issue came up (once). On my laptop everything
> works fine and even though the issue below came up the device was ususal
> like always.
> 
> I added the relevant Maintainers into CC so they can judge if it's
> something serious or not. I have also added a full dmesg as an
> attachment. If anybody has idea about possible reproducers I would be
> interested in that aswell, as I only saw the issue once so far.
> 

You might hit

https://gitlab.freedesktop.org/drm/amd/-/issues/3799

Guenter

> Cheers,
> Chris
> 
> kernel: CPU: 4 UID: 0 PID: 436 Comm: kworker/u32:4 Not tainted 6.12.6-rc1-1home #1 c49ee701ad1a1a28c82c80281ff6159df069d19b
> kernel: Hardware name: Valve Jupiter/Jupiter, BIOS F7A0131 01/30/2024
> kernel: Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> kernel: RIP: 0010:check_flush_dependency+0xfc/0x120
> kernel: Code: 8b 45 18 48 8d b2 c0 00 00 00 49 89 e8 48 8d 8b c0 00 00 00 48 c7 c7 e0 a1 ae a8 c6 05 29 03 16 02 01 48 89 c2 e8 04 8e fd ff <0f> 0b e9 1f ff ff ff 80 3d 14 03 16 02 00 75 93 e9 4a ff ff ff 66
> kernel: RSP: 0018:ffffa65802707c60 EFLAGS: 00010082
> kernel: RAX: 0000000000000000 RBX: ffff958c80050800 RCX: 0000000000000027
> kernel: RDX: ffff958fb00218c8 RSI: 0000000000000001 RDI: ffff958fb00218c0
> kernel: RBP: ffffffffc0a2eb00 R08: 0000000000000000 R09: ffffa65802707ae0
> kernel: R10: ffffffffa92b54e8 R11: 0000000000000003 R12: ffff958c899b3580
> kernel: R13: ffff958c8cc71c00 R14: ffffa65802707c90 R15: 0000000000000001
> kernel: FS:  0000000000000000(0000) GS:ffff958fb0000000(0000) knlGS:0000000000000000
> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> kernel: CR2: 00007f764c0d5000 CR3: 00000001b6222000 CR4: 0000000000350ef0
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  ? check_flush_dependency+0xfc/0x120
> kernel:  ? __warn.cold+0x93/0xf6
> kernel:  ? check_flush_dependency+0xfc/0x120
> kernel:  ? report_bug+0xff/0x140
> kernel:  ? handle_bug+0x58/0x90
> kernel:  ? exc_invalid_op+0x17/0x70
> kernel:  ? asm_exc_invalid_op+0x1a/0x20
> kernel:  ? __pfx_amdgpu_device_delay_enable_gfx_off+0x10/0x10 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
> kernel:  ? check_flush_dependency+0xfc/0x120
> kernel:  __flush_work+0x110/0x2c0
> kernel:  cancel_delayed_work_sync+0x5e/0x80
> kernel:  amdgpu_gfx_off_ctrl+0xad/0x140 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
> kernel:  amdgpu_ring_alloc+0x43/0x60 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
> kernel:  amdgpu_ib_schedule+0xf0/0x730 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
> kernel:  amdgpu_job_run+0x8c/0x170 [amdgpu 857aca8165f9b9ab3793f37419bdc9a45d24aff0]
> kernel:  ? mod_delayed_work_on+0xa4/0xb0
> kernel:  drm_sched_run_job_work+0x25c/0x3f0 [gpu_sched da7f9c92395781c75e4ac0d605a4cf839a336d2f]
> kernel:  ? srso_return_thunk+0x5/0x5f
> kernel:  process_one_work+0x17e/0x330
> kernel:  worker_thread+0x2ce/0x3f0
> kernel:  ? __pfx_worker_thread+0x10/0x10
> kernel:  kthread+0xd2/0x100
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork+0x34/0x50
> kernel:  ? __pfx_kthread+0x10/0x10
> kernel:  ret_from_fork_asm+0x1a/0x30
> kernel:  </TASK>
> kernel: ---[ end trace 0000000000000000 ]---
> 

