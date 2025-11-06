Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2EC3BA5F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 15:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1162610E8FD;
	Thu,  6 Nov 2025 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UoIfqBBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC9910E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762438672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOmQ4llb7kP262Xa9PbvJAAOPIeD2rWXkLdWxj3SB8c=;
 b=UoIfqBBTcnpwR30rYeppUlObQAW6KyAG51Ysc9BGPdrF7AsQUvGQTgyxufQ6tIl7owlb/p
 HxCcNkPXg1DjG8bjrl6Wp93ilX5NwcefMC7CIsSAP0HfSTbk8u048Qx9MJzO6pjELFfNMo
 MFJWoObTZpzCPL1jLG3LQOGwq+8Nnl0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-fNr4RwZ-NHycMJXYxztQIQ-1; Thu, 06 Nov 2025 09:17:51 -0500
X-MC-Unique: fNr4RwZ-NHycMJXYxztQIQ-1
X-Mimecast-MFC-AGG-ID: fNr4RwZ-NHycMJXYxztQIQ_1762438670
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-429b7b46eebso993014f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 06:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762438670; x=1763043470;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOmQ4llb7kP262Xa9PbvJAAOPIeD2rWXkLdWxj3SB8c=;
 b=JD8OMKSluDdYRlVf57mJ7iDXn8Iuc2saJV8X/jzk5yBclPQMFnDfLrQDqm59XXq3c8
 1bzXT6IxWt4ztrA6BdR0uTPtFtzak1+DAqxtDfJSp1Jt7cU2ymNQjIJ0XMCQDg/gpkVF
 kGh7Xk6yDokkHHXopdtAQxoAFKWEsnyqCCXMK9tAUwp1h6rlab5zTBfWKirqfasvLvn1
 R0K7Y6ubkNfq+xj2JdsI3+ks5ocQdne5VSafLeYdLnQOBdjPb16FTIwhqZ2EfPUuwwsT
 UnaZSmLvMdZXsGzZsuCXZOmeQuUwkICJiT/CbN1E4jMnxi/Y/fxdLOmuVfFutJFu909P
 i+vA==
X-Gm-Message-State: AOJu0YwaPsxP3/P620nyefoVGi+pIL73X2wqOJiT41u71PXUa6KyGVEF
 gmwTMmNjniZ9EHgfSzaBMpBDzOQZ9HdMXg/loZhT8jRVwVu/a3YhAhqHXQCePOJaRrnU3RPAc1V
 hFXTrZZzfldDfG7gKa8yCVSWXX9beptIaSndjQbdo1BCnHpoj0i3YssKtgWZ+cyhEgvrkLw==
X-Gm-Gg: ASbGncvQds++ppWGQJgGA5Cv3qfPPTmPfZdXCvu+zEcZJ6Ab71i4Jcj4I85DtplMIgC
 gMKmfIcUuF/aKHsRQsZ5TwLOrBz+01mdVZA77CqQD9AaWYV/Y8HGz9ZbtUK4swAn/rkC1/28ysR
 iY4fdYq+WUYT/lvrsmgiYtEe6SNJpzXr1qp4FbWuTMeLmcDX1oWRz2E+kULRPa7zTQSnqYX/S2y
 kqSxhSl78ST9Dmuqf1Uz+jiGSEEpoBm6E/j5XzD3QLfrtqs4nZMxYLEPCV0w/xLlOukYPjleWhk
 cAfkGgvYSupDrhjoUnsq3SZ7QqMOmzVEY0MsEYkIIZGviX11Ll1kfjdL9pEsW2LGlnQg8yPlNtg
 yt0eOKlOKxk0vGWexwmjm/il6GtyD2cIUYKagNQ4=
X-Received: by 2002:a05:6000:1acd:b0:429:d6dc:ae10 with SMTP id
 ffacd0b85a97d-429e33074f3mr7200284f8f.29.1762438669979; 
 Thu, 06 Nov 2025 06:17:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECtHMufng993YxMM1Z77s6VKOBx4/YbWe58KLYxGCY+QuA47orpp3JdEejfQUPqilVk3VibQ==
X-Received: by 2002:a05:6000:1acd:b0:429:d6dc:ae10 with SMTP id
 ffacd0b85a97d-429e33074f3mr7200248f8f.29.1762438669518; 
 Thu, 06 Nov 2025 06:17:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429eb4ad537sm5144285f8f.42.2025.11.06.06.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 06:17:48 -0800 (PST)
Message-ID: <eaa147cf-9805-415d-b898-f96fc4a53fae@redhat.com>
Date: Thu, 6 Nov 2025 15:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Set surface-framebuffer GEM objects
To: Thomas Zimmermann <tzimmermann@suse.de>, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20251104103611.167821-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251104103611.167821-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rYfSMBic7ZFRr4zT0ilZD_ioPsQECar4JJIq3zAkjYc_1762438670
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 04/11/2025 11:36, Thomas Zimmermann wrote:
> Set struct drm_framebuffer.obj[0] to the allocated GEM buffer object
> for surface framebuffers. Avoids a NULL-pointer deref in the client's
> vmap helpers.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> [   22.640191] Console: switching to colour frame buffer device 160x50
> [   22.641788] Oops: general protection fault, probably for
>    non-canonical address 0xdffffc000000001f: 0000 [#1] SMP KASAN NOPTI
> [   22.641795] KASAN: null-ptr-deref in range
> [0x00000000000000f8-0x00000000000000ff]
> [...]
> [   22.641809] Hardware name: VMware, Inc. VMware20,1/440BX Desktop
>    Reference Platform, BIOS VMW201.00V.24928539.B64.2508260915 08/26/2025
> [   22.641812] Workqueue: events drm_fb_helper_damage_work
> [   22.641824] RIP: 0010:drm_gem_lock+0x25/0x50
> [   22.641831] Code: 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 b8
>    00 00 00 00 00 fc ff df 53 48 89 fb 48 81 c7 f8 00 00 00 48 89 fa 48
>    c1 ea 03 <80> 3c 02 00 75 0f 48 8b bb f8 00 00 00 31 f6 5b e9 16 2e 15
>    01 e8
> [...]
> [   22.641889] Call Trace:
> [   22.641891]  <TASK>
> [   22.641894]  drm_client_buffer_vmap_local+0x78/0x140
> [   22.641903]  drm_fbdev_ttm_helper_fb_dirty+0x20c/0x510 [drm_ttm_helper]
> [   22.641913]  ? __pfx_drm_fbdev_ttm_helper_fb_dirty+0x10/0x10 [drm_ttm_helper]
> [   22.641918]  ? __raw_spin_lock_irqsave+0x8c/0xf0
> [   22.641924]  ? __pfx___raw_spin_lock_irqsave+0x10/0x10
> [   22.641928]  ? __pfx_mutex_lock+0x10/0x10
> [   22.641936]  drm_fb_helper_fb_dirty+0x29a/0x5e0
> [   22.641942]  ? __pfx_drm_fb_helper_fb_dirty+0x10/0x10
> [...]
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: ea39f2e66e61 ("drm/client: Deprecate struct drm_client_buffer.gem")
> Reported-by: Ian Forbes <ian.forbes@broadcom.com>
> Closes: https://lore.kernel.org/dri-devel/CAO6MGtjg8PiRiSLomJQRBduTBSC0WkqX67tEZwA9qwOgRzchpw@mail.gmail.com/
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 54ea1b513950..d32ce1cb579e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -553,6 +553,9 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
>   	memcpy(&vfbs->uo, uo, sizeof(vfbs->uo));
>   	vmw_user_object_ref(&vfbs->uo);
>   
> +	if (vfbs->uo.buffer)
> +		vfbs->base.base.obj[0] = &vfbs->uo.buffer->tbo.base;
> +
>   	*out = &vfbs->base;
>   
>   	ret = drm_framebuffer_init(dev, &vfbs->base.base,

