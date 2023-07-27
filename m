Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AD67647AF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 09:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E7810E4DA;
	Thu, 27 Jul 2023 07:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB8910E4DA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:05:52 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RBMCQ2dsnzNmJN;
 Thu, 27 Jul 2023 15:02:26 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 15:05:48 +0800
Message-ID: <ac3f4aeb-45c8-c337-55c0-c04db9328090@huawei.com>
Date: Thu, 27 Jul 2023 15:05:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] drm: omapdrm: dss: Remove redundant DSSERR()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230727113923.3093070-1-ruanjinjie@huawei.com>
 <20230727065708.q7wrmzb7egzc4tmy@pengutronix.de>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230727065708.q7wrmzb7egzc4tmy@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: arnd@arndb.de, guozhengkui@vivo.com, tomi.valkeinen@ideasonboard.com,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, yuancan@huawei.com,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/7/27 14:57, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Jul 27, 2023 at 11:39:23AM +0000, Ruan Jinjie wrote:
>> There is no need to call the DSSERR() function directly to print
>> a custom message when handling an error from platform_get_irq() function
>> as it is going to display an appropriate error message
>> in case of a failure.
>>
>> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
>> ---
>>  drivers/gpu/drm/omapdrm/dss/dispc.c | 1 -
>>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 4 +---
>>  drivers/gpu/drm/omapdrm/dss/hdmi4.c | 1 -
>>  drivers/gpu/drm/omapdrm/dss/hdmi5.c | 1 -
>>  4 files changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> index c26aab4939fa..9209103f5dc5 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
>> @@ -4779,7 +4779,6 @@ static int dispc_bind(struct device *dev, struct device *master, void *data)
>>  
>>  	dispc->irq = platform_get_irq(dispc->pdev, 0);
>>  	if (dispc->irq < 0) {
>> -		DSSERR("platform_get_irq failed\n");
>>  		r = -ENODEV;
>>  		goto err_free;
>>  	}
> 
> Orthogonal to your patch I wonder about r = -ENODEV. Wouldn't r =
> dispc->irq be the sensible option? Ditto for the other hunks.

I agree with you, r = dispc->irq will be more sensible!
> 
> Best regards
> Uwe
> 
