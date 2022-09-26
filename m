Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A15E97AD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 03:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0284C10E4B1;
	Mon, 26 Sep 2022 01:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AA810E4B1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 01:21:13 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MbPxJ01bczWgtJ;
 Mon, 26 Sep 2022 09:17:07 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 09:21:10 +0800
Message-ID: <66e9a351-7ca0-ab02-35b1-2acbfebdde40@huawei.com>
Date: Mon, 26 Sep 2022 09:21:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] video: fbdev: tridentfb: Fix missing
 pci_disable_device() in probe and remove
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, <zheyuma97@gmail.com>, <javierm@redhat.com>, 
 <wsa+renesas@sang-engineering.com>, <tzimmermann@suse.de>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20220922013709.3324521-1-ruanjinjie@huawei.com>
 <eabf4405-7492-19c4-0827-a240e9c75dca@gmx.de>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <eabf4405-7492-19c4-0827-a240e9c75dca@gmx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you very much!

On 2022/9/26 0:21, Helge Deller wrote:
> On 9/22/22 03:37, ruanjinjie wrote:
>> Replace pci_enable_device() with pcim_enable_device(),
>> pci_disable_device() and pci_release_regions() will be
>> called in release automatically.
>>
>> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> 
> applied.
> 
> Thanks!
> Helge
> 
>> ---
>>   drivers/video/fbdev/tridentfb.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/tridentfb.c
>> b/drivers/video/fbdev/tridentfb.c
>> index f9c3b1d38fc2..7933e01aacc5 100644
>> --- a/drivers/video/fbdev/tridentfb.c
>> +++ b/drivers/video/fbdev/tridentfb.c
>> @@ -1475,7 +1475,7 @@ static int trident_pci_probe(struct pci_dev *dev,
>>       if (err)
>>           return err;
>>
>> -    err = pci_enable_device(dev);
>> +    err = pcim_enable_device(dev);
>>       if (err)
>>           return err;
>>
>> @@ -1715,12 +1715,10 @@ static int trident_pci_probe(struct pci_dev *dev,
>>       kfree(info->pixmap.addr);
>>       if (info->screen_base)
>>           iounmap(info->screen_base);
>> -    release_mem_region(tridentfb_fix.smem_start,
>> tridentfb_fix.smem_len);
>>       disable_mmio(info->par);
>>   out_unmap1:
>>       if (default_par->io_virt)
>>           iounmap(default_par->io_virt);
>> -    release_mem_region(tridentfb_fix.mmio_start,
>> tridentfb_fix.mmio_len);
>>       framebuffer_release(info);
>>       return err;
>>   }
>> @@ -1735,8 +1733,6 @@ static void trident_pci_remove(struct pci_dev *dev)
>>           i2c_del_adapter(&par->ddc_adapter);
>>       iounmap(par->io_virt);
>>       iounmap(info->screen_base);
>> -    release_mem_region(tridentfb_fix.smem_start,
>> tridentfb_fix.smem_len);
>> -    release_mem_region(tridentfb_fix.mmio_start,
>> tridentfb_fix.mmio_len);
>>       kfree(info->pixmap.addr);
>>       fb_dealloc_cmap(&info->cmap);
>>       framebuffer_release(info);
> 
