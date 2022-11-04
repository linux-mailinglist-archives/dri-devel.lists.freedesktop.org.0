Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077266190E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 07:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C5410E047;
	Fri,  4 Nov 2022 06:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31F610E047
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 06:20:59 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N3Vqg6Kvrz15MJf;
 Fri,  4 Nov 2022 14:20:47 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 4 Nov 2022 14:20:53 +0800
Message-ID: <d9132431-76c4-fa04-84a8-7cf9fa67be07@huawei.com>
Date: Fri, 4 Nov 2022 14:20:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/ingenic: Fix missing platform_driver_unregister()
 call in ingenic_drm_init()
To: Paul Cercueil <paul@crapouillou.net>
References: <20221103140148.76385-1-yuancan@huawei.com>
 <5B1SKR.FZ7TSOMCSE4N2@crapouillou.net>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <5B1SKR.FZ7TSOMCSE4N2@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 2022/11/3 22:52, Paul Cercueil 写道:
> Hi Yuan,
>
> Le jeu. 3 nov. 2022 à 14:01:48 +0000, Yuan Can <yuancan@huawei.com> a 
> écrit :
>> A problem about modprobe ingenic-drm failed is triggered with the 
>> following
>> log given:
>>
>>  [  303.561088] Error: Driver 'ingenic-ipu' is already registered, 
>> aborting...
>>  modprobe: ERROR: could not insert 'ingenic_drm': Device or resource 
>> busy
>>
>> The reason is that ingenic_drm_init() returns platform_driver_register()
>> directly without checking its return value, if 
>> platform_driver_register()
>> failed, it returns without unregistering ingenic_ipu_driver_ptr, 
>> resulting
>> the ingenic-drm can never be installed later.
>> A simple call graph is shown as below:
>>
>>  ingenic_drm_init()
>>    platform_driver_register() # ingenic_ipu_driver_ptr are registered
>>    platform_driver_register()
>>      driver_register()
>>        bus_add_driver()
>>          priv = kzalloc(...) # OOM happened
>>    # return without unregister ingenic_ipu_driver_ptr
>>
>> Fixing this problem by checking the return value of
>> platform_driver_register() and do platform_unregister_drivers() if
>> error happened.
>>
>> Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>
> Missing a Cc: to linux-stable, no?
>
> Cheers,
> -Paul
Ok, I will cc to linux-stable in the v2 patch, thanks for the review.

-- 
Best regards,
Yuan Can

