Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61052AE36
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 00:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9896D10E5BD;
	Tue, 17 May 2022 22:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C830B10FA0C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652826812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsgZD2xN95jcvNsVYdiJpz1wstzqtrmwvWpl/rt8mrs=;
 b=W/r2i1/1gk0eogp+4Gh9r6V5LjdgGcyJntnt8kD/Aek5worlVf8KjzeplVLjUVzFxgpbCI
 C9Yb60DRUulkNWIqFXQmS+R/bMFHvJtVPO//ioBbxAi5DeAmgIqeNSc/9YOd7tfSq1S7hR
 P3LQV5rb7khdGGVz859ed5lIIRIVN3M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-Sq-onmETPU67BQ5uoQYenw-1; Tue, 17 May 2022 18:33:29 -0400
X-MC-Unique: Sq-onmETPU67BQ5uoQYenw-1
Received: by mail-qk1-f199.google.com with SMTP id
 27-20020a05620a041b00b0069fd7a60a43so261331qkp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 15:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=xsgZD2xN95jcvNsVYdiJpz1wstzqtrmwvWpl/rt8mrs=;
 b=Yh6XNWEuRi5P61cyCcv2By5YIUUtsLO470z4OTWFLQpmw6xvewRwPWcA4nTkiwRanO
 MCU324UDFX6BY1fd4Kw8LEKIC7j7Jt0yXwl8Hoej6rXsX/OqYSJvbedeZnIOf4kSz5F1
 THLji2VgKf5WpwJcjsQaqD4c0oWrUEwl8xPhVFrstGPWJKTc3ciVRCrYAU4fSHSrG4PV
 zaxr7m41ie43W8GE5eif64VgCyM+yEWw67NPd8RkW6GJnPUMukXYarwpsL74DS1axjcl
 uoID+1Xi1cXnzZTcAZzyP1yU9t8CKC+r8i0dg/xyWsLQJL0tEO+w/P06OQ+mDdSOm2qb
 p1Tg==
X-Gm-Message-State: AOAM531AWugHi048LjKHs7xNLisevuCSlydIHt9gYK8uROPS36C4fvHu
 1dp+Za+ADstfXikcncCf7rnJsgd+RXaTNf6eJ5DhkE1LptXJayGxm3bqfN6Hze7b50HBMV6Dkuc
 Ju1yiHio+Rg2/1em17sOVqwC146Ap
X-Received: by 2002:a05:620a:4727:b0:6a0:3036:8bfe with SMTP id
 bs39-20020a05620a472700b006a030368bfemr18258020qkb.239.1652826809402; 
 Tue, 17 May 2022 15:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1rJobn4JcdOWoAqeK93N2MhQ5S8q1IuwRVLFycp/5h0rBE3NqehxIR7DkNsuosW/5+564Lw==
X-Received: by 2002:a05:620a:4727:b0:6a0:3036:8bfe with SMTP id
 bs39-20020a05620a472700b006a030368bfemr18258006qkb.239.1652826809198; 
 Tue, 17 May 2022 15:33:29 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 z197-20020a3765ce000000b0069fc13ce212sm276480qkb.67.2022.05.17.15.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 15:31:56 -0700 (PDT)
Message-ID: <aed19bec63ddcb63bf87582754c96d7fbe2c06b3.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: reorder nouveau_drm_device_fini
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>, linux-kernel@vger.kernel.org
Date: Tue, 17 May 2022 18:31:03 -0400
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

