Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4970D45E
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 08:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF99310E3D9;
	Tue, 23 May 2023 06:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA75410E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 06:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684824914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odsUUnwClAP2on65xdKl2Hq7oF6vzO61yTHmTu6IXeE=;
 b=XPL0DyMxqxj26fumI8ynMO0da9ljAMAiG5QAA1e1cMAdInlrMtNeUAxX949shZ1qv/sh9e
 O/Bq5FQ9WD4EJsQYiLb64ZwOL1j6N5SNEkD6xk93bHlgeIYBkqc9rcTApZeFz+tT6HxtRE
 Ra9mbgCRFFDGEidRSnKMPqrEXQaqqvI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-OPJCQg8KO0WB664j4alZ0g-1; Tue, 23 May 2023 02:55:13 -0400
X-MC-Unique: OPJCQg8KO0WB664j4alZ0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f60481749eso9984095e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 23:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684824912; x=1687416912;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odsUUnwClAP2on65xdKl2Hq7oF6vzO61yTHmTu6IXeE=;
 b=PaqsaH9TRLE91SKwzy05q3grwdqeTEcMLrKotNFClJuAdDEkAyl5UvLUxtkVpLsXJA
 J/bqBtzCk5fhUXtLtGMjelKOfgd4JsvsDBUqMCVAOV3vCjdAxQgVoSTfvBjIYFcvufVj
 320uMxnq6V6eqzWvv4YmUalqmywWfb4rbkj0MblfskXgvOA2MVo84G7oqsR7oZoucGax
 dzZ9tTqjcszt4ju7Q3eISqGenKXVjgAXg4nzvi8uxeA1L/+YsMZJdtIrBw+m3wWJ98Hc
 xzSSlTc9yerNyheM0FwT92AjOSJVFmwTXPDCkgBlt0OCtzycL5qISP6YRcqgBvGWEU8h
 EA8Q==
X-Gm-Message-State: AC+VfDyRplpCxyDgq7ggYtpolVCMNACwI7ch8x1+ubfSz/o8Mpt2Czdy
 OseAADK8NOz3HbDKzcQEHKh8rQoa986lu8rxCW93QOWnHAHCqYzCRQrzA2TCHTUdDWHmUAe927R
 Whr0gP5cYfHKafrL9bRPkXOc/zQI5
X-Received: by 2002:a05:600c:1e01:b0:3f6:b44:3163 with SMTP id
 ay1-20020a05600c1e0100b003f60b443163mr682726wmb.12.1684824912308; 
 Mon, 22 May 2023 23:55:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qJRY8jU/JR4ZTguCc25jcaqQwMaTKNt22+z7yh9WE1iICxCh3azlN7cQtd042q4bPwNViaw==
X-Received: by 2002:a05:600c:1e01:b0:3f6:b44:3163 with SMTP id
 ay1-20020a05600c1e0100b003f60b443163mr682714wmb.12.1684824911999; 
 Mon, 22 May 2023 23:55:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1cf613000000b003f1958eeadcsm13735091wmc.17.2023.05.22.23.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 23:55:11 -0700 (PDT)
Message-ID: <b48a462b-ed20-f8fe-5b4f-4e7f93f8f5e0@redhat.com>
Date: Tue, 23 May 2023 08:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230505124337.854845-1-jfalempe@redhat.com>
 <20230505124337.854845-5-jfalempe@redhat.com>
 <380dd99b-00cd-fc75-94af-ae5074882006@suse.de>
 <35dd9e6f-19b8-36cc-eeae-36399a2498f1@redhat.com>
In-Reply-To: <35dd9e6f-19b8-36cc-eeae-36399a2498f1@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 11:49, Jocelyn Falempe wrote:
> On 08/05/2023 10:04, Thomas Zimmermann wrote:
>> Hi Jocelyn
>>
>> Am 05.05.23 um 14:43 schrieb Jocelyn Falempe:

[cut]
>>> +    /* pad each line to 32bits boundaries see section 4.5.7 of G200 
>>> Specification */
>>> +    int width_padded = round_up(width * cpp, 4);
>>> +
>>> +    for (i = 0; i < height; i++)
>>> +        memcpy(mdev->dma_buf + width_padded * i,
>>> +               src + (((clip->y1 + i) * pitch) + clip->x1 * cpp),
>>> +               width * cpp);
>>
>> This memcpy() should probably go away.  Instead of SHMEM, mgag200 
>> should allocate with GEM DMA helpers. We have a number of drivers that 
>> use DMA helpers with DRM format helpers, so the conversion should be 
>> strait-forward and can be done independently from the other patches.
> 
> This is something I tried to do.
> It will also make the driver a bit more complex, because when the damage 
> rectangle is not the full screen, I will need to do one ILOAD per line, 
> instead of one for the whole rectangle, but that's still manageable.
> Do you know which driver I can take as an example ?

I've tested using the GEM DMA helper, but on my test machine, I have the 
same issue that it fails to allocate the framebuffer when it is more 
than 4MB.
So it works in 1024x768 (3MB) but fails for 1280x1024 (5MB).

Adding cma=128M to the kernel command line makes it work (in 1280x1024) 
sometime but not reliably. (it fails to allocate in loop for 30min, and 
then suddenly the allocation succeed, and graphics start working). Also 
enabling iommu seems to have no effect.

I'm probably missing something, as other drivers are using this 
successfully ?

I just used DEFINE_DRM_GEM_DMA_FOPS instead of DEFINE_DRM_GEM_FOPS and
DRM_GEM_DMA_DRIVER_OPS instead of DRM_GEM_SHMEM_DRIVER_OPS in mgag200_drv.c

Then I call drm_fb_dma_get_gem_obj() to get the physical address for the 
Matrox's DMA.

Best regards,

-- 

Jocelyn




