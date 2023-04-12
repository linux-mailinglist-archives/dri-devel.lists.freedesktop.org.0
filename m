Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D955F6DFAE0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 18:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0730710E03D;
	Wed, 12 Apr 2023 16:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BABC10E2EC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681315818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJCWQ83neccOk4cQYizEd6oZJxX1TCTab2/R2voqwCY=;
 b=S6m88MiPIxb10MegYjibrMdEcFaYK23+S9bFCNPP/Ou4Kg6sRXh6ucb0j4uXW88gH/oqj4
 5ueERCWu0/2hwMDqL7imNlki7a5sYJnlqT6K1DNznknWVZH/oX8OKkvKoNuKpR9mCiMW46
 JKAlrwZXdUoYJ8PF84Y6exm+kTvMpAE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-4KqvdHj8MymtDIfQWmAHOQ-1; Wed, 12 Apr 2023 12:10:16 -0400
X-MC-Unique: 4KqvdHj8MymtDIfQWmAHOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 i1-20020adfaac1000000b002f3fceeda8aso857785wrc.18
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 09:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681315814; x=1683907814;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mJCWQ83neccOk4cQYizEd6oZJxX1TCTab2/R2voqwCY=;
 b=m1nRGdtw8CARhxgdLz45jPgd/LO8rfDCfcxvBZEacAEzt22erHvLZ9csQqSbKSIwOn
 e2jzYk3TCZQnNXvk6UGETcaeyij0gr3vOyNekOtjsnOm0Zwls85JWSnsF2QICudi0ZrY
 AUuLRLcBr8M/qox1cS09xWgtqI9f9ZXfp2dLx8dF3xJSPmQogTClP0GHvgO1A5SVtRQN
 mg9BNwunJMOouaR8dal0bVw9K/Gv0P3bW0nWBo8TWmyVbSuWALy9opCsExZGjbbKK8LU
 oVJT3J/CTebziOS2IbcWLkB5bCk5giP97q3F9UkoXuk9SSOBFF1/5HOFIjBAznOOdLPs
 jOBA==
X-Gm-Message-State: AAQBX9dZKQGjwbX33Z4CYGjW2x+PYGFwII5H+VjZdOgi0XA5xqtQufRd
 lhW/ZpfE616kz/HAe2keLPaennrGJjTMl7JZF5UqVhIk/A1NaK01pw8BtvhOteeEOdcf4VrC7oB
 r5Sd5FmSkuEbKSziL5P37kYrSEKev
X-Received: by 2002:a5d:4405:0:b0:2ef:ae9e:b191 with SMTP id
 z5-20020a5d4405000000b002efae9eb191mr2141820wrq.45.1681315814077; 
 Wed, 12 Apr 2023 09:10:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350YuvPzQFCHwo9SoO4okPODuiDkowHJnvBy979F1wcqkMTGg4mCZBr7SGXj6M/3x0nM7CYiiSQ==
X-Received: by 2002:a5d:4405:0:b0:2ef:ae9e:b191 with SMTP id
 z5-20020a5d4405000000b002efae9eb191mr2141808wrq.45.1681315813713; 
 Wed, 12 Apr 2023 09:10:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b003eb596cbc54sm2900696wmi.0.2023.04.12.09.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 09:10:13 -0700 (PDT)
Message-ID: <6d92fca7-1137-2497-86b3-bbd1ddf3917c@redhat.com>
Date: Wed, 12 Apr 2023 18:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] drm/mgag200: Use 24bit format in VRAM
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 lyude@redhat.com
References: <20230412133912.610294-1-jfalempe@redhat.com>
 <20230412133912.610294-3-jfalempe@redhat.com>
 <87mt3drv4q.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87mt3drv4q.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2023 17:13, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
>> The bandwidth between system memory and VRAM is very limited
>> on G200.
>> So when using a 32bit framebuffer on system memory, convert it to 24bit
>> when copying the frame to the VRAM, this allows to go 33% faster.
>> Converting the format on the fly is negligible, even on low end CPU.
>>
>> small benchmark on my Dell T310:
>> 1280x1024 32bits: ~125ms to transfert a single frame.
>> 1280x1024 24bits: ~95ms
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
> 
> I assume that the alpha channel is unused on this display HW and is just
> exposed to user-space to make the DRM driver more compatible ?

Yes, alpha channel is dropped by the hardware, and has no impact on the 
display.
Most userspace now prefer 32bit framebuffer. I know Gnome/wayland 
default to 32bit, and probably other DE are doing the same.

> 
> If so, probably has to be mentioned in the changelog but other than that:

ok I will add this in the commit message.

> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Thanks,

-- 

Jocelyn

