Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A469BFBA5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 02:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B7610E20E;
	Thu,  7 Nov 2024 01:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E802D10E20E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 01:35:14 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XkPk367PXz20sng;
 Thu,  7 Nov 2024 09:34:03 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id 7092F18002B;
 Thu,  7 Nov 2024 09:35:11 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 09:35:10 +0800
Message-ID: <effe7aa5-1bd9-34f9-a3e9-db3f260f66e0@huawei.com>
Date: Thu, 7 Nov 2024 09:35:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ttm/tests: Fix memory leaks for ttm_tt_init()
Content-Language: en-US
To: <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <quic_jjohnson@quicinc.com>,
 <asomalap@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241018101127.706605-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241018101127.706605-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200008.china.huawei.com (7.202.181.35)
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

Gentle ping.

On 2024/10/18 18:11, Jinjie Ruan wrote:
> modprobe ttm_tt_test and then rmmod it, the following
> memory leaks occurs because the ttm->pages allocated
> in ttm_tt_init() is not freed:
> 
> 	unreferenced object 0xffffff80c8469ed0 (size 8):
> 	  comm "kunit_try_catch", pid 1841, jiffies 4294914909
> 	  hex dump (first 8 bytes):
> 	    00 be 19 c3 fe ff ff ff                          ........
> 	  backtrace (crc 9c21b223):
> 	    [<00000000d734f633>] kmemleak_alloc+0x34/0x40
> 	    [<0000000055020f06>] __kmalloc_node_noprof+0x304/0x3e4
> 	    [<00000000ab22f5d3>] __kvmalloc_node_noprof+0x1c/0x144
> 	    [<00000000590d5c78>] ttm_tt_init+0x138/0x28c [ttm]
> 	    [<000000009445c08f>] 0xffffffd89a21c334
> 	    [<00000000db227f06>] kunit_try_run_case+0x13c/0x3ac
> 	    [<00000000434063ab>] kunit_generic_run_threadfn_adapter+0x80/0xec
> 	    [<00000000dac19ab7>] kthread+0x2e8/0x374
> 	    [<0000000057031423>] ret_from_fork+0x10/0x20
> 	......
> 
> Add a helper named ttm_tt_init_kunit() to call ttm_tt_finish()
> to free it automatically.
> 
> Cc: stable@vger.kernel.org
> Fixes: e6f7c641fae3 ("drm/ttm/tests: Add tests for ttm_tt")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 +++++++++++++++++++
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  5 +++++
>  drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 18 +++++++--------
>  3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 4f448d8cf30d..63a582de9ea9 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -317,5 +317,27 @@ void ttm_test_devices_fini(struct kunit *test)
>  }
>  EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
>  
> +static void kunit_action_ttm_tt_fini(void *ptr)
> +{
> +	struct ttm_tt *ttm = ptr;
> +
> +	ttm_tt_fini(ttm);
> +}
> +
> +int ttm_tt_init_kunit(struct kunit *test,
> +		      struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> +		      uint32_t page_flags, enum ttm_caching caching,
> +		      unsigned long extra_pages)
> +{
> +	int ret;
> +
> +	ret = ttm_tt_init(ttm, bo, page_flags, caching, extra_pages);
> +	if (ret)
> +		return ret;
> +
> +	return kunit_add_action_or_reset(test, kunit_action_ttm_tt_fini, ttm);
> +}
> +EXPORT_SYMBOL(ttm_tt_init_kunit);
> +
>  MODULE_DESCRIPTION("TTM KUnit test helper functions");
>  MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index c7da23232ffa..254d96a9adda 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -52,4 +52,9 @@ int ttm_test_devices_init(struct kunit *test);
>  int ttm_test_devices_all_init(struct kunit *test);
>  void ttm_test_devices_fini(struct kunit *test);
>  
> +int ttm_tt_init_kunit(struct kunit *test,
> +		      struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> +		      uint32_t page_flags, enum ttm_caching caching,
> +		      unsigned long extra_pages);
> +
>  #endif // TTM_KUNIT_HELPERS_H
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> index 61ec6f580b62..2ba0f346fba8 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -52,7 +52,7 @@ static void ttm_tt_init_basic(struct kunit *test)
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, params->size, NULL);
>  
> -	err = ttm_tt_init(tt, bo, page_flags, caching, extra_pages);
> +	err = ttm_tt_init_kunit(test, tt, bo, page_flags, caching, extra_pages);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	KUNIT_ASSERT_EQ(test, tt->num_pages, num_pages + extra_pages);
> @@ -81,7 +81,7 @@ static void ttm_tt_init_misaligned(struct kunit *test)
>  	/* Make the object size misaligned */
>  	bo->base.size += 1;
>  
> -	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, caching, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	KUNIT_ASSERT_EQ(test, tt->num_pages, num_pages);
> @@ -99,7 +99,7 @@ static void ttm_tt_fini_basic(struct kunit *test)
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
>  
> -	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, caching, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	KUNIT_ASSERT_NOT_NULL(test, tt->pages);
>  
> @@ -140,7 +140,7 @@ static void ttm_tt_fini_shmem(struct kunit *test)
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
>  
> -	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, caching, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	shmem = shmem_file_setup("ttm swap", BO_SIZE, 0);
> @@ -197,7 +197,7 @@ static void ttm_tt_create_ttm_exists(struct kunit *test)
>  
>  	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
>  
> -	err = ttm_tt_init(tt, bo, 0, caching, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, caching, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  	bo->ttm = tt;
>  
> @@ -280,7 +280,7 @@ static void ttm_tt_populate_populated_ttm(struct kunit *test)
>  	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, tt);
>  
> -	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
> @@ -304,7 +304,7 @@ static void ttm_tt_unpopulate_basic(struct kunit *test)
>  	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, tt);
>  
> -	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
> @@ -327,7 +327,7 @@ static void ttm_tt_unpopulate_empty_ttm(struct kunit *test)
>  	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, tt);
>  
> -	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	ttm_tt_unpopulate(devs->ttm_dev, tt);
> @@ -348,7 +348,7 @@ static void ttm_tt_swapin_basic(struct kunit *test)
>  	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
>  	KUNIT_ASSERT_NOT_NULL(test, tt);
>  
> -	err = ttm_tt_init(tt, bo, 0, ttm_cached, 0);
> +	err = ttm_tt_init_kunit(test, tt, bo, 0, ttm_cached, 0);
>  	KUNIT_ASSERT_EQ(test, err, 0);
>  
>  	err = ttm_tt_populate(devs->ttm_dev, tt, &ctx);
