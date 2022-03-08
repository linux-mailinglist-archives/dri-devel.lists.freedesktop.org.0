Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E164D1406
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8720C10EC55;
	Tue,  8 Mar 2022 09:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACB710EC3C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646733508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qc/dPF9NCELBNu4QqNWKZSQHX9YzQPWRojivE3+b0CU=;
 b=GkSDVgvU6z9yOhhGuvq+eNbRilZSOUqPAqIfsBu0oECG+dtKcNW4Azk3ryBRDcxua1xODc
 obvPR52mOuFQLXQ1/tlbwORxvllkedHe1DJlZ7tulh09lsMxv2MdQY025ILi6ZokHXLgHF
 jf/+J7Gel78k+HjRe3nltgZDZujRDoU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-8OCpVW_EP9uvTe-T1wbVTw-1; Tue, 08 Mar 2022 04:58:24 -0500
X-MC-Unique: 8OCpVW_EP9uvTe-T1wbVTw-1
Received: by mail-wr1-f70.google.com with SMTP id
 l10-20020a05600012ca00b001f1e4669c98so1599821wrx.23
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 01:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qc/dPF9NCELBNu4QqNWKZSQHX9YzQPWRojivE3+b0CU=;
 b=y389ws4BAzZm+Z04ZJKpVBbbWzZfmzX4FCOvX+1eD0FtFdvReA9IPf0KsHHpMQ89N/
 VaTt6eH1pJPRmnCyQQdhagL4H48umJJrGh28GN8+WIDOaVeIturXmS9IPLd8FpJFqbmM
 oCJPOAkS1cRegl3eDTGuuOaqtoKQR8KimVop0gOcY1i6NZ0nG9iNsKIRJgPXlUNzTI+3
 l7zSTM1C3JQ9mOtsg0A7f2LG5d3XpP/Q1b95vNl7pi+GiX7x8RJdYjWchaMIatjTzkeZ
 M8fn2EWCn7ZIM13kyo+YH5JJQqf3mm5tZB2FEu/aanZi0rqyGAvnBqEMsZie6CDCLfGB
 +Faw==
X-Gm-Message-State: AOAM533zxgN5E0dSoIFoJfyPgBP1nMF/s9CQPX2YrQJpDJ9L9058AIpJ
 QYCI1bWSFSFm4Js+AybbAgVak2EmdxAVXLuTXiUxWniNBl4NsNOT6IQzS4YfWjfo+kdmydnDHUv
 paYZaZsRoqy96SqLEHGCWsMwu9CM/
X-Received: by 2002:a05:600c:35d5:b0:389:bd4a:fde0 with SMTP id
 r21-20020a05600c35d500b00389bd4afde0mr2905729wmq.127.1646733503696; 
 Tue, 08 Mar 2022 01:58:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJtj7RKYw3qkkDGfz/aSVN5Brr3Z9cCTJdq5hynPwmNva1D24fAYp/TKddQMzVWxr4O9YHKw==
X-Received: by 2002:a05:600c:35d5:b0:389:bd4a:fde0 with SMTP id
 r21-20020a05600c35d500b00389bd4afde0mr2905711wmq.127.1646733503447; 
 Tue, 08 Mar 2022 01:58:23 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 9-20020a1c0209000000b003868897278asm2475185wmc.23.2022.03.08.01.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 01:58:23 -0800 (PST)
Message-ID: <f869d4ee-210f-06b4-015b-b3ec78eaf4fb@redhat.com>
Date: Tue, 8 Mar 2022 10:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/9] drm/simpledrm: Use fbdev defaults for shadow buffering
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-2-tzimmermann@suse.de>
 <a9e7aa2c-9954-94ee-6f7c-0d6822342897@redhat.com>
 <80342fbf-5aee-5769-b439-3e147c44711f@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <80342fbf-5aee-5769-b439-3e147c44711f@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/22 10:56, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.03.22 um 10:31 schrieb Javier Martinez Canillas:
>> On 3/3/22 21:58, Thomas Zimmermann wrote:
>>> Don't select shadow buffering for the fbdev console explicitly. The
>>> fbdev emulation's heuristic will enable it for any framebuffer with
>>> .dirty callback.
>>>
>>
>> Indeed it does. Not related to your series but looking at this
>> patch I noticed that drivers/gpu/drm/tiny/bochs.c will be the
>> only driver that sets .prefer_shadow_fbdev after this lands.
>>
>> The driver is using GEM so I wonder if after your series this
>> DRM driver could have a .dirty callback and the field just be
>> dropped? Or there would still be a case where it is needed ?
> Bochs uses VRAM helpers (i.e., TTM). Fbdev and userspace would directly 
> write into that buffer memory without a copy. So the dirty function 
> would be empty.
> 
> Other drivers with VRAM helpers (e.g., hibmc, ast) operate on uncached 
> I/O memory AFAICT. So they set .prefer_shadow, which also affects 
> userspace. Bochs uses cached memory and shouldn't need prefer_shadow. 
> Setting prefer_shadow_fbdev is only there for making the fbdev buffer 
> object evictable from video memory.
> 
> As it stands, using prefer_shadow_fbdev is the cleanest solution, even 
> if bochs is the only user of that field.
> 
> Alternatively, we could make it a requirement that qemu provides enough 
> video memory for bochs to unconditionally pin the fbdev BO there without 
> ever evicting. I guess, that would mean 32 MiB of VRAM at least.
>

I see. Thanks a lot for this explanation.
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

