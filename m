Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434EF797126
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1E010E799;
	Thu,  7 Sep 2023 09:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B644610E08E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694077903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YnyTRR6tMkGERN8b/9+xcC7xMqnGekjmEizvTb1pzc=;
 b=BBj1fGMUPaO6++LNRIuNjuG3+J85EyfkFkhVTDZv8bK6oEvI2XUWAo04cyj3+aw5gjQ6uM
 LKe5YxNGIYnfVMc11s9ay2diPmpHXVuWsu+TasPq1U2UbtlWoZnzXNCKuLkhzeLUaDD2Z7
 DumCG9yBqBaLYrK0clkGb4/frCNfxGA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-_tRJVBzBNEuGGhRtAR5OpQ-1; Thu, 07 Sep 2023 05:11:42 -0400
X-MC-Unique: _tRJVBzBNEuGGhRtAR5OpQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9a62adedadbso44819966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 02:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077901; x=1694682701;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+YnyTRR6tMkGERN8b/9+xcC7xMqnGekjmEizvTb1pzc=;
 b=bnAfYZFbMpYiChNNkGYTDuqIXLcsJEuud3sLQdfD2hHGytXU16kLOnYNp+MMXd8eMx
 /o+w47Mg1HfIcwa8N2hkbeJnJ1xi9tB9MRSnz8yMwqrs9knRKP2r9efz/X9G3kWfdRlW
 agoxbWCaujaQjButgFYgqbcNpGid7e1uBKAUR3oUCK5y2VvEQ9T5dv8Ak/3wCKug/XIL
 G1z9xbbYfQNwI6aydgo+5m33wEQDMS6eVfGIcxdNb/seeUxtQRX+pThcMkWEZ830aMs3
 N2Nkt0BTTFmc548FKksIpzvrPHEtgi+LOMmcpX3JaGBa5URCPd9YDIu65YRo8DO09Ktc
 DpEA==
X-Gm-Message-State: AOJu0Yx99b1rUnuezVzz+cPLupWn+U14ubVVhRoDNen/NH+iJdXQf1yt
 myhdZsk8mIgcNxVPpoT/UEJ/isQ4jBMAmtM15ihOdoTJVtAZGyhQqTVjWZGIYvznintUi4Jkyhr
 tclrD4rMdbjyJwlPA4fqMVqjODbOm
X-Received: by 2002:a17:906:5a70:b0:9a1:c352:b6a5 with SMTP id
 my48-20020a1709065a7000b009a1c352b6a5mr4656300ejc.69.1694077901273; 
 Thu, 07 Sep 2023 02:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPbdeLZzS8ttk/yjs2IW+39K0hV5ihSPugQejYTnmMfrcEgSvEwCcItJyfPVPbdXGAhjaTKg==
X-Received: by 2002:a17:906:5a70:b0:9a1:c352:b6a5 with SMTP id
 my48-20020a1709065a7000b009a1c352b6a5mr4656280ejc.69.1694077900967; 
 Thu, 07 Sep 2023 02:11:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a1709064b5a00b00988be3c1d87sm10198891ejv.116.2023.09.07.02.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 02:11:40 -0700 (PDT)
Message-ID: <2a473b06-69c1-f620-7595-b119c639669b@redhat.com>
Date: Thu, 7 Sep 2023 11:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v2 5/7] drm/gpuvm: add an abstraction for a
 VM / BO combination
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-6-dakr@redhat.com>
 <20230907101630.7213c919@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230907101630.7213c919@collabora.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/7/23 10:16, Boris Brezillon wrote:
> On Wed,  6 Sep 2023 23:47:13 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> @@ -812,15 +967,20 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>>   /**
>>    * drm_gpuva_link() - link a &drm_gpuva
>>    * @va: the &drm_gpuva to link
>> + * @vm_bo: the &drm_gpuvm_bo to add the &drm_gpuva to
>>    *
>> - * This adds the given &va to the GPU VA list of the &drm_gem_object it is
>> - * associated with.
>> + * This adds the given &va to the GPU VA list of the &drm_gpuvm_bo and the
>> + * &drm_gpuvm_bo to the &drm_gem_object it is associated with.
>> + *
>> + * For every &drm_gpuva entry added to the &drm_gpuvm_bo an additional
>> + * reference of the latter is taken.
>>    *
>>    * This function expects the caller to protect the GEM's GPUVA list against
>> - * concurrent access using the GEMs dma_resv lock.
>> + * concurrent access using either the GEMs dma_resv lock or a driver specific
>> + * lock set through drm_gem_gpuva_set_lock().
>>    */
>>   void
>> -drm_gpuva_link(struct drm_gpuva *va)
>> +drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo)
>>   {
>>   	struct drm_gem_object *obj = va->gem.obj;
>>   
>> @@ -829,7 +989,10 @@ drm_gpuva_link(struct drm_gpuva *va)
>>   
>>   	drm_gem_gpuva_assert_lock_held(obj);
>>   
>> -	list_add_tail(&va->gem.entry, &obj->gpuva.list);
>> +	drm_gpuvm_bo_get(vm_bo);
> 
> Guess we should WARN if vm_obj->obj == obj, at least.
> 
>> +	list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
>> +	if (list_empty(&vm_bo->list.entry.gem))
>> +		list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuva_link);
>>   
>> @@ -840,20 +1003,40 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
>>    * This removes the given &va from the GPU VA list of the &drm_gem_object it is
>>    * associated with.
>>    *
>> + * This removes the given &va from the GPU VA list of the &drm_gpuvm_bo and
>> + * the &drm_gpuvm_bo from the &drm_gem_object it is associated with in case
>> + * this call unlinks the last &drm_gpuva from the &drm_gpuvm_bo.
>> + *
>> + * For every &drm_gpuva entry removed from the &drm_gpuvm_bo a reference of
>> + * the latter is dropped.
>> + *
>>    * This function expects the caller to protect the GEM's GPUVA list against
>> - * concurrent access using the GEMs dma_resv lock.
>> + * concurrent access using either the GEMs dma_resv lock or a driver specific
>> + * lock set through drm_gem_gpuva_set_lock().
>>    */
>>   void
>>   drm_gpuva_unlink(struct drm_gpuva *va)
>>   {
>>   	struct drm_gem_object *obj = va->gem.obj;
>> +	struct drm_gpuvm_bo *vm_bo;
>>   
>>   	if (unlikely(!obj))
>>   		return;
>>   
>>   	drm_gem_gpuva_assert_lock_held(obj);
>>   
>> +	vm_bo = __drm_gpuvm_bo_find(va->vm, obj);
> 
> Could we add a drm_gpuva::vm_bo field so we don't have to search the
> vm_bo here, and maybe drop the drm_gpuva::vm and drm_gpuva::obj fields,
> since drm_gpuvm_bo contains both the vm and the GEM object. I know that
> means adding an extra indirection + allocation for drivers that don't
> want to use drm_gpuva_[un]link(), but I wonder if it's not preferable
> over having the information duplicated (with potential mismatch)

I was considering that and I think we can add a drm_gpuva::vm_bo field and
get rid of drm_gpuva::obj. However, I think we need to keep drm_gpuva::vm,
since it is valid for ::obj to be NULL, hence it must be valid for ::vm_bo too.
Null objects are used for sparse mappings / userptr.

> 
>> +	if (WARN(!vm_bo, "GPUVA doesn't seem to be linked.\n"))
>> +		return;
>> +
>>   	list_del_init(&va->gem.entry);
>> +
>> +	/* This is the last mapping being unlinked for this GEM object, hence
>> +	 * also remove the VM_BO from the GEM's gpuva list.
>> +	 */
>> +	if (list_empty(&vm_bo->list.gpuva))
>> +		list_del_init(&vm_bo->list.entry.gem);
>> +	drm_gpuvm_bo_put(vm_bo);
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
> 

