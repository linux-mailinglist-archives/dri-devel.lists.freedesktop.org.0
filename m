Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD5D691F36
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 13:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E2810E11E;
	Fri, 10 Feb 2023 12:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D0E10E11E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676032709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PI3oUcKvFRhOHs5XVCh/GOynsoU/7+zmMQO9bHrhWBo=;
 b=Bvs+peQClyfZMAJIoamDFQj6PM5xWGyVDp044t8cLaby4mA9YHhD/+jMdy+hrgMWMHVP6p
 UbK5FDpMcDTTpD+CO21jlzjV1OMowKkoBhgl+c/1eQJDRMtcW0Re18X8DjXYIvRrASDcFq
 /e0CD9oMiNJcxpWgglrGYHyHC9UYoh0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149--aMZft8BNaWtsuhedTpjWA-1; Fri, 10 Feb 2023 07:38:25 -0500
X-MC-Unique: -aMZft8BNaWtsuhedTpjWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k17-20020a05600c1c9100b003dd41ad974bso2506161wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 04:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PI3oUcKvFRhOHs5XVCh/GOynsoU/7+zmMQO9bHrhWBo=;
 b=6Yy9GcW5/VBpb4/8yy0AaOz6+bKsFXR5m5K4gf15QksGGdyjIklG7wdsNa9DMQbeMA
 eB4CWXk34RAv54sDRuUH+lbMglCtkjilGVunNnI5cbl22lgIwOYoq0AHdHUGvsksyFpl
 cpu39hMHNk2Keg1rDsAUjIFBTHHVQFl+bbt/kforY8vxRyz0csl0S1hwt8AHxccdYF5h
 HhvHGFKVoxS9QAbbJCrtFK9QBLCSciZNcG/JB0VinrYegapqZEfHXeV9I9/FDg/rDgZg
 N8bVZ4fRKVKVUUHeNHHeViwI6gUyd4o332TKkU/Vqs/7byUJwlzcnaGDZsHurJ8LVw+k
 eutg==
X-Gm-Message-State: AO0yUKXRjLn6j4vpQxc1KqqVtinZT0vz1MFl7V7LpjULXO6obWWAW8Lx
 nznczTxPe3kTP8gVXWtySvI9gy5gJjzdtN6ScU2PJwN8hdkya3St8/JLWq1jM4ilCnyo0haIosj
 sFguMQE1VOLF9HFR3f40uXb4Yn6nK
X-Received: by 2002:a5d:6750:0:b0:2be:64bb:1d84 with SMTP id
 l16-20020a5d6750000000b002be64bb1d84mr13710718wrw.24.1676032704781; 
 Fri, 10 Feb 2023 04:38:24 -0800 (PST)
X-Google-Smtp-Source: AK7set94Bsqs5Ph/JyHM/6nNXatqCHays9ZS2lteG/fGGCwXWMilMicUznlG3v++jadE4RijV3uDbQ==
X-Received: by 2002:a5d:6750:0:b0:2be:64bb:1d84 with SMTP id
 l16-20020a5d6750000000b002be64bb1d84mr13710711wrw.24.1676032704636; 
 Fri, 10 Feb 2023 04:38:24 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s10-20020adff80a000000b002c54c7b9c78sm612414wrp.76.2023.02.10.04.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 04:38:24 -0800 (PST)
Message-ID: <bee5d455-3e15-427a-d7a6-f633a748f4c3@redhat.com>
Date: Fri, 10 Feb 2023 13:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/shmem-helper: Fix locking for
 drm_gem_shmem_get_pages_sgt()
From: Javier Martinez Canillas <javierm@redhat.com>
To: Asahi Lina <lina@asahilina.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230205125124.2260-1-lina@asahilina.net>
 <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
In-Reply-To: <a1cd8c74-98f4-bff0-0344-cbece787c6e8@redhat.com>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/23 19:47, Javier Martinez Canillas wrote:
> Hello Lina,
> 
> On 2/5/23 13:51, Asahi Lina wrote:
>> Other functions touching shmem->sgt take the pages lock, so do that here
>> too. drm_gem_shmem_get_pages() & co take the same lock, so move to the
>> _locked() variants to avoid recursive locking.
>>
>> Discovered while auditing locking to write the Rust abstractions.
>>
>> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
>> Fixes: 4fa3d66f132b ("drm/shmem: Do dma_unmap_sg before purging pages")
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
> 
> Good catch. The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Pushed this to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

