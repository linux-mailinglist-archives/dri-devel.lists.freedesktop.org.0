Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C10C99C525
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 11:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B85E10E3E5;
	Mon, 14 Oct 2024 09:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FDB10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 09:15:37 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XRs5k70Pzz1ymtQ;
 Mon, 14 Oct 2024 17:15:38 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 814DA140158;
 Mon, 14 Oct 2024 17:15:33 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 14 Oct 2024 17:15:32 +0800
Message-ID: <dbe9c1c8-6c5c-f2da-545d-73e6fa535d8a@huawei.com>
Date: Mon, 14 Oct 2024 17:15:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] drm/connector: hdmi: Fix memory leak in
 drm_display_mode_from_cea_vic()
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <christian.koenig@amd.com>,
 <ray.huang@amd.com>, <dmitry.baryshkov@linaro.org>,
 <dave.stevenson@raspberrypi.com>, <mcanal@igalia.com>,
 <quic_jjohnson@quicinc.com>, <karolina.stolarek@intel.com>,
 <Arunpravin.PaneerSelvam@amd.com>, <thomas.hellstrom@linux.intel.com>,
 <asomalap@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20241014071632.989108-1-ruanjinjie@huawei.com>
 <20241014071632.989108-2-ruanjinjie@huawei.com>
 <20241014-fervent-whimsical-oyster-b0926d@houat>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241014-fervent-whimsical-oyster-b0926d@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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



On 2024/10/14 17:11, Maxime Ripard wrote:
> On Mon, Oct 14, 2024 at 03:16:30PM GMT, Jinjie Ruan wrote:
>> modprobe drm_connector_test and then rmmod drm_connector_test,
>> the following memory leak occurs.
>>
>> The `mode` allocated in drm_mode_duplicate() called by
>> drm_display_mode_from_cea_vic() is not freed, which cause the memory leak:
>>
>> 	unreferenced object 0xffffff80cb0ee400 (size 128):
>> 	  comm "kunit_try_catch", pid 1948, jiffies 4294950339
>> 	  hex dump (first 32 bytes):
>> 	    14 44 02 00 80 07 d8 07 04 08 98 08 00 00 38 04  .D............8.
>> 	    3c 04 41 04 65 04 00 00 05 00 00 00 00 00 00 00  <.A.e...........
>> 	  backtrace (crc 90e9585c):
>> 	    [<00000000ec42e3d7>] kmemleak_alloc+0x34/0x40
>> 	    [<00000000d0ef055a>] __kmalloc_cache_noprof+0x26c/0x2f4
>> 	    [<00000000c2062161>] drm_mode_duplicate+0x44/0x19c
>> 	    [<00000000f96c74aa>] drm_display_mode_from_cea_vic+0x88/0x98
>> 	    [<00000000d8f2c8b4>] 0xffffffdc982a4868
>> 	    [<000000005d164dbc>] kunit_try_run_case+0x13c/0x3ac
>> 	    [<000000006fb23398>] kunit_generic_run_threadfn_adapter+0x80/0xec
>> 	    [<000000006ea56ca0>] kthread+0x2e8/0x374
>> 	    [<000000000676063f>] ret_from_fork+0x10/0x20
>> 	......
>>
>> Free `mode` by calling drm_mode_destroy() to fix it.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: abb6f74973e2 ("drm/tests: Add HDMI TDMS character rate tests")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/gpu/drm/tests/drm_connector_test.c | 24 ++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
>> index 15e36a8db685..9c94d26b3486 100644
>> --- a/drivers/gpu/drm/tests/drm_connector_test.c
>> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
>> @@ -1004,6 +1004,8 @@ static void drm_test_drm_hdmi_compute_mode_clock_rgb(struct kunit *test)
>>  	rate = drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
>>  	KUNIT_ASSERT_GT(test, rate, 0);
>>  	KUNIT_EXPECT_EQ(test, mode->clock * 1000ULL, rate);
>> +
>> +	drm_mode_destroy(drm, mode);
>>  }
> 
> If KUNIT_ASSERT_GT triggers, then we would end up leaking the mode as well.
> 
> I think we should create a kunit_drm_display_mode_from_cea_vic()
> function that registers a kunit action to free the mode when the test is
> done.

You are right! That will be nice and could be used by the new KUNIT test
modules.

> 
> Maxime
