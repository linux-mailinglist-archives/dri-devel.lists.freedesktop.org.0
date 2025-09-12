Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B965B53FCF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 03:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046010E010;
	Fri, 12 Sep 2025 01:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EBB10E010
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 01:23:09 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4cNGt84VvWz3tZXQ;
 Fri, 12 Sep 2025 09:24:16 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 3DBB81A016C;
 Fri, 12 Sep 2025 09:23:07 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Sep 2025 09:23:06 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 12 Sep 2025 09:23:06 +0800
Message-ID: <13b3f4d9-c8b4-445f-8f9e-a57a1fa2bbb5@huawei.com>
Date: Fri, 12 Sep 2025 09:23:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <fengsheng5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-3-shiyongbang@huawei.com>
 <aayi7zjrmru2ancexrqmcutams6ohde3nrkhqacixwp45dsk4v@7ig6hqzahdxf>
 <1dd93bb7-4f67-4b9b-8b6a-d7c5c77cf807@huawei.com>
 <ce47v3y77uc4dunlwyvmfe6j7d7mza4zfrbvu5dz67t66jdlop@vqgv47saj37i>
 <8bbfd02f-138d-420c-b456-10d0c913f46e@huawei.com>
 <cdmtfluxqes3bv3t7suctbajp4jmpih6fhegkbf7mxvy4umzrd@rtpupear4el2>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <cdmtfluxqes3bv3t7suctbajp4jmpih6fhegkbf7mxvy4umzrd@rtpupear4el2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
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


> On Thu, Sep 11, 2025 at 05:32:40PM +0800, Yongbang Shi wrote:
>>> On Thu, Aug 14, 2025 at 08:19:41PM +0800, Yongbang Shi wrote:
>>>>> On Wed, Aug 13, 2025 at 05:42:29PM +0800, Yongbang Shi wrote:
>>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>>
>>>>>> The debouncing when HPD pulled out still remains sometimes, 200ms still can
>>>>>> not ensure helper_detect() is correct. So add a flag to hold the sink
>>>>>> status, and changed detect_ctx() functions by using flag to check status.
>>>>> THis doesn't explain what is wrong with
>>>>> drm_connector_helper_detect_from_ddc(). In the end, this function
>>>>> doesn't use the HPD pin.
>>>> I'm sorry about the misunderstanding.
>>>> The issue is that after plugging or unplugging the monitor, the driver takes no action sometimes
>>>> even though an interrupt is triggered. The root cause is that drm_connector_helper_detect_from_ddc()
>>>> still returns connected status when the monitor is unplugged.
>>>> And I will fix the way in the end.
>>> Can you perform a normal DP detection: read DPCD and check that there is
>>> a DPRX attached and that it's either non-branch device or it has one or
>>> more sinks?
>> I'm very sorry that I didn't get the last sentence's asking before.
>> It's a non-branch device. We just connect a DP monitor.
> Somebody might connect a different configuration than the one that you
> are using.

Okay, I can add the check drm_dp_is_branch() in the DP's detect_ctx() to
intercept branch devices, is that good?

Thanks,
Baihan Li

