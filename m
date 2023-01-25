Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD4867AE44
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5B610E74F;
	Wed, 25 Jan 2023 09:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6237210E74B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674639670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
 b=dJjiXtPRYk4I2MjgtHaRnrIjz5IM2S2H0u/SNncNFEgh2vSCF6twLMIMKEH3LCWURBMe22
 hcl7Bt4h2PAtJgqpoaWJCUktlGskUr4bPokkJDksDC8v8Q7Y86KOkadx6x2shivRiGiS+i
 2Zm94nbJsTbWjRimXDfmlAX19VPMGFo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-8P1-rk3-Nnigj0--zckqCA-1; Wed, 25 Jan 2023 04:41:06 -0500
X-MC-Unique: 8P1-rk3-Nnigj0--zckqCA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r1-20020adfa141000000b002be28fd4a7bso3059849wrr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
 b=Aupwshv5gQZwbdquS2gRWFen3oy5pEjFvtcnK49P3NC72BurF7B3sxwJs8+B5FXJZo
 VMvXnwfL3BYB2IitS5g3iRtE0I2q14UF9KQTKSch0Y02lnvBGruNp13T1qQYku79GjxR
 Ou97c4Ez/8zfjYgoLwX4zhBiiKGlCxIZaMzYwuP2bur/C6GeOYiX4SAAuIGm5NhBGt9Z
 lvgpsYsxiYSMDxNtfgA7mCKLUMsPE34GWdIgszcBjIWLSyQAIbRb+vtlWqGQxZ9inPod
 3k2KGuiOQlF0As6c1fl5kKrcRT8QmVumVMbZ4OLOor6k2C9ODZLXg2mOkZ20si+WoD1y
 PWTw==
X-Gm-Message-State: AFqh2kqQTRINUQQmePo3Ms3AyNDmpOzwaHoZN/I6MjUiuvAsh1qoURU1
 iYYK5mMClen9WQynQxokzIiNC72WQvLKC0G6ZZCz7sZSPf2GfqqE/onLXeO26qhpaE8LiS3X0+B
 al/kMk9I8wCsr/gEyoBi/IUtjJS4A
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id
 cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416470wrb.3.1674639665557; 
 Wed, 25 Jan 2023 01:41:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspvSYF5UcTCX9Syl/sB5Wttapk1TJmAOGMxlySA2rIPpJprAbwV2wYhJQSWjxg72A43lgFrQ==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id
 cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416452wrb.3.1674639665344; 
 Wed, 25 Jan 2023 01:41:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a18-20020a056000101200b002be25db0b7bsm4010247wrx.10.2023.01.25.01.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:41:04 -0800 (PST)
Message-ID: <66114220-d226-e0e9-bf09-707388ce98f3@redhat.com>
Date: Wed, 25 Jan 2023 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 06/10] drm/fb-helper: Initialize fb-helper's preferred
 BPP in prepare function
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper's preferred_bpp field early from within
> drm_fb_helper_prepare(); instead of the later client hot-plugging
> callback. This simplifies the generic fbdev setup function.
> 
> No real changes, but all drivers' fbdev code has to be adapted.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

