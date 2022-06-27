Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20BA55B836
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F6511A171;
	Mon, 27 Jun 2022 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2974911A17A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656315113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUlYsEPWWhOYMYkBLJK32cCzeHl6cStHfmVs4A5dSNU=;
 b=cUbnC8Mm5TAjO0stoVBDDuksPrLY4/OCOAr09T7yMurrxjLTg2yNs5cJlvK3R+i+/ggvjj
 4YHFxKQowlV+9aMISRxWzdFDmj2jDWHC9XpnzsUGnM72VukNBo+eWh7O1IiL4CKfDmLPIX
 2ONMHTr+EX0d8vMwrDJQ/smzT/FITbg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-q3uzT84OOdKkis_e94kh5A-1; Mon, 27 Jun 2022 03:31:48 -0400
X-MC-Unique: q3uzT84OOdKkis_e94kh5A-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b0039c832fbd02so6922770wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 00:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=EUlYsEPWWhOYMYkBLJK32cCzeHl6cStHfmVs4A5dSNU=;
 b=Yn3W+186BPQF1MUfk4NghNwRE16+LZrBPLLkaqWxDcJAHoXI0JTn9YnsSD4PwPxaEo
 yt43vxpvphZQYTO6wgjdpjq0hTWz/lnU1Oi2Z1Sq1I5DHa2mw1y+T35aGywy7iS/jUmX
 rPraMN82Y2BuZ5W8CvBqbT5D7vypZh9fpaCFN6IdnMBqQJyR5WDVGEB76NrKBz7/cRpT
 mLvvZxnBEvtfvLJxk5gnB6fJ1TKGCAswX13hFz6KYqX8Yn+EgLw/esu7s2ak7BIsr9SQ
 aDWmSh3kxhdIaRfw/xIHVuTA+wZershEMPm+pAfQl6E8eTbdCMcv0NqNsZi0O07inM3Z
 r2mw==
X-Gm-Message-State: AJIora/mKoo50EoHLCbIURH4Wk8U6zLywkQncJYR8CpKKk8vUiQ/UmtE
 mqPCkr5YpF+E52GkcI/Iyz8gBXXCGm6VePL1cBTkWYVPUbQbjNtI15WXbcyeekt8BomobMVtCFS
 urVwV4Jwf+lMIUHKiIvxAO1TOmNok
X-Received: by 2002:a05:600c:3c8a:b0:3a0:4ad8:d3c4 with SMTP id
 bg10-20020a05600c3c8a00b003a04ad8d3c4mr3403553wmb.43.1656315107342; 
 Mon, 27 Jun 2022 00:31:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIxzqXQBccOHGTb7BB9fchHY1rsuqvbNZzufCC258yfk9xTeBg9TXczNfsz2ETRTVBGoaPHA==
X-Received: by 2002:a05:600c:3c8a:b0:3a0:4ad8:d3c4 with SMTP id
 bg10-20020a05600c3c8a00b003a04ad8d3c4mr3403540wmb.43.1656315107136; 
 Mon, 27 Jun 2022 00:31:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 n32-20020a05600c3ba000b0039c5224bfcbsm16758449wms.46.2022.06.27.00.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 00:31:46 -0700 (PDT)
Message-ID: <1c6517d8-396d-3a63-f4ed-f7dcd2159a2f@redhat.com>
Date: Mon, 27 Jun 2022 09:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kuohsiang_chou@aspeedtech.com
References: <20220622124815.356035-1-jfalempe@redhat.com>
 <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
 <9db1d8fd-1778-0811-ec70-ad5bb8de00a6@redhat.com>
In-Reply-To: <9db1d8fd-1778-0811-ec70-ad5bb8de00a6@redhat.com>
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
Cc: michel@daenzer.net, hungju_huang@aspeedtech.com,
 Venkat Tadikonda <venkateswara.rao@intel.com>, charles_kuan@aspeedtech.com,
 luke_chen@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2022 10:21, Jocelyn Falempe wrote:
> On 22/06/2022 20:34, Lyude Paul wrote:
>> Some small nitpicks:
>>
>> On Wed, 2022-06-22 at 14:48 +0200, Jocelyn Falempe wrote:
>>> With an AST2600, the screen is garbage when going out of suspend.
>>> This is because color settings are lost, and not restored on resume.
>>> Force the color settings on DPMS_ON, to make sure the settings are 
>>> correct.
>>>
>>> I didn't write this code, it comes from the out-of-tree aspeed driver 
>>> v1.13
>>> https://www.aspeedtech.com/support_driver/
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Tested-by: Venkat Tadikonda <venkateswara.rao@intel.com>
>>
>> Should have a Cc: to stable imho, `dim` can do this for you:
>>
>> https://drm.pages.freedesktop.org/maintainer-tools/dim.html
> 
> Sure I will add cc to stable for the v2

In fact it doesn't apply to older kernel version, (it depends on 
594e9c04b586 Create the driver for ASPEED proprietory Display-Port).

So I think I will just push it to drm-misc-next, with the indentation fixed.

>>
>>> ---
>>>   drivers/gpu/drm/ast/ast_mode.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>> b/drivers/gpu/drm/ast/ast_mode.c
>>> index 3eb9afecd9d4..cdddcb5c4439 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -990,6 +990,9 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int
>>> mode)
>>>   {
>>>          struct ast_private *ast = to_ast_private(crtc->dev);
>>>          u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
>>> +       struct ast_crtc_state *ast_state;
>>> +       const struct drm_format_info *format;
>>> +       struct ast_vbios_mode_info *vbios_mode_info;
>>>          /* TODO: Maybe control display signal generation with
>>>           *       Sync Enable (bit CR17.7).
>>> @@ -1007,6 +1010,16 @@ static void ast_crtc_dpms(struct drm_crtc 
>>> *crtc, int
>>> mode)
>>>                          ast_dp_set_on_off(crtc->dev, 1);
>>>                  }
>>> +               ast_state = to_ast_crtc_state(crtc->state);
>>> +               format = ast_state->format;
>>> +
>>> +               if (format){
>>
>> Should be a space between ')' and '{'.
> 
> looks like I forget to run checkpatch.pl on it before sending :(
> 
> I'll wait a bit for other comments, and sent a v2 with cc for stable.
>>
>> With that fixed, this is: Reviewed-by: Lyude Paul <lyude@redhat.com>
>>
>>> +                       vbios_mode_info = &ast_state->vbios_mode_info;
>>> +
>>> +                       ast_set_color_reg(ast, format);
>>> +                       ast_set_vbios_color_reg(ast, format,
>>> vbios_mode_info);
>>> +               }
>>> +
>>>                  ast_crtc_load_lut(ast, crtc);
>>>                  break;
>>>          case DRM_MODE_DPMS_STANDBY:
>>
> 

