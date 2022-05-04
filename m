Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210F519EB6
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881B610E13E;
	Wed,  4 May 2022 11:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331510E13E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651665556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/ZQhIASnn/ubnKLFpPZhWODpMOppTPFiHq2h9icwy0=;
 b=OU5NJPfreSBpsinHwbaAEprp+OVE4SmOT+61uLG+Av1xBL0r3TQufsaVDVUI0I4C1dr4jO
 +0NoEwrz1f6nyARGMkqcBTkluZcZKhf8m+hk+/8vnmg9DoatBVq5Dl2AvmMeAGdYiMSzb9
 IXkYDIZxn0ZboFUW4AZosA+O5s2qdsU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-6TV9JdbWNzesRhyZPy3_Zw-1; Wed, 04 May 2022 07:59:15 -0400
X-MC-Unique: 6TV9JdbWNzesRhyZPy3_Zw-1
Received: by mail-wr1-f71.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso292732wrg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=v/ZQhIASnn/ubnKLFpPZhWODpMOppTPFiHq2h9icwy0=;
 b=cgg0/VmE6kC5yhRIuSk/qPMR0y4ycaufOA+rgQp9Fh7/OVJR3kp7EdKVxczOf+A+a8
 QnXozwS5qzBSzSiCRNXbHX0C/UAPP08EpOPDSpCChlJ6NHf3zD84w0rP5EVxxNUNDBr+
 0UNA77ixnBWKUS+OxVHfzDouQmadSTGmZpSEwH1Fft1HrD40rUyCp9KH6k/rLgdjRm45
 cDhHGO1LU/w7wWB7Zd6loHGwnPpaWBN4BWo2RB3mvQhRNn6ZTN/UY3R8yxWoqsXqt9mS
 mnYWqxXDlMJz9D2WE/k/6Qpaf4eiftWrVNsSa60M9heBvzz9E0e8jPTFn8OliaYmeQOj
 9+hw==
X-Gm-Message-State: AOAM531tMLUEJ6vPnu4BNJ2WKLCwRUOeIHGUXeX1DgQ5cx1fmJsP+Qfs
 3F0m094IqNIpAWlJ/rKw3jWpJf3viIKOWF0Cx05qO/1EwCFmUbXpimNGXNy4kljk11AjZR2gkiL
 c6tDyAFr5hC6hVCSedDmGDmQzwkzt
X-Received: by 2002:a05:6000:188c:b0:20c:563a:aa86 with SMTP id
 a12-20020a056000188c00b0020c563aaa86mr14711735wri.360.1651665554089; 
 Wed, 04 May 2022 04:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0uPh2rCeyHVlw2vJ7PcfM8apvhDy0enqFTN83/vlkgU9Y72BYXWcfdKRNsgopJulKxql3hA==
X-Received: by 2002:a05:6000:188c:b0:20c:563a:aa86 with SMTP id
 a12-20020a056000188c00b0020c563aaa86mr14711727wri.360.1651665553876; 
 Wed, 04 May 2022 04:59:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a765:79fb:b5ef:c480?
 ([2a01:e0a:d5:a000:a765:79fb:b5ef:c480])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003942a244ed3sm3534670wmi.24.2022.05.04.04.59.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 04:59:13 -0700 (PDT)
Message-ID: <f0242df1-dc4e-fad0-83ad-a96d5bb7abf2@redhat.com>
Date: Wed, 4 May 2022 13:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] mgag200: remove unused flag
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-4-jfalempe@redhat.com>
 <4ab30b5c-9c47-c31c-a719-3413ccffcaa4@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4ab30b5c-9c47-c31c-a719-3413ccffcaa4@suse.de>
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05/2022 12:12, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.04.22 um 18:41 schrieb Jocelyn Falempe:
>> The flag MGAG200_FLAG_HW_BUG_NO_STARTADD is no more used, because
>> the framebuffer is now always at offset 0.
> 
> Oh, well. I remember that thing. It took us a long time to find and fix 
> this problem. Back then, mgag200 still used VRAM helpers, which do page 
> flipping in video memory. Displays remained dark on some systems without 
> any clear cause. We added the flag to work around the broken HW.
> 
> I left the flag in for reference. Instead of removing it, I think we 
> should add a drm_WARN_ON_ONCE() in mgag200_set_start_add() if the flag 
> is set and offset is non-zero.

sure, I can do that in v2.

> 
> Best regards
> Thomas
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_drv.c | 3 +--
>>   drivers/gpu/drm/mgag200/mgag200_drv.h | 3 ---
>>   2 files changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index 217844d71ab5..8659e1ca8009 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -306,8 +306,7 @@ mgag200_device_create(struct pci_dev *pdev, enum 
>> mga_type type, unsigned long fl
>>   static const struct pci_device_id mgag200_pciidlist[] = {
>>       { PCI_VENDOR_ID_MATROX, 0x520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_PCI },
>>       { PCI_VENDOR_ID_MATROX, 0x521, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_AGP },
>> -    { PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
>> -        G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
>> +    { PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_SE_A },
>>       { PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_SE_B },
>>       { PCI_VENDOR_ID_MATROX, 0x530, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_EV },
>>       { PCI_VENDOR_ID_MATROX, 0x532, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 
>> G200_WB },
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> index 4368112023f7..c7b6dc771ab3 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -201,9 +201,6 @@ enum mga_type {
>>       G200_EW3,
>>   };
>> -/* HW does not handle 'startadd' field correct. */
>> -#define MGAG200_FLAG_HW_BUG_NO_STARTADD    (1ul << 8)
>> -
>>   #define MGAG200_TYPE_MASK    (0x000000ff)
>>   #define MGAG200_FLAG_MASK    (0x00ffff00)
> 

