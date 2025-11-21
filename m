Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B4C78222
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 10:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A9B10E11B;
	Fri, 21 Nov 2025 09:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="SrNSHmDx";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="SrNSHmDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C68C10E11B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 09:25:01 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=UdxRi4JTzFkZn/kZqJCUXukEalb3NfL9CcwO64QkNIE=;
 b=SrNSHmDxRS/A1/qhWQfvVy8MlzbJy8znYx2EQGAorJ1xfnmAdqt9SeTwF/wZ2mMpBdZGV30qr
 wXixYNlBsmDTpMLDRCwsJuziqXzOZlYUnLHv1Rm3TZgpDI9lzpaLYFNsqcZ554I3pa3fF3xpXgl
 mukgdYjYVa7vYtVWm5Qhkek=
Received: from canpmsgout11.his.huawei.com (unknown [172.19.92.148])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dCVCl5VtZz1BGft
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:24:19 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=UdxRi4JTzFkZn/kZqJCUXukEalb3NfL9CcwO64QkNIE=;
 b=SrNSHmDxRS/A1/qhWQfvVy8MlzbJy8znYx2EQGAorJ1xfnmAdqt9SeTwF/wZ2mMpBdZGV30qr
 wXixYNlBsmDTpMLDRCwsJuziqXzOZlYUnLHv1Rm3TZgpDI9lzpaLYFNsqcZ554I3pa3fF3xpXgl
 mukgdYjYVa7vYtVWm5Qhkek=
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dCVBP1B1FzKm5S;
 Fri, 21 Nov 2025 17:23:09 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id B9B99140295;
 Fri, 21 Nov 2025 17:24:54 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 17:24:52 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 17:24:52 +0800
Message-ID: <bec66db2-9480-4698-9348-970bded1fb4d@huawei.com>
Date: Fri, 21 Nov 2025 17:24:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 drm-dp 1/4] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250926011500.2545817-1-shiyongbang@huawei.com>
 <20250926011500.2545817-2-shiyongbang@huawei.com>
 <w54im5c6zbeoik44jrzvwnfrcxpbf3pzke74a7r4kcgq6balvh@d33v6xpmua6s>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <w54im5c6zbeoik44jrzvwnfrcxpbf3pzke74a7r4kcgq6balvh@d33v6xpmua6s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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

Hi Dmitry,

I'm replying here to follow up on this patch.
It has been a while since your RB, so I just want to check if there are any problems here for my patch,
or anything I can do better before it can be picked up?

Thanks,
Baihan

> On Fri, Sep 26, 2025 at 09:14:57AM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> The issue is that drm_connector_helper_detect_from_ddc() returns wrong
>> status when plugging or unplugging the monitor. Use HPD pin status in
>> DP's detect_ctx() for real physcal monitor in/out, and implementation
>> a complete DP detection including read DPCD, check if it's a branch
>> device and its sink count for different situations.
>>
>> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v7 -> v8:
>>    - fix build errors reported by kernel test robot <lkp@intel.com>
>>      Closes: https://lore.kernel.org/oe-kbuild-all/202509241625.o4mNleVb-lkp@intel.com/
>> v6 -> v7:
>>    - add the check about branch devices, suggested by Dmitry Baryshkov.
>> v5 -> v6:
>>    - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
>> v4 -> v5:
>>    - fix the commit message and DP detect_ctx(), suggested by Dmitry Baryshkov.
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 12 +++++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  6 +++
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 ++
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 48 ++++++++++++++++++-
>>   5 files changed, 71 insertions(+), 2 deletions(-)
>>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
