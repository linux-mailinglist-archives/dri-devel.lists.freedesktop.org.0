Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D95EED0A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 07:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13513890C7;
	Thu, 29 Sep 2022 05:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 17991 seconds by postgrey-1.36 at gabe;
 Thu, 29 Sep 2022 05:07:26 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E815110E0FE;
 Thu, 29 Sep 2022 05:07:26 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdLvZ196nz4xGh;
 Thu, 29 Sep 2022 15:07:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1664428044;
 bh=LNJLwf4icNuP92vlonmeVOhbmhMWAvb1KZSRpI5pNFE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RmmwtB+Lq8bjkFuvWqmHzVzaEXURluSYEX7ndiVyuWqzynjHwOkXEd7d55TdcPdR3
 AKsLc+bQH8LwodnZNM/TXhnavHNQdaIehmVr9TluOfPyWQZui7tDuKbQsH01FhSC8V
 wr1p2UI1BPVSJA0f/V9l1JzFzgT04uDvRNZ3B9hv9k4fxW8theuwzRQdlgNILubYhq
 ZK/ymFMP+bM4hv0Q2p4PRL+P9isFHyJhX6hL74EqHJrJiR4ExrEOSFWffFokEb+amQ
 C7cL/kWRJkajfUPucTviskOUV95IRNe3nZ8ugIFg3iEXJ1+raAUC75VfQfduJLiaJD
 XlroTz/ZLvaTw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 1/7] mm/memory.c: Fix race when faulting a device
 private page
In-Reply-To: <875yh7osye.fsf@nvdebian.thelocal>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <af2ea89799b08e0a5e592df0da0dcb9a5bf8533b.1664171943.git-series.apopple@nvidia.com>
 <87fsgbf3gh.fsf@mpe.ellerman.id.au> <875yh7osye.fsf@nvdebian.thelocal>
Date: Thu, 29 Sep 2022 15:07:17 +1000
Message-ID: <87bkqyg456.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, "Matthew Wilcox
 \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alistair Popple <apopple@nvidia.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Alistair Popple <apopple@nvidia.com> writes:
>>> When the CPU tries to access a device private page the migrate_to_ram()
>>> callback associated with the pgmap for the page is called. However no
>>> reference is taken on the faulting page. Therefore a concurrent
>>> migration of the device private page can free the page and possibly the
>>> underlying pgmap. This results in a race which can crash the kernel due
>>> to the migrate_to_ram() function pointer becoming invalid. It also means
>>> drivers can't reliably read the zone_device_data field because the page
>>> may have been freed with memunmap_pages().
>>>
>>> Close the race by getting a reference on the page while holding the ptl
>>> to ensure it has not been freed. Unfortunately the elevated reference
>>> count will cause the migration required to handle the fault to fail. To
>>> avoid this failure pass the faulting page into the migrate_vma functions
>>> so that if an elevated reference count is found it can be checked to see
>>> if it's expected or not.
>>>
>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>> ---
>>>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
>>>  include/linux/migrate.h                  |  8 ++++++-
>>>  lib/test_hmm.c                           |  7 ++---
>>>  mm/memory.c                              | 16 +++++++++++-
>>>  mm/migrate.c                             | 34 ++++++++++++++-----------
>>>  mm/migrate_device.c                      | 18 +++++++++----
>>>  9 files changed, 87 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> index 5980063..d4eacf4 100644
>>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>> @@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
...
>>> @@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
>>>
>>>  	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
>>>  				vmf->address + PAGE_SIZE, PAGE_SHIFT,
>>> -				pvt->kvm, pvt->gpa))
>>> +				pvt->kvm, pvt->gpa, vmf->page))
>>>  		return VM_FAULT_SIGBUS;
>>>  	else
>>>  		return 0;
>>
>> I don't have a UV test system, but as-is it doesn't even compile :)
>
> Ugh, thanks. I did get as far as installing a PPC cross-compiler and
> building a kernel. Apparently I did not get as far as enabling
> CONFIG_PPC_UV :)

No worries, that's really on us. If we're going to keep the code in the
tree then it should really be enabled in at least one of our defconfigs.

cheers
