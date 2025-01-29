Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E36A21E6F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39B210E0B5;
	Wed, 29 Jan 2025 14:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aJTPa8mr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B77310E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738159542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6kKYHxAf9gfs9QpeELvznyDwdRbm+EXcQmKXvXNfzQ=;
 b=aJTPa8mrhJSe5xNS7n/PacjF7O5iiP/tzsjhpwg32QX5kjT1SqLdJ0AXAltG1NA5sZAf3k
 E0t5aUmMuTT9yutUKkDwBUFIcaPbqfYpKHAz7/3WagcsrkNprywNuNzuOvT3CgjsUkScKD
 QF2uK6rymTNJHWwDsOSt6OSC8zLcM9Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-c6mV46iCNi2vADmh6Iy27g-1; Wed, 29 Jan 2025 09:05:35 -0500
X-MC-Unique: c6mV46iCNi2vADmh6Iy27g-1
X-Mimecast-MFC-AGG-ID: c6mV46iCNi2vADmh6Iy27g
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-38a2140a400so5280803f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 06:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738159533; x=1738764333;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L6kKYHxAf9gfs9QpeELvznyDwdRbm+EXcQmKXvXNfzQ=;
 b=M0PgRo/lhT8a5qDFG6cJZGazQTORd9fWGYEEO5hHC9EKw+soqO1AXrXH1R8k18n/1F
 Sag7pJ95c5TuLWwkJcl76Nt/WVAAyY08ZaPcXMrHeYV8YbFkyXNcWixY2q2PS7PjkPb4
 y6IkZ1Sg/3bTd3Hzovkzr/uMXk7oRPjWt/ddK9Xt8rqxy2CLPDJHL1h6tROjZHwq+6Vg
 AvOBC+BC6930smstzhcQIzb7xuVkfgtshxcznWRPgPDtLoEfRUkTGG6EcSE7yOHMFhvj
 5rvov4itJUSOfhp4OB5O7HatRQ2akzEXWUR6Z0oTvLgcYwrJ8TFrGv6Zbgt/FSomXq4d
 oSuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHrczvq9r4bF3gLbe32Jz4bK+Xt8J+bosgDBom7p//8of+4LK+fs5y5/he9raijbdLEwIQKFXuK04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTNL3N9m/G4zkI3KNKYcqctenzR6GB/8kl1UcnLOca97WDLOJD
 qAUEeK+o/eTimJUTGyVd0lN/JBtk3tEt5S3qwWgnu60U+4YLiG9ytLrZOeEWuZCwdQTZh7P9vZG
 Op4LNpVOy6bjAAAiPP/AlF9/moh+jmqur+7HOflFjY22Qn+RsHNBdjstRUKQRPvetXA==
X-Gm-Gg: ASbGncv47jdLZpOlit+Y/ZgP1GnMovycLVWxZDnz10zPsA3RAWYbdNOwYIKeQSdVi/c
 2tB4QtzRWuiM2HdLowi0T5vxuCD5LI6EmrFibxfrDtmzfiWhc4yw2kNdJ1sunmy3AaUclbi5LyP
 MSprhm2rln5tzRmXvqPqzjfIrWWgo03DcQzOsi7jLzlwcOIDqB7SQTZtBn9/Ky7L4ZHiRqFXGZS
 jAMXPnjgw/UR5UxbU1NAAXuyJ5koB6f2NfvFYRAvwHRdfC/PqI5IEFl/B52vgGtAZBxViMIC3AC
 El5tYVNNuzdwz1ge0GElG2Kjc4AfMWopl4wUJgLYmtyY
X-Received: by 2002:a5d:584a:0:b0:385:f72a:a3b0 with SMTP id
 ffacd0b85a97d-38c5209664emr2598214f8f.55.1738159532560; 
 Wed, 29 Jan 2025 06:05:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3bQlYikVPKSbM2nhnnq+zTGybXX5EMbbZWUtqHiB2G+7YBdN//3SWYbrWqH6dR8Ai+SGRJA==
X-Received: by 2002:a5d:584a:0:b0:385:f72a:a3b0 with SMTP id
 ffacd0b85a97d-38c5209664emr2598146f8f.55.1738159531966; 
 Wed, 29 Jan 2025 06:05:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4006sm17361500f8f.94.2025.01.29.06.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 06:05:31 -0800 (PST)
Message-ID: <c3560336-38fa-451c-8ef2-c58871c7ff6e@redhat.com>
Date: Wed, 29 Jan 2025 15:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/16] drm/ast: astdp: Look up mode index from table
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250129095840.20629-1-tzimmermann@suse.de>
 <20250129095840.20629-15-tzimmermann@suse.de>
 <b824e913-0d2f-4a09-b1fa-da89375b47e4@redhat.com>
 <bc902ac5-ab1e-4d16-bc27-163123cb2d3f@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <bc902ac5-ab1e-4d16-bc27-163123cb2d3f@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3MVegRfSoruxBYI0QFzZkHb330SXw3PAEaqZtvuOh3A_1738159533
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

On 29/01/2025 13:01, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 29.01.25 um 12:27 schrieb Jocelyn Falempe:
>> On 29/01/2025 10:55, Thomas Zimmermann wrote:
>>> Replace the large switch statement with a look-up table when selecting
>>> the mode index. Makes the code easier to read. The table is sorted by
>>> resolutions; if run-time overhead from traversal becomes significant,
>>> binary search would be a possible optimization.
>>>
>>> The mode index requires a refresh-rate index to be added or subtracted,
>>> which still requires a minimal switch.
>>>
>> I think there is a problem in the mode_index/refresh_index 
>> calculation, see below:
>>
>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/ast/ast_dp.c | 116 +++++++++++++++++------------------
>>>   1 file changed, 55 insertions(+), 61 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>>> index e1ca012e639be..70fa754432bca 100644
>>> --- a/drivers/gpu/drm/ast/ast_dp.c
>>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>>> @@ -14,80 +14,74 @@
>>>   #include "ast_drv.h"
>>>   #include "ast_vbios.h"
>>>   +struct ast_astdp_mode_index_table_entry {
>>> +    unsigned int hdisplay;
>>> +    unsigned int vdisplay;
>>> +    unsigned int mode_index;
>>> +};
>>> +
>>> +/* FIXME: Do refresh rate and flags actually matter? */
>>> +static const struct ast_astdp_mode_index_table_entry 
>>> ast_astdp_mode_index_table[] = {
>>> +    {  320,  240, ASTDP_320x240_60 },
>>> +    {  400,  300, ASTDP_400x300_60 },
>>> +    {  512,  384, ASTDP_512x384_60 },
>>> +    {  640,  480, ASTDP_640x480_60 },
>>> +    {  800,  600, ASTDP_800x600_56 },
>>> +    { 1024,  768, ASTDP_1024x768_60 },
>>> +    { 1152,  864, ASTDP_1152x864_75 },
>>> +    { 1280,  800, ASTDP_1280x800_60_RB },
>>> +    { 1280, 1024, ASTDP_1280x1024_60 },
>>> +    { 1360,  768, ASTDP_1366x768_60 }, // same as 1366x786
>>> +    { 1366,  768, ASTDP_1366x768_60 },
>>> +    { 1440,  900, ASTDP_1440x900_60_RB },
>>> +    { 1600,  900, ASTDP_1600x900_60_RB },
>>> +    { 1600, 1200, ASTDP_1600x1200_60 },
>>> +    { 1680, 1050, ASTDP_1680x1050_60_RB },
>>> +    { 1920, 1080, ASTDP_1920x1080_60 },
>>> +    { 1920, 1200, ASTDP_1920x1200_60 },
>>> +    { 0 }
>>> +};
>>> +
>>> +static int __ast_astdp_get_mode_index(unsigned int hdisplay, 
>>> unsigned int vdisplay)
>>> +{
>>> +    const struct ast_astdp_mode_index_table_entry *entry = 
>>> ast_astdp_mode_index_table;
>>> +
>>> +    while (entry->hdisplay && entry->vdisplay) {
>>> +        if (entry->hdisplay == hdisplay && entry->vdisplay == vdisplay)
>>> +            return entry->mode_index;
>>> +        ++entry;
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +
>>>   static int ast_astdp_get_mode_index(const struct ast_vbios_enhtable 
>>> *vmode)
>>>   {
>>> +    int mode_index;
>>>       u8 refresh_rate_index;
>>>   +    mode_index = __ast_astdp_get_mode_index(vmode->hde, vmode->vde);
>>> +    if (mode_index < 0)
>>> +        return mode_index;
>>> +
>>>       if (vmode->refresh_rate_index < 1 || vmode->refresh_rate_index 
>>> > 255)
>>>           return -EINVAL;
>>> -
>>>       refresh_rate_index = vmode->refresh_rate_index - 1;
>>>   -    switch (vmode->hde) {
>>> -    case 320:
>>> -        if (vmode->vde == 240)
>>> -            return ASTDP_320x240_60;
>>> -        break;
>>> -    case 400:
>>> -        if (vmode->vde == 300)
>>> -            return ASTDP_400x300_60;
>>> -        break;
>>> -    case 512:
>>> -        if (vmode->vde == 384)
>>> -            return ASTDP_512x384_60;
>>> -        break;
>>> -    case 640:
>>> -        if (vmode->vde == 480)
>>> -            return (u8)(ASTDP_640x480_60 + (u8)refresh_rate_index);
>>> -        break;
>>> -    case 800:
>>> -        if (vmode->vde == 600)
>>> -            return (u8)(ASTDP_800x600_56 + (u8)refresh_rate_index);
>>> -        break;
>>> -    case 1024:
>>> -        if (vmode->vde == 768)
>>> -            return (u8)(ASTDP_1024x768_60 + (u8)refresh_rate_index);
>>> -        break;
>>> -    case 1152:
>>> -        if (vmode->vde == 864)
>>> -            return ASTDP_1152x864_75;
>>> -        break;
>>> -    case 1280:
>>> -        if (vmode->vde == 800)
>>> -            return (u8)(ASTDP_1280x800_60_RB - (u8)refresh_rate_index);
>>> -        if (vmode->vde == 1024)
>>> -            return (u8)(ASTDP_1280x1024_60 + (u8)refresh_rate_index);
>>> -        break;
>>> -    case 1360:
>>> -    case 1366:
>>> -        if (vmode->vde == 768)
>>> -            return ASTDP_1366x768_60;
>>> -        break;
>>> -    case 1440:
>>> -        if (vmode->vde == 900)
>>> -            return (u8)(ASTDP_1440x900_60_RB - (u8)refresh_rate_index);
>>> -        break;
>>> -    case 1600:
>>> -        if (vmode->vde == 900)
>>> -            return (u8)(ASTDP_1600x900_60_RB - (u8)refresh_rate_index);
>>> -        if (vmode->vde == 1200)
>>
>>> -        break;
>>> -    case 1680:
>>> -        if (vmode->vde == 1050)
>>> -            return (u8)(ASTDP_1680x1050_60_RB - 
>>> (u8)refresh_rate_index);
>>> -        break;
>>> -    case 1920:
>>> -        if (vmode->vde == 1080)
>>> -            return ASTDP_1920x1080_60;
>>> -        if (vmode->vde == 1200)
>>> -            return ASTDP_1920x1200_60;
>>> +    /* FIXME: Why are we doing this? */
>>> +    switch (mode_index) {
>>> +    case ASTDP_1280x800_60_RB:
>>> +    case ASTDP_1440x900_60_RB:
>>> +    case ASTDP_1600x900_60_RB:
>>> +    case ASTDP_1680x1050_60_RB:
>>> +        mode_index = (u8)(mode_index - (u8)refresh_rate_index);
>>>           break;
>> I think you should add this to do the same as before:
> 
> It's intentional. The refresh-rate index stored in vmode- 
>  >refresh_rate_index is at least one. The function then subtracts 1 to 
> compute refresh_rate_index, so we have 0 by default. And that's what we 
> always used for cases that did not explicitly add refresh_rate_index 
> before. I guess I should add this to the commit message's second paragraph.
> 
> Apart from that, I honestly don't understand the purpose of this 
> computation.

Yes, I have no clue either. Thanks for the clarification.> Best regards
> Thomas
> 
>>
>>     case ASTDP_640x480_60:
>>     case ASTDP_800x600_56:
>>     case ASTDP_1024x768_60:
>>     case ASTDP_1280x1024_60:
>>         mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>>           break;
>>     default:
>>         break;
>>
>>>       default:
>>> +        mode_index = (u8)(mode_index + (u8)refresh_rate_index);
>>>           break;
>>>       }
>>>   -    return -EINVAL;
>>> +    return mode_index;
>>>   }
>>>     static bool ast_astdp_is_connected(struct ast_device *ast)
>>
> 

