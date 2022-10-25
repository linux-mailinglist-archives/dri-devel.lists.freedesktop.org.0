Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07960C9CF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 12:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0732010E038;
	Tue, 25 Oct 2022 10:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA3910E31F;
 Tue, 25 Oct 2022 10:17:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B8C9B81CD1;
 Tue, 25 Oct 2022 10:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC4FC433C1;
 Tue, 25 Oct 2022 10:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666693067;
 bh=loBjWPuoKTGF/gO56VzkKo6krQdgRby7JIrG/EzZOSQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d6ZDNCAcK4F26u54xQf8kDBp/8b3DW5BfO6g1lzeUvpUqST0Kw+Ohe0820AGWKYi+
 /7Iqw8NZ0p6eQ/pqwMi1Gu67j2R14VHUyxddgBClTRfmn7+eiBCfjsq3GSF79nNNGz
 0X7g+J7DfNAmhkRl2i3xi1iShD/jLXV9iOD0Aj/KAyEV5IbzhVMFLMbIuW+YD0HX3T
 B8i2fs2s6CKT9WlZ6lTFZXa/hnB4DlVRnIIZi1IMECfFVAoF+8Q0qD/kHO/VT7rrxh
 ahRkwDT3WUrOsLHpVfVQd0i2lzMAzWlJ4qQ4wL0BQod1CCuVzaQiHLp5VsXHdnMHQK
 2bogCqmt8gCvw==
Message-ID: <f36153fe-214c-2904-e155-ab9cee8a2a2c@kernel.org>
Date: Tue, 25 Oct 2022 12:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 0/8] Fix several device private page reference counting
 issues
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/28/22 14:01, Alistair Popple wrote:
> This series aims to fix a number of page reference counting issues in
> drivers dealing with device private ZONE_DEVICE pages. These result in
> use-after-free type bugs, either from accessing a struct page which no
> longer exists because it has been removed or accessing fields within the
> struct page which are no longer valid because the page has been freed.
> 
> During normal usage it is unlikely these will cause any problems. However
> without these fixes it is possible to crash the kernel from userspace.
> These crashes can be triggered either by unloading the kernel module or
> unbinding the device from the driver prior to a userspace task exiting. In
> modules such as Nouveau it is also possible to trigger some of these issues
> by explicitly closing the device file-descriptor prior to the task exiting
> and then accessing device private memory.

Hi, as this series was noticed to create a CVE [1], do you think a stable
backport is warranted? I think the "It is possible to launch the attack
remotely." in [1] is incorrect though, right?

It looks to me that patch 1 would be needed since the CONFIG_DEVICE_PRIVATE
introduction, while the following few only to kernels with 27674ef6c73f
(probably not so critical as that includes no LTS)?

Thanks,
Vlastimil

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-3523

> This involves some minor changes to both PowerPC and AMD GPU code.
> Unfortunately I lack hardware to test either of those so any help there
> would be appreciated. The changes mimic what is done in for both Nouveau
> and hmm-tests though so I doubt they will cause problems.
> 
> To: Andrew Morton <akpm@linux-foundation.org>
> To: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> 
> Alistair Popple (8):
>   mm/memory.c: Fix race when faulting a device private page
>   mm: Free device private pages have zero refcount
>   mm/memremap.c: Take a pgmap reference on page allocation
>   mm/migrate_device.c: Refactor migrate_vma and migrate_deivce_coherent_page()
>   mm/migrate_device.c: Add migrate_device_range()
>   nouveau/dmem: Refactor nouveau_dmem_fault_copy_one()
>   nouveau/dmem: Evict device private memory during release
>   hmm-tests: Add test for migrate_device_range()
> 
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  17 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  19 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |   2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     |  11 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 108 +++++++----
>  include/linux/memremap.h                 |   1 +-
>  include/linux/migrate.h                  |  15 ++-
>  lib/test_hmm.c                           | 129 ++++++++++---
>  lib/test_hmm_uapi.h                      |   1 +-
>  mm/memory.c                              |  16 +-
>  mm/memremap.c                            |  30 ++-
>  mm/migrate.c                             |  34 +--
>  mm/migrate_device.c                      | 239 +++++++++++++++++-------
>  mm/page_alloc.c                          |   8 +-
>  tools/testing/selftests/vm/hmm-tests.c   |  49 +++++-
>  15 files changed, 516 insertions(+), 163 deletions(-)
> 
> base-commit: 088b8aa537c2c767765f1c19b555f21ffe555786

