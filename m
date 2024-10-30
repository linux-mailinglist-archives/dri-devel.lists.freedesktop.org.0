Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CB9B8037
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 17:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4537710E419;
	Thu, 31 Oct 2024 16:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.b="R7+6/lBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABBC10E802
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 21:06:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso2286285e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mandelbit.com; s=google; t=1730322381; x=1730927181;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WX13tTCFxcXE+Bigy7FSQVXRGX8nHmGzv+k+UrLYlGM=;
 b=R7+6/lBXgtyv7s188WaG3uIv6OJi2c32H2xFcBmhUJv+pNGSwxnQV/0nrGj8IHWFZd
 0qzuKp2coAlb691X0VCxhOYXJ5iSKAmQtqAe+vsm8FLAanopJTnn/5xno3opAq/cBYD4
 EFu06SXEGvXs08yEr7NV0CKIFi+STG+0u/t7rFSc4U32e3HqPDcqt4nO8JWtf/fgT/Vk
 eXxNLzpwDrm2TYE5oTyoWKLnYe7l1kHEI8Jp3TQtjXgwWikZjSzJ54KkTrrUCLdi/kmY
 iLDtVNMYgmHZGreF1dr9J5g/MWoNSrX3r2XjmRuoVwkWEQfqoc2ClUnU68PDtdbNn0EF
 dhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730322381; x=1730927181;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WX13tTCFxcXE+Bigy7FSQVXRGX8nHmGzv+k+UrLYlGM=;
 b=DM32fiO0HASAbjcmyBooWq/JqeeskXLG45PpQmE5HYUQ32fEdd7bLWm+h6UAKtedMx
 ErakC1VRk/O6AR+g0foYwtoMZvyw0k6QwcmscjtCg4WLVAnrAXOqp0qK9gQ+xsaD1Vg8
 0xMkeWVSqpzCobMmOjg+MCf2dHbHPxGOxWMPwcK0Uz0CcGHQpotudRpANXT+Ykh67TM7
 V+ku5w2BURxrj6vgmCEA3VEcd/pCSMTjFoqBxauq2jkUFmpQBD7HZvewhNkmMtb7vs4U
 rp31A87QX85nVA+u082focK7ZnY/5CRtR96pKc0C5J7Szv99dD6QYjb95yjfDj3kZZlW
 Q2jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhmIzwDnyy8wmXxA2dJgD54PTOmYYTTdL//6iS4Q2W5UVi8fJC2lRcjQa0FqYt84fSkDYrkMF6zwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSrzVVjRx98ODxa2RlpXYFGF6OY1E9hvDvkD5escgHdhBcrlyF
 qGJOYAGCOurC+sdBqrLwUa3n3lwi9EtJczHTkmbovfwP+XyKgfC8vdAXeJ8Kf5Y=
X-Google-Smtp-Source: AGHT+IEmRLg8vDwm8bvvWC4LzQD/IrqRTvL1uEFXrn1aTaS1CETYsodSWhWZCzXSPY48jWLGbb4qnQ==
X-Received: by 2002:a05:600c:1d22:b0:42f:7ed4:4c25 with SMTP id
 5b1f17b1804b1-4319acb1739mr151563065e9.14.1730322380555; 
 Wed, 30 Oct 2024 14:06:20 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:3ca3:4955:91d7:e8e1?
 ([2001:67c:2fbc:1:3ca3:4955:91d7:e8e1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca704sm32285475e9.41.2024.10.30.14.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 14:06:20 -0700 (PDT)
Message-ID: <77ba52f4-dcdc-4fdd-97b7-0163e54e8836@mandelbit.com>
Date: Wed, 30 Oct 2024 22:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: prevent NULL pointer dereference if ATIF is not
 supported
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241029233232.27692-1-antonio@mandelbit.com>
 <08add1ec-ceae-4f74-83b0-72d0df510950@amd.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@mandelbit.com>
Autocrypt: addr=antonio@mandelbit.com; keydata=
 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
Organization: Mandelbit SRL
In-Reply-To: <08add1ec-ceae-4f74-83b0-72d0df510950@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 31 Oct 2024 16:35:40 +0000
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

Hi Mario,

On 30/10/2024 02:41, Mario Limonciello wrote:
> On 10/29/2024 18:32, Antonio Quartulli wrote:
>> acpi_evaluate_object() may return AE_NOT_FOUND (failure), which
>> would result in dereferencing buffer.pointer (obj) while being NULL.
>>
>> Bail out also when status is AE_NOT_FOUND with a proper error message.
>>
>> This fixes 1 FORWARD_NULL issue reported by Coverity
>> Report: CID 1600951:  Null pointer dereferences  (FORWARD_NULL)
>>
>> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
> 
> I'm not really sure how realistic this failure is.  Can you share the 
> full call trace that Coverity identified?

I just checked Coverity Scan and it only says:

	5. Condition status, taking true branch.
	6. Condition status != 5U /* (acpi_status)(5 | 0) */, taking false branch.

The above points are related to:

	if (ACPI_FAILURE(status) && status != AE_NOT_FOUND)

It doesn't show how acpi_evaluate_object() is expected to return 
AE_NOT_FOUND.

This said, if you think this case is unrealistic, why do you check for 
"status != AE_NOT_FOUND" at all?

At this point maybe it would make more sense to simply drop this check 
and always bail out with the current error message.

Basically a patch with the following only:

-       /* Fail if calling the method fails and ATIF is supported */
-       if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
+       /* Fail if calling the method fails */
+       if (ACPI_FAILURE(status)) {

This way we don't make a fuzz for a possibly unrealistic case, while 
still protecting against bugs and null-dereferences.


Regards,

> 
> amdgpu_atif_pci_probe_handle() will check whether the handle is 
> available in the first place.  We'll never this this far if that failed.
> 
> Because of that I don't follow how this could return AE_NOT_FOUND.
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_acpi.c
>> index cce85389427f..f10c3261a4ab 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> @@ -172,10 +172,13 @@ static union acpi_object 
>> *amdgpu_atif_call(struct amdgpu_atif *atif,
>>                         &buffer);
>>       obj = (union acpi_object *)buffer.pointer;
>> -    /* Fail if calling the method fails and ATIF is supported */
>> -    if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
>> -        DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
>> -                 acpi_format_exception(status));
>> +    /* Fail if calling the method fails */
>> +    if (ACPI_FAILURE(status)) {
>> +        if (status != AE_NOT_FOUND)
>> +            DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
>> +                     acpi_format_exception(status));
>> +        else
>> +            DRM_DEBUG_DRIVER("ATIF not supported\n");
>>           kfree(obj);
>>           return NULL;
>>       }
> 

-- 
Antonio Quartulli

CEO and Co-Founder
Mandelbit Srl
https://www.mandelbit.com

