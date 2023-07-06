Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F44749816
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 11:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E06910E49E;
	Thu,  6 Jul 2023 09:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AC710E49E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 09:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688634997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cm1dhxsavU7u1DrG0J9Xk7KPMVnjK1cspOaMg0/ZR2Y=;
 b=SyWzjnkiyUITaHFVKzYn4ijGnarB8rAiumYRACWIbh3Dx4WBU8MOPRj3T0cscEiYocWBtx
 8Cui2weAiUKRa9zeaYV2hjzsOZEWQx13kO5cmxK4RFTffQWwPAbkNLXrJxjl7s+7tzyU0Q
 TJ94wYjfEs1nfmKnCLVRdVMHCLBYL60=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-Ctupr8D7MnmRBuB9e4xukA-1; Thu, 06 Jul 2023 05:16:35 -0400
X-MC-Unique: Ctupr8D7MnmRBuB9e4xukA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbcae05906so3218745e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 02:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688634994; x=1691226994;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cm1dhxsavU7u1DrG0J9Xk7KPMVnjK1cspOaMg0/ZR2Y=;
 b=LIjt4yvTh/9g/22gcv3AT5XziOp4MzCo/9cvlF8wDvl242dK7DEXpxXlUrJE72YSeO
 JpCbTOr+y8DtOITOoXzrtLVJvfP2CFTY4Mbl/JdnclA+nacp1P4OSXFb70J8AXhw1x6Z
 69gKwc0pNHUQ4U+krwn5XKVasNqt0Aotc9BtGqA9+waMhCv8wBsIvUNKCxoQdUvHj+HS
 6XeR5q3EHPmWNfMsE5xM4tElhh3bPmqaO4ge1IML++YtMWGeNZ5coNQ6F76vjuQZRBjW
 vNjLPhmzOhzYkxdNn5bzi+Z/byAeFbwWjs25BBbDS/120vn84rUirAOUxw3gbmMZ34OG
 9NUQ==
X-Gm-Message-State: ABy/qLZN/i+cAoSC47EtDrED5AEBmUTS+WO5gCciLJzjw2+u7e6irJRm
 /Q3JiojupeQchXT/uYrgpDJgmOsPvxF+C6HmgD2K0MPwF8r+j4UfwTtJp3xCXds/LNRyatC1mFO
 D2w+I6W8s+mi8Get74G55ipz92hz1
X-Received: by 2002:a7b:c847:0:b0:3fb:a1d9:ede8 with SMTP id
 c7-20020a7bc847000000b003fba1d9ede8mr867941wml.10.1688634994494; 
 Thu, 06 Jul 2023 02:16:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHbXbexIX3tP0FuC2nqzVQiUNVBLl6HhHC6nvimyGqIXUjvvp4Lmp9aGAVpuW1n1cSmviab0Q==
X-Received: by 2002:a7b:c847:0:b0:3fb:a1d9:ede8 with SMTP id
 c7-20020a7bc847000000b003fba1d9ede8mr867929wml.10.1688634994212; 
 Thu, 06 Jul 2023 02:16:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:57d9:6996:9558:341b?
 ([2a01:e0a:d5:a000:57d9:6996:9558:341b])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003fbb2c0fce5sm4474329wml.25.2023.07.06.02.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 02:16:33 -0700 (PDT)
Message-ID: <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
Date: Thu, 6 Jul 2023 11:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
In-Reply-To: <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
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

On 04/07/2023 18:45, Jocelyn Falempe wrote:
> On 04/07/2023 16:54, Jani Nikula wrote:
>> On Fri, 23 Jun 2023, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>>>   EDID on DP")
>>> The default resolution is now 640x480 when no monitor is connected.
>>> But Aspeed graphics is mostly used in servers, where no monitor
>>> is attached. This also affects the "remote" resolution to 640x480, 
>>> which is
>>> inconvenient, and breaks the anaconda installer.
>>> So when no EDID is present, set 1024x768 as preferred resolution.
>>
>> This conflates "monitor connected" and "EDID present", which are not
>> necessarily the same thing.
>>
>> The fallback in drm_helper_probe_single_connector_modes() is for no
>> modes, but connector status is connected or unknown.
> 
> When debugging the issue, I found it surprising that the status is 
> "connected" when nothing is plugged in the DP port.
>>
>> You could add a connector ->detect callback that returns disconnected
>> when there's no display, and the problem should go away. If there's no
>> ->detect callback, it'll default to connected.
> 
> ok, I'll try that. I don't know how the hardware detect something is 
> connected, but looking at the dp code, maybe checking 
> "AST_IO_CRTC_PORT,0xDC, ASTDP_LINK_SUCCESS" would be good enough.

I've tested this approach, and it works. But on the server I'm testing, 
there are VGA and DP output. I think on a server that has only one DP 
output, if no monitor is connected, then no modes will be reported to 
userspace, and the remote BMC may not work ?

Also I don't have physical access to the server, so I only tested when 
no monitor is plugged.

I will send shortly a v2 with this change, so others can help me test 
this case.

Best regards,

-- 

Jocelyn


> 
>>
>>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID 
>>> on DP")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/ast/ast_mode.c | 26 ++++++++++++++++++++++++--
>>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>> b/drivers/gpu/drm/ast/ast_mode.c
>>> index 36374828f6c8..8f7b7cc021c7 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -1589,9 +1589,31 @@ static const struct drm_connector_helper_funcs 
>>> ast_dp501_connector_helper_funcs
>>>       .get_modes = ast_dp501_connector_helper_get_modes,
>>>   };
>>> +static int ast_dp_probe_single_connector_modes(struct drm_connector 
>>> *connector,
>>> +                           uint32_t maxX, uint32_t maxY)
>>> +{
>>> +    int ret;
>>> +    struct drm_display_mode *mode;
>>> +
>>> +    ret = drm_helper_probe_single_connector_modes(connector, maxX, 
>>> maxY);
>>> +    /*
>>> +     * When no monitor are detected, DP now default to 640x480
>>> +     * As aspeed is mostly used in remote server, and DP monitors are
>>> +     * rarely attached, it's better to default to 1024x768
>>> +     */
>>> +    if (!connector->edid_blob_ptr) {
>>
>> Please try not to use connector->edid_blob_ptr for anything in
>> drivers. The logic is complicated enough as it is, with the firmware and
>> override EDIDs and everything, and makes future refactoring of EDID
>> handling harder.
> 
> Ok, I will try your other suggestion, and remove this.
> 
> Thanks a lot for your comments.
> 

