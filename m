Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1043CAEB9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 23:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D176E33F;
	Thu, 15 Jul 2021 21:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64DE6E334
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626385645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VbJoFGn3iVtEo23nu3H2b6uKsNM79IeS4yIQ3LlXnk=;
 b=CK2kQJ3psZwU1sZAF6c73irJUfarq+07bUNA+3gwigyVCTgv7dVpdYVMwRn1+Iz4Id9/wm
 igaeGUeWKeqhNT9oLIMA4Dk3frrMCwDN7D8Yy4oy3uZTG8yTdDnBau0V5Lo2xy4CgliRft
 rcAIly7BJZ8hJtwfQ//VXgASE9DmMxU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-iHhNfJ-LMXG87JDEOVeYng-1; Thu, 15 Jul 2021 17:47:22 -0400
X-MC-Unique: iHhNfJ-LMXG87JDEOVeYng-1
Received: by mail-qv1-f69.google.com with SMTP id
 c22-20020a0ca9d60000b02902e60d75210eso5143553qvb.19
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 14:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6VbJoFGn3iVtEo23nu3H2b6uKsNM79IeS4yIQ3LlXnk=;
 b=lF99ZB7UiTlJIB4eJR60p3HzdRzvJjl+uhh6NkrafoRZm6Xybc524WnYPJBq4qh0Te
 FNk7r2l2KpJuXh8dm+21nUrP81ePCA8eHOTRKUT7DX0tz0YGLhCCS/gHIG9Cr/q45kWw
 rar/vEphmvDamOFJW0uMR2OSYM7C1C3ojFYoKV0HQZJb84zx9j4ie/gU5ZKrHBbCpIW6
 jnAVrS/iPAO6zFOfRshMXT7GrUm0dr5dugt2gm7r+9X5Bp9/dgtIm58OOK2C++CJfIa1
 h5Cd+KbdoSLy4IxX2AUEhxI7sYQa26mBKhd1+km3hpRGbLjVodwgj4TANsSZcE19tb+1
 2zrA==
X-Gm-Message-State: AOAM532B7wk+njbUE7+8H2I82d9/PRlFIZp8HB/sc6RXhlc4EaYvdQ0R
 /1S+oavVxeIn3BIzwaYhp+cQ2YjMhrjaGhbc5W6plfZFHBKVxM4OgANEKlMSemPGW+xkvnW4HSW
 cWtnpF7qN3SqUSi0cOo63GBJXkNuz
X-Received: by 2002:a37:596:: with SMTP id 144mr6005312qkf.147.1626385642393; 
 Thu, 15 Jul 2021 14:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf6CxMuCywKlr13sMEvKt2RmDZXJ3nQGJyosoC9dHBut/1SP4vBw0DEf6PE92oUlap1x+XxQ==
X-Received: by 2002:a37:596:: with SMTP id 144mr6005296qkf.147.1626385642176; 
 Thu, 15 Jul 2021 14:47:22 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id u3sm2549187qtg.16.2021.07.15.14.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 14:47:21 -0700 (PDT)
Message-ID: <9c9c3878de9640239b51fb961e949d2b075dc5ac.camel@redhat.com>
Subject: Re: [PATCH -next] drm: nouveau: fix disp.c build when
 NOUVEAU_BACKLIGHT is not enabled
From: Lyude Paul <lyude@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Thu, 15 Jul 2021 17:47:20 -0400
In-Reply-To: <20210714171523.413-1-rdunlap@infradead.org>
References: <20210714171523.413-1-rdunlap@infradead.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2021-07-14 at 10:15 -0700, Randy Dunlap wrote:
> Fix build errors and warnings when
> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> 
> ../drivers/gpu/drm/nouveau/dispnv50/disp.c: In function
> ‘nv50_sor_atomic_disable’:
> ../drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:52: error: ‘struct
> nouveau_connector’ has no member named ‘backlight’
>   struct nouveau_backlight *backlight = nv_connector->backlight;
>                                                     ^~
> ../drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:28: error: dereferencing
> pointer to incomplete type ‘struct nouveau_backlight’
>   if (backlight && backlight->uses_dpcd) {
> 
> and then fix subsequent build warnings after the above are fixed:
> 
> ../drivers/gpu/drm/nouveau/dispnv50/disp.c: In function
> ‘nv50_sor_atomic_disable’:
> ../drivers/gpu/drm/nouveau/dispnv50/disp.c:1669:6: warning: unused variable
> ‘ret’ [-Wunused-variable]
>   int ret;
>       ^~~
> ../drivers/gpu/drm/nouveau/dispnv50/disp.c:1662:22: warning: unused variable
> ‘drm’ [-Wunused-variable]
>   struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>                       ^~~
> 
> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight
> support for nouveau")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> --- linux-next-20210714.orig/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ linux-next-20210714/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1659,23 +1659,27 @@ static void
>  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct
> drm_atomic_state *state)
>  {
>         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> -       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>         struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
>         struct nouveau_connector *nv_connector =
> nv50_outp_get_old_connector(state, nv_encoder);
> +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> +       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>         struct nouveau_backlight *backlight = nv_connector->backlight;
> +#endif
>         struct drm_dp_aux *aux = &nv_connector->aux;
>         int ret;
>         u8 pwr;
>  
> +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>         if (backlight && backlight->uses_dpcd) {
>                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
>                 if (ret < 0)
>                         NV_ERROR(drm, "Failed to disable backlight on
> [CONNECTOR:%d:%s]: %d\n",
>                                  nv_connector->base.base.id, nv_connector-
> >base.name, ret);
>         }
> +#endif
>  
>         if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> -               int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> +               ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
>  
>                 if (ret == 0) {
>                         pwr &= ~DP_SET_POWER_MASK;
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

