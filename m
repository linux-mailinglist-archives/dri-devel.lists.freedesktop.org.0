Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0255AD7CF2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 23:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D110E098;
	Thu, 12 Jun 2025 21:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="R7UYCCYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648B010E194
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 21:10:03 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-235a3dd4f0dso10104415ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749762603; x=1750367403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=PexcpAOOtkiKpS0ImSN7hb8qJkrQBZztkR4qfhcbAPg=;
 b=R7UYCCYFfvCkQ/ml4js/PSnokZww2KrRGIa0ATp4DH8N9yqbDU0BhrvEODmvVY7tlH
 KMmmnZ/O2/afURIRguHteSWvIBiylv3QbEmDjo51EEm+nm6qvDW5+szJEIcUB6qxbtJQ
 mu1kyBHh6ZsVREHDiMr8Uv+UK0Msk2Sf8mhYPo6aaEPeL2dedZKDW1VgqwXL3EmuPGVW
 PzGcL2FLFD615Su53rIRWDfK1J+hgGeGlh2GkUM4zX/JFo/Tg/IVBqXDADF1oPJyoFcO
 citT1E5BdmmNNGqmiZH8Wnl1ddJjQ5wqT7K4lfq2+ECDhNFo4P0MWhsXbmeO3uW1Fnu9
 nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749762603; x=1750367403;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PexcpAOOtkiKpS0ImSN7hb8qJkrQBZztkR4qfhcbAPg=;
 b=mq9s1WOyY/M8rZTyrUa9OKjwadeS95ewVP24JxQPhkLkNCkPANCxh86OeGqCMNEsyp
 bienAyW7Tf2qLLvpioAkhotwtLrGJeNBmLf2f8QuJkkweO8BTIs58N6Yh2lTqXukHXOI
 1CHy6YvmZEKKyImTxKyGk2fisNtVwLjWqd2tRX4W9iMj6l9QOCP6S63m2QOeuHhQI/n5
 5izHc2runu1+rG8331p5ernOnNKiz1OKrLoEd/+OzzIZqGqqR/k+x63HydaxQJdsyQ1x
 cdjKyCCKZ2Rs+GRDkgtk5D6+hFntkWDNLivujTMDpQRHYofR2u0TtXpvpsxnSP1m7f4v
 2gSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrPyViBSPCFH53NZQJBUkdw8asEqytTcUo8a+TN0ao8bw/tn2kRZKCGuhN3k5xdDYshadO3VUg54M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPSnPJD76MFEhaYhafkZqrwBXgVmgwpErsbH4IFxahDLCwEVlF
 RzXMQeUe4L3nInsks6aIgD71U0yR1pVfvcLwEZM2gc8WZ6CnJdSo62wVBCBVJru2B4Q=
X-Gm-Gg: ASbGncs7EXSuA7ggOuyAFqYXLvB2hnn98HnQs6AUituxabk15FGqOVo09YMTQl46IZ6
 RU6yH93CLYXr2H4shV9Jt0BCoJbXMgsSr49TGW/vzWpx1pf0qxhSon97MBE/eCmrS/r2Qma0oaR
 ka/FT8o3UYWE34Xgf141Gc/ePCgmGfL/h7YTBRh9fi2jqKNTa2O7antbkIj7nHjVHGUjd7LWQf3
 zbHMn2Uw+2etLalYxD9RkrBVMwrwniTNdmioxp7+Op7TQOs3FEjD0Tngt/vlO5S4J2qhji+pDpF
 pmmii/Y4xw9HpNckBFqiBtRokORLiswe4ocK2CXr+38xKWpmFdb93921gLMnw3HhvxuNDBM=
X-Google-Smtp-Source: AGHT+IGL4tPRfvomS0QOENtAAhRSPdcbA0I2fW+JHeZhytSPqTuXvc5dEq7vCmd0bf7++ELPpHr/nQ==
X-Received: by 2002:a17:902:ce87:b0:231:9902:1519 with SMTP id
 d9443c01a7336-2365dc2fde1mr7281095ad.39.1749762602989; 
 Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-2365decb5f9sm1602845ad.194.2025.06.12.14.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:10:02 -0700 (PDT)
X-Google-Original-Date: Thu, 12 Jun 2025 14:09:58 PDT (-0700)
Subject: Re: [PATCH] drm/amd/pm: Avoid more large frame warnings
In-Reply-To: <c3cc254a-4018-49e1-bb6e-25b245d62f4e@amd.com>
CC: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, asad.kamal@amd.com,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lijo.lazar@amd.com
Message-ID: <mhng-9A9FE10C-6479-4B2F-8FE0-2467BB76681E@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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

On Thu, 12 Jun 2025 05:29:55 PDT (-0700), lijo.lazar@amd.com wrote:
>
>
> On 6/11/2025 10:30 AM, Lazar, Lijo wrote:
>>
>>
>> On 6/11/2025 2:51 AM, Palmer Dabbelt wrote:
>>> From: Palmer Dabbelt <palmer@dabbelt.com>
>>>
>>> 9KiB frames seem pretty big, but without this I'm getting some warnings
>>> as of 6.16-rc1
>>>
>>>       CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
>>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
>>>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>>>      2885 | }
>>>           | ^
>>>     cc1: all warnings being treated as errors
>>>
>>
>> Could you also provide your build environment details?
>>
>> With below in Makefile + gcc 11.4.0, stack frame size is 168 bytes.

I'm on GCC 12 on RISC-V (though looks like it showed up somewhere else, 
too).

>>
>> ccflags-y += -fstack-usage
>>
>> smu_v13_0_6_ppt.c:2667:16:smu_v13_0_6_get_gpu_metrics   168     static
>>
>> Thanks,
>> Lijo
>>
>
> Was able to see this issue in one of our systems. This patch fixed that
> -  https://patchwork.freedesktop.org/patch/658216/
>
> Please try and let me know if it works for your config.

Thanks, I just threw it at the tester.  I'll go post a Reviewed-by at 
https://lore.kernel.org/all/20250612122321.801690-1-lijo.lazar@amd.com/ 
if it works...

>
> Thanks,
> Lijo
>
>>> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
>>> ---
>>>  drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> index 51f1fa9789ab..9824b7f4827f 100644
>>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
>>> @@ -23,9 +23,19 @@
>>>  # Makefile for the 'smu manager' sub-component of powerplay.
>>>  # It provides the smu management services for the driver.
>>>
>>> +ifneq ($(CONFIG_FRAME_WARN),0)
>>> +    frame_warn_limit := 9216
>>> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
>>> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
>>> +    endif
>>> +endif
>>> +
>>>  SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
>>>  	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
>>>
>>>  AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
>>>
>>>  AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
>>> +
>>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
>>> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)
>>
