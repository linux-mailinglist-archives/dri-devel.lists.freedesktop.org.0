Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D106899C535
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2F110E3F1;
	Mon, 14 Oct 2024 09:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvXaS/64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D11110E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728897448; x=1760433448;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=u6TaFVZONqi9zP1yGL5nvvE5e03tHzhpbIR4tHpq/k8=;
 b=UvXaS/64mZe4PlA5Wm9KtzzzjlBaapiuZisOxTpie1M+jYIlHP+x2ffD
 wBusKVTuwVDfcdfrkSj1DOmm/DFcTu2bVibJwP4ZXPXsp4lICTr1Ky6bR
 BHNhp1oJm9pcZM4kO6iTdEsdbPjI4QIWt7hmCZL+6THwAAUVo1m9xGKGx
 MBTro7lgyu9BQAzBgMywusnH3BvTA5dnvTRAnffPFC0sunowD1u6yMTRA
 pOn/7IZyMCa4qrtQ7nbxLVTPGaGDP9HdqdFD0dYHM9eEVoXco0ZzO0dOw
 0NaRykjlebWfjxhMbhAl2k6Mg6df3j59qVXSnKWvHSO9VMyuwibJJd5vs A==;
X-CSE-ConnectionGUID: gKmfF056Q0SB0oZv8hpTTw==
X-CSE-MsgGUID: lZGDygbHS4edv60DSdA76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53657008"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="53657008"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 02:17:28 -0700
X-CSE-ConnectionGUID: JRiJQlePRXOh5zXqsUbWhg==
X-CSE-MsgGUID: obGBvDAPSdmfwoP+isWSkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77446041"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.190])
 ([10.245.177.190])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 02:17:22 -0700
Message-ID: <b545ed9c-787e-4840-b91f-3544bda0f2f0@linux.intel.com>
Date: Mon, 14 Oct 2024 11:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/ttm/tests: Fix memory leak in
 ttm_tt_simple_create()
To: Jinjie Ruan <ruanjinjie@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 christian.koenig@amd.com, ray.huang@amd.com, dmitry.baryshkov@linaro.org,
 dave.stevenson@raspberrypi.com, mcanal@igalia.com,
 quic_jjohnson@quicinc.com, karolina.stolarek@intel.com,
 Arunpravin.PaneerSelvam@amd.com, thomas.hellstrom@linux.intel.com,
 asomalap@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241014071632.989108-1-ruanjinjie@huawei.com>
 <20241014071632.989108-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014071632.989108-3-ruanjinjie@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/14/2024 9:16 AM, Jinjie Ruan wrote:
> modprobe ttm_device_test and then rmmod ttm_device_test, the fllowing
> memory leaks occurs:
>
> The ttm->pages allocated in ttm_tt_init() is not freed after calling
> ttm_tt_simple_create(), which cause the memory leak:
>
> 	unreferenced object 0xffffff80caf27750 (size 8):
> 	  comm "kunit_try_catch", pid 2242, jiffies 4295055735
> 	  hex dump (first 8 bytes):
> 	    c0 1e 3d c3 fe ff ff ff                          ..=.....
> 	  backtrace (crc 3d11615a):
> 	    [<000000007f57312a>] kmemleak_alloc+0x34/0x40
> 	    [<000000008c6c4c7e>] __kmalloc_node_noprof+0x304/0x3e4
> 	    [<00000000679c1182>] __kvmalloc_node_noprof+0x1c/0x144
> 	    [<000000006aed0a3d>] ttm_tt_init+0x138/0x28c [ttm]
> 	    [<000000005c331998>] drm_gem_shmem_free+0x60/0x534 [drm_shmem_helper]
> 	    [<0000000022b4f375>] kunit_try_run_case+0x13c/0x3ac
> 	    [<00000000c525d725>] kunit_generic_run_threadfn_adapter+0x80/0xec
> 	    [<000000002db94a1f>] kthread+0x2e8/0x374
> 	    [<000000002c457ad7>] ret_from_fork+0x10/0x20
> 	......
>
> Fix it by calling ttm_tt_fini() in the exit function.
>
> Cc: stable@vger.kernel.org
> Fixes: e6f7c641fae3 ("drm/ttm/tests: Add tests for ttm_tt")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index b91c13f46225..9ff216ec58ef 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -54,6 +54,7 @@ static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo, u32 pag
>  
>  static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
> +	ttm_tt_fini(ttm);
>  	kfree(ttm);
>  }
>  
