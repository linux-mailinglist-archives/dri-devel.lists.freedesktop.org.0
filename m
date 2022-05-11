Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A228C523256
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A102A10E258;
	Wed, 11 May 2022 12:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411C510E258
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652270484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvJz3kIQp6oFZy6gEtQUxT64p3T3zR43kmgls6fwHwE=;
 b=dHg7jB+Im07ZE2h1IuauFAVghftTdyQvJE6++ABC+2qfRKmJn/VEg+SrkC/SLGR42x6bko
 oQ96DDCsvHGKcoegJoEg+opmLOaTuTLFqeS7RdhcyeLH8uH7letvyICieEm07VzHuhkNIZ
 jwSs++wEGJAFIh7mjhKU7YAPjVqrn50=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-ZkbNbBVGPYejndgqGvG1IQ-1; Wed, 11 May 2022 08:01:23 -0400
X-MC-Unique: ZkbNbBVGPYejndgqGvG1IQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so2742419wmq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dvJz3kIQp6oFZy6gEtQUxT64p3T3zR43kmgls6fwHwE=;
 b=Z33NWaLpfGZCBVFqqzgnjLpqb1122Gqrc6xWfn6aXxyQP8YU1B+8sabFapXfUU2Di6
 CohfyXprHfVl5u6cq03CIbpN9Jg+WLAPUb0bZHLoFgZ8WLEyfQKv9pRBPPeEn3JIWwAs
 BVXP8IhkXi3hgHfoeVw2Cxd0U0+88yP7SxnQpPxm5AP0lqqO9odvPWkghLuPMH6YILvb
 enNx5y1y0B5u45Hen3bM563/p9GWoN9k7FIiQj7cHZWEqPWPDzJuRkW5Lc+7shFGyRgs
 /+avse9oYKv41aTKmAsI+CKS8JNX0lkQU+Wz+q+/kT+vJ8S28cHRvNQgfzHK/G35y99T
 MjIg==
X-Gm-Message-State: AOAM531AAatcJo73HZxVhWOAwUXH0SpT/qOQ/kntVdsShgu1LRip9lID
 0lpr2M7PnIaTHNFKSwojGsolufkasSYIlO1dPtSwlB0feYV5L6IdTmj5tAsWFWAOywxO1WgenyS
 6cxXPFB1br6QI4iYpm/ECEnOYr6bZ
X-Received: by 2002:a7b:c186:0:b0:394:bed:e0cf with SMTP id
 y6-20020a7bc186000000b003940bede0cfmr4401686wmi.162.1652270481384; 
 Wed, 11 May 2022 05:01:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJU9TiluFpK/8RtXUWSj8BNNT56qPPeY24uIkteINdDQBh7GlSAISg5cd1QveK6E+uS7WTog==
X-Received: by 2002:a7b:c186:0:b0:394:bed:e0cf with SMTP id
 y6-20020a7bc186000000b003940bede0cfmr4401600wmi.162.1652270480623; 
 Wed, 11 May 2022 05:01:20 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003942a244ec5sm1925339wml.10.2022.05.11.05.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 05:01:20 -0700 (PDT)
Message-ID: <7d9f44e6-ae45-1747-366a-15cf2941dc2f@redhat.com>
Date: Wed, 11 May 2022 14:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/7] firmware: sysfb: Add helpers to unregister a pdev
 and disable registration
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-3-javierm@redhat.com>
 <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <09cc267d-ead4-dd63-07dd-dfa347cbcee1@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/11/22 13:54, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.05.22 um 13:24 schrieb Javier Martinez Canillas:
>> These can be used by subsystems to unregister a platform device registered
>> by sysfb and also to disable future platform device registration in sysfb.
>>
> 
> I find it very hard to review these patches, as related things are put 
> into separate patches.
> 
> I suggest to put the sysfb_disable() stuff into patch 5 and the rest 
> into patch 4.
>

Ok, you then want in the same patch to have both the helper definition
and first usage.

Other subsystems ask you to do the opposite, to split the definition and
usage in separate patches. But I'm fine with merging those if you prefer.
 
> Best regards
> Thomas
> 
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

