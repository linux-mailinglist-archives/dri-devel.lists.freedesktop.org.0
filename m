Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91FAD393C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5202810E562;
	Tue, 10 Jun 2025 13:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6582E10E562
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:31:24 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bGqQz0PH6z1fy9r;
 Tue, 10 Jun 2025 21:30:03 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id ED4191400DC;
 Tue, 10 Jun 2025 21:31:21 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:31:21 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:31:20 +0800
Message-ID: <3fc17e98-5934-45c8-ba84-815a25a434cc@huawei.com>
Date: Tue, 10 Jun 2025 21:31:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 08/10] drm/hisilicon/hibmc: fix DP no showing after
 HPD with VGA connected
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-9-shiyongbang@huawei.com>
 <qv3frn7zaqzxatag5y7g3p6u5ulywife5aqovhjppjokglptwg@vl4ponlnbbtv>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <qv3frn7zaqzxatag5y7g3p6u5ulywife5aqovhjppjokglptwg@vl4ponlnbbtv>
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


> On Fri, May 30, 2025 at 05:54:30PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> If the system started with VGA connected, the desktop like GDM cannot get
>> DP's CRTC when DP device is plugged in, because there is only one crtc
>> sharing use of VGA and DP. So change VGA to disconnected when DP is
>> connected.
> NAK. I think we discussed this when the previous patch was submitted.
>
> VGA and DP are independent. It should be user's choice whether to use
> VGA or DP if both are connected.

Okay, I can use GDM to set which connectors to use, or config Xorg conf file.
But I have an another problem, I think our driver only support one of them displaying, can we realize
the clone displaying at the same time? To make DP and VGA shows up simultaneous when DP is plugged in,
If the system started with VGA connected.

Thanks,
Baihan.


>> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
