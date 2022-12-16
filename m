Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF364EBC7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 14:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D2210E5C6;
	Fri, 16 Dec 2022 13:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C26B10E5C6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNSYe3TRMGv5m5RI72VhSMEpC3Fqh7WOCcnn68AuVas=;
 b=FuDsJZX3IuO39UTpSZ2pWyRColgOJbbwtbG4E4hhUh+HgFJ4eshQY0BXEsPQ71J/DL407u
 rLPsl6vq/FfFdM7JKxkvvYQjSOh6B0FIBBT0jaNo2dYNFVvj4iA/+dtIwudM61zL1zg8mD
 9C6+fyi4HwL9wS/mAYakk5e/dRELBHU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-WlUSdFC5PNeECa_CIZwpEA-1; Fri, 16 Dec 2022 08:01:40 -0500
X-MC-Unique: WlUSdFC5PNeECa_CIZwpEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h81-20020a1c2154000000b003d1c8e519fbso2557289wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 05:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNSYe3TRMGv5m5RI72VhSMEpC3Fqh7WOCcnn68AuVas=;
 b=g1zJPIBL1BnXfe6effkHmP8LuG8TPNbnyjy7BsPYsfn74+dZPPA573zaYjNG6RuS4/
 lpYU558uAYUFSXKpTvaPmHbH7X1L4gMRkugX2KZOEu6n8qsTVnIQd9MK87nb3ukUiYIL
 o1rzrChCfV4pZt1Fm+Wch3byfyHl+WefE/gRbULzotYxdIPAFGAFGgfjw8GLwiIZNluG
 uM0ts6HEI2Ngjb0x8mY0ep/GXmzz25UYx94iIqBHdn+BWWEQdhqJstjjeBt7VDg/VcAS
 VJrWhNF24QDiLXZeAtCTCgXYoLsQiW4UMv6oAYaoz/ZkVliu+dtTsS6EUCfzPUALkNAx
 MPxw==
X-Gm-Message-State: ANoB5pnCtNsifCSyHEOoABdUyN2B9uzFwkWNpohjC8V6ciL8biUUntED
 bH5kKIVlGQR35qEG7qUmUqBo61Yqffy1/8b6qRwAWY9TBcmP2jG/BEfycHFY2TXGr1SW+Fxil8o
 mnuEy4KNYze5uRnQgWmD9LwqOrdSS
X-Received: by 2002:a05:600c:6888:b0:3d1:d746:7bca with SMTP id
 fn8-20020a05600c688800b003d1d7467bcamr25095847wmb.4.1671195699333; 
 Fri, 16 Dec 2022 05:01:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4abG82lFqrrNqydA+yEhRnH4Ew1z4BMMnk2v6JSkHNIZCqtkmkCOUQMfiGE18h9Q/SCZLnZw==
X-Received: by 2002:a05:600c:6888:b0:3d1:d746:7bca with SMTP id
 fn8-20020a05600c688800b003d1d7467bcamr25095823wmb.4.1671195699083; 
 Fri, 16 Dec 2022 05:01:39 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm11152265wmq.2.2022.12.16.05.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 05:01:38 -0800 (PST)
Message-ID: <fd3cf15c-9a07-ef43-daeb-10aaf767e809@redhat.com>
Date: Fri, 16 Dec 2022 14:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm: Only select I2C_ALGOBIT for drivers that actually
 need it
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220912091505.149423-1-u.kleine-koenig@pengutronix.de>
 <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <12b18ff8-532e-66bd-1c34-2880c1762a22@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 19:16, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.09.22 um 11:15 schrieb Uwe Kleine-König:
>> While working on a drm driver that doesn't need the i2c algobit stuff I
>> noticed that DRM selects this code even tough only 8 drivers actually use
>> it. While also only some drivers use i2c, keep the select for I2C for the
>> next cleanup patch. Still prepare this already by also selecting I2C for
>> the individual drivers.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>> Changes since v1
>> (20210514100142.1182997-1-u.kleine-koenig@pengutronix.de) from
>> 2021-05-14:
>>
>>   - rebased to next-20220909
>>     was something around v5.13-rc2 before, required to fix context
>>     changes in the nouveau Kconfig file. git am -3 handled it just fine.
>>
>> I reverified that no new drivers were added that need a corresponding
>> select.
>>
>> Best regards
>> Uwe
>>
>>   drivers/gpu/drm/Kconfig                 | 5 ++++-
>>   drivers/gpu/drm/ast/Kconfig             | 2 ++
>>   drivers/gpu/drm/gma500/Kconfig          | 2 ++
>>   drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
>>   drivers/gpu/drm/i915/Kconfig            | 2 ++
>>   drivers/gpu/drm/mgag200/Kconfig         | 2 ++
>>   drivers/gpu/drm/nouveau/Kconfig         | 2 ++
>>   7 files changed, 16 insertions(+), 1 deletion(-)
> 
> amdgpu and radeon also include <linux/i2c-algo-bit.h>. Are they special 
> in some way?
> 

Uwe, do you have an answer for this question? I wan to merge this patch
but don't know if need to wait for a v3 including those drivers too.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

