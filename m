Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF96E8E44
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 11:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159A210E27F;
	Thu, 20 Apr 2023 09:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9963D10E27F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 09:37:14 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 33K9Kcq1063608;
 Thu, 20 Apr 2023 17:20:38 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 20 Apr
 2023 17:37:00 +0800
Message-ID: <325512ba-b468-bca0-d3ef-a1c9cf464d62@aspeedtech.com>
Date: Thu, 20 Apr 2023 17:37:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/ast: Fix ARM compatibility
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, <airlied@redhat.com>
References: <20230420080947.27226-1-jammy_huang@aspeedtech.com>
 <61edb9d3-11f5-42de-633d-6e6253ce021f@suse.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <61edb9d3-11f5-42de-633d-6e6253ce021f@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 33K9Kcq1063608
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for help. I will update a new patch per your comments

On 2023/4/20 下午 04:57, Thomas Zimmermann wrote:
> Hi
>
> Am 20.04.23 um 10:09 schrieb Jammy Huang:
>> ARM architecture only has 'memory', so all devices are accessed by
>> MMIO if possible.
>>
>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
>> ---
>>   v2 changes:
>>    - Use MMIO after AST2500 which enable MMIO by default.
>> ---
>>   drivers/gpu/drm/ast/ast_main.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_main.c 
>> b/drivers/gpu/drm/ast/ast_main.c
>> index f83ce77127cb..d384e810fa4d 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -425,11 +425,12 @@ struct ast_private *ast_device_create(const 
>> struct drm_driver *drv,
>>           return ERR_PTR(-EIO);
>>         /*
>> -     * If we don't have IO space at all, use MMIO now and
>> -     * assume the chip has MMIO enabled by default (rev 0x20
>> -     * and higher).
>> +     * After AST2500, MMIO is enabled by default, and it should be 
>> adapted
>
> By 'adapted', you mean 'adopted'?
>
> Apart from that:
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> I also ran this patch on an AST2100, which still works as before.
>
> Best regards
> Thomas
>
>> +     * to be compatible with Arm.
>>        */
>> -    if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
>> +    if (pdev->revision >= 0x40) {
>> +        ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
>> +    } else if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
>>           drm_info(dev, "platform has no IO space, trying MMIO\n");
>>           ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
>>       }
>>
>> base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
>
-- 
Best Regards
Jammy

