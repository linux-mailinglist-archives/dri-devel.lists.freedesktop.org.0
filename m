Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F248557FEAE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13468A1C37;
	Mon, 25 Jul 2022 11:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D1BA1BA4;
 Mon, 25 Jul 2022 11:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658750367; x=1690286367;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3cTXgsBfigtVKEbhJMoPU61A5f/edzZ1TEdm5LGUxKY=;
 b=mdA/tzLah8iXuXFSrZVT55iqiUNOlUFX/Ot15j+ohkxOG+Zm1QgG0LRp
 V6nzgK8+vTIKLPGEbAgiyHbo+le8xAKlwBWEqvMxCHXWLM4/1d9cnQlch
 EPxoYWu4p/Ja6MZhSWqp4FJv8TsTVwYbvRPVtZaeJrkNMCItV1B6bakHI
 IAmvOSUF8HIsCBK5QrS41mJ6JrPCUgWFxcQIvShoF4Z61VoHNfzT3HMCd
 niIKav2zwNRZNtuckd41eaYdmh4qHOOznaQxBttpZkL3eizo05Fiyptue
 wSTS4SNrM31T6IYJvwMKHJcuI3ijg+UG40g0wHe/y9Tnu6fYW1E8GTO/v A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="351674890"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="351674890"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:59:27 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="632332478"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.13.24])
 ([10.213.13.24])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:59:21 -0700
Message-ID: <9adf4881-15a4-862d-b90b-1ad2db3fcf99@intel.com>
Date: Mon, 25 Jul 2022 13:59:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915: Check if the size is too big
 while creating shmem file
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-6-gwan-gyeong.mun@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220725092528.1281487-6-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.07.2022 11:25, Gwan-gyeong Mun wrote:
> The __shmem_file_setup() function returns -EINVAL if size is greater than
> MAX_LFS_FILESIZE. To handle the same error as other code that returns
> -E2BIG when the size is too large, it add a code that returns -E2BIG when
> the size is larger than the size that can be handled.
> 
> v4: If BITS_PER_LONG is 32, size > MAX_LFS_FILESIZE is always false, so it
>      checks only when BITS_PER_LONG is 64.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
