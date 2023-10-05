Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDC7B9B6C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 09:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5C310E05F;
	Thu,  5 Oct 2023 07:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE6110E05F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696491473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jH33QhYaNQ5bf9hjGQYFxdt8E9thgji4wm8Jia6pG4c=;
 b=M68eVvErXjEVYw8YgGtgLIHz9mWz4XwM49zEcNnYZrc6aCVB3QFsncBEMRTdNaYxe5pChA
 J0DaYhpKEiDyoePwrhCPYVtzUjbGl3dghXowXsxUG7FGSXJmPSazJ+eDTJL5IAmF9zrL+8
 LBi05cJH36u+W2IkooL/VXFvP8qapkI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-stAOxNDSMca6EXSIXsf5NQ-1; Thu, 05 Oct 2023 03:37:52 -0400
X-MC-Unique: stAOxNDSMca6EXSIXsf5NQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5056eada207so711111e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 00:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696491470; x=1697096270;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jH33QhYaNQ5bf9hjGQYFxdt8E9thgji4wm8Jia6pG4c=;
 b=S/RIz0UyMMiE68DD2EurrX4HYhwztazBQGWxviB2kHfWFW3YZyTrgUPzQsD1SbwVGl
 bVGHCryDl0z3fOgv+Tkf6YMSJ7/4r1AE5OvyjxBImF/+PEDqctFFp7SL8/W33B344/sr
 /fF4vdkukptLPnTrXCOOTMyfZpsWNVDt+H9ecnFM5FFj9bCbjxmEwlfECsTxPaOCoD01
 XWcpqIYaEmdp2K7EQux8b+KjZRf7AdGvZeBvHRSKVlK+CUte+8nlVkFLcwcV+m++vN09
 Bg2ZtB+YlhiFz5mdL+SpXxRccX8fbAptimiOioQs8RQYiYnGT80Vj7GffsdmfiMFDUhz
 vzCg==
X-Gm-Message-State: AOJu0YwvOxEQxRfxvR8hMeO/j8UIoyMG3k1mi5913Xuc7BP0ZENFP1pK
 0smn4DyVIhrfMWqOIz37NDhrmlHAMsK9RRxSvYU8ShaYYr5WxcN12L5Z/DNCtY/haQyl+PNC/4x
 za5t5gquy0ttC0bDJ74+53GisJIn9
X-Received: by 2002:a05:6512:3e7:b0:503:c51:74df with SMTP id
 n7-20020a05651203e700b005030c5174dfmr3261709lfq.48.1696491470749; 
 Thu, 05 Oct 2023 00:37:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1ggDpXDUu1ISfpY/fUPvEkMXnYHSdGry0CFO1oL+9f7DdaBm1RdHjjx6O8uagVGoJoIFl2w==
X-Received: by 2002:a05:6512:3e7:b0:503:c51:74df with SMTP id
 n7-20020a05651203e700b005030c5174dfmr3261694lfq.48.1696491470374; 
 Thu, 05 Oct 2023 00:37:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b00406725f27e1sm859649wmc.42.2023.10.05.00.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 00:37:49 -0700 (PDT)
Message-ID: <7082653f-e5d2-4852-a08f-2d8b638f0c53@redhat.com>
Date: Thu, 5 Oct 2023 09:37:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/4] drm/format-helper: Export line conversion helper
 for drm_panic
To: nerdopolis <bluescreen_avenger@verizon.net>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-2-jfalempe@redhat.com>
 <5210522.31r3eYUQgx@nerdopolis2>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5210522.31r3eYUQgx@nerdopolis2>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/10/2023 03:45, nerdopolis wrote:
> On Tuesday, October 3, 2023 10:22:44 AM EDT Jocelyn Falempe wrote:
>> drm_panic will need the low-level drm_fb_xxxx_line functions.
>> Also add drm_fb_r1_to_xrgb8888 to render the fonts.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 88 ++++++++++++++++++++++++++---
>>   include/drm/drm_format_helper.h     |  9 +++
>>   2 files changed, 89 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
>> index f93a4efcee90..c238e5d84f1f 100644
>> --- a/drivers/gpu/drm/drm_format_helper.c
>> +++ b/drivers/gpu/drm/drm_format_helper.c
>> @@ -270,7 +270,30 @@ void drm_fb_swab(struct iosys_map *dst, const unsigned int *dst_pitch,
>>   
>>   	drm_fb_xfrm(dst, dst_pitch, &cpp, src, fb, clip, cached, swab_line);
>>   }
>> -EXPORT_SYMBOL(drm_fb_swab);
> I had to add this line back to get it to build, but once I did, it worked.

Thanks, you're right that line shouldn't be removed.

Best regards,

-- 

Jocelyn

