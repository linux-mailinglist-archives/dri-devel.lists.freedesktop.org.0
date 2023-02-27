Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5F6A3C0C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 09:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3705810E367;
	Mon, 27 Feb 2023 08:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C447B10E365;
 Mon, 27 Feb 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677485562; x=1709021562;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g/qFcJpDpnsZnlb697tuEqjU+UhyHZYvc/vYhvZ14BY=;
 b=RjcrIYByVTdKEGu2t9g5ImqI1WkZulKQ7aSkK45ExlWyQnIPpxtDyrbO
 AicQSZRR+xOU+plNJpXeREV7W/THZnlIWnHfRfm9BYeMkhUHjcSvduZVz
 ssyTcI/Ont7N/JblG8jULFsXdfrMmUJQ245ufXk8TvItwCZzI6rVRm8y7
 M/WoPCXpC0JDdEFYqd35Yx9kv9E0XnyDm7KahmxStlmbKPecTqraI2zQq
 lBSO92af4/h0GzS/zQHa4P1jgwvhrao14QN5pXd01CfHoyGrhsyyKyGYv
 UBzMLjKTdiklRwrQYjVmf/ZFD3qVsC1d1A0vO4ZnVKeo4nsGXp0IzrjMC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="333846546"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="333846546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:11:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847707133"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="847707133"
Received: from flayounx-mobl.ger.corp.intel.com (HELO [10.249.254.249])
 ([10.249.254.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 00:11:54 -0800
Message-ID: <6cddb602-31dd-8854-25dc-11afe9b1a275@linux.intel.com>
Date: Mon, 27 Feb 2023 09:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/3] drm/helpers: Make the suballocation manager drm
 generic
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
References: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel, Dave

Ack to merge this to drm through drm-misc-next?

/Thomas


On 2/24/23 10:51, Thomas Hellström wrote:
> This series (or at least the suballocator helper) is a prerequisite
> for the new Xe driver.
>
> There was an unresolved issue when the series was last up for review,
> and that was the per allocation aligment. Last message was from
> Maarten Lankhorst arguing that the larger per-driver alignment used
> would only incur a small memory cost. This new variant resolves that.
>
> The generic suballocator has been tested with the Xe driver, and a
> kunit test is under development.
> The amd- and radeon adaptations are only compile-tested.
>
> v3:
> - Remove stale author information (Christian König)
> - Update Radeon Kconfig (Thomas Hellström)
>
> v4:
> - Avoid 64-bit integer divisions (kernel test robot <lkp@intel.com>)
> - Use size_t rather than u64 for the managed range. (Thomas)
>
>
> Maarten Lankhorst (3):
>    drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
>    drm/amd: Convert amdgpu to use suballocation helper.
>    drm/radeon: Use the drm suballocation manager implementation.
>
>   drivers/gpu/drm/Kconfig                    |   4 +
>   drivers/gpu/drm/Makefile                   |   3 +
>   drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 +--------------
>   drivers/gpu/drm/drm_suballoc.c             | 457 +++++++++++++++++++++
>   drivers/gpu/drm/radeon/Kconfig             |   1 +
>   drivers/gpu/drm/radeon/radeon.h            |  55 +--
>   drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
>   drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
>   drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
>   drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
>   include/drm/drm_suballoc.h                 | 108 +++++
>   16 files changed, 674 insertions(+), 693 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>   create mode 100644 include/drm/drm_suballoc.h
>
