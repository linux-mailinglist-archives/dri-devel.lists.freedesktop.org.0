Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B065751C7E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F62910E643;
	Thu, 13 Jul 2023 09:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448D889336
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689238822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xslvHIozzfNk1Ol0QMKEqDbBJWPkHKwS2Uj7vPyaEHI=;
 b=cp7Ru7p2kYV+GdmaVxv1Xne57pN6fq+YWV/RCjL8W47r8s+i8L1Sn0n36831fHpJhk2L5N
 o8sPpez+kEuz+1/gPo5oL5nnqFIDmvwrVPRtqZqrCpjPaTCINgzJfV4bSrlSD6qDRVJ84I
 /5J+H8WoHcCUaLyNmTWKmEmp+UNzsHc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-aeTZNrShP8Oqwlghd8AHGA-1; Thu, 13 Jul 2023 05:00:21 -0400
X-MC-Unique: aeTZNrShP8Oqwlghd8AHGA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b7430d23ffso4411551fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689238819; x=1691830819;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xslvHIozzfNk1Ol0QMKEqDbBJWPkHKwS2Uj7vPyaEHI=;
 b=LsN5EIG0VRSdQWNitzMbLXimuGR9/vAWM25GU7v9GgfV3PSOJ15WhvPLg0vw1GIhOF
 j1wHCZX1AJ8YwGYx+0R+IpCRW+zrEgpEBafFgiKZSQXDfDxx/SJcwwXdbFgGnTYAjFhn
 bqg198yuPWWeZQZptrLKR2/0lfPPyb8TuM3tlglLbu3TsfUoWKKbfQSAzlaWk2sG8JkX
 Oso7zwvbH4wvTzlP8Q5j9dtwF6lTeLaN61/b2Q7lcfpu24aYpaVeB1pdh5rW1hNUMX15
 LG69B5s165sz5Vjm8sAZKqQ0Axj+jgQCOUL0bAbnZSq15kQMnPkUl2kB+W8rK1fzHiqR
 sCXg==
X-Gm-Message-State: ABy/qLaGqqW0ud0mgrFik4Q0uGzdxuPybbCkGiFJErcqTr0iugplF8mW
 az7Uk+gK0Rhly8JgnAAJ2qPaaEJophBTTTFGuDvwdaGGYlXjccWR2Regq2n/3zlQptX22TGLR3s
 SiwR22Z2HpYOna8ianAKPE8O67hkb
X-Received: by 2002:a05:6512:3b90:b0:4f8:7524:8431 with SMTP id
 g16-20020a0565123b9000b004f875248431mr889634lfv.44.1689238819673; 
 Thu, 13 Jul 2023 02:00:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfEtvIw0v6wbEmdoAyI5b6omYiXcn5AyP36g9NcW6I5wKsqCsmjEXaKSzCx0kM7JjX1zcczw==
X-Received: by 2002:a05:6512:3b90:b0:4f8:7524:8431 with SMTP id
 g16-20020a0565123b9000b004f875248431mr889607lfv.44.1689238819294; 
 Thu, 13 Jul 2023 02:00:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 y18-20020adffa52000000b00313f031876esm7319510wrr.43.2023.07.13.02.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 02:00:18 -0700 (PDT)
Message-ID: <ad41800f-540c-5c69-ec11-d7a7eb9db3fc@redhat.com>
Date: Thu, 13 Jul 2023 11:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
 <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
 <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
In-Reply-To: <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
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

On 13/07/2023 10:17, Jocelyn Falempe wrote:
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
>>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID 
>>> on DP")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/ast/ast_dp.c    | 11 ++++++++++
>>>   drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
>>>   drivers/gpu/drm/ast/ast_drv.h   |  2 ++
>>>   drivers/gpu/drm/ast/ast_mode.c  | 31 +++++++++++++++++++++++++--
>>>   4 files changed, 67 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
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
> So I think I will follow your suggestion, and remove the check for 
> ASTDP_LINK_SUCCESS.

I've run a test on my server, and even when nothing is plugged, the 
ASTDP_HPD is still true. So I will just change the order of the checks, 
and keep the ASTDP_LINK_SUCCESS.

Best regards,

-- 

Jocelyn
> 
> 
> For the BMC connector patch, you know if there is a register setting I 
> can check to see if a BMC is present or not ?
> 
> Best regards,
> 

