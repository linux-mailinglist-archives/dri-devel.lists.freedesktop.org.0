Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3155B8B4
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 10:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C65112883;
	Mon, 27 Jun 2022 08:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFE9112883
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656319513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeetajRxJH9k+1wiBL4+bpfxP7EvIFI/mhDbFEAam04=;
 b=L+e7TWlNbcreAYkQpMvJE4SkqFW6vy8BKeXHVGg+2BFG+5TKwjWYPT36M4xXsyjngp1hHZ
 dKuuN8zWnBFTNVzdj2Y2O5bXlfst8oz63fBKvTlQ7iqjoK29dde1reXMqNBeJx6/EURQf/
 WrtPvgp85MKT2yG+1zMJtReUgmFOcHI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-bwX8Js9FOFep6tv_eZX8cA-1; Mon, 27 Jun 2022 04:45:10 -0400
X-MC-Unique: bwX8Js9FOFep6tv_eZX8cA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020a5d69c1000000b0021b9f3abfebso1001639wrw.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 01:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zeetajRxJH9k+1wiBL4+bpfxP7EvIFI/mhDbFEAam04=;
 b=VRmdf7mxN9veI24i6zZRDgLuYYJ/rAZlHQbY2FRokjMh8IoG38B6/WYVMCfsqL5j3w
 QjOol/03ppyQOdzyistyo5U50lP47EYGz52TU1NVLJ9xdVnS7DXKPZ17vhe/TMFlVIC1
 JATuGZXOg/md3c3SbLMRepMh1DOJdZREJTTBvJqWhhIaKV3G2T2OBtTr4KNK17dPCMtT
 BThrMXte6rBjZi0HIms/7fneKvNjH3KRjKMjvUCnesKDBEiHz71IzKElZ8dTp2IWKcRa
 UZMPX3Te5QVOXrfSGno5r4wvZEqkke8Z/pKTZyGAQ7t27qdRmIjiXjyuQnPKowMJ/3HH
 erzw==
X-Gm-Message-State: AJIora/YEVFYYI6ZBQb2xPHqSyauK1ceUnmcMeLZan6H2uiLRG4aidxK
 G504sKnR1/O3FMLcxC/uEC17w4Y38s72gKbNHA4GmeiFwYqYb0g340iUN8x933kx0273mZZIDke
 Zk81GwZL+7gxA8rawDweOYIg7MeNL
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr2087309wmc.73.1656319508795; 
 Mon, 27 Jun 2022 01:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1udK8ScDlve5szWmt1SK//uvMAP09bine922WM9zojuuIGAHewovWzziHBRHiE4+VMhKZOaaw==
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id
 x22-20020a1c7c16000000b003a04c5fce13mr2087290wmc.73.1656319508548; 
 Mon, 27 Jun 2022 01:45:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfa54e000000b0021b93b29cacsm11685942wrb.99.2022.06.27.01.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 01:45:07 -0700 (PDT)
Message-ID: <e8da05d6-9dbb-0a9b-bfe5-be690e874820@redhat.com>
Date: Mon, 27 Jun 2022 10:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
To: Thomas Zimmermann <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, kuohsiang_chou@aspeedtech.com
References: <20220622124815.356035-1-jfalempe@redhat.com>
 <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
 <9db1d8fd-1778-0811-ec70-ad5bb8de00a6@redhat.com>
 <1c6517d8-396d-3a63-f4ed-f7dcd2159a2f@redhat.com>
 <cf8697fb-c979-baae-e194-ec5b6b2bc3c7@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cf8697fb-c979-baae-e194-ec5b6b2bc3c7@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: charles_kuan@aspeedtech.com, michel@daenzer.net, luke_chen@aspeedtech.com,
 Venkat Tadikonda <venkateswara.rao@intel.com>, hungju_huang@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2022 09:39, Thomas Zimmermann wrote:
> 
> 
> Am 27.06.22 um 09:31 schrieb Jocelyn Falempe:
>> On 23/06/2022 10:21, Jocelyn Falempe wrote:
>>> On 22/06/2022 20:34, Lyude Paul wrote:
>>>> Some small nitpicks:
>>>>
>>>> On Wed, 2022-06-22 at 14:48 +0200, Jocelyn Falempe wrote:
>>>>> With an AST2600, the screen is garbage when going out of suspend.
>>>>> This is because color settings are lost, and not restored on resume.
>>>>> Force the color settings on DPMS_ON, to make sure the settings are 
>>>>> correct.
>>>>>
>>>>> I didn't write this code, it comes from the out-of-tree aspeed 
>>>>> driver v1.13
>>>>> https://www.aspeedtech.com/support_driver/
>>>>>
>>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>>> Tested-by: Venkat Tadikonda <venkateswara.rao@intel.com>
>>>>
>>>> Should have a Cc: to stable imho, `dim` can do this for you:
>>>>
>>>> https://drm.pages.freedesktop.org/maintainer-tools/dim.html
>>>
>>> Sure I will add cc to stable for the v2
>>
>> In fact it doesn't apply to older kernel version, (it depends on 
>> 594e9c04b586 Create the driver for ASPEED proprietory Display-Port).
>>
>> So I think I will just push it to drm-misc-next, with the indentation 
>> fixed.
> 
> Sure, go ahead.

Applied to drm-misc-next, thank you all.

> 
>>
>>>>
>>>>> ---
>>>>>   drivers/gpu/drm/ast/ast_mode.c | 13 +++++++++++++
>>>>>   1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>>>> b/drivers/gpu/drm/ast/ast_mode.c
>>>>> index 3eb9afecd9d4..cdddcb5c4439 100644
>>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>>> @@ -990,6 +990,9 @@ static void ast_crtc_dpms(struct drm_crtc 
>>>>> *crtc, int
>>>>> mode)
>>>>>   {
>>>>>          struct ast_private *ast = to_ast_private(crtc->dev);
>>>>>          u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
>>>>> +       struct ast_crtc_state *ast_state;
>>>>> +       const struct drm_format_info *format;
>>>>> +       struct ast_vbios_mode_info *vbios_mode_info;
>>>>>          /* TODO: Maybe control display signal generation with
>>>>>           *       Sync Enable (bit CR17.7).
>>>>> @@ -1007,6 +1010,16 @@ static void ast_crtc_dpms(struct drm_crtc 
>>>>> *crtc, int
>>>>> mode)
>>>>>                          ast_dp_set_on_off(crtc->dev, 1);
>>>>>                  }
>>>>> +               ast_state = to_ast_crtc_state(crtc->state);
>>>>> +               format = ast_state->format;
>>>>> +
>>>>> +               if (format){
>>>>
>>>> Should be a space between ')' and '{'.
>>>
>>> looks like I forget to run checkpatch.pl on it before sending :(
>>>
>>> I'll wait a bit for other comments, and sent a v2 with cc for stable.
>>>>
>>>> With that fixed, this is: Reviewed-by: Lyude Paul <lyude@redhat.com>
>>>>
>>>>> +                       vbios_mode_info = &ast_state->vbios_mode_info;
>>>>> +
>>>>> +                       ast_set_color_reg(ast, format);
>>>>> +                       ast_set_vbios_color_reg(ast, format,
>>>>> vbios_mode_info);
>>>>> +               }
>>>>> +
>>>>>                  ast_crtc_load_lut(ast, crtc);
>>>>>                  break;
>>>>>          case DRM_MODE_DPMS_STANDBY:
>>>>
>>>
>>
> 

