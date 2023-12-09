Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3280BA1D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 11:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAA010E052;
	Sun, 10 Dec 2023 10:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3073710E2EB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 21:29:51 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-425a116f1cdso13974231cf.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 13:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1702157390; x=1702762190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iFEUFFz09hiRyS0qcoPsXIF6VUSImKjj5WbLQv8dS3M=;
 b=DOgd0M+z7lZ3p+pHC33D5/LzVa9MxgBn5OlFCfRKN5+u8yYTn67vi/i7oyDsNMihnF
 ljvLWezibofoV0UuL0obaCRfdzrPXXnGnlrVvBP2s4G5LhkY3qS06qx6MP14LR/B890i
 1liCKFLcDkM+oKRSlHQv0TNlrdGp7lwrjR/okmgoGfTia3R9Xs2dxhknOozq8U2OfKtX
 zgK/O67VQ2b6LEtjIWwCKQyS9NDT+z61QeZIzu/0JPzVTia08T8dmXVJ1a7OxzeK56sE
 HsYrPvfiNa+6YQBQ8iOhlzUwFGWxWJs+DUqgX/LAOMvhd//eTrX7LITGm93xnjQMSRGj
 m79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702157390; x=1702762190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iFEUFFz09hiRyS0qcoPsXIF6VUSImKjj5WbLQv8dS3M=;
 b=r9VzEyFGOGY4ccAqH7jlfwVSqGLkNF3+wSCXywkP6TV8dafqm9mzzOknMvzq1EBEDJ
 3aoFisYU1vtXqDvq9OMqlF3aPNR0OeYI8ZNnQljlXQQ1+uMScLWcnvc5xB8/WTf6IUqI
 f6uk7QPo5wbhVsuTcJR9AQnMD09QDbf0ht1ITDHWsDW0kjxYcx6GGewkTtQBXHJdrTI2
 Fd0Ns95wBV6HBkqiWf4db1/af7XcG8KSuo1v3aJy7E3IyNzin5ABZyf9EKepOOE6X2Rr
 sIIqyQxhMC2ahQJ8yTKlBXNQjq+0oOf41LMikv3qzQH3gUHZpzDY44IIN5hyehsmM92B
 ZNUg==
X-Gm-Message-State: AOJu0YxILNmZJ4QPVH8fkLN+SvRRo/mHOm0NksB/cj8Jl+rwxDZbStoP
 j8jMV/LEuM84psmXOc1Mq9rqaQ==
X-Google-Smtp-Source: AGHT+IFocs3LkyA/Jt/FCqhjxzgRz8AgbQ0brbt26sXxD73qHkqT5u0QLdYWPcmh/VTk8arvnDsjzw==
X-Received: by 2002:a05:620a:8112:b0:77f:61d3:734c with SMTP id
 os18-20020a05620a811200b0077f61d3734cmr1598295qkn.43.1702157390147; 
 Sat, 09 Dec 2023 13:29:50 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f559:1d79:8a5d:590e?
 ([2600:1700:2000:b002:f559:1d79:8a5d:590e])
 by smtp.gmail.com with ESMTPSA id
 tn24-20020a05620a3c1800b0077f052fa73bsm1662198qkn.15.2023.12.09.13.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Dec 2023 13:29:48 -0800 (PST)
Message-ID: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
Date: Sat, 9 Dec 2023 15:29:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 10 Dec 2023 10:10:19 +0000
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
Cc: llvm@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Palmer Dabbelt <palmer@dabbelt.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
> On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
>> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>>>> architectures. Enabling hardware FP requires overriding the ISA string
>>>>> for the relevant compilation units.
>>>>
>>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
>>>
>>> :(
>>>
>>>> Nathan, have you given up on these being sorted out?
>>>
>>> Does your configuration have KASAN (I don't think RISC-V supports
>>> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
>>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
>>> or KCSAN in dml2")?
>>>
>>> I am not really interested in playing whack-a-mole with these warnings
>>> like I have done in the past for the reasons I outlined here:
>>>
>>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>>
>> I also see one of these with clang 17 even with KASAN disabled:
>>
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
>> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
>> [-Wframe-larger-than]
>> void dml32_recalculate(struct display_mode_lib *mode_lib)
>>
>>      ^
>> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>>
>> So I'm in favor of just raising the limit for these files for clang, like you
>> suggested in the linked thread.
> 
> How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
> in that function? That should also avoid the build failure
> but give a better indication of where the problem is
> if someone actually runs into that function and triggers
> a runtime stack overflow.

Won't that break actual users of the driver, trading an unlikely but
theoretically possible stack overflow for a guaranteed crash? The intent of this
series is that I have one of these GPUs plugged in to a RISC-V board, and I want
to use it.

Regards,
Samuel

