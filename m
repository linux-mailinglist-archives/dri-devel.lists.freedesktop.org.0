Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D504F56AC2E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 21:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C636D14A262;
	Thu,  7 Jul 2022 19:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695C614A257
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/09duIaIEFfbOfOoFpBzJ/OHB5C+OhETNK1haqEKUI=;
 b=JssJj4Od/GVA/d2hi3cXTasM9SCztaB0WtIBuxDGQdQ2fnOrwy8kHEn7twFQhdQVhPThK3
 14dIbYqRpGXi314qZkMAA0KSrZ7A38iW4dVJuLHFN2HOfzFhNbLMxjJoMiditFoF7KifSE
 u0BVR04sYXs+Peap+MOo6m8woP/rNxI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-Dj2-PGcYOiiULVHTJ5RmXg-1; Thu, 07 Jul 2022 15:49:14 -0400
X-MC-Unique: Dj2-PGcYOiiULVHTJ5RmXg-1
Received: by mail-qk1-f200.google.com with SMTP id
 q184-20020a378ec1000000b006b14460be35so19032567qkd.22
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=b/09duIaIEFfbOfOoFpBzJ/OHB5C+OhETNK1haqEKUI=;
 b=CKbxQdQhqxrd0MiTpkdep/tyBVPrMO1LtYaJ2C3eLBfZZsKjWc3j0ohMS7RdOvOf5H
 baWb3BcX75uLmmfQyNZmnKBg5nWfzi+zEUmDAzVrjlCu+lETqpqUU5QtNbXtuiqa/i1S
 LWbPdOjtt71z/3JGgFIx+HcooS6lplqtJBnlT2CNHqszHVYzyX/KVtNLlUf8QO3gCRUY
 2i8evKeYFOf/KmblNMO0POPIJOEPDS+TPaYUw3rSxl1G65Owizoz5qZYb5D7YRpiqpqm
 PUvirEIIIUgY4EHZJBi5AOZKkhtx1T8jEibXlcJ97yhZxEV2+N/0YnJBk+pwhiBoQIP6
 YBxQ==
X-Gm-Message-State: AJIora9wNBTyCv2ecmNmzDEOqPBJqzCfJiYhbqoI+wBrYFNtsqfkvziM
 ZliyttNK42WqRogNv3+MFXipQ7fL8hrpvRtyu92uUSaWznLGL5Eg+ilanTOq+z7SeajVArtP6tY
 W8Q9d6enEe5gpT3dxcXmLDsh5ZkSM
X-Received: by 2002:a05:6214:2027:b0:473:2d58:7ce9 with SMTP id
 7-20020a056214202700b004732d587ce9mr4481196qvf.107.1657223353553; 
 Thu, 07 Jul 2022 12:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v30p/B+gX/BnCMrUQB1lcXkKCSu9pY+vBctYwrmJAVo313ntD9v5GhZQ9NfuVfNRds55Wb4A==
X-Received: by 2002:a05:6214:2027:b0:473:2d58:7ce9 with SMTP id
 7-20020a056214202700b004732d587ce9mr4481163qvf.107.1657223353007; 
 Thu, 07 Jul 2022 12:49:13 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 dm15-20020a05620a1d4f00b006b555509398sm1582726qkb.136.2022.07.07.12.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:49:12 -0700 (PDT)
Message-ID: <a6e04ca0ff6134652f5ddf4bdbce1f1e90270e2e.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: fix a use-after-free in
 nouveau_gem_prime_import_sg_table()
From: Lyude Paul <lyude@redhat.com>
To: Jianglei Nie <niejianglei2021@163.com>, bskeggs@redhat.com, 
 kherbst@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Date: Thu, 07 Jul 2022 15:49:11 -0400
In-Reply-To: <20220705132546.2247677-1-niejianglei2021@163.com>
References: <20220705132546.2247677-1-niejianglei2021@163.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a moment

On Tue, 2022-07-05 at 21:25 +0800, Jianglei Nie wrote:
> nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
> back to the caller. On failures, ttm will call nouveau_bo_del_ttm() and
> free the memory.Thus, when nouveau_bo_init() returns an error, the gem
> object has already been released. Then the call to nouveau_bo_ref() will
> use the freed "nvbo->bo" and lead to a use-after-free bug.
> 
> We should delete the call to nouveau_bo_ref() to avoid the use-after-free.
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_prime.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c
> b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index 347488685f74..9608121e49b7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -71,7 +71,6 @@ struct drm_gem_object
> *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>         ret = nouveau_bo_init(nvbo, size, align, NOUVEAU_GEM_DOMAIN_GART,
>                               sg, robj);
>         if (ret) {
> -               nouveau_bo_ref(NULL, &nvbo);
>                 obj = ERR_PTR(ret);
>                 goto unlock;
>         }

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

