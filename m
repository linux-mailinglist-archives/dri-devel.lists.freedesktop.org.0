Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91994523270
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F179A10E13B;
	Wed, 11 May 2022 12:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050C410E13B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652270692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVQXpwnUiujXuLg5u5znfigCM8Hb3qWj/Lf7G2GHThw=;
 b=fOJnWeYJWly9HLNQQ20E0y1QKr1tKFaHYfnkggHhBwqRuJCyOtdcrgl9sYY7TRv1DTYnWR
 XevH9MKrAVbiv1ez0HChIPYJArins4bkaMO4pVdfCqI9H6GPnlr/G6GQjHQvCtWlH3jTzl
 GVfGCF/IvO9L1eheJsCKK9liIQraB1E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-87D-TroUNUGIVHygyVOwAw-1; Wed, 11 May 2022 08:04:52 -0400
X-MC-Unique: 87D-TroUNUGIVHygyVOwAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i18-20020a1c5412000000b0039491a8298cso627065wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cVQXpwnUiujXuLg5u5znfigCM8Hb3qWj/Lf7G2GHThw=;
 b=eyzu4W/mB5BZaQtep6/XLT22mRv21TJzPeW5AYyR2WGiz9Xlv3vuL5ILD2Q5E/AitV
 bAW3gombO4Ri6iAnDeFSLNeRMxi50CSznOerptQOMiLPtxahLXPRbYvO8NznfyZ+8uXZ
 W9kUCPUiClSuezlJXeCdQ9BtK5otoZLUvqxH1XgAd5rlJeRnA8Xtkmu52Vcc3eGbauJr
 y2WMh0JRXhAupnk8vTD4GAtHIfCsgIJNjM6cCLulH8KBqZtA6Amn92ElIG7JvjRYh7NV
 GE5DSe5VJ8P6W+Slx1RCbWFI+Mbhe5g8wNwwl+Iy3kFPsZxlu/dyG47aonuKQ5qdFSMf
 qR/w==
X-Gm-Message-State: AOAM531FdriDfQaYjAT/9NKr0aRKNyslYoZjkclBSdyJmnmK9NG2QLXf
 2mLdcuePM3MzGSCyY++06cj6AeC2DLfylXmbC10pTUbSmjUsSvE4CnmivYYOjky1X5RdWJF3vb3
 zArQpb2CIlEDG6jXTtJ1bhY8k4H8s
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr21854598wrx.479.1652270690456; 
 Wed, 11 May 2022 05:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjermyG9SRZ/FmRDFMxi8/suJlcYz4i0tXnjbGu89XptXf6YedUiGCcfi1mjm2a+Pz1FgRRA==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr21854568wrx.479.1652270690050; 
 Wed, 11 May 2022 05:04:50 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c464500b0039482d95ab7sm1827299wmo.24.2022.05.11.05.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 05:04:49 -0700 (PDT)
Message-ID: <e237556e-da38-8a90-d5e7-702cb01af7c7@redhat.com>
Date: Wed, 11 May 2022 14:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 1/7] firmware: sysfb: Make sysfb_create_simplefb()
 return a pdev pointer
To: linux-kernel@vger.kernel.org
References: <20220511112438.1251024-1-javierm@redhat.com>
 <20220511112438.1251024-2-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220511112438.1251024-2-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/22 13:24, Javier Martinez Canillas wrote:
> This function just returned 0 on success or an errno code on error, but it
> could be useful for sysfb_init() callers to have a pointer to the device.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Thomas,

This patch can also be merged already if you want to shrink the set
more. Even though no caller would use the new return value yet, it
is a standalone change and already reviewed by Daniel and you.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

