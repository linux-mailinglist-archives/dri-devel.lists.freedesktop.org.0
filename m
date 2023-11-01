Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C507DE5A9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 18:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FBB10E779;
	Wed,  1 Nov 2023 17:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556BE10E761
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 17:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698861292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnKpb4EeK07qAJufbEwOR+W4LEQMu0mtbC3uRm1Hwfg=;
 b=KCkbSvuSGabS+T3d0siomi5biKCBjqyQfyjnWw58NLbWRhqiy4CSDJI1TLwh3j1k2UylC6
 JudliQDeetrgqltlhFuKUhyNWtWw/NKSypw5H3sq02I69tsM8a4oPcYucxQOzCLprZnI2a
 QskCEyEzKbzyOGgonF3d6+p3YtoyEpY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-23lxXHllNxujmDSCGgIymA-1; Wed, 01 Nov 2023 13:54:50 -0400
X-MC-Unique: 23lxXHllNxujmDSCGgIymA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-53ee9f409a9so23458a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 10:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698861289; x=1699466089;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NnKpb4EeK07qAJufbEwOR+W4LEQMu0mtbC3uRm1Hwfg=;
 b=rvXeMaTOaq9LWrJ+P+eOefz9cfbwVnBEKnAkzICVWBcRdLwO8F9ehapTqqK3hld3gn
 ZSKVLe+yDw5LnOxRzgwV8H4xJWZiuvnJSqxX5TbOONMyX1yBj8kZiqKgdIeftP1KDKQJ
 GBvLVl+lEGZo3op55YLtWzCJBpNpFGDV4MudzXQFeaATr+7C7Kkz+weBPxL27fOhMrFw
 JWe92DXVL8VK5GDRFdrDdPt0ZgQHMNPpUSAvvgwfEPRWf1yslP0Jh3PkychrO6Kz0USJ
 bAUrZXkICnVQCQlvLcmtzdIIRGY0GrKLo1dk1XP2+L7ZCJv5EYHq2mBjji5qIg3bteHl
 Sm5g==
X-Gm-Message-State: AOJu0YwtB8ykF/G6zliH8Qbbxe1Bn9fcIGDSi6EUr9p4MDtM0JipR9tZ
 +JADpt0RtValzsyF6gZcyT8j4PztT/b0gKcckFt0Nfju3TNJ76skWdV2TZG+DD8NDTdpzSg66lD
 /jS7SmuYylgd8t6+wND+/bTnuejAE
X-Received: by 2002:aa7:d0ca:0:b0:530:74ed:fc8a with SMTP id
 u10-20020aa7d0ca000000b0053074edfc8amr13224041edo.41.1698861289534; 
 Wed, 01 Nov 2023 10:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVnFRMTGJHQlmpCorHWXgjX/JDj2IwGcvCvUpQyXc80EQmO4QlCuNvR898VgWual5BmnPZQQ==
X-Received: by 2002:aa7:d0ca:0:b0:530:74ed:fc8a with SMTP id
 u10-20020aa7d0ca000000b0053074edfc8amr13224026edo.41.1698861289276; 
 Wed, 01 Nov 2023 10:54:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a50d6c2000000b0054018a76825sm1353748edj.8.2023.11.01.10.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 10:54:48 -0700 (PDT)
Message-ID: <56fbbe6c-0342-01d9-9840-40c7fa13f1f2@redhat.com>
Date: Wed, 1 Nov 2023 18:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
To: Thierry Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231101172017.3872242-1-thierry.reding@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/23 18:20, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> This contains two patches that bring simplefb up to feature parity with
> simpledrm. The patches add support for the "memory-region" property that
> provides an alternative to the "reg" property to describe the memory
> used for the framebuffer and allow attaching the simple-framebuffer
> device to one or more generic power domains to make sure they aren't
> turned off during the boot process and take down the display
> configuration.
> 
> Changes in v2:
> - remove unnecessary call to simplefb_detach_genpds() since that's
>   already done automatically by devres
> - fix crash if power-domains property is missing in DT

Thanks, the new version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Helge, will you pick these 2 up, or shall I push them to drm-misc-fixes?

Regards,

Hans





> Thierry Reding (2):
>   fbdev/simplefb: Support memory-region property
>   fbdev/simplefb: Add support for generic power-domains
> 
>  drivers/video/fbdev/simplefb.c | 128 +++++++++++++++++++++++++++++++--
>  1 file changed, 123 insertions(+), 5 deletions(-)
> 

