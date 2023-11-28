Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C61C7FC3F1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 20:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302D810E175;
	Tue, 28 Nov 2023 19:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EBF10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 19:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701198131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HGmHgjiL5RvZl2sLJfs3i9fXFkdmODqGYRvSernjGLI=;
 b=RcQyyHRq8Hqf/fJBqO/vyDYoae4y/l8WCiJY3mCZh0kNF49Yw+XYSrybogSORhCTRuOicg
 QZUUeo/vviokt72mkOKzI2X08oM73GEuAwTfILcWTy5I2yO96UrMJOszOJQ1XiSKlbfFo1
 r3JduxQwAW/EEvyDJmRS7IEososGXKU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-apk0fL-aNSCvMvq9x-YAsw-1; Tue, 28 Nov 2023 14:02:10 -0500
X-MC-Unique: apk0fL-aNSCvMvq9x-YAsw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a0d66bf14d9so246968166b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701198128; x=1701802928;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HGmHgjiL5RvZl2sLJfs3i9fXFkdmODqGYRvSernjGLI=;
 b=mkPvXiYPh61+xaWwNurUf7Fhj1ua2E01Mb65harSEfNlnJzG3TaZV0gwViXpp7MF+k
 a76KW4UaWRCbfIIS13EbmYIgJBb5l6XpFxTvmAOTG6WDvs53p0bQ3Njkf4XyTFvf0s+0
 Fy5GEMM6jNG+Fs97VXrkaJLFCCxN7r2pSSOtvMDB10qSl1Ro8JNdIDFqrA1HM8e1QAg7
 Bx/ToxrKlGY2NGpo+soGv8jU94/3NMATjsBJEEmpIZc9sWoBsE0r2X4FFX7EHfSBwHup
 olKsffPEJ36MQIlVCv6QKg8U3Sv+mMwu1VGtnjIg1C1CFElHTRtawZlAco6EwJwvuzX6
 3ebA==
X-Gm-Message-State: AOJu0Yw99SWGz+Gm+AyV1rt6fUb0DDamkY7CEMLopDTiolbPbSerruv4
 AXqNwlEq2WTtp5n4pmYafTJUBrARGnr2bAz4C+N9u7iqlSuyOrDusPqIuVwCuCdWHIqWq+HP/r6
 96UVDYA3MmCgTnOpDFWZXl2Pi7BX4RnPp5C9i
X-Received: by 2002:a17:906:1d0c:b0:9e5:2c35:50e9 with SMTP id
 n12-20020a1709061d0c00b009e52c3550e9mr8404034ejh.77.1701198128177; 
 Tue, 28 Nov 2023 11:02:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUj8kifnKaxa05P8mGD82jKPO4N0l1GehEfH6yvVc7CQFKp1485CXWi/ZGS5bkOo8AJKnYvg==
X-Received: by 2002:a17:906:1d0c:b0:9e5:2c35:50e9 with SMTP id
 n12-20020a1709061d0c00b009e52c3550e9mr8404017ejh.77.1701198127854; 
 Tue, 28 Nov 2023 11:02:07 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a170906b20400b009ddaf5ebb6fsm7148515ejz.177.2023.11.28.11.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 11:02:07 -0800 (PST)
Message-ID: <40603849-a23b-4098-b0a9-284622d931fb@redhat.com>
Date: Tue, 28 Nov 2023 20:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [PATCH drm-misc-next 5/5] drm/imagination: vm: make
 use of GPUVM's drm_exec helper
To: Donald Robson <Donald.Robson@imgtec.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, Frank Binns <Frank.Binns@imgtec.com>,
 Matt Coster <Matt.Coster@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-6-dakr@redhat.com>
 <3582c630ee753db6ef1370612e69f36287536912.camel@imgtec.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <3582c630ee753db6ef1370612e69f36287536912.camel@imgtec.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/23 11:47, Donald Robson wrote:
> Hi Danilo,
> 
> Apologies - I guess I should have submitted a patch to handle zero fences in your
> locking functions with the final patch series.
> 
> On Sat, 2023-11-25 at 00:36 +0100, Danilo Krummrich wrote:
>> *** CAUTION: This email originates from a source not known to Imagination Technologies. Think before you click a link or open an attachment ***
>>
>> Make use of GPUVM's drm_exec helper functions preventing direct access
>> to GPUVM internal data structures, such as the external object list.
>>
>> This is especially important to ensure following the locking rules
>> around the GPUVM external object list.
>>
>> Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/imagination/pvr_vm.c | 16 +++++-----------
>>   1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
>> index e0d74d9a6190..3f7888f5cc53 100644
>> --- a/drivers/gpu/drm/imagination/pvr_vm.c
>> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
>> @@ -337,27 +337,21 @@ static int
>>   pvr_vm_bind_op_lock_resvs(struct drm_exec *exec, struct pvr_vm_bind_op *bind_op)
>>   {
>>   	drm_exec_until_all_locked(exec) {
>> -		struct drm_gem_object *r_obj = &bind_op->vm_ctx->dummy_gem;
>>   		struct drm_gpuvm *gpuvm = &bind_op->vm_ctx->gpuvm_mgr;
>>   		struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
>> -		struct drm_gpuvm_bo *gpuvm_bo;
>>   
>>   		/* Acquire lock on the vm_context's reserve object. */
>> -		int err = drm_exec_lock_obj(exec, r_obj);
>> +		int err = drm_gpuvm_prepare_vm(gpuvm, exec, 0);
>>   
>>   		drm_exec_retry_on_contention(exec);
>>   		if (err)
>>   			return err;
>>   
>>   		/* Acquire lock on all BOs in the context. */
>> -		list_for_each_entry(gpuvm_bo, &gpuvm->extobj.list,
>> -				    list.entry.extobj) {
>> -			err = drm_exec_lock_obj(exec, gpuvm_bo->obj);
>> -
>> -			drm_exec_retry_on_contention(exec);
>> -			if (err)
>> -				return err;
>> -		}
>> +		err = drm_gpuvm_prepare_objects(gpuvm, exec, 0);
>> +		drm_exec_retry_on_contention(exec);
>> +		if (err)
>> +			return err;
> 
> Before I discovered the problem when not reserving fences, I was trying to use
> drm_gpuvm_exec_lock() with vm_exec->extra.fn() for the part below.  Is there
> a reason not to do that now?

No, that works - gonna change that.

- Danilo

> 
> Many thanks,
> Donald
> 
>>   
>>   		/* Unmap operations don't have an object to lock. */
>>   		if (!pvr_obj)

