Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A962F6B7
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56AC10E742;
	Fri, 18 Nov 2022 14:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC6D10E72F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668780096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4PQ5IbrNFQk2mj5BUUnbMGfNXJMqjvDXukuiRNs2Vc=;
 b=VBAAcwUO4fbFaoCMxCPY5149W7kYwRdVJ2PuWWkNfcvtooHhfPNuLXOMJFg3B2BiaA6vDK
 tqzkSMuVKBTyAARSEaRYTawLCnqOw2k7UOzb+YjTMAwuX9dQmMLLzBR8hpWCrHIlOp1Fbp
 RV4GCW1xEiVHGExg7Hd7tro/+MNMN+Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-f5829YTpOX2C7puC1WIdbQ-1; Fri, 18 Nov 2022 09:01:34 -0500
X-MC-Unique: f5829YTpOX2C7puC1WIdbQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 i14-20020adfa50e000000b0023652707418so1620449wrb.20
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T4PQ5IbrNFQk2mj5BUUnbMGfNXJMqjvDXukuiRNs2Vc=;
 b=4QVhCxzwVAt8llYIHovkesoAovK7Wi8y3ISkvp148p/KK4pDzfRgoiTA7cxg7wiAQF
 MrWts6CQ/EmsoGBq99R1BrXN9hesKppM9nYn9FlgYcqq3AATyyMt/4/mUnAF2UwWc2k7
 hE3QGHLWKMlRncaIT44Lg1M5RPLDCn17dWdFC76xzOcjhxJ9FfhJfjdSBePSUTj2e8sH
 m0KTHb377/JzQXkpaVQTafdJ+TtdQczhJ/7rYRWN5RqjYVD+nyhYXA+TR9IhRyzgNPyO
 lvR/NAPMkVyibPXIYakrLcvEcXgI87LScAygVz5n2QBaDwpbI6L8JlsDNpT7x+t2vprh
 QEoQ==
X-Gm-Message-State: ANoB5pmyQvfK3qkLbdcllmdjoT9N2FHiP4JqL0OYXPA2cuPi2zhj2hMt
 Xli5qLsabUmDQ/bPV/aViwluCPZPUqOTaLZ9OiUqMce9oKDphbIAm7K4Qf9CYxH9y/6WTksun6P
 tAzWtkTLAbz1U109it1IVeghfOSFZ
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id
 m5-20020a7bca45000000b003c4bda17c57mr8686294wml.6.1668780093409; 
 Fri, 18 Nov 2022 06:01:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5d+MEceeaLfAU03DL9gIKTDEBvfDXHGIX0zq027/DsyUOQUPgbC/yWFwlicah+sz0hCVpcDg==
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id
 m5-20020a7bca45000000b003c4bda17c57mr8686233wml.6.1668780092987; 
 Fri, 18 Nov 2022 06:01:32 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c3-20020a5d4cc3000000b00241c4bd6c09sm1144086wrt.33.2022.11.18.06.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:01:32 -0800 (PST)
Message-ID: <03f625e6-f6e4-25dc-f325-4dfbe138f713@redhat.com>
Date: Fri, 18 Nov 2022 15:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
 <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
 <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
 <5893d46d-ca8a-81e4-2884-aa682ef69872@redhat.com>
 <2d2bf68d-6a6a-d00c-a277-4ebc492e8fae@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <2d2bf68d-6a6a-d00c-a277-4ebc492e8fae@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 14:48, Thomas Zimmermann wrote:

[...]

>>>
>>
>> Ah, I see. So is to set 32-bit bpp for both XRGB8888 and ARGB8888. But then
>> I think that you also need to fix logicvc_mode_init() to remove that += 8?
>>
>> Because right now the preferred_depth += 8 would set a preferred_depth of 32
>> when should be just 24 even if alpha is enabled?
>>
>> Or am I confusing again the meaning of the color depth?
> 
> For DRM, it's defined in drm_fourcc.c. ARGB8888 has a depth of 32 and 
> XRGB8888 has a depth of 24. Both have a bpp of 32.
> 
> BUT in logicvc's internal data structure, both formats have a color 
> depth of 24 and a bpp of 32.
>

Got it. Thanks for the explanations and sorry for the silly questions then.

If you drop that 15-bit preferred depth case, feel free to add

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

