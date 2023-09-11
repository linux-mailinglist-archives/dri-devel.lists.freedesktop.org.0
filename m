Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED479AA9E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 19:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FC210E1B1;
	Mon, 11 Sep 2023 17:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE0C10E1B1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694454548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=St0OIFMZR2EddndtcFLYyMwK3Fvt2qDifveALpwjgwM=;
 b=VGLoHgPWw33wfYdLRpqsWxasKzc/GTI8n7ARtBxhM9u90Wnlr6GT5GlfT5qdFo8RS9njAj
 6yeIMEzICnpmZdiO7NWIRFFkTFyp8VfRYnnSEZ0v2qGdQ9fy2akqHDrCVjpA829TZLBFzU
 FpFffClzcmqOG95oaIfFzOxVAASTRw8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-b9xRIYWJNiSMKDebGGE9kg-1; Mon, 11 Sep 2023 13:49:07 -0400
X-MC-Unique: b9xRIYWJNiSMKDebGGE9kg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9a63d4c8afbso326322666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694454546; x=1695059346;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=St0OIFMZR2EddndtcFLYyMwK3Fvt2qDifveALpwjgwM=;
 b=c345WY9Yk9nEBSoZmF03uNSjj2Edy0Xu3SLsEHpNITcdZP/gW3aKO1PHB8n24ZnrHa
 CvKTdn29JNWSjlhDNq//74mcKq1f4Covpx58Zga1CXPJrTg6yOc4wn64LvlBnxNvXvrr
 +nHaxQLDM1MtgOeQsEHZkwyWiR6EGAYwPLoARKImxSO+/nw+LV6a0cax3JwOadcoTEdc
 QtOBbqvXqqDUMFYhWOHIMw3bVjcGMX67wWIGE1bwmsWzP7WaMf0K0dIXo5nO4SeaXsiY
 IQrxGApjppn0bOXItWiNtWVqM9dS57VHWZkP9clmjhd67jphFXSUG6MISw7t87ermxBc
 rQyA==
X-Gm-Message-State: AOJu0Yx7BzeP8K3ypUdGx7Yq6ybsuwSUr3qF4PRmGb5XHLf8AsvqLN+0
 b7EKMApk+OUhY4PjuUuw/NEVpPObp1dZXRrtvWpCkJo4GQoERuf5AEQw1pAxZE+AR8LcwjNpJLc
 oMUBeLBCy1Ry6T5PWqaMjdUBE+TEm
X-Received: by 2002:a17:906:9713:b0:9a1:be5b:f4aa with SMTP id
 k19-20020a170906971300b009a1be5bf4aamr7888323ejx.0.1694454546462; 
 Mon, 11 Sep 2023 10:49:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJT7jpbp9w+Jd4iB1jj177KBarF5tpW4Kb+y9RLOsrxNRVTCbPPhmW6pX+J4jSq1kcXfWr9Q==
X-Received: by 2002:a17:906:9713:b0:9a1:be5b:f4aa with SMTP id
 k19-20020a170906971300b009a1be5bf4aamr7888308ejx.0.1694454546201; 
 Mon, 11 Sep 2023 10:49:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a170906b11800b0099c971ba285sm5685580ejy.5.2023.09.11.10.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 10:49:05 -0700 (PDT)
Message-ID: <06bbb49d-974f-e3bb-f844-1509313066cc@redhat.com>
Date: Mon, 11 Sep 2023 19:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 5/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-6-dakr@redhat.com>
 <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 9/11/23 19:19, Thomas Hellström wrote:
> Hi, Danilo
> 
> On 9/9/23 17:31, Danilo Krummrich wrote:
>> This patch adds an abstraction layer between the drm_gpuva mappings of
>> a particular drm_gem_object and this GEM object itself. The abstraction
>> represents a combination of a drm_gem_object and drm_gpuvm. The
>> drm_gem_object holds a list of drm_gpuvm_bo structures (the structure
>> representing this abstraction), while each drm_gpuvm_bo contains list of
>> mappings of this GEM object.
>>
>> This has multiple advantages:
>>
>> 1) We can use the drm_gpuvm_bo structure to attach it to various lists
>>     of the drm_gpuvm. This is useful for tracking external and evicted
>>     objects per VM, which is introduced in subsequent patches.
>>
>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>     drm_gpuvm becomes much cheaper.
>>
>> 3) Drivers can derive and extend the structure to easily represent
>>     driver specific states of a BO for a certain GPUVM.
>>
>> The idea of this abstraction was taken from amdgpu, hence the credit for
>> this idea goes to the developers of amdgpu.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Did you consider having the drivers embed the struct drm_gpuvm_bo in their own bo definition? I figure that would mean using the gem bo's refcounting and providing a helper to call from the driver's bo release. Looks like that could potentially save a lot of code? Or is there something that won't work with that approach?

There are drm_gpuvm_ops::vm_bo_alloc and drm_gpuvm_ops::vm_bo_free callback for drivers to register for that purpose.

- Danilo

> 
> Thanks,
> 
> Thomas
> 
> 

