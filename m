Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA452AE38
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 00:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207FC1125D7;
	Tue, 17 May 2022 22:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CC310FA0C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 22:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652826821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsgZD2xN95jcvNsVYdiJpz1wstzqtrmwvWpl/rt8mrs=;
 b=Js7VkRPvMV+8h8BvFZkIWA8fL+QpIRmFtzMGbFF2kJ9C10qfnE7qupz7k40TC2opmf826f
 xVXlD3XofEG0mXu1Iy77i37jAqYHAgk8kkl9DFv/l2trd1QhzPd7iGTMYw5FMW7flp2Mzw
 SJ2SpCbt/jwvmqsrT8hHqZ1Mbw/7m6E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-DTtYgvOAP8aXRs0sKFEk2Q-1; Tue, 17 May 2022 18:33:40 -0400
X-MC-Unique: DTtYgvOAP8aXRs0sKFEk2Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 z12-20020ae9e60c000000b006a0e769f9caso254240qkf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xsgZD2xN95jcvNsVYdiJpz1wstzqtrmwvWpl/rt8mrs=;
 b=zwyH1Zh7/be4V+Vz2/siYDee79Jysr5lsO8GkSwkCOnUXXGciV8jS3IwyDZ/URM07Z
 NVRePVaLpmqL0tmS6zhE8VlAvQTYc5B0i8wIL9JxZGqoFV6h4N3D947Bw3XY5Ksi7fAK
 Z6/Vtejb9ER/2Q+lhvnYZNsO2BytrWlvFf/Sz1rPTprnKWdZx89bGKSkVG9mElWP9uZ8
 Rfj7IQmfiZqc528uRhr76dwiWZzdw0eMUcDHuvNV37fa/whyXvM89bt3ul8sxtFrIT1/
 ZHJ5SRZe2EBwwLtTHxGX+fq53VYjyR/SuwsqPmiziwxweYBnlw4oBEne/8peDI/4N9lA
 /0aw==
X-Gm-Message-State: AOAM530SaMwy8tDZzf66X9y4tf6Ls8US0+gx0l+8RDoI5ntOUr5KNLhz
 rq1YHjcYhb7sEiB4MyVnD3FaNYfi0z39WpW2uQYmUAYn1CRbJiQ3R0AMCqJzCcOokhVxl25DW1E
 ZltUbhRbVYGogSis6y9/N8UBAwbiV
X-Received: by 2002:a05:622a:4d4:b0:2f3:c529:5f89 with SMTP id
 q20-20020a05622a04d400b002f3c5295f89mr22472721qtx.158.1652826820094; 
 Tue, 17 May 2022 15:33:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNH3lIfhXQ3QcRjAYZSIHBy4cUOe+o8UjX9lacQqYYbq3FNnSKIvDUgOrGldFFWLAX52lxvw==
X-Received: by 2002:a05:622a:4d4:b0:2f3:c529:5f89 with SMTP id
 q20-20020a05622a04d400b002f3c5295f89mr22472711qtx.158.1652826819889; 
 Tue, 17 May 2022 15:33:39 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 g12-20020ac8070c000000b002f39b99f69csm114858qth.54.2022.05.17.15.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 15:33:39 -0700 (PDT)
Message-ID: <4382925e2e4174598214f3a9f74b373a5fca40fd.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: reorder nouveau_drm_device_fini
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>, linux-kernel@vger.kernel.org
Date: Tue, 17 May 2022 18:33:38 -0400
In-Reply-To: <20220516133103.324365-1-mmenzyns@redhat.com>
References: <20220516133103.324365-1-mmenzyns@redhat.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So I think you forgot to update the subject of the patch. If you can send a
respin of this patch with a corrected patch title, then you can consider this:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I'll push once you get the respin out

On Mon, 2022-05-16 at 15:31 +0200, Mark Menzynski wrote:
> Resources needed for output poll workers are destroyed in
> nouveau_fbcon_fini() before output poll workers are cleared in
> nouveau_display_fini(). This means there is a time between fbcon_fini()
> and display_fini(), where if output poll happens, it crashes.
> 
> This makes output poll workers cleared right before fbcon resources are
> destroyed.
> 
> BUG: KASAN: use-after-free in
> __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
> [drm_kms_helper]
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 4f9b3aa5deda..5226323e55d3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -39,6 +39,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_atomic.h>
> @@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
>         if (!drm->fbcon)
>                 return;
>  
> +       drm_kms_helper_poll_fini(dev);
>         nouveau_fbcon_accel_fini(dev);
>         nouveau_fbcon_destroy(dev, drm->fbcon);
>         kfree(drm->fbcon);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

