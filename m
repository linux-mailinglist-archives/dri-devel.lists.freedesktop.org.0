Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B98550B2B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 16:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B0A10E04C;
	Sun, 19 Jun 2022 14:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E47810E04C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 14:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655648704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekXGr6wfwJ630qszmpOLocmLKM/9kKKdXwFEn2AA3iI=;
 b=FU9oalW07ittFIPLV7tv+QIUyW+USGO7gbDWgX9kL5EalFjQufmP4tsOTQZ0HlKZh1zx+H
 Rp73eVMT70GL21rVjD9z6suQ9oMbNoL0z+XFUugmd4YKFKVa4eEiVU4lrVpb1vN9yuPO1b
 tr8X7XltLdqrX+4qVGhnDT8mXvlRtco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-ThIOLAEaN-aecZyWaa8-pw-1; Sun, 19 Jun 2022 10:25:00 -0400
X-MC-Unique: ThIOLAEaN-aecZyWaa8-pw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so5498058wmq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 07:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ekXGr6wfwJ630qszmpOLocmLKM/9kKKdXwFEn2AA3iI=;
 b=eRo6G+pzeTzju0V1bthB33tuhYESDJDCEpbHtDxdSCAwzwhab8JAc+V4kAsgGwV3jj
 FcDsw7zAvfsVuCyqJ6UUO6ipAeoqW/LIVJNLQH9xETaaLxlndCm0QGhvKY5nxPOaz4LO
 jVRPqyOsvytqHj5/tM/JS5WZ5DcGyul7J1nyyZNRPMNKRc6dy8ZWpSsLTelrjh2KikDz
 UGUheXrTTmhwgfOLji2nGQbMRsZ1RvFgC+MbAvseZuV2HlodDiKXnCNya1/ERfkLfN3N
 RPQvpNVKjcErNJzwGX7WWX91R56hi4nrphND0uTDfqkxw6lgLfP+jpWK8ImSsrT+2rBe
 KeZg==
X-Gm-Message-State: AJIora85vmVSqb48yChle1Ham+wPVaBa9jYwDfwwL3Q09G3EuLq4TdD0
 nY8FHr5Ps7YdLSPbQ+tMy9uzJBDsCIHvrTMXRcTNH7Xi4wJm4/8yU0AqDw34x5rlFhyBmLehuej
 aS6tp3pRLl91llVJP9nOnZWr4L7/T
X-Received: by 2002:a05:600c:1e85:b0:39c:8628:ca96 with SMTP id
 be5-20020a05600c1e8500b0039c8628ca96mr19915319wmb.176.1655648699744; 
 Sun, 19 Jun 2022 07:24:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIO3SYkr/pIF3ZF8J9uPBKw13uX6xp79wy6oYAWXFvDuLb4bdEEiavSPQrTSVcYnfiw1QK2Q==
X-Received: by 2002:a05:600c:1e85:b0:39c:8628:ca96 with SMTP id
 be5-20020a05600c1e8500b0039c8628ca96mr19915291wmb.176.1655648699439; 
 Sun, 19 Jun 2022 07:24:59 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o1-20020adfeac1000000b0021b8c554196sm1640464wrn.29.2022.06.19.07.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 07:24:58 -0700 (PDT)
Message-ID: <d7469398-d872-3cb3-5238-1696e4e9415b@redhat.com>
Date: Sun, 19 Jun 2022 16:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm: hisilicon: depends on MMU
From: Javier Martinez Canillas <javierm@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20220531025557.29593-1-rdunlap@infradead.org>
 <40d294df-de91-3f36-7d70-13cad54ac34f@redhat.com>
In-Reply-To: <40d294df-de91-3f36-7d70-13cad54ac34f@redhat.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 patches@lists.linux.dev, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Huang Rui <ray.huang@amd.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/19/22 16:05, Javier Martinez Canillas wrote:
> Hello Randy,
> 
> On 5/31/22 04:55, Randy Dunlap wrote:
>> Prevent a kconfig warning when MMU is not enabled by making
>> DRM_HISI_HIBMC depend on MMU.
>>
>> WARNING: unmet direct dependencies detected for DRM_TTM
>>   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
>>   Selected by [m]:
>>   - DRM_TTM_HELPER [=m] && HAS_IOMEM [=y] && DRM [=m]
>>   - DRM_HISI_HIBMC [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && (ARM64 || COMPILE_TEST [=y])
>>
>> Fixes: 4f7f1973b0c8 ("drm/vram: fix Kconfig")

Actually this fixes isn't the correct one AFAICT, it should probably be
either acad3fe650a5 ("drm/hisilicon: Removed the dependency on the mmu")
or a0f25a6bb319 ("drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST
is enabled"). And those two commits should be mentioned in the description.

Maybe we can append the following two paragraphs to your commit message ?

The Kconfig symbol depended on MMU but that was dropped by commit acad3fe650a5
("drm/hisilicon: Removed the dependency on the mmu") because it already had as
a dependency ARM64 that already selects MMU.

But later, commit a0f25a6bb319 ("drm/hisilicon/hibmc: Allow to be built if
COMPILE_TEST is enabled") allowed the driver to be built for non-ARM64 when
the COMPILE_TEST is set but that could lead to unmet direct dependencies and
linking errors.

If you agree with the changes, I can do it before applying. Please let me know.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

