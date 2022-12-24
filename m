Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 081EF6558F8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Dec 2022 08:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478EA10E1CC;
	Sat, 24 Dec 2022 07:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF09610E1CC
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Dec 2022 07:35:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-03 (Coremail) with SMTP id rQCowADn7JTJq6Zj1ihdCA--.4680S2;
 Sat, 24 Dec 2022 15:35:37 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: gregkh@linuxfoundation.org
Subject: Re: [PATCH v3] usb: gadget: aspeed_udc: Add check for
 dma_alloc_coherent
Date: Sat, 24 Dec 2022 15:35:36 +0800
Message-Id: <20221224073536.24889-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADn7JTJq6Zj1ihdCA--.4680S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur4UGF4UXr1UZFW3Wry3Arb_yoWDKrgEkr
 4UuFW7C34UZF98tF17J34ayrWDKF95Z3s5WF1q9FnxZa43JayxXr4Uuryv9a13ZF1xCFs3
 Cw15JanrXa4FgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
 8cxan2IY04v7MxkIecxEwVAFwVW8CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
 0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUm-eOUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-aspeed@lists.ozlabs.org,
 andrew@aj.id.au, neal_liu@aspeedtech.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org, joel@jms.id.au,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 10:54:37PM +0800, Greg KH wrote:
>> diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
>> index 01968e2167f9..7dc2457c7460 100644
>> --- a/drivers/usb/gadget/udc/aspeed_udc.c
>> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
>> @@ -1516,6 +1516,10 @@ static int ast_udc_probe(struct platform_device *pdev)
>>  					  AST_UDC_EP_DMA_SIZE *
>>  					  AST_UDC_NUM_ENDPOINTS,
>>  					  &udc->ep0_buf_dma, GFP_KERNEL);
>> +	if (!udc->ep0_buf) {
>> +		rc = -ENOMEM;
>> +		goto err;
>> +	}
>>  
>>  	udc->gadget.speed = USB_SPEED_UNKNOWN;
>>  	udc->gadget.max_speed = USB_SPEED_HIGH;
>> -- 
>> 2.25.1
>> 
> 
> Why is this just a duplicate of the patch previously submitted here:
> 	https://lore.kernel.org/r/20221125092833.74822-1-yuancan@huawei.com
> 
> confused,
> 
> greg k-h

Yes, it is the same as mine.
As the previous patch had not been merged into the Linux kernel,
my tool found the same error and report it.
And both of us chose the most concise way to fix the error.
That is why the patches are the same.

Thanks,
Jiang

