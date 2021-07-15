Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E13C9D6A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BF889FD9;
	Thu, 15 Jul 2021 11:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D30689FD9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 11:03:45 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GQWcS658kzbc5f;
 Thu, 15 Jul 2021 19:00:24 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Jul 2021 19:03:42 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Jul 2021 19:03:42 +0800
Subject: Re: [PATCH -next v2] drm/bochs: Fix missing pci_disable_device() on
 error in bochs_pci_probe()
To: Thomas Zimmermann <tzimmermann@suse.de>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>
References: <20210715020551.1030812-1-yangyingliang@huawei.com>
 <49771e7d-666a-bac3-2cd7-23008a95ad8e@suse.de>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <22ff114a-9810-37f4-43c2-22ce55d6482f@huawei.com>
Date: Thu, 15 Jul 2021 19:03:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <49771e7d-666a-bac3-2cd7-23008a95ad8e@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
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
Cc: airlied@linux.ie, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021/7/15 17:30, Thomas Zimmermann wrote:
> Hi,
>
> for the change
>
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>
> but there are some style issues AFAICS.
OK, need I resend it with the style changes and your ack ?
>
> Am 15.07.21 um 04:05 schrieb Yang Yingliang:
>> Replace pci_enable_device() with pcim_enable_device(),
>> pci_disable_device() will be called in release automatically.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>
> S-o-b line goes first
>
>> ---
>> v2:
>>    use pcim_enable_device()
>
> This changelog should rather be located between the commit description 
> and the first S-o-b line.
>
> Best regards
> Thomas
>
>> ---
>>   drivers/gpu/drm/tiny/bochs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
>> index a2cfecfa8556..73415fa9ae0f 100644
>> --- a/drivers/gpu/drm/tiny/bochs.c
>> +++ b/drivers/gpu/drm/tiny/bochs.c
>> @@ -648,7 +648,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent
>>       if (IS_ERR(dev))
>>           return PTR_ERR(dev);
>>   -    ret = pci_enable_device(pdev);
>> +    ret = pcim_enable_device(pdev);
>>       if (ret)
>>           goto err_free_dev;
>>
>
