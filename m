Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F20990A30
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 19:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF45A10EA4E;
	Fri,  4 Oct 2024 17:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O/MMSUcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FBF10EA4F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 17:33:52 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-82aac438539so104183939f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1728063232; x=1728668032;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AgjqbFQ8hXrOjTXuOvQSjPVxsFmi6mOfY4A+dK7+CZQ=;
 b=O/MMSUcWSF5tkAvP5FhZ4BgHknUUnkMhLISDjxkS5w5xOK02w3/dplc2W5AE+Q6vyY
 EhANvktAd/IIG+QSTpsbD7AloB2bGbou2PPlDAcWX6EAMoMPCnoUYifIIMb672r5k4Dy
 xA9THu/ULKKBgFIbaPdF3pUMCzmOdVPbScz+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728063232; x=1728668032;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AgjqbFQ8hXrOjTXuOvQSjPVxsFmi6mOfY4A+dK7+CZQ=;
 b=j6peH/28G9VFnx0hMKdUx4FeK9Dszj5DUl/aQMscQKjJFwDVMSEbTDdmwsi8eJhNB9
 BEXbF0hvNmtcQqFUMCw+MbvYjZeJyMhonRel7NqCbLBdSanuCaw6MtKNriHomrVDKD8O
 vWKMI1UD9OWTaFIENhLHb408L/3W2n6v5xXe1zwX4qYTl4YvoG+nXgAfCMTnEX5aZxet
 xsqkY8EKg8JpFGZ1ZV4keHuGWoEjScTqIRnG0TBrZmNEEhb8UqDuV/fhV38iDtN0sgvH
 jlhwTIYlk3a+ENDB5J6hthqCeGNRzcTUpZrvNGjA+tY4f8nbeeD5vIW6P5FNURXlL+YZ
 r4rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaLSFcUC1DXyPEAGk9oxd0gitCB0QG9YMpAE3CE4cx0ucO+1tZSqp1AegkZ0wq4Z/fCvSi2MvW4wQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq9w0U/nMjr0iLqEh5xu8FfvdGr9MYfXBKE1VkjVa/DFYTotDz
 9JUi+X6Gq5HC41maEA/L83DocQcHrlZ3l41LI5Lfh/9FIEha3MEMrzKUs8EzFGM=
X-Google-Smtp-Source: AGHT+IFWtN+nePXXWQrjbLcWtHgnNNN+hX6zEwqzI13DzO7+hHBsT7GAMCn6f/EhVXGV2DP3eQ9Jew==
X-Received: by 2002:a05:6602:3f93:b0:82c:fa71:2326 with SMTP id
 ca18e2360f4ac-834f7cfb296mr299279739f.8.1728063231607; 
 Fri, 04 Oct 2024 10:33:51 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503b154b5sm4227339f.43.2024.10.04.10.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 10:33:51 -0700 (PDT)
Message-ID: <7e1d5d2d-1b6d-4232-8d1b-6523849708b5@linuxfoundation.org>
Date: Fri, 4 Oct 2024 11:33:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: "Sundararaju, Sathishkumar" <sasundar@amd.com>,
 Advait Dhamorikar <advaitdhamorikar@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, leo.liu@amd.com, sathishkumar.sundararaju@amd.com,
 saleemkhan.jamadar@amd.com, Veerabadhran.Gopalakrishnan@amd.com,
 sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anupnewsmail@gmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241004081618.27599-1-advaitdhamorikar@gmail.com>
 <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <00761132-75f3-41fd-b571-30b0cbe5565d@amd.com>
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

On 10/4/24 03:15, Sundararaju, Sathishkumar wrote:
> 
> All occurrences of this error fix should have been together in a single patch both in _get and _set callbacks corresponding to f0b19b84d391, please avoid separate patch for each occurrence.
> 
> Sorry Alex, I missed to note this yesterday.
> 
> 
> Regards,
> Sathish

Sathish,

Please don't post on top when responding to kernel emails
and patches. It makes it difficult to follow the discussions

> 
> 
> On 10/4/2024 1:46 PM, Advait Dhamorikar wrote:
>> Fix shift-count-overflow when creating mask.
>> The expression's value may not be what the
>> programmer intended, because the expression is
>> evaluated using a narrower integer type.
>>
>> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
>> Signed-off-by: Advait Dhamorikar<advaitdhamorikar@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> index 95e2796919fc..7df402c45f40 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
>> @@ -388,7 +388,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_get(void *data, u64 *val)
>>   		for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>>   			ring = &adev->jpeg.inst[i].ring_dec[j];
>>   			if (ring->sched.ready)
>> -				mask |= 1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>> +				mask |= (u64)1 << ((i * adev->jpeg.num_jpeg_rings) + j);
>>   		}
>>   	}
>>   	*val = mask;

thanks,
-- Shuah
