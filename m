Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C3F55753E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893C611A1A7;
	Thu, 23 Jun 2022 08:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B4B11A19D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655972513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9xp6k+/ssztG/3ADbjTV9uJ3unEg15AWLMEKoDssNs=;
 b=GW7KliUSv/XHD68MaVVBoc3ZOh281YYHkH+iMp8CQ5Bbvvk8GhsGAVQ87Ur7k/4Mw1E7GJ
 KxLlcB/f/0yYevSVJp4Moapv94g+62s2YdQYMp4e6A55yBvKRpgmppFraiWz/bn5oNwd/5
 YdYewc2SZMRQjnPsmhHzF6EHh3GWnLI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-vCMQZs1qOCyux8n8-4Wb9Q-1; Thu, 23 Jun 2022 04:21:52 -0400
X-MC-Unique: vCMQZs1qOCyux8n8-4Wb9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so1058644wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 01:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U9xp6k+/ssztG/3ADbjTV9uJ3unEg15AWLMEKoDssNs=;
 b=w/hVYGrTOzW1N3HYv/5+b0FFM9GbhDpGpKQiwbZoy0bMi2LfHirzfhMd53q1BrvsmB
 Pd2j1m266rcs9DUX+3pkUGM5ZKJUxUeepLTl0vExt+Rj3mBRsabXMnUsskqC4CHfZgxW
 6sNS2nJ8dlOlg03aCjwd681NK5uIYOv7xbGiZRUS483/eLYYwtFwpCjLK/5rvgKUeRnp
 QHDm4cygE2QWb1vjvA9C9PVT/idrwvUsSLMZzj3FvTPGgrqYXMKk9TMOrHvQyDE4+nM0
 VnjL4LQq/mmwWSwJg2FhCBlaLOv4MmDi4CiOExXkTYSqscK19Njsz/z3RNemGIEBZ8ZH
 Y4fw==
X-Gm-Message-State: AJIora+OXExvBEN1pSi+KMalMd/mOsDMNgH/RRp0sP6H6Vh2ocDgTkG6
 CeprZYPnbmnegmAfkO3X2/FYxV35Nx9MR9MHUW2pTV0VljRmlz9Ebso4/nB/z2mnDSD60HRrLBh
 zioqJT54xTjMCcrgvVlAU8VaKVY65
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id
 i8-20020a0560001ac800b0021b92398f28mr7009954wry.517.1655972510834; 
 Thu, 23 Jun 2022 01:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5SZVQyWk+TEFu2PRx6KERnUD0CLeC/LvIflxyl+704vIzs3fjEjczxWI4stRQpX2hBnuPsA==
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id
 i8-20020a0560001ac800b0021b92398f28mr7009942wry.517.1655972510628; 
 Thu, 23 Jun 2022 01:21:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002103bd9c5acsm21694267wrn.105.2022.06.23.01.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 01:21:50 -0700 (PDT)
Message-ID: <9db1d8fd-1778-0811-ec70-ad5bb8de00a6@redhat.com>
Date: Thu, 23 Jun 2022 10:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kuohsiang_chou@aspeedtech.com
References: <20220622124815.356035-1-jfalempe@redhat.com>
 <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <8a6048576c440f1653121bb7be8583e9fee0c79a.camel@redhat.com>
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

On 22/06/2022 20:34, Lyude Paul wrote:
> Some small nitpicks:
> 
> On Wed, 2022-06-22 at 14:48 +0200, Jocelyn Falempe wrote:
>> With an AST2600, the screen is garbage when going out of suspend.
>> This is because color settings are lost, and not restored on resume.
>> Force the color settings on DPMS_ON, to make sure the settings are correct.
>>
>> I didn't write this code, it comes from the out-of-tree aspeed driver v1.13
>> https://www.aspeedtech.com/support_driver/
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Tested-by: Venkat Tadikonda <venkateswara.rao@intel.com>
> 
> Should have a Cc: to stable imho, `dim` can do this for you:
> 
> https://drm.pages.freedesktop.org/maintainer-tools/dim.html

Sure I will add cc to stable for the v2
> 
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
>> index 3eb9afecd9d4..cdddcb5c4439 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -990,6 +990,9 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int
>> mode)
>>   {
>>          struct ast_private *ast = to_ast_private(crtc->dev);
>>          u8 ch = AST_DPMS_VSYNC_OFF | AST_DPMS_HSYNC_OFF;
>> +       struct ast_crtc_state *ast_state;
>> +       const struct drm_format_info *format;
>> +       struct ast_vbios_mode_info *vbios_mode_info;
>>   
>>          /* TODO: Maybe control display signal generation with
>>           *       Sync Enable (bit CR17.7).
>> @@ -1007,6 +1010,16 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int
>> mode)
>>                          ast_dp_set_on_off(crtc->dev, 1);
>>                  }
>>   
>> +               ast_state = to_ast_crtc_state(crtc->state);
>> +               format = ast_state->format;
>> +
>> +               if (format){
> 
> Should be a space between ')' and '{'.

looks like I forget to run checkpatch.pl on it before sending :(

I'll wait a bit for other comments, and sent a v2 with cc for stable.
> 
> With that fixed, this is: Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
>> +                       vbios_mode_info = &ast_state->vbios_mode_info;
>> +
>> +                       ast_set_color_reg(ast, format);
>> +                       ast_set_vbios_color_reg(ast, format,
>> vbios_mode_info);
>> +               }
>> +
>>                  ast_crtc_load_lut(ast, crtc);
>>                  break;
>>          case DRM_MODE_DPMS_STANDBY:
> 

