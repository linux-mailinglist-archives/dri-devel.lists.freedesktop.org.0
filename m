Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE37105F6
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 09:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40F110E7AF;
	Thu, 25 May 2023 07:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB9C10E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 07:09:36 +0000 (UTC)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 May
 2023 15:09:33 +0800
Message-ID: <9b94aa47-31ee-b9ab-ccf3-3afcd67c2e19@aspeedtech.com>
Date: Thu, 25 May 2023 15:09:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/ast: Fix long time waiting on s3/s4 resume
To: Thomas Zimmermann <tzimmermann@suse.de>, <airlied@redhat.com>
References: <20230414074204.5787-1-jammy_huang@aspeedtech.com>
 <9d98962c-a508-e6ff-00cf-7c1927cce1da@aspeedtech.com>
 <ec2dd80d-26dc-a35d-df15-386d3e5daf70@suse.de>
Content-Language: en-US
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <ec2dd80d-26dc-a35d-df15-386d3e5daf70@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thanks for your review.

On 2023/5/24 下午 06:41, Thomas Zimmermann wrote:
> Hi,
>
> sorry that this took so long.
>
> Am 24.05.23 um 04:34 schrieb Jammy Huang:
>> Hi Thomas,
>>
>> Could you help review this patch?
>>
>> This is an issue leading to kernel panic found by Intel. Wendy has 
>> confirmed issue resolved by this patch.
>>
>> On 2023/4/14 下午 03:42, Jammy Huang wrote:
>>> In resume, DP's launch function, ast_dp_launch, could wait at most 30
>>> seconds before timeout to check if DP is enabled.
>>>
>>> To avoid this problem, we only check if DP enable or not at driver 
>>> probe.
>>>
>
> You should say what the problem is. Has the DP always been disabled? 
> Is the DP only disabled after resume? Or is it a firmware bug?

The problem is that It could lead to 'DPM device timeout' and trigger 
unrecoverable kernel panic. I will describe
the problem more clearly.

>
> If you have the name/email of "wendy.wang", you should probably 
> mention her in a Reported-by tag here.
>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217278
>
> This should be
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217278
>
>>> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
OK, thanks for corrections.
>
> With these changes considered, feel free to add
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> But I cannot test the patch or even verify the bugfix.
>
> I do have comments below that you might want to consider as well.
>
>>> ---
>>>   v2 changes:
>>>    - Fix build error.
>>> ---
>>>   drivers/gpu/drm/ast/ast_dp.c   | 55 
>>> +++++++++++-----------------------
>>>   drivers/gpu/drm/ast/ast_drv.h  |  2 +-
>>>   drivers/gpu/drm/ast/ast_main.c | 11 +++++--
>>>   drivers/gpu/drm/ast/ast_post.c |  3 +-
>>>   4 files changed, 29 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c 
>>> b/drivers/gpu/drm/ast/ast_dp.c
>>> index 56483860306b..eee2f264c880 100644
>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>> @@ -119,53 +119,32 @@ int ast_astdp_read_edid(struct drm_device 
>>> *dev, u8 *ediddata)
>>>   /*
>>>    * Launch Aspeed DP
>>>    */
>>> -void ast_dp_launch(struct drm_device *dev, u8 bPower)
>>> +void ast_dp_launch(struct drm_device *dev)
>>>   {
>>> -    u32 i = 0, j = 0, WaitCount = 1;
>>> -    u8 bDPTX = 0;
>>> +    u32 i = 0;
>>>       u8 bDPExecute = 1;
>>> -
>>>       struct ast_private *ast = to_ast_private(dev);
>>> -    // S3 come back, need more time to wait BMC ready.
>>> -    if (bPower)
>>> -        WaitCount = 300;
>>> -
>>> -
>>> -    // Wait total count by different condition.
>>> -    for (j = 0; j < WaitCount; j++) {
>>> -        bDPTX = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>>> TX_TYPE_MASK);
>>> -
>>> -        if (bDPTX)
>>> -            break;
>>> +    // Wait one second then timeout.
>>> +    while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>>> COPROCESSOR_LAUNCH) !=
>>> +        COPROCESSOR_LAUNCH) {
>>> +        i++;
>>> +        // wait 100 ms
>>>           msleep(100);
>>> -    }
>>> -    // 0xE : ASTDP with DPMCU FW handling
>>> -    if (bDPTX == ASTDP_DPMCU_TX) {
>>> -        // Wait one second then timeout.
>>> -        i = 0;
>>> -
>>> -        while (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>>> COPROCESSOR_LAUNCH) !=
>>> -            COPROCESSOR_LAUNCH) {
>>> -            i++;
>>> -            // wait 100 ms
>>> -            msleep(100);
>>> -
>>> -            if (i >= 10) {
>>> -                // DP would not be ready.
>>> -                bDPExecute = 0;
>>> -                break;
>>> -            }
>>> +        if (i >= 10) {
>>> +            // DP would not be ready.
>>> +            bDPExecute = 0;
>>> +            break;
>>>           }
>>> +    }
>>> -        if (bDPExecute)
>>> -            ast->tx_chip_types |= BIT(AST_TX_ASTDP);
>>> +    if (!bDPExecute)
>>> +        drm_err(dev, "Wait DPMCU executing timeout\n");
>
> If waiting fails, should the function return an error? The caller 
> could then disable the DP functionality.

The check for COPROCESSOR_LAUNCH is actually MCU running status on BMC. 
For some cases, the execution
of MCU on BMC could be halted, which leads to failure on check for this 
status. But DP is workable after BMC
release the execution of MCU. Thus, we do not want to disable DP 
functionality here.

>>> -        ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
>>> -                            (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
>>> -                            ASTDP_HOST_EDID_READ_DONE);
>>> -    }
>>> +    ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE5,
>>> +                   (u8) ~ASTDP_HOST_EDID_READ_DONE_MASK,
>>> +                   ASTDP_HOST_EDID_READ_DONE);
>>>   }
>>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>>> b/drivers/gpu/drm/ast/ast_drv.h
>>> index d51b81fea9c8..15e86394be4f 100644
>>> --- a/drivers/gpu/drm/ast/ast_drv.h
>>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>>> @@ -498,7 +498,7 @@ struct ast_i2c_chan *ast_i2c_create(struct 
>>> drm_device *dev);
>>>   /* aspeed DP */
>>>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>>> -void ast_dp_launch(struct drm_device *dev, u8 bPower);
>>> +void ast_dp_launch(struct drm_device *dev);
>>>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>>>   void ast_dp_set_on_off(struct drm_device *dev, bool no);
>>>   void ast_dp_set_mode(struct drm_crtc *crtc, struct 
>>> ast_vbios_mode_info *vbios_mode);
>>> diff --git a/drivers/gpu/drm/ast/ast_main.c 
>>> b/drivers/gpu/drm/ast/ast_main.c
>>> index f83ce77127cb..8ecddf20113f 100644
>>> --- a/drivers/gpu/drm/ast/ast_main.c
>>> +++ b/drivers/gpu/drm/ast/ast_main.c
>>> @@ -254,8 +254,13 @@ static int ast_detect_chip(struct drm_device 
>>> *dev, bool *need_post)
>>>           case 0x0c:
>>>               ast->tx_chip_types = AST_TX_DP501_BIT;
>>>           }
>>> -    } else if (ast->chip == AST2600)
>>> -        ast_dp_launch(&ast->base, 0);
>>> +    } else if (ast->chip == AST2600) {
>>> +        if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>>> TX_TYPE_MASK) ==
>>> +            ASTDP_DPMCU_TX) {
>>> +            ast->tx_chip_types = AST_TX_ASTDP_BIT;
>>> +            ast_dp_launch(&ast->base);
>
> Here, if ast_dp_launch() would return an error, we would not set the 
> chip type. The driver would then disable further support. That appears 
> to be preferable to me. (?)
>
> Best regards
> Thomas
>
>>> +        }
>>> +    }
>>>       /* Print stuff for diagnostic purposes */
>>>       if (ast->tx_chip_types & AST_TX_NONE_BIT)
>>> @@ -264,6 +269,8 @@ static int ast_detect_chip(struct drm_device 
>>> *dev, bool *need_post)
>>>           drm_info(dev, "Using Sil164 TMDS transmitter\n");
>>>       if (ast->tx_chip_types & AST_TX_DP501_BIT)
>>>           drm_info(dev, "Using DP501 DisplayPort transmitter\n");
>>> +    if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
>>> +        drm_info(dev, "Using ASPEED DisplayPort transmitter\n");
>>>       return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/ast/ast_post.c 
>>> b/drivers/gpu/drm/ast/ast_post.c
>>> index 82fd3c8adee1..90e40f59aff7 100644
>>> --- a/drivers/gpu/drm/ast/ast_post.c
>>> +++ b/drivers/gpu/drm/ast/ast_post.c
>>> @@ -380,7 +380,8 @@ void ast_post_gpu(struct drm_device *dev)
>>>       ast_set_def_ext_reg(dev);
>>>       if (ast->chip == AST2600) {
>>> -        ast_dp_launch(dev, 1);
>>> +        if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
>>> +            ast_dp_launch(dev);
>>>       } else if (ast->config_mode == ast_use_p2a) {
>>>           if (ast->chip == AST2500)
>>>               ast_post_chip_2500(dev);
>>>
>>> base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
>>
>
-- 
Best Regards
Jammy

