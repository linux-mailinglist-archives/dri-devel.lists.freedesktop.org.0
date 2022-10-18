Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9025602EFC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 16:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05D110E8D1;
	Tue, 18 Oct 2022 14:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A426210E8D1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666105028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N18X2J/ONbO6fBplsdixEtdnDqytNGDyOXwWdNHlzog=;
 b=NV6HbTP3kNsfUGAC9xKqGASiPZcJQqRTPIDN4kogV+enhw8M6n2sR5kPpPkMJSWeZsBPqd
 43+WCf/1WBES+XMA+TXZmqnVRoNnujtCkzQkQlnIDgK4w6/fjKCplOZ8jDQld2jofRmKRt
 crkdoxpf0y6MCWELV/DhIoZLxv4RVoM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-141-2WwfJ_v_Piixl5a41sC8xQ-1; Tue, 18 Oct 2022 10:57:07 -0400
X-MC-Unique: 2WwfJ_v_Piixl5a41sC8xQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i203-20020a1c3bd4000000b003c6d18a7ee5so505368wma.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N18X2J/ONbO6fBplsdixEtdnDqytNGDyOXwWdNHlzog=;
 b=vBRaRtn6G+drwdcJO/UCv35Aj5sRO7SrLV1nho+6z6OCTCuqxyLlEANd/PW9cwfm4f
 dBD+BdMIWOA2a4LPwjjS2xnzRHQDM1T1ECvF4zQOdozkrQVf2QU755/1NgYUFqSi75Lt
 jV/GBe6GSIZYY8lEqV8rKpu0QxWRYtKblnXN1bIhVWQwit3kXdgXEgLOFSN146r/JFqD
 1aSdX1ioyDhPQ747o3T/qPpvFs7SPfZPK91CmV+ZwJTZlT6TpPfH9lPOrWoqIW+FWdie
 hM6Oj4/WlJ5tEi+PTcckDxLd3NzJ6wVqkwMR+aST+hLV4SHqZKDYwKTR+9ufBOVqNIg+
 8bVA==
X-Gm-Message-State: ACrzQf1wK8Lfbhl1u+yLSFDHIPv2WAp71Y7U30GKuAg4I6iqaP3bHsgs
 dkHRjNV6023EEctgd9f7NacsIrhQW9J1aSUF3UPItUIMf5CU2WBQUSM81o6ehLo464AoHD6Obiw
 Wcq/2KD4sLa8UDAkB95MqpenJfEDO
X-Received: by 2002:a05:600c:214f:b0:3c6:ce02:8a68 with SMTP id
 v15-20020a05600c214f00b003c6ce028a68mr23598178wml.187.1666105025930; 
 Tue, 18 Oct 2022 07:57:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6054Cazg2z9TC7UqsrNGdhopIpZm1elhvnKApojdAs5XcIRVqvOggdge+pR3acpIcpGS8i5g==
X-Received: by 2002:a05:600c:214f:b0:3c6:ce02:8a68 with SMTP id
 v15-20020a05600c214f00b003c6ce028a68mr23598167wml.187.1666105025727; 
 Tue, 18 Oct 2022 07:57:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c348100b003a5f4fccd4asm20221640wmq.35.2022.10.18.07.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 07:57:05 -0700 (PDT)
Message-ID: <b9f25473-d598-7566-96cf-4f8b10453722@redhat.com>
Date: Tue, 18 Oct 2022 16:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] drm/mgag200: Fix PLL setup for G200_SE_A rev >=4
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com
References: <20221013132810.521945-1-jfalempe@redhat.com>
 <03ca96bc-358f-3f02-c53e-5ff3a0d935dc@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <03ca96bc-358f-3f02-c53e-5ff3a0d935dc@suse.de>
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
Cc: michel@daenzer.net, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I just pushed it to drm-misc-next.

I also fixed the commit message a bit, the commit moving this line of 
code is in fact:

commit 877507bb954e ("drm/mgag200: Provide per-device callbacks for 
PIXPLLC")

Best Regards

-- 

Jocelyn

On 13/10/2022 15:55, Thomas Zimmermann wrote:
> 
> 
> Am 13.10.22 um 15:28 schrieb Jocelyn Falempe:
>> For G200_SE_A, PLL M setting is wrong, which leads to blank screen,
>> or "signal out of range" on VGA display.
>> previous code had "m |= 0x80" which was changed to
>> m |= ((pixpllcn & BIT(8)) >> 1);
>>
>> Tested on G200_SE_A rev 42
>>
>> This line of code was moved to another file with
>> commit 85397f6bc4ff ("drm/mgag200: Initialize each model in separate
>> function") but can be easily backported before this commit.
>>
>> v2: * put BIT(7) First to respect MSB-to-LSB (Thomas)
>>      * Add a comment to explain that this bit must be set (Thomas)
>>
>> Fixes: 2dd040946ecf ("drm/mgag200: Store values (not bits) in struct 
>> mgag200_pll_values")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_g200se.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> index be389ed91cbd..bd6e573c9a1a 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> @@ -284,7 +284,8 @@ static void 
>> mgag200_g200se_04_pixpllc_atomic_update(struct drm_crtc *crtc,
>>       pixpllcp = pixpllc->p - 1;
>>       pixpllcs = pixpllc->s;
>> -    xpixpllcm = pixpllcm | ((pixpllcn & BIT(8)) >> 1);
>> +    // For G200SE A, BIT(7) should be set unconditionally.
>> +    xpixpllcm = BIT(7) | pixpllcm;
>>       xpixpllcn = pixpllcn;
>>       xpixpllcp = (pixpllcs << 3) | pixpllcp;
> 

