Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108477CA61D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 12:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FABF10E1B6;
	Mon, 16 Oct 2023 10:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D338910E1B6;
 Mon, 16 Oct 2023 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697453763; x=1728989763;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=H5EK/1NrFbgiqg2PgWD+4Bqxa9ncCXBthHODgWpYWM8=;
 b=gUm5rCDQaGjsBwZhL41qir0JkBgaaVF+PccKOdOXEpnZWx7OJ5EaCTjJ
 308sJtcvX+wHEmu+8CrIRmHKS7+lOZnT2Etwuzf4G5W3VCsYH0ZsRiE7p
 A80NLthGd6bLvcftdQqi84iKvRMxVGOIiWffj5TynY0MKwshBxcb9kt7X
 2XV7II1Yo3zlKjDbyhC/ixGuU133GO7zToEooVR0sy39jj+y+9HttRdGF
 7jYp04y530uvAGXH+DmwlXpfmpp72M99HXH5wxwDD3FGuAQ2AiC1YErGZ
 mV2/YQwYC+ykpLtCwGJwqU4AHTQo5WTrkBU0+zFr69QnWZKuRftZTpxjM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364851992"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="364851992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 03:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3581917"
Received: from hlykke-mobl.ger.corp.intel.com (HELO [10.249.254.194])
 ([10.249.254.194])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 03:56:06 -0700
Message-ID: <b325ff2e-011b-98fd-9490-e02e21286c29@linux.intel.com>
Date: Mon, 16 Oct 2023 12:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v6 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-5-dakr@redhat.com>
 <f5a025853885bd535188516853e87383879f9dc7.camel@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f5a025853885bd535188516853e87383879f9dc7.camel@linux.intel.com>
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


On 10/13/23 15:37, Thomas Hellström wrote:
> Hi,
>
> On Mon, 2023-10-09 at 01:32 +0200, Danilo Krummrich wrote:
>> Currently the DRM GPUVM offers common infrastructure to track GPU VA
>> allocations and mappings, generically connect GPU VA mappings to
>> their
>> backing buffers and perform more complex mapping operations on the
>> GPU VA
>> space.
>>
>> However, there are more design patterns commonly used by drivers,
>> which
>> can potentially be generalized in order to make the DRM GPUVM
>> represent
>> a basis for GPU-VM implementations. In this context, this patch aims
>> at generalizing the following elements.
>>
>> 1) Provide a common dma-resv for GEM objects not being used outside
>> of
>>     this GPU-VM.
>>
>> 2) Provide tracking of external GEM objects (GEM objects which are
>>     shared with other GPU-VMs).
>>
>> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>>     GPU-VM contains mappings of.
>>
>> 4) Provide tracking of evicted GEM objects the GPU-VM contains
>> mappings
>>     of, such that validation of evicted GEM objects is accelerated.
>>
>> 5) Provide some convinience functions for common patterns.
>>
>> Big thanks to Boris Brezillon for his help to figure out locking for
>> drivers updating the GPU VA space within the fence signalling path.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c | 646
>> ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_gpuvm.h     | 246 ++++++++++++++
>>   2 files changed, 892 insertions(+)
>>
> There's a checkpatch.pl warning and a number of random macro CHECKs if
> using --strict.
>
> Also the overall s/Returns:/Return/ (and possibly function line break).
>
>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>> b/drivers/gpu/drm/drm_gpuvm.c
>> index 28282283ddaf..6977bd30eca5 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -82,6 +82,21 @@
>>    * &drm_gem_object list of &drm_gpuvm_bos for an existing instance
>> of this
>>    * particular combination. If not existent a new instance is created
>> and linked
>>    * to the &drm_gem_object.
>> + *
>> + * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm,
>> are also used
>> + * as entry for the &drm_gpuvm's lists of external and evicted
>> objects. Those
>> + * list are maintained in order to accelerate locking of dma-resv
>> locks and
> s/list/lists/
>> + * validation of evicted objects bound in a &drm_gpuvm. For
>> instance, all
>> + * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked
>> by calling
>> + * drm_gpuvm_exec_lock(). Once locked drivers can call
>> drm_gpuvm_validate() in
>> + * order to validate all evicted &drm_gem_objects. It is also
>> possible to lock
>> + * additional &drm_gem_objects by providing the corresponding
>> parameters to
>> + * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop
>> while making
>> + * use of helper functions such as drm_gpuvm_prepare_range() or
>> + * drm_gpuvm_prepare_objects().
>> + *
>> + * Every bound &drm_gem_object is treated as external object when
>> its &dma_resv
>> + * structure is different than the &drm_gpuvm's common &dma_resv
>> structure.
>>    */
>>   
>>   /**
>> @@ -429,6 +444,20 @@
>>    * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm
>> and
>>    * &drm_gem_object must be able to observe previous creations and
>> destructions
>>    * of &drm_gpuvm_bos in order to keep instances unique.
>> + *
>> + * The &drm_gpuvm's lists for keeping track of external and evicted
>> objects are
>> + * protected against concurrent insertion / removal and iteration
>> internally.
>> + *
>> + * However, drivers still need ensure to protect concurrent calls to
>> functions
>> + * iterating those lists, namely drm_gpuvm_prepare_objects() and
>> + * drm_gpuvm_validate().
>
>> + *
>> + * Alternatively, drivers can set the &DRM_GPUVM_RESV_PROTECTED flag
>> to indicate
>> + * that the corresponding &dma_resv locks are held in order to
>> protect the
>> + * lists. If &DRM_GPUVM_RESV_PROTECTED is set, internal locking is
>> disabled and
>> + * the corresponding lockdep checks are enabled. This is an
>> optimization for
>> + * drivers which are capable of taking the corresponding &dma_resv
>> locks and
>> + * hence do not require internal locking.
>>    */
>>   
>>   /**
>> @@ -641,6 +670,195 @@
>>    *     }
>>    */
>>   
>> +/**
>> + * get_next_vm_bo_from_list() - get the next vm_bo element
> macros use a different kerneldoc syntax:
> https://return42.github.io/linuxdoc/linuxdoc-howto/kernel-doc-syntax.html#macro

The syntax for macros in that page does not appear to be valid from what 
I can tell. Please ignore that.

/Thomas

