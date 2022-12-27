Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A0656E40
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 20:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32D110E0C0;
	Tue, 27 Dec 2022 19:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AC410E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672169018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7dbgHTngiyfazSG5sXwLfx+o+WyMctqSvzgKNLu/LU=;
 b=WJq1VkATQMtmUffPjF7oJkvOz/G22et3IVad+jZ0wFBjIVXmyOycEDqNqt5ICwkljD6qbA
 UAtBho+Df7kMei2+wNVt4Jk8AHV7IuDwrnQKeQ0oIyarPOCqaoGdxnQzWfthWy1GflI7Al
 ylF0wFjHaNNIDHV25VXm6A5mo2OOPXQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-dTh0oPf8MEyoxpMbH1P2nQ-1; Tue, 27 Dec 2022 14:23:35 -0500
X-MC-Unique: dTh0oPf8MEyoxpMbH1P2nQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 fm17-20020a05600c0c1100b003d96f0a7f2eso6948191wmb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 11:23:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7dbgHTngiyfazSG5sXwLfx+o+WyMctqSvzgKNLu/LU=;
 b=4rI+r0jsXL6NJgC7DOOAB3P48d802fB+yRUTaK4RlYsjSvuABtsKesbKC7feHRmcj+
 uky9jNmnvZM5OMakrDhQPvIpDoMsZ5DcQ+lTbmUKxOhhODK9iWkUJhKXP+AVK69iRit9
 6hH3EHyjv+P2XM3Qd9+MAyEpoQLNii9BYdZmPIwZnC2NN3pvEs5ZPM5l+ihm69zzNa79
 8cvGMIE03yrImxBQOnel4ikKykIobCKQxV+0BqhM1trHXgtyhg0df730ccUbT2xz841u
 AWzH5IjUz+8kSkVz1oJacjUeCzIfia5H4i+PsxHujLssUxt1tzkN4ioF8dhFOfwE3X+F
 sRnQ==
X-Gm-Message-State: AFqh2koGQEqkn8fz+teN34M++zPLw7FTZIhNDCbX8HkG18RFBo3fl/Su
 88Vg4+08+1dUN+9O6Pfc4MtwBb0X/QYwvGCZ5QcV5H0/4dmGLN7qLg5Dqm3bL3Vb9VCwcpeoOC/
 fn5ik6bz8pxh5gwR0cNivZuj5l0+8
X-Received: by 2002:a05:600c:3b90:b0:3d1:f0f1:ceb4 with SMTP id
 n16-20020a05600c3b9000b003d1f0f1ceb4mr16025418wms.19.1672169014429; 
 Tue, 27 Dec 2022 11:23:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXva0B2UHKhAop8zDawG+uzkPkYfVViqdOdvS3DOeaUVR1+zQGk160j5uLhQYZ6Be0X+v85V8g==
X-Received: by 2002:a05:600c:3b90:b0:3d1:f0f1:ceb4 with SMTP id
 n16-20020a05600c3b9000b003d1f0f1ceb4mr16025401wms.19.1672169014169; 
 Tue, 27 Dec 2022 11:23:34 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q20-20020a1ce914000000b003b4935f04a4sm21286147wmc.5.2022.12.27.11.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 11:23:33 -0800 (PST)
Message-ID: <9911d249-ccc0-7724-b0bc-17bcf2a524e8@redhat.com>
Date: Tue, 27 Dec 2022 20:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/2] Recover from failure to probe GPU
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221222183012.1046-1-mario.limonciello@amd.com>
 <2761b1e1-508d-2c2c-f2d8-6f1be536723e@suse.de>
 <f9b40837-ee2b-76fb-0ec1-d7dfda4ffb7e@amd.com>
 <CADnq5_M42GQhVquw5BM+P-6NKmdZ6yj8czq=s5iXVAmVOexAkw@mail.gmail.com>
 <CADnq5_OLf3VhFZm7=riDm9ezVT9j9nQ5Fwei3budnqPt5C4t9Q@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CADnq5_OLf3VhFZm7=riDm9ezVT9j9nQ5Fwei3budnqPt5C4t9Q@mail.gmail.com>
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
Cc: linux-efi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Alex,

On 12/27/22 18:04, Alex Deucher wrote:

[...]

> 
> I think something like this would do the trick:
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2017b3466612..45aee27ab6b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2141,6 +2141,11 @@ static int amdgpu_device_ip_early_init(struct
> amdgpu_device *adev)
>                 break;
>         }
> 
> +       /* Get rid of things like offb */
> +       r = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> &amdgpu_kms_driver);
> +       if (r)
> +               return r;
> +
>         if (amdgpu_has_atpx() &&
>             (amdgpu_is_atpx_hybrid() ||
>              amdgpu_has_atpx_dgpu_power_cntl()) &&
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index b8cfa48fb296..4e74d7abc3c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2123,11 +2123,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>         }
>  #endif
> 
> -       /* Get rid of things like offb */
> -       ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> &amdgpu_kms_driver);
> -       if (ret)
> -               return ret;
> -

I'm not familiar with the amdgpu driver but yes, something like that
is what I had in mind.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

