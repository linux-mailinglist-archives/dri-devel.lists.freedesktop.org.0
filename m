Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C449E750B2C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44E410E550;
	Wed, 12 Jul 2023 14:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C5110E551
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689172798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grVr7j2Zm3eT0DcrwM1TdH58S0mbuqk+O8OKMnnwukY=;
 b=J/cMfNQX86Tm1HYBMwHC+ocE0t2ZeZMn1T805uk3zmhCZkFdYG5fYgK9o/Xjdx3Zr/Pucf
 /6+APpAhGpaL5jRJdwDJYVJ5xyL60Z9q8Y+9Px2Mu/N9h2Zu3Y+W4weze+VX6QNT0Oru84
 Rs++EXleTdlZ9tqY5aoPFpfQGnCBRgU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-H9NPVz08Om-8OdIiUTIK8g-1; Wed, 12 Jul 2023 10:39:57 -0400
X-MC-Unique: H9NPVz08Om-8OdIiUTIK8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbe4cecd66so41028775e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 07:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689172796; x=1691764796;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=grVr7j2Zm3eT0DcrwM1TdH58S0mbuqk+O8OKMnnwukY=;
 b=Tp55bG5OP25vDBh1odMkzqpm/3d0S+9jP9q8asnRiU47eqSCi3Bl9K3WlwVfcyPlow
 +IO+TS+gl7/ZtlzkTjBGSEXlyBpnm1/gqXj5lDAKu66btuWUijXU+4J3Oq+Nr1Eb+x0L
 Ee4qbH3yrGY/mxoo+RwSdi74k3Upun/rl8JoIfLPsGyP7LeXE0LgrskF2x7ISndos8Bo
 1J74mkrxfnANFaAAVlFk7AGFLtt3HBEflAOsgZd0vWhSKiyCDk8trJRtH6QC7/h1qjSZ
 LEo4qey664RCpe2r7RmME22lx+OtLT1n/K38tWsWf8SN/8LCJmZ4gOC9d+MG8OBkEXuP
 OXKA==
X-Gm-Message-State: ABy/qLZv7pH1AjdcQkJjLKgGCD+DsJv0qpoCwJaxWWyBZHlO/5gjuTt1
 5vwaJ9IcLskju3qFtiY+i/chzSuR2fYJ7lutwZMcAQRT41bkODsTgevbX1A6ghBp353glGDLppk
 vvz9QRlwnbaaX5voQDSaiRGw+dt0A
X-Received: by 2002:a1c:4b18:0:b0:3fb:ab76:164b with SMTP id
 y24-20020a1c4b18000000b003fbab76164bmr17211872wma.13.1689172796541; 
 Wed, 12 Jul 2023 07:39:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFXBILLxhmWBDRocNFaSxcIbyor29XZrrqFME/pQVBdx4xWzAIr5zPQEGUOnq85l9O2gUGecA==
X-Received: by 2002:a1c:4b18:0:b0:3fb:ab76:164b with SMTP id
 y24-20020a1c4b18000000b003fbab76164bmr17211847wma.13.1689172796173; 
 Wed, 12 Jul 2023 07:39:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c248b00b003fc00789d5bsm5304200wms.1.2023.07.12.07.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 07:39:55 -0700 (PDT)
Message-ID: <af5ab6ed-2f8f-f02e-bc5d-9d13d9e8c87a@redhat.com>
Date: Wed, 12 Jul 2023 16:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/2] drm/ast: report connection status on Display Port.
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230712132826.287126-1-jfalempe@redhat.com>
 <20230712132826.287126-2-jfalempe@redhat.com>
 <e37d95f9-bcb5-237a-4c7e-2ae38f8b247d@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <e37d95f9-bcb5-237a-4c7e-2ae38f8b247d@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/07/2023 15:55, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.07.23 um 15:27 schrieb Jocelyn Falempe:
>> Aspeed always report the display port as "connected", because it
>> doesn't set a .detect callback.
>> Fix this by providing the proper detect callback for astdp and dp501.
>>
>> This also fixes the following regression:
>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>> EDID on DP")
>> The default resolution is now 640x480 when no monitor is connected. But
>> Aspeed graphics is mostly used in servers, where no monitor is attached.
>> This also affects the remote BMC resolution to 640x480, which is
>> inconvenient, and breaks the anaconda installer.
> 
> The formatting of these paragraphs still looks off.

ok, I think it's because I start a new line in the middle of the 
sentence, before "The default resolution ..." ?
I will fix that.
> 
> It just occured to me that you probably want output polling to make 
> detection work dynamically. See an old patch of mine on how that works:
> 
> https://patchwork.freedesktop.org/patch/488460/

So, if I understand well, I just need to add:

connector->polled = DRM_CONNECTOR_POLL_CONNECT | 
DRM_CONNECTOR_POLL_DISCONNECT;

and call drm_kms_helper_poll_init() ?
> 
> We also get an interrupt when the connector state changes, but IDK how 
> that has to be handled. So polling is the next best thing. Sorry for 
> missing this in the earlier reviews.

Yes, there is no irq configured in the ast driver, so let's fallback to 
polling.

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>>
>> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
>> v3: Use .detect_ctx callback, and refactors (Thomas Zimmermann)
>>      Add a BMC virtual connector
>> v4: Better indent detect_ctx() functions (Thomas Zimmermann)
>>
>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID 
>> on DP")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c    | 11 ++++++++++
>>   drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
>>   drivers/gpu/drm/ast/ast_drv.h   |  2 ++
>>   drivers/gpu/drm/ast/ast_mode.c  | 25 ++++++++++++++++++++++
>>   4 files changed, 63 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 6dc1a09504e1..bf78f3d4aa3f 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -7,6 +7,17 @@
>>   #include <drm/drm_print.h>
>>   #include "ast_drv.h"
>> +bool ast_astdp_is_connected(struct ast_device *ast)
>> +{
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>> ASTDP_MCU_FW_EXECUTING))
>> +        return false;
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 
>> ASTDP_LINK_SUCCESS))
>> +        return false;
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, ASTDP_HPD))
>> +        return false;
>> +    return true;
>> +}
>> +
>>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>>   {
>>       struct ast_device *ast = to_ast_device(dev);
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c 
>> b/drivers/gpu/drm/ast/ast_dp501.c
>> index a5d285850ffb..f10d53b0c94f 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>> @@ -272,11 +272,9 @@ static bool ast_launch_m68k(struct drm_device *dev)
>>       return true;
>>   }
>> -bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>> +bool ast_dp501_is_connected(struct ast_device *ast)
>>   {
>> -    struct ast_device *ast = to_ast_device(dev);
>> -    u32 i, boot_address, offset, data;
>> -    u32 *pEDIDidx;
>> +    u32 boot_address, offset, data;
>>       if (ast->config_mode == ast_use_p2a) {
>>           boot_address = get_fw_base(ast);
>> @@ -292,14 +290,6 @@ bool ast_dp501_read_edid(struct drm_device *dev, 
>> u8 *ediddata)
>>           data = ast_mindwm(ast, boot_address + offset);
>>           if (!(data & AST_DP501_PNP_CONNECTED))
>>               return false;
>> -
>> -        /* Read EDID */
>> -        offset = AST_DP501_EDID_DATA;
>> -        for (i = 0; i < 128; i += 4) {
>> -            data = ast_mindwm(ast, boot_address + offset + i);
>> -            pEDIDidx = (u32 *)(ediddata + i);
>> -            *pEDIDidx = data;
>> -        }
>>       } else {
>>           if (!ast->dp501_fw_buf)
>>               return false;
>> @@ -319,7 +309,30 @@ bool ast_dp501_read_edid(struct drm_device *dev, 
>> u8 *ediddata)
>>           data = readl(ast->dp501_fw_buf + offset);
>>           if (!(data & AST_DP501_PNP_CONNECTED))
>>               return false;
>> +    }
>> +    return true;
>> +}
>> +
>> +bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>> +{
>> +    struct ast_device *ast = to_ast_device(dev);
>> +    u32 i, boot_address, offset, data;
>> +    u32 *pEDIDidx;
>> +
>> +    if (!ast_dp501_is_connected(ast))
>> +        return false;
>> +
>> +    if (ast->config_mode == ast_use_p2a) {
>> +        boot_address = get_fw_base(ast);
>> +        /* Read EDID */
>> +        offset = AST_DP501_EDID_DATA;
>> +        for (i = 0; i < 128; i += 4) {
>> +            data = ast_mindwm(ast, boot_address + offset + i);
>> +            pEDIDidx = (u32 *)(ediddata + i);
>> +            *pEDIDidx = data;
>> +        }
>> +    } else {
>>           /* Read EDID */
>>           offset = AST_DP501_EDID_DATA;
>>           for (i = 0; i < 128; i += 4) {
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index c9659e72002f..848a9f1403e8 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -514,6 +514,7 @@ void ast_patch_ahb_2500(struct ast_device *ast);
>>   /* ast dp501 */
>>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
>> +bool ast_dp501_is_connected(struct ast_device *ast);
>>   bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
>>   u8 ast_get_dp501_max_clk(struct drm_device *dev);
>>   void ast_init_3rdtx(struct drm_device *dev);
>> @@ -522,6 +523,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>>   struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>>   /* aspeed DP */
>> +bool ast_astdp_is_connected(struct ast_device *ast);
>>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>>   void ast_dp_launch(struct drm_device *dev);
>>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 1a8293162fec..75a84817a57d 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1582,8 +1582,21 @@ static int 
>> ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>>       return 0;
>>   }
>> +static int ast_dp501_connector_helper_detect_ctx(struct drm_connector 
>> *connector,
>> +                         struct drm_modeset_acquire_ctx *ctx,
>> +                         bool force)
>> +{
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +
>> +    if (ast_dp501_is_connected(ast))
>> +        return connector_status_connected;
>> +    return connector_status_disconnected;
>> +}
>> +
>> +
>>   static const struct drm_connector_helper_funcs 
>> ast_dp501_connector_helper_funcs = {
>>       .get_modes = ast_dp501_connector_helper_get_modes,
>> +    .detect_ctx = ast_dp501_connector_helper_detect_ctx,
>>   };
>>   static const struct drm_connector_funcs ast_dp501_connector_funcs = {
>> @@ -1680,8 +1693,20 @@ static int 
>> ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>>       return 0;
>>   }
>> +static int ast_astdp_connector_helper_detect_ctx(struct drm_connector 
>> *connector,
>> +                         struct drm_modeset_acquire_ctx *ctx,
>> +                         bool force)
>> +{
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +
>> +    if (ast_astdp_is_connected(ast))
>> +        return connector_status_connected;
>> +    return connector_status_disconnected;
>> +}
>> +
>>   static const struct drm_connector_helper_funcs 
>> ast_astdp_connector_helper_funcs = {
>>       .get_modes = ast_astdp_connector_helper_get_modes,
>> +    .detect_ctx = ast_astdp_connector_helper_detect_ctx,
>>   };
>>   static const struct drm_connector_funcs ast_astdp_connector_funcs = {
> 

