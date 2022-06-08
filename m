Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91254395E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6AA1123BE;
	Wed,  8 Jun 2022 16:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0129611224B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654706933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bByiFHMltGefY+LNK3OtBeBXj88eR9EK0TLlc44mXOI=;
 b=WjtoM6+rCnf1GKvzqqIrWc0VlQZZhV5TM74BzLvCRcFp1HubbCJWQ2rJWd+jcaGdcbo8qf
 30gR6WfY6AoHhdlPHSUjeK4OmRH6hoK8vn7yu4cA7tVR1aNRbYYuMqG5GNgMyUmGCGg7Iq
 IEiYtnuqKwTVSxZUGlmr3aEZLoqrItk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-296-S_jtnJ5eOseY1YOnlFu13g-1; Wed, 08 Jun 2022 12:48:43 -0400
X-MC-Unique: S_jtnJ5eOseY1YOnlFu13g-1
Received: by mail-wm1-f70.google.com with SMTP id
 h189-20020a1c21c6000000b0039c65f0e4ccso230316wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bByiFHMltGefY+LNK3OtBeBXj88eR9EK0TLlc44mXOI=;
 b=AEf7T6XIM55acgTZFptHLft36lEPXLItuOSvCfCP5PcLVJBL7AGG2CkkStFs058M3H
 MpxU9phE76qtLSS/qgkoId6tym7oEMlZd9C+yJcNYKqjDl9LzGm/jpdBmfkdfvZXvW1W
 rJCgbuC0ZxmReUMP5icCVQzrZWr4EgxsuHHbHIJlS+fP01z6o7ZchQqMXmOna6s+C3k7
 Z/g87FDqr+gATvI5p9XGAIKrBcU5Rwagt3WozJGZd1e063T6eRTtm3Eb5weoqevqqEwF
 ge6uwmkxVj2evHhoV5o9q0v2fwA+DGMYK4hvEkoICdCvcHWhJdZbMiLHefvD0EwPAclk
 6GtQ==
X-Gm-Message-State: AOAM533DaT8mlWvKf58haME/thf0Ou/8y7diPsFnRjSARj9QNLdaGn9Y
 4fm1oAJSeoJVXk2EioA8dBLqvG58VxX532XI6KOPQtZPh5HvLtApvL6kzoODeOHyyJt3DCNtiZ1
 qoS/JE4Pv33x+ShVbHtHZiZxAMEA+
X-Received: by 2002:a7b:cc94:0:b0:39c:4507:e806 with SMTP id
 p20-20020a7bcc94000000b0039c4507e806mr98127wma.91.1654706921839; 
 Wed, 08 Jun 2022 09:48:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt4Wew6G2zM4whZozpTcKSEmGO8wSo4bYJzdB8bqNPIJR/gfzTkCZSt9C5yJEO//7SXLvG5g==
X-Received: by 2002:a7b:cc94:0:b0:39c:4507:e806 with SMTP id
 p20-20020a7bcc94000000b0039c4507e806mr98102wma.91.1654706921600; 
 Wed, 08 Jun 2022 09:48:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az13-20020a05600c600d00b0039c47767e23sm3583771wmb.33.2022.06.08.09.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 09:48:41 -0700 (PDT)
Message-ID: <40f27e32-720a-2f51-2164-5e152f53443a@redhat.com>
Date: Wed, 8 Jun 2022 18:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/6] Raspberry PI 4 V3D enablement
To: Melissa Wen <mwen@igalia.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <cadecbfd-e174-eadb-276c-577bb2bf70f2@gmail.com>
 <9aaaaa29-11c0-d494-11dd-0bbf5d384364@redhat.com>
 <20220608155130.w4piz2g3obp7qnx7@mail.igalia.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220608155130.w4piz2g3obp7qnx7@mail.igalia.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>,
 maxime@cerno.tech, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Melissa,

On 6/8/22 17:51, Melissa Wen wrote:

[snip]

>>>
>>> I can take the last 3 patches through the Broadcom ARM SoC pull request, 
>>> but the first three should probably go via the DRM tree unless you want 
>>> me to merge them all?
>>
>> I can merge the first 3 patches through the drm-misc tree. Can I get
>> an ack from you for those ?
>>
>> The changes are independent so there's no need for an immutable branch
>> or any kind of cross tree coordination.
> 
> Hi Javier,
> 
> I'm not sure if you're suggesting here to apply the entire series as it
> is now.
>

No. I suggested that could just apply the first 3 patches that were related
to DRM, not the last 3 three since Florian will pick those.
 
> I'm not able to have a functional kernel from arm defconfig, only for
> arm64. I'd like to have this issue clarified before merge this serie. I
> tried multi_v7_defconfig on raspbian 32-bits and got a kernel panic.
> Things work better when using downstream bcm2711_defconfig.
> 
> If you have an idea of what is going on, please, let me know. I can try

Can you please share for info? For example your boot log when it panics,
maybe that could shed some light on what's going on.

> again and I'll be okay on merging it. Otherwise, let's wait for more
> inputs to have a better picture of the situation.
>

Of course I don't plan to push patches that are known to cause issues.

I mentioned that could help merging the DRM changes if needed before
you sent your bug report.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

