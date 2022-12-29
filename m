Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D868A658DED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 15:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BC48989E;
	Thu, 29 Dec 2022 14:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032738989E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672324519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KePM8LGAehS8PxVf3em7bkMvOyCCyGkD1QJPFzoXjoY=;
 b=evb0+MHXl4X7BfSCvTX0+E86yeukqK/kOgvH+y3vhs5uyvbBf6tPt2DQXiQasc+TJfpM2G
 0UlDT0fHW+sz0yT4ZV+PkR8uUPQk7Inez+s031sRHR3gYqXxULRCCCka4Y+fmXgg86Z/HV
 z1jw/evvPN1cggBc8NqJ15PniOzrFo4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-61JxHmwjOTiJmsJJJn9SXA-1; Thu, 29 Dec 2022 09:35:15 -0500
X-MC-Unique: 61JxHmwjOTiJmsJJJn9SXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay32-20020a05600c1e2000b003d9730391b5so7271248wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 06:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KePM8LGAehS8PxVf3em7bkMvOyCCyGkD1QJPFzoXjoY=;
 b=q/2xw78VNsAPO8lqEVLbC986cWw7Fo9UEdrPT7CeuHtrP9NijEdc+y/5eCrwp3zYSb
 DW1pOBcci4IFSHS4iAoT7RqIRQIMLaAA557b7lVfqgMmOctlwKGzKPa36jgzqoSkeZhM
 2xab+u2lQXjK2zquCOOenxbS0riW1X7/5nYmScBzixOW4dLZrzHCzuFX5/HHTTQ94Pj5
 TRIulsCElc7VMkDtx8QaJJxj8UK0ki/xR0aUrHJ2R5YJshjqiJ+x6m+5xKIoSWziIdgU
 xC5affjQhoI7LjiwcnUbW2T/HJGdWIXDrf5TwH4uxwFv4s5vz+8iKtEGNWcMdhab6/qa
 aU2g==
X-Gm-Message-State: AFqh2kqZx7qgUnvxo44ZqYGrpMP3aWwL98Rdg2auAs4n+DzYgg+mXyDF
 Lkz7nlRhe86J2FP7Klt+FmgACo0nu/NkQPZ+DfM+nzqPsy4437co39nSAabdUqQIf0pdhIU/5dl
 vOlkClqUmNoDDK+SltO5FH8wLAFuu
X-Received: by 2002:a5d:460d:0:b0:242:69f4:cb6a with SMTP id
 t13-20020a5d460d000000b0024269f4cb6amr16459193wrq.9.1672324514807; 
 Thu, 29 Dec 2022 06:35:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuhgKP5nEJxUo1DwVlnSvFu/L2yowvsm+jGS3h9joQUDWOjQmxTMQckkrXQ+uhe+DCqYeOJDQ==
X-Received: by 2002:a5d:460d:0:b0:242:69f4:cb6a with SMTP id
 t13-20020a5d460d000000b0024269f4cb6amr16459171wrq.9.1672324514569; 
 Thu, 29 Dec 2022 06:35:14 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003d1f2c3e571sm32813393wmq.33.2022.12.29.06.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 06:35:14 -0800 (PST)
Message-ID: <21fe5a6c-06f9-a902-6621-19c4a2a451ad@redhat.com>
Date: Thu, 29 Dec 2022 15:35:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 01/11] drm/amd: Delay removal of the firmware
 framebuffer
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20221228163102.468-1-mario.limonciello@amd.com>
 <20221228163102.468-2-mario.limonciello@amd.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221228163102.468-2-mario.limonciello@amd.com>
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
Cc: Alex Deucher <alex.deucher@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Carlos Soriano Sanchez <csoriano@redhat.com>, stable@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mario,

On 12/28/22 17:30, Mario Limonciello wrote:
> Removing the firmware framebuffer from the driver means that even
> if the driver doesn't support the IP blocks in a GPU it will no
> longer be functional after the driver fails to initialize.
> 
> This change will ensure that unsupported IP blocks at least cause
> the driver to work with the EFI framebuffer.
>
> Cc: stable@vger.kernel.org
> Suggested-by: Alex Deucher <alex.deucher@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

As mentioned, I'm not familiar with this driver but the change looks
good to me. Delaying the firmware-provided framebuffer removal is the
correct thing to do IMO.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

