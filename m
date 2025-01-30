Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD668A22C8D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 12:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456810E03D;
	Thu, 30 Jan 2025 11:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TxRtoFDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DE610E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738236819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=125I8Ys+u6fwmCdqFMEfO5PntZZCalxJd6bqOSO8/yY=;
 b=TxRtoFDlusV/ktPQAHNaExc8Q7JjU2M3DXu/fgByAVKz/AtZ6a9BTaefxKGvQ52fmODzgr
 OqxhghJ/4MCXDpydEhaNO/SeE0jLn8sjRm4/Xfj07bmJN80lkd6BB8oP1jb755mQRhRZz0
 FVyxVgNB6nUhnBBeQjiLGEDJrlOFfzc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-W7lnFuzhMAqQGnZJMsGpgw-1; Thu, 30 Jan 2025 06:33:38 -0500
X-MC-Unique: W7lnFuzhMAqQGnZJMsGpgw-1
X-Mimecast-MFC-AGG-ID: W7lnFuzhMAqQGnZJMsGpgw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361efc9dc6so3271195e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 03:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738236816; x=1738841616;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=125I8Ys+u6fwmCdqFMEfO5PntZZCalxJd6bqOSO8/yY=;
 b=SPd7IVNPnP0RJwKfr1NwPhjioC6iTc1iQcTxIKWaU7uJ6lnvFN7+j5QFqkTPeDFxGM
 MLsW5FZaoreqLKEWrYyxBhFxNVjZqyddqSWJjwgSbGovd7/1cpxUwwm1vD4gOCox7Jj3
 OqR3qSy7phDO8DEzl++Qb/qTjlefMz4VKSse3ZeKvqJ09PfoAnm9fGTNpyjPeMVBKYvN
 fF2GlQC8gferiMWQGLSWwUbGQXNIkNHOLbsm4d2McSXT8rc+VwJKR25NPDDcr28Ua8i1
 iq4tBNje2cUUzChd2aitITuJXNmhH8kflPmWRlfeWYZJsml037e5S2DoA+F+Yvp2IRY1
 LkAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWccGA5gzBqwqBHEF5oEl2yzOhkKdVf8SQBZ4MfSs+Vazgn+qXCMycpdAlO6YXBnK/EVMcLzEKqIV4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTjYv2VDKmR79AWujeQT4Cc8is0mhV12r+a3qTdJP+KEST8smw
 HpNoUjg9dE/EYLxD8ya8/otz7XvvmjNChM944cqb6ImB6fJpGb4uaDf6T0XZJ7g7sbGN+YyTwRb
 J1V5kSIWoiSeOPcWrmb5g3qfKecsyJZVQOoEowfub9JaIuCgx8gCeHh2cE1Lci7uyAYw9BM9eMQ
 ==
X-Gm-Gg: ASbGncuEqZCfoGfgziHHqU+TzHV9IZz1bE2YLeClg4NTLJU6IRzjVHRbE6Ia80NndQC
 T+KKtEf+3dzceXORsGqBvS3aM7fe13QbOUQ47hZLTssRD/3S2GmMNVvGLxi1mi2PQ4oZHTV/NLR
 WUqbV7OYGiutVF+ZRL5TnxXYhh7bQOAenKPK0NEhR/mPd57ZA4bB6V7wsFnVji0+AJpcEk6Za6p
 g7UK0sVxopqddv+btalPC0pTmeC+RD3TBNC0X6HhP2Nxak78NhJFzPtiUmAc+tj0hp18nJexjqc
 EjqRk0D6cnfiMTB/YeVq9DbC3u+cLNlvLnfwkLAvkuGk
X-Received: by 2002:a05:600c:500d:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-438dc40f16bmr53236705e9.25.1738236816539; 
 Thu, 30 Jan 2025 03:33:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVvUuQepCZEgBuMOCivNzFPoWpiJsmIqwPckClnUgeXFBqAVhr3qvSJ0+mqpaa64Yimu0y0w==
X-Received: by 2002:a05:600c:500d:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-438dc40f16bmr53236525e9.25.1738236815984; 
 Thu, 30 Jan 2025 03:33:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e5d4csm19913205e9.19.2025.01.30.03.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 03:33:35 -0800 (PST)
Message-ID: <2a02ee54-369e-44b2-a759-fd9951f7fc87@redhat.com>
Date: Thu, 30 Jan 2025 12:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] drm/ast: astdp: Look up mode index from table
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250129095840.20629-1-tzimmermann@suse.de>
 <20250129095840.20629-15-tzimmermann@suse.de>
 <b824e913-0d2f-4a09-b1fa-da89375b47e4@redhat.com>
 <bc902ac5-ab1e-4d16-bc27-163123cb2d3f@suse.de>
 <c3560336-38fa-451c-8ef2-c58871c7ff6e@redhat.com>
In-Reply-To: <c3560336-38fa-451c-8ef2-c58871c7ff6e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LRLJFBmRRnC3fBg520mh4qbMpTHEvJylWvZzEKxwJVw_1738236817
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/01/2025 15:05, Jocelyn Falempe wrote:
> On 29/01/2025 13:01, Thomas Zimmermann wrote:
>> Hi
>>
>>
>> Am 29.01.25 um 12:27 schrieb Jocelyn Falempe:
>>> On 29/01/2025 10:55, Thomas Zimmermann wrote:
>>>> Replace the large switch statement with a look-up table when selecting
>>>> the mode index. Makes the code easier to read. The table is sorted by
>>>> resolutions; if run-time overhead from traversal becomes significant,
>>>> binary search would be a possible optimization.
>>>>
>>>> The mode index requires a refresh-rate index to be added or subtracted,
>>>> which still requires a minimal switch.
>>>>
>>> I think there is a problem in the mode_index/refresh_index 
>>> calculation, see below:

Sorry, I though I already reviewed it. With the added explanations, it 
looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>
>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>   drivers/gpu/drm/ast/ast_dp.c | 116 ++++++++++++++++ 
>>>> +------------------
>>>>   1 file changed, 55 insertions(+), 61 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ 
>>>> ast_dp.c
>>>> index e1ca012e639be..70fa754432bca 100644
>>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>>> @@ -14,80 +14,74 @@
>>>>   #include "ast_drv.h"
>>>>   #include "ast_vbios.h"
>>>>   +struct ast_astdp_mode_index_table_entry {
>>>> +    unsigned int hdisplay;
>>>> +    unsigned int vdisplay;
>>>> +    unsigned int mode_index;
>>>> +};
>>>> +
>>>> +/* FIXME: Do refresh rate and flags actually matter? */
>>>> +static const struct ast_astdp_mode_index_table_entry 
>>>> ast_astdp_mode_index_table[] = {
>>>> +    {  320,  240, ASTDP_320x240_60 },
>>>> +    {  400,  300, ASTDP_400x300_60 },
>>>> +    {  512,  384, ASTDP_512x384_60 },
>>>> +    {  640,  480, ASTDP_640x480_60 },
>>>> +    {  800,  600, ASTDP_800x600_56 },
>>>> +    { 1024,  768, ASTDP_1024x768_60 },
>>>> +    { 1152,  864, ASTDP_1152x864_75 },
>>>> +    { 1280,  800, ASTDP_1280x800_60_RB },
>>>> +    { 1280, 1024, ASTDP_1280x1024_60 },
>>>> +    { 1360,  768, ASTDP_1366x768_60 }, // same as 1366x786
>>>> +    { 1366,  768, ASTDP_1366x768_60 },
>>>> +    { 1440,  900, ASTDP_1440x900_60_RB },
>>>> +    { 1600,  900, ASTDP_1600x900_60_RB },
>>>> +    { 1600, 1200, ASTDP_1600x1200_60 },
>>>> +    { 1680, 1050, ASTDP_1680x1050_60_RB },
>>>> +    { 1920, 1080, ASTDP_1920x1080_60 },
>>>> +    { 1920, 1200, ASTDP_1920x1200_60 },
>>>> +    { 0 }
>>>> +};
>>>> +
>>>> +static int __ast_astdp_get_mode_index(unsigned int hdisplay, 
>>>> unsigned int vdisplay)
>>>> +{
>>>> +    const struct ast_astdp_mode_index_table_entry *entry = 
>>>> ast_astdp_mode_index_table;
>>>> +
>>>> +    while (entry->hdisplay && entry->vdisplay) {
>>>> +        if (entry->hdisplay == hdisplay && entry->vdisplay == 
>>>> vdisplay)
>>>> +            return entry->mode_index;
>>>> +        ++entry;
>>>> +    }
>>>> +
>>>> +    return -EINVAL;
>>>> +}
>>>> +
>>>>   static int ast_astdp_get_mode_index(const struct 
>>>> ast_vbios_enhtable *vmode)
>>>>   {
>>>> +    int mode_index;
>>>>       u8 refresh_rate_index;
>>>>   +    mode_index = __ast_astdp_get_mode_index(vmode->hde, vmode->vde);
>>>> +    if (mode_index < 0)
>>>> +        return mode_index;
>>>> +
>>>>       if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index 
>>>> > 255)
>>>>           return -EINVAL;
>>>> -
>>>>       refresh_rate_index = vmode->refresh_rate_index - 1;
>>>>   -    switch (vmode->hde) {
>>>> -    case 320:
>>>> -        if (vmode->vde == 240)
>>>> -            return ASTDP_320x240_60;
>>>> -        break;
>>>> -    case 400:
>>>> -        if (vmode->vde == 300)
>>>> -            return ASTDP_400x300_60;
>>>> -        break;
>>>> -    case 512:
>>>> -        if (vmode->vde == 384)
>>>> -            return ASTDP_512x384_60;
>>>> -        break;
>>>> -    case 640:
>>>> -        if (vmode->vde == 480)
>>>> -            return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
>>>> -        break;
>>>> -    case 800:
>>>> -        if (vmode->vde == 600)
>>>> -            return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
>>>> -        break;
>>>> -    case 1024:
>>>> -        if (vmode->vde == 768)
>>>> -            return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
>>>> -        break;
>>>> -    case 1152:
>>>> -        if (vmode->vde == 864)
>>>> -            return ASTDP_1152x864_75;
>>>> -        break;
>>>> -    case 1280:
>>>> -        if (vmode->vde == 800)
>>>> -            return (u8)(ASTDP_1280x800_60_RB - 
>>>> (u8)refresh_rate_index);
>>>> -        if (vmode->vde == 1024)
>>>> -            return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
>>>> -        break;
>>>> -    case 1360:
>>>> -    case 1366:
>>>> -        if (vmode->vde == 768)
>>>> -            return ASTDP_1366x768_60;
>>>> -        break;
>>>> -    case 1440:
>>>> -        if (vmode->vde == 900)
>>>> -            return (u8)(ASTDP_1440x900_60_RB - 
>>>> (u8)refresh_rate_index);
>>>> -        break;
>>>> -    case 1600:
>>>> -        if (vmode->vde == 900)
>>>> -            return (u8)(ASTDP_1600x900_60_RB - 
>>>> (u8)refresh_rate_index);
>>>> -        if (vmode->vde == 1200)
>>>
>>>> -        break;
>>>> -    case 1680:
>>>> -        if (vmode->vde == 1050)
>>>> -            return (u8)(ASTDP_1680x1050_60_RB - 
>>>> (u8)refresh_rate_index);
>>>> -        break;
>>>> -    case 1920:
>>>> -        if (vmode->vde == 1080)
>>>> -            return ASTDP_1920x1080_60;
>>>> -        if (vmode->vde == 1200)
>>>> -            return ASTDP_1920x1200_60;
>>>> +    /* FIXME: Why are we doing this? */
>>>> +    switch (mode_index) {
>>>> +    case ASTDP_1280x800_60_RB:
>>>> +    case ASTDP_1440x900_60_RB:
>>>> +    case ASTDP_1600x900_60_RB:
>>>> +    case ASTDP_1680x1050_60_RB:
>>>> +        mode_index = (u8)(mode_index - (u8)refresh_rate_index);
>>>>           break;
>>> I think you should add this to do the same as before:
>>
>> It's intentional. The refresh-rate index stored in vmode- 
>>  >refresh_rate_index is at least one. The function then subtracts 1 to 
>> compute refresh_rate_index, so we have 0 by default. And that's what 
>> we always used for cases that did not explicitly add 
>> refresh_rate_index before. I guess I should add this to the commit 
>> message's second paragraph.
>>
>> Apart from that, I honestly don't understand the purpose of this 
>> computation.
> 
> Yes, I have no clue either. Thanks for the clarification.> Best regards
>> Thomas
>>
>>>
>>>     case ASTDP_640x480_60:
>>>     case ASTDP_800x600_56:
>>>     case ASTDP_1024x768_60:
>>>     case ASTDP_1280x1024_60:
>>>         mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>>>           break;
>>>     default:
>>>         break;
>>>
>>>>       default:
>>>> +        mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>>>>           break;
>>>>       }
>>>>   -    return -EINVAL;
>>>> +    return mode_index;
>>>>   }
>>>>     static bool ast_astdp_is_connected(struct ast_device *ast)
>>>
>>
> 

