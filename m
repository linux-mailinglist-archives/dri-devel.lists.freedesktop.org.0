Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B2751C9D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7010E647;
	Thu, 13 Jul 2023 09:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A13610E647
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:05:35 +0000 (UTC)
Received: from [192.168.2.181] (192.168.2.181) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 Jul
 2023 17:05:31 +0800
Message-ID: <2b1c2a6c-c912-d24f-b622-7a3f1cec89aa@aspeedtech.com>
Date: Thu, 13 Jul 2023 17:05:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
To: Jocelyn Falempe <jfalempe@redhat.com>, <tzimmermann@suse.de>,
 <airlied@redhat.com>, <kuohsiang_chou@aspeedtech.com>,
 <jani.nikula@linux.intel.com>, <dianders@chromium.org>
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
 <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
 <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
Content-Language: en-US
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.181]
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

On 2023/7/13 下午 04:17, Jocelyn Falempe wrote:
> On 13/07/2023 09:00, Jammy Huang wrote:
>> Hi Jocelyn,
>>
>> Thanks for your work.
>>
>> On 2023/7/13 下午 02:40, Jocelyn Falempe wrote:
>>> Aspeed always report the display port as "connected", because it
>>> doesn't set a .detect_ctx callback.
>>> Fix this by providing the proper detect callback for astdp and dp501.
>>>
>>> This also fixes the following regression:
>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>> EDID on DP") The default resolution is now 640x480 when no monitor is
>>> connected. But Aspeed graphics is mostly used in servers, where no 
>>> monitor
>>> is attached. This also affects the remote BMC resolution to 640x480, 
>>> which
>>> is inconvenient, and breaks the anaconda installer.
>>>
>>> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
>>> v3: Use .detect_ctx callback, and refactors (Thomas Zimmermann)
>>>      Add a BMC virtual connector
>>> v4: Better indent detect_ctx() functions (Thomas Zimmermann)
>>> v5: Enable polling of the dp and dp501 connector status
>>>      (Thomas Zimmermann)
>>>
>>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no 
>>> EDID on DP")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/ast/ast_dp.c    | 11 ++++++++++
>>>   drivers/gpu/drm/ast/ast_dp501.c | 37 
>>> ++++++++++++++++++++++-----------
>>>   drivers/gpu/drm/ast/ast_drv.h   |  2 ++
>>>   drivers/gpu/drm/ast/ast_mode.c  | 31 +++++++++++++++++++++++++--
>>>   4 files changed, 67 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c 
>>> b/drivers/gpu/drm/ast/ast_dp.c
>>> index 6dc1a09504e1..bf78f3d4aa3f 100644
>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>> @@ -7,6 +7,17 @@
>>>   #include <drm/drm_print.h>
>>>   #include "ast_drv.h"
>>> +bool ast_astdp_is_connected(struct ast_device *ast)
>>> +{
>>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>>> ASTDP_MCU_FW_EXECUTING))
>>> +        return false;
>>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 
>>> ASTDP_LINK_SUCCESS))
>>> +        return false;
>>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, 
>>> ASTDP_HPD))
>>> +        return false;
>>> +    return true;
>>> +}
>>
>> * ASPDP_LINK_SUCCESS is true, when DP link training is finished. The 
>> DP link quality is good
>>
>> enough to deliver video data.
>>
>> * ASTDP_HPD is true, when there is DP sink pull high HPD.
>>
>> Thus, ASTDP_HPD is the prerequisite of ASTDP_LINK_SUCCESS. I would 
>> suggest to remove
>>
>> the check for ASTDP_LINK_SUCCESS here. ASTDP_HPD is good enough for 
>> connected status.
>>
>> If you want to check all these three status, please change the order, 
>> FW_EXECUTING -> HPD ->
>>
>> LINK_SUCCESS.
>
> Thanks for the detailed explanations.
> I looked at other drivers to see if HPD is good enough for "connected" 
> status, but I didn't find a clear answer.
> There is also a drm_link_status, but that looks to be mostly unused.
> https://elixir.bootlin.com/linux/latest/source/include/drm/drm_connector.h#L331 
>
>
> So I think I will follow your suggestion, and remove the check for 
> ASTDP_LINK_SUCCESS.
>
>
> For the BMC connector patch, you know if there is a register setting I 
> can check to see if a BMC is present or not ?

I think you can use VGA CRD0[7] whose definition is as below:

DRAM Initial Selection (see note 1)
0: VBIOS Initial the DRAM
1: SOC Firmware Initial the DRAM

If CRD0[7] is 1, there is BMC.

>
> Best regards,
>
-- 
Best Regards
Jammy

