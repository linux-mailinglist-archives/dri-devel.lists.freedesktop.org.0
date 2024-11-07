Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056439BFB93
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 02:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139310E213;
	Thu,  7 Nov 2024 01:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7395C10E20E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 01:33:32 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XkPfh6Rg7z1T9TQ;
 Thu,  7 Nov 2024 09:31:08 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
 by mail.maildlp.com (Postfix) with ESMTPS id A78CC180105;
 Thu,  7 Nov 2024 09:33:29 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 09:33:28 +0800
Message-ID: <534caf1f-626b-252d-b08a-fc5a3cc007e9@huawei.com>
Date: Thu, 7 Nov 2024 09:33:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v4] drm/ttm/tests: Fix memory leak in
 ttm_tt_simple_create()
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <christian.koenig@amd.com>, <ray.huang@amd.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <karolina.stolarek@intel.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <asomalap@amd.com>,
 <quic_jjohnson@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241026020758.3846669-1-ruanjinjie@huawei.com>
 <560d2026-5785-b6b1-eb7d-3afed714d47f@huawei.com>
In-Reply-To: <560d2026-5785-b6b1-eb7d-3afed714d47f@huawei.com>
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



On 2024/10/30 10:01, Jinjie Ruan wrote:
> Gentle ping.
> 
> On 2024/10/26 10:07, Jinjie Ruan wrote:
>> modprobe ttm_device_test and then rmmod ttm_device_test, the following
>> memory leaks occurs:
>>
>> The ttm->pages allocated in ttm_tt_init() is not freed after calling
>> ttm_tt_simple_create(), which cause the memory leak:
>>
>> 	unreferenced object 0xffffff80caf27750 (size 8):
>> 	  comm "kunit_try_catch", pid 2242, jiffies 4295055735
>> 	  hex dump (first 8 bytes):
>> 	    c0 1e 3d c3 fe ff ff ff                          ..=.....
>> 	  backtrace (crc 3d11615a):
>> 	    [<000000007f57312a>] kmemleak_alloc+0x34/0x40
>> 	    [<000000008c6c4c7e>] __kmalloc_node_noprof+0x304/0x3e4
>> 	    [<00000000679c1182>] __kvmalloc_node_noprof+0x1c/0x144
>> 	    [<000000006aed0a3d>] ttm_tt_init+0x138/0x28c [ttm]
>> 	    [<000000005c331998>] drm_gem_shmem_free+0x60/0x534 [drm_shmem_helper]
>> 	    [<0000000022b4f375>] kunit_try_run_case+0x13c/0x3ac
>> 	    [<00000000c525d725>] kunit_generic_run_threadfn_adapter+0x80/0xec
>> 	    [<000000002db94a1f>] kthread+0x2e8/0x374
>> 	    [<000000002c457ad7>] ret_from_fork+0x10/0x20
>> 	......
>>
>> Fix it by calling ttm_tt_fini() in the exit function.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: e6f7c641fae3 ("drm/ttm/tests: Add tests for ttm_tt")
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Hi, Nirmoy,

could this patch be merged?

>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v4:
>> - Split out to be alone.
>> v3:
>> - s/fllowing/following/
>> v2:
>> - Add Reviewed-by.
>> ---
>>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index b91c13f46225..9ff216ec58ef 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -54,6 +54,7 @@ static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo, u32 pag
>>  
>>  static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>  {
>> +	ttm_tt_fini(ttm);
>>  	kfree(ttm);
>>  }
>>  
