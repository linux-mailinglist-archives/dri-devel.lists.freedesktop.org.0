Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6CBCF5D8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 15:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505BD10E304;
	Sat, 11 Oct 2025 13:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cfrTd9G0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4EA10E304
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 13:46:33 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b3d80891c6cso601041166b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760190392; x=1760795192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V7baLPO6ldN0wytk+dLo0ZV9RZqTyWkuy/xpv05pZ3Q=;
 b=cfrTd9G0Rj/UXCtM0B1Z3x2b8iO9Jl1ddyJq3O6Ranww1sSw7I8crRYnjwY19nWmb3
 F30WLZsMMmYmql0NuDWv7N3VmEEaM89dGjmZUClARqiorWylLSk0ZwFYJ0ykPlXDFSxV
 8RzPHJ0jprdE1fZuGooJQ4et2OQFQMEO0SQ5BTrzg7flu/6ORgApkiyoQ5lJW66R5D1P
 D87nXSHIFcbdIaSYiBAtBB+mGprn164uqAXLE8+ZHFE3EcuinF7bhhdA7x5kNwxJ4vOg
 xA+85Q1YgxsvJRf/Qka40wMAYbiAUsk6DeD3ryGiORLD115HUoYkaGshdGKtkWHSs6wU
 YVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760190392; x=1760795192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V7baLPO6ldN0wytk+dLo0ZV9RZqTyWkuy/xpv05pZ3Q=;
 b=Noc/5UGfUrvctBBBDiinIaGFG66J0PdEpvT5cy4hpQS10/0By3Hi8cz7Gx0WHtbzed
 RTcxsPcRiP6LMPBl4nzXMpz50hFuYmcnZ+YUuuHKeKWpCv3oxnc0ecy8i1V6ZZ+HF6XM
 kiItkUADuJSHgDGoyt8xNp1fG7NuJUsIUKt6lMbP7ri4+Pg0VsmMDQMKvFDYn6p+Rox2
 Q6VQpzvrJyl/6Yfl0PUqo8c4SxeDfaWFG53rabNksMDWWChGGg2rtoEC4VwJb7Tqk7mt
 bwAUGCp4nbZlSxM7lpgXP8glQQRSi6UX2NtlFcBy70jh0u2cTH32A9Z/QRZelAfNnEXw
 TtHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6YXZP90NhmdOIYjOSfEhfcXY/lqmaNSQVfsqPt/J0qkwjo8G8PtkZmGuxxgkK3xt9JN4EV08TXqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyThGqcihIJw1qA4Bs3geDdOUxMI1XUeelBiLYpDRp+dnjKn3md
 vvKNpWH8aYE3PDEvmYIx7DJoLIOnVf4VTDDjDSkrW/kE9ErkRFbXirc=
X-Gm-Gg: ASbGncu8DlI3cKSq9/9VR8xzHuq3TpvxSIrHnevF2KPvaB8ZeZ+dMbBTEq0myopng5z
 xQTge86xG0ErmQI7NJ7fN6GjtAgE/uWZsll3W7oeAFgSkgR21cYTTCU8+FzRCoh9Gwl0rmgDl15
 XxyLpTgfTtKq0vUnhLix2PDvkMobg8fvLle+Aoe4AXEh8lb5w2Nhrh8Wcg0SSJrIGkYEVOs1IzB
 q7NH+XeRuAvmQn+7fT7bVDhZSOG/ch/e15V9QdWFDlU1V5F/IGhIk2W1P/kVVbpkFtsD9sU5A7M
 7P/pgDyhqhJcP5nWv+iHJVQogjNc5E6PsazGhoG6GX5YoRH4LMsC+aKZq13UAiOAyjODiF3KkYv
 0llWAERuLeZsZhzaxWW3O8j4YD67L0KhlwtOBA1t7NOUxFl6qNon84MkVVe0w8y4vfETrPtsygn
 B06zWhZgK0/Pgg6O9pd/D42uDUiYIz5xapYrnzjqk=
X-Google-Smtp-Source: AGHT+IEeOXQezqtJMQ7hsE05lMpf7I93JoBsZfK1rO+E+6ZkZi1qgfeP+uOP/QAPO7I5q02P/gEzWg==
X-Received: by 2002:a17:907:6e86:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b50bedbed80mr1895801866b.17.1760190391512; 
 Sat, 11 Oct 2025 06:46:31 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it.
 [87.19.169.144]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67d2cb1sm479786366b.34.2025.10.11.06.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Oct 2025 06:46:31 -0700 (PDT)
Message-ID: <9b074160-68ea-4c19-83a5-8beb6eeb3768@gmail.com>
Date: Sat, 11 Oct 2025 15:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
 <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <eb15cf16-f51a-4eb9-992f-158e2510184e@oss.qualcomm.com>
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

On 10/10/25 7:30 PM, Konrad Dybcio wrote:
> On 10/10/25 4:39 PM, Anna Maniscalco wrote:
>> Update last_fence in the vm-bind path instead of kernel managed path.
>>
>> last_fence is used to wait for work to finish in vm_bind contexts but not
>> used for kernel managed contexts.
>>
>> This fixes a bug where last_fence is not waited on context close leading
>> to faults as resources are freed while in use.
>>
>> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
>> ---
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> Your sign-off will be removed by git, as it appears below the '---' line
>
> Konrad

I sent a v3, thanks for pointing this out

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

