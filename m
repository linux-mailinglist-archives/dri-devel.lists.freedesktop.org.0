Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEFB65B6DF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 20:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD9710E384;
	Mon,  2 Jan 2023 19:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6710E384
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672686800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rS6IkM26a9yODRpF7B+x34s+L3GGgZHwy27uItfaRms=;
 b=Bh/yMX7/yZaheRfjhmmv5r7P+xSuGsECgQWpGMYZ6jOjXP9m7KNmOdzO5cEwcsf1mZcXRK
 6/yaZRZ2KUjpebqYomt9SQQLY/GML8Aod6D06qkTI6GYlKospsQa19710EU9V7pgz5U4Ow
 9U0LcEMgl+MAxp/89qygUTxwfnvG9Fk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-217-K-Wp2r2tNP6iRUOaAUI7cQ-1; Mon, 02 Jan 2023 14:13:19 -0500
X-MC-Unique: K-Wp2r2tNP6iRUOaAUI7cQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p34-20020a05600c1da200b003d990064285so9755221wms.8
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 11:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rS6IkM26a9yODRpF7B+x34s+L3GGgZHwy27uItfaRms=;
 b=x0b1tdiq483KVfjf/yTnBml44wjg/XaGijozm8mDpe4v1Bf7mPBCLpy3Y2lNK+G+OA
 qLXQ19okTflEY1ObBVMJcgyFEOoJtd1ftMnzmT0Glgs9w38B+sadlAK4A5kgp8NKVRKV
 a9PcAMeUHOZpKSLqwtEfKRKVJ+LgEGzTdH3alNkGLHwoBneUGErB0X3DaNpGcA/plPXS
 qVd2m/ply0u0v2/njDF5eLQNS1t6k4GUtYT2m9DmkpauC6w2/SQKgbDJtaVsea94J3+V
 LuKN0SCE1pKhx2CGzalessvCy8E3hO7cCM9ds+TVnAmRFnYqM1ymjXe6jdL2RxBEb4J2
 0UWA==
X-Gm-Message-State: AFqh2koD9fwT+j895bEMWUw2JAponpbTtnj2o6wkz2a2imTp5rsdVApg
 L8XDGJjZoifBz+aeOBel9bMiaQqeADtht6i6trS3vVmxhxKMWUAYD9r5SNsVVgdpBcuFVXWLkCi
 TWL5ZxUA1Umx9U6aC/NjGryGB25tE
X-Received: by 2002:adf:f00c:0:b0:242:63e5:fdaa with SMTP id
 j12-20020adff00c000000b0024263e5fdaamr23459084wro.62.1672686798041; 
 Mon, 02 Jan 2023 11:13:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9wGF7fw14CLhRRj6sqQE3EQYPOSo+EpyWbo8tgMFVfQRNnX3BMShvwWiSB7JImfYWjXddSw==
X-Received: by 2002:adf:f00c:0:b0:242:63e5:fdaa with SMTP id
 j12-20020adff00c000000b0024263e5fdaamr23459073wro.62.1672686797810; 
 Mon, 02 Jan 2023 11:13:17 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u17-20020adfeb51000000b0026e94493858sm29025917wrn.106.2023.01.02.11.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 11:13:17 -0800 (PST)
Message-ID: <e7b9e76e-8f34-75c8-2136-095bd42a0bf8@redhat.com>
Date: Mon, 2 Jan 2023 20:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 00/14] drm/panel: Make panel drivers use existing DSI
 write macros
To: Sam Ravnborg <sam@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <Y7Mp1diWRWgiHsw0@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y7Mp1diWRWgiHsw0@ravnborg.org>
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/2/23 20:00, Sam Ravnborg wrote:
> Hi Javier.
> 
> On Wed, Dec 28, 2022 at 02:47:43AM +0100, Javier Martinez Canillas wrote:
>> Hello,
>>
>> This series contains cleanups for DRM panel drivers that define their own
>> DSI write macros instead of using what's already in <drm/drm_mipi_dsi.h>.
>>
>> The changes are quite trivial but I've only tested this with allmodconfig
>> and `make M=drivers/gpu/drm/panel/` so please review and testing would be
>> highly appreciated.
> 
> Nice cleanup - I like it.

Thanks.

> In most of the patches there is some trivial indent that should be
> fixed, I think I noted it everywhere.
>

Yup, I just used sed -i to modify in-place but the new macro _seq suffix
caused the wrong indent everywhere. I'll fix them in v2.
 
> Sorry - but no testing.
>

No worries, I also just build tested the drivers since I lack the HW but
the changes are pretty trivial so I expect no functional changes.
 
> The last patch is buggy - see the comment.

Indeed. Thanks for pointing that out! I completely missed that the macro
was different than the others.

> I suggest to land patch 1 now (with the fix), this makes it easier for
> others to test on top of drm-misc-next.
>

Agreed. I'll just post that one as a v2 and then the rest as a separate
series after pushing that to drm-misc-next.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

