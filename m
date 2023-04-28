Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB746F131C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 10:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DE110E65E;
	Fri, 28 Apr 2023 08:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 537 seconds by postgrey-1.36 at gabe;
 Fri, 28 Apr 2023 08:15:56 UTC
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA9F10E65E;
 Fri, 28 Apr 2023 08:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A02D63F819;
 Fri, 28 Apr 2023 10:06:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPV-orLKB_Mt; Fri, 28 Apr 2023 10:06:55 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 9961B3F802;
 Fri, 28 Apr 2023 10:06:54 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0EB4436322E;
 Fri, 28 Apr 2023 10:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1682669214; bh=iBHmpox9n0J5Bo93oJctoF5qYJPhn8L69X0KpoEdt88=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hGimOHXSqYe/+orzsDMfMhzPtwuElrPg2gq7+dV7Jhjaz13tfLGlNGVC6rHvDcTU3
 ZX+1qZYuEGyuIKl5sUxxNok7MfBRVzzZKqjk+WQSPR3b5TWpJSfNBlwSjulUiut6yh
 hx9q3jaoOrcdCNBhqxo2p8+RCeD6Ntxxr6Hs7DDg=
Message-ID: <e1c73441-df6f-799c-eda0-8639067a0fea@shipmail.org>
Date: Fri, 28 Apr 2023 10:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/5] drm/i915: Allow user to set cache at BO creation
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20230428054737.1765778-1-fei.yang@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20230428054737.1765778-1-fei.yang@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/28/23 07:47, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
>
> The first three patches in this series are taken from
> https://patchwork.freedesktop.org/series/116868/
> These patches are included here because the last patch
> has dependency on the pat_index refactor.
>
> This series is focusing on uAPI changes,
> 1. end support for set caching ioctl [PATCH 4/5]
> 2. add set_pat extension for gem_create [PATCH 5/5]
>
> v2: drop one patch that was merged separately
>      341ad0e8e254 drm/i915/mtl: Add PTE encode function
> v3: rebase on https://patchwork.freedesktop.org/series/117082/

Hi, Fei.

Does this uAPI update also affect any discrete GPUs supported by i915, 
And in that case, does it allow setting non-snooping PAT indices on 
those devices?

If so, since the uAPI for discrete GPU devices doesn't allow incoherency 
between GPU and CPU (apart from write-combining buffering), the correct 
CPU caching mode matching the PAT index needs to be selected for the 
buffer object in i915_ttm_select_tt_caching().

Thanks,
Thomas

>
> Fei Yang (5):
>    drm/i915: preparation for using PAT index
>    drm/i915: use pat_index instead of cache_level
>    drm/i915: make sure correct pte encode is used
>    drm/i915/mtl: end support for set caching ioctl
>    drm/i915: Allow user to set cache at BO creation
>
>   drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
>   drivers/gpu/drm/i915/gem/i915_gem_create.c    | 36 +++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 46 ++++++-----
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 10 ++-
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 67 +++++++++++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  | 26 +++++-
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  9 ++-
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 16 ++--
>   .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>   drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 73 +++++++++--------
>   drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76 +++++++++---------
>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 20 +++--
>   drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
>   drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  6 +-
>   drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------
>   drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
>   drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
>   drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
>   drivers/gpu/drm/i915/i915_debugfs.c           | 55 ++++++++++---
>   drivers/gpu/drm/i915/i915_gem.c               | 16 +++-
>   drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
>   drivers/gpu/drm/i915/i915_pci.c               | 79 ++++++++++++++++---
>   drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
>   drivers/gpu/drm/i915/i915_vma.h               |  2 +-
>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
>   drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
>   drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
>   .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
>   .../drm/i915/selftests/intel_memory_region.c  |  4 +-
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++
>   drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
>   include/uapi/drm/i915_drm.h                   | 36 +++++++++
>   tools/include/uapi/drm/i915_drm.h             | 36 +++++++++
>   44 files changed, 621 insertions(+), 243 deletions(-)
>
