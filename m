Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD47A25CD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486C410E66E;
	Fri, 15 Sep 2023 18:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BFD10E021;
 Fri, 15 Sep 2023 18:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694802718; x=1726338718;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j58zNPJRrigHIdyHdXY008rH6ymZ+hM8ZO+Wz3ozsts=;
 b=YQkfKvQYeFmAQu1w1C2zi1izq5schZtJWAm41JHZmnzH//CnEJf7VaoV
 wSFxQ8allDC4Ph+QJAJQ6rJxkdjKt1m6sc6NxL2etUH+asZexw5lXk5UV
 fKqYrC1Z3PFs8J7IAbnafUWajIc1NbzfOrabivesM7qzjdchW6r2rSb1H
 X6G9Y2fuh90Hx+scQmNjBWuAyCHGmqgFjwOOw/Q6FBzy7liDHcT3WUj7a
 HuXHBrDvHNt4WOcWR2Om5L58pMmIhE7ckQRCGUOTegVKHJiFWyxxc6oHX
 U+TaAYg2RTDLXFeFXUO5+BaD2DPXr8Wyvh9f2+bYfMJgfKXtjvPntUmf7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445789407"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445789407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="991950051"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="991950051"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO [10.249.254.223])
 ([10.249.254.223])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:31:55 -0700
Message-ID: <e02934dc-0366-ba4c-c27a-758169a12380@linux.intel.com>
Date: Fri, 15 Sep 2023 20:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/4] drm/xe: Support optional pinning of userptr pages
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
 <169416265636.18944.11104812487971466589@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <169416265636.18944.11104812487971466589@jlahtine-mobl.ger.corp.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/8/23 10:44, Joonas Lahtinen wrote:
> Quoting Thomas Hellström (2023-08-22 19:21:32)
>> This series adds a flag at VM_BIND time to pin the memory backing a VMA.
>> Initially this is needed for long-running workloads on hardware that
>> neither support mid-thread preemption nor pagefaults, since without it
>> the userptr MMU notifier will wait for preemption until preemption times
>> out.
>  From terminology perspective we have a lot of folks in the userspace and
> kernel developers who have come to understand pinned memory as something
> that is locked in place while a dependent context is active on the
> hardware. And that has been related to lack of page-fault support.
>
> As here the plan is to go a step forward and never move that memory, would
> it be worthy to call such memory LOCKED (would also align with CPU side).
> And per my understanding the aspiration is to keep supporting locking
> memory in place (within sysadmin configured limits) even if page-faults
> will become de-facto usage.
>
> So, in short, should we do s/pinned/locked/, to avoid terminology
> confusion between new and old drivers which userspace may have to deal
> from same codebase?

This is mainly a problem for people used to i915 pinning where we at 
some point used the term "short term pinning" and "long term pinning".

There are some discussions about the terminology here:
https://lwn.net/Articles/600502/
although I'm not sure what the outcome of that patchset was, but in this 
patchset, we're at least using pin_user_pages() for these VMAS. TTM and 
dma-buf also uses the term pinning.

The Linux distinction appears to be that locked pages are never paged 
out but may be migrated, (allowed to cause minor but not major 
pagefaults). Pinned pages are neither swapped nor migrated, and we're 
using the latter.

So I think pinning is the correct terminology?

(As a side note, Maarten was spending considerable time trying to remove 
the short term pinning from upstream i915 before xe work started).

Anyway, this patch series is on hold until we've merged Xe and can 
follow up with a discussion on exactly how we can support pinning in drm.

/Thomas


>
> Regards, Joonas
>
>> Moving forward this could be supported also for bo-backed VMAs given
>> a proper accounting takes place. A sysadmin could then optionally configure
>> a system to be optimized for dealing with a single GPU application
>> at a time.
>>
>> The series will be followed up with an igt series to exercise the uAPI.
>>
>> v2:
>> - Address review comments by Matthew Brost.
>>
>> Thomas Hellström (4):
>>    drm/xe/vm: Use onion unwind for xe_vma_userptr_pin_pages()
>>    drm/xe/vm: Implement userptr page pinning
>>    drm/xe/vm: Perform accounting of userptr pinned pages
>>    drm/xe/uapi: Support pinning of userptr vmas
>>
>>   drivers/gpu/drm/xe/xe_vm.c       | 194 ++++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_vm.h       |   9 ++
>>   drivers/gpu/drm/xe/xe_vm_types.h |  14 +++
>>   include/uapi/drm/xe_drm.h        |  18 +++
>>   4 files changed, 190 insertions(+), 45 deletions(-)
>>
>> -- 
>> 2.41.0
>>
