Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF0974D08E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB1910E239;
	Mon, 10 Jul 2023 08:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC5310E239
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688978928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnT1tPuR/VUaxYcwdc5fja6B+nVCta9u8R8VI7JBzTU=;
 b=eHdCClxV2F71FlfgwH62KcyxTfu+qKAlKGfXi+yJWOr+HRW/2mr8CHmPPFoki4fKOhYps/
 6+YNdqxjIjguE3LIub4AtkmH+eCPtlr+VQPehXhDuMgu4wmnDdk36tlRrX5fifwKc467ZK
 Zd6cY0CCJRO8xYpHKyrsE/KTuVHuUXI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-LkLDkT2qOH-ip04OMwL5FA-1; Mon, 10 Jul 2023 04:48:47 -0400
X-MC-Unique: LkLDkT2qOH-ip04OMwL5FA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-314291caa91so2294531f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688978926; x=1691570926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VnT1tPuR/VUaxYcwdc5fja6B+nVCta9u8R8VI7JBzTU=;
 b=QNlo+iJylumP3WV7sla8jeywQhU0aDYYUzHibbKOGVV61UH80cNJAY3rRew9rlZF2T
 6lMLxeWg1ryGIn6G2VltMali/Ztv/fKf/1/tQQI8o25X6yBM66OjG/suJW1kOXGllZ5F
 n3bN5JIdyzY8iZmUb3z6s4cE+Tfi13lrb/9Wj8xe2x6NASTu8rZZ3w4K2GzBpI5m8bnD
 LPh60mg29vXgOvVK/ULxqAgMixu6xOTl6d+IhgT7jfm3LTx9d2RHhA7LEPS6dLqk7Q1N
 Hlby+YexFcPXQ6O/3BQZ3PHEkGFRNGVGY/b8oAYbY4LB7/f+yg6PllsBbciOM7IHuuxJ
 mFhw==
X-Gm-Message-State: ABy/qLZMI4t2Am99RQw7ojZk5KyOZHXFngvlmlAI9t+pFwAlDX5AWZ+9
 ZMLtJ3Ov/jkHrDKqhopD/L9NOjx1C8L2ok/oMJLxgOk6uWIdWjXKLiPMMx7mSVwO0EIutDlTeXZ
 ry37pYDgmp7YzxeJL3IJb2dproK05
X-Received: by 2002:a5d:5142:0:b0:313:eeb3:c57a with SMTP id
 u2-20020a5d5142000000b00313eeb3c57amr10583157wrt.15.1688978926321; 
 Mon, 10 Jul 2023 01:48:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEl0Ilw0F0+BPI0872WaPo4+iStmZh/KToecW4TsTdIu8X5u+tYgKyHVbjgWTkl4gKbZOFrug==
X-Received: by 2002:a5d:5142:0:b0:313:eeb3:c57a with SMTP id
 u2-20020a5d5142000000b00313eeb3c57amr10583145wrt.15.1688978925976; 
 Mon, 10 Jul 2023 01:48:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 t18-20020adff052000000b0031433443265sm11173875wro.53.2023.07.10.01.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 01:48:45 -0700 (PDT)
Message-ID: <f5a4229f-2543-d6e2-1845-5d24ab462cf8@redhat.com>
Date: Mon, 10 Jul 2023 10:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/ast: report connection status on Display Port.
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com
References: <20230706100102.563458-1-jfalempe@redhat.com>
 <adbab7c1-2dee-1f00-dbf9-ef63bd9b51c9@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <adbab7c1-2dee-1f00-dbf9-ef63bd9b51c9@suse.de>
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

On 10/07/2023 08:57, Thomas Zimmermann wrote:
> Hi Jocelyn
> 
> Am 06.07.23 um 11:58 schrieb Jocelyn Falempe:
>> Aspeed always report the display port as "connected", because it
>> doesn't set a .detect callback.
>> Fix this by providing the proper detect callback for astdp and dp501.
>>
>> This also fixes the following regression:
>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>   EDID on DP")
>> The default resolution is now 640x480 when no monitor is connected.
>> But Aspeed graphics is mostly used in servers, where no monitor
>> is attached. This also affects the remote BMC resolution to 640x480,
>> which is inconvenient, and breaks the anaconda installer.
> 
> The formating of these paraghraphs looks off.

Ok

> 
>>
>> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Maybe add Fixes with the patch that added the DP default resolution. 
> It's not really correct, but at least tells people to consider your patch.
> 
> I assume that you'll send another patch with the BMC connector?

Yes, this patch alone will break more systems than what it tries to fix.

> 
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c    |  9 ++++++++
>>   drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
>>   drivers/gpu/drm/ast/ast_drv.h   |  2 ++
>>   drivers/gpu/drm/ast/ast_mode.c  | 24 +++++++++++++++++++++
>>   4 files changed, 60 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 6dc1a09504e1..fbc154930fdf 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -7,6 +7,15 @@
>>   #include <drm/drm_print.h>
>>   #include "ast_drv.h"
>> +bool ast_astdp_is_connected(struct ast_device *ast)
>> +{
>> +    if (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>> ASTDP_MCU_FW_EXECUTING) &&
>> +        ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 
>> ASTDP_LINK_SUCCESS) &&
>> +        ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, ASTDP_HPD))
> 
> The indention of those two lines is off.
> 
> You could also rewrite this as
> 
>   if (!a)
>     return false;
>   if (!b)
>     return false;
>   if (!c)
>     return false;
>   return true;

ok

> 
>> +        return true;
>> +    return false;
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
>> index 3f6e0c984523..99a24d779b9c 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -510,6 +510,7 @@ void ast_patch_ahb_2500(struct ast_device *ast);
>>   /* ast dp501 */
>>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
>> +bool ast_dp501_is_connected(struct ast_device *ast);
>>   bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
>>   u8 ast_get_dp501_max_clk(struct drm_device *dev);
>>   void ast_init_3rdtx(struct drm_device *dev);
>> @@ -518,6 +519,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>>   struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>>   /* aspeed DP */
>> +bool ast_astdp_is_connected(struct ast_device *ast);
>>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>>   void ast_dp_launch(struct drm_device *dev);
>>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index f711d592da52..ccf48d57d239 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1586,12 +1586,24 @@ static const struct drm_connector_helper_funcs 
>> ast_dp501_connector_helper_funcs
>>       .get_modes = ast_dp501_connector_helper_get_modes,
>>   };
>> +static enum drm_connector_status ast_dp501_connector_helper_detect(
>> +    struct drm_connector *connector,
>> +    bool force)
>> +{
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +
>> +    if (ast_dp501_is_connected(ast))
>> +        return connector_status_connected;
>> +    return connector_status_disconnected;
>> +}
> 
> It seems more appropriate to implement this as connector helper func 
> detect_ctx. It does the same in practice, but the detect funtionality is 
> rather part of the helpers.

ok, it looks easy to switch to detect_ctx().

> 
>> +
>>   static const struct drm_connector_funcs ast_dp501_connector_funcs = {
>>       .reset = drm_atomic_helper_connector_reset,
>>       .fill_modes = drm_helper_probe_single_connector_modes,
>>       .destroy = drm_connector_cleanup,
>>       .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>>       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +    .detect = ast_dp501_connector_helper_detect,
> 
> That might sound pedantic, but I'd prefer to have the assignments sorted 
> as in the struct's definiation. :) So .detect would be set just below 
> .reset.

ok, I was wondering what the order was, as it was not alphabetically.

> 
>>   };
>>   static int ast_dp501_connector_init(struct drm_device *dev, struct 
>> drm_connector *connector)
>> @@ -1684,12 +1696,24 @@ static const struct drm_connector_helper_funcs 
>> ast_astdp_connector_helper_funcs
>>       .get_modes = ast_astdp_connector_helper_get_modes,
>>   };
>> +static enum drm_connector_status ast_astdp_connector_helper_detect(
>> +    struct drm_connector *connector,
>> +    bool force)
>> +{
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +
>> +    if (ast_astdp_is_connected(ast))
>> +        return connector_status_connected;
>> +    return connector_status_disconnected;
>> +}
>> +
>>   static const struct drm_connector_funcs ast_astdp_connector_funcs = {
>>       .reset = drm_atomic_helper_connector_reset,
>>       .fill_modes = drm_helper_probe_single_connector_modes,
>>       .destroy = drm_connector_cleanup,
>>       .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>>       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +    .detect = ast_astdp_connector_helper_detect,
> 
> Same here.
> 
> Best regards
> Thomas
> 
>>   };
>>   static int ast_astdp_connector_init(struct drm_device *dev, struct 
>> drm_connector *connector)
>>
>> base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2
> 

Thanks for your review.
I will try to add a virtual BMC connector, and send a v3.

-- 

Jocelyn

