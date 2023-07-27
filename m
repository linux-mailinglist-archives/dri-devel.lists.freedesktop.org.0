Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68E376554B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 15:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06D310E0F4;
	Thu, 27 Jul 2023 13:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F2210E0F4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 13:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690465427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6IdfiH6mIMbR0FSXPQIGzj7LBm5xu56D2rRO//Z4diQ=;
 b=KIKYoMz1HP1/pScbuSig/DnzN2+esasij7fMZ3xpJOb2O9ekacEz1nn2l1p9XEhD0wxjs1
 ups1M+lhlndAMCAFGQm8EBWjMCCGU883BOqMr/HsJ5wL5ARUkWXrU54tnfzZIsfYr92rCY
 BUC/fqeYiT9y4syh1Wfwo0NFouqSW3U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-Rn-u8p6jOGS03NmOaMJGaA-1; Thu, 27 Jul 2023 09:43:46 -0400
X-MC-Unique: Rn-u8p6jOGS03NmOaMJGaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so5682385e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 06:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690465425; x=1691070225;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6IdfiH6mIMbR0FSXPQIGzj7LBm5xu56D2rRO//Z4diQ=;
 b=Oa7c1Fnd+kBUQKEJY/CqHcbZFjeAxgGkAAok+cMsw738wScpCJ6s4379Xg0ecJQNDQ
 reHh88HWVOUECX+1lgu+zX7tvCWXw3U0FFi4y7wZS8K4iC5gnion+JDJzvDbX1IE7/I7
 Xz4TqB9ujmF/sQQ5WKHdHqoNMlbrc06RtsNNVnDQ/wZaE9CtebzhsXwu0Kuh0Vg+sY0a
 hpCH3BNdB1lnk16zIXnz25ua14JMTIKEp0P0RW4IWqAehw5+DPLGGWOZeGpmSEWWjfvY
 RY0AJUAoEDmRWktCyxaeUDFhIV1CAzXxao+ALrq4a4Dmx6LVPpmv4Us2U4dw2m9CGEwY
 fKjQ==
X-Gm-Message-State: ABy/qLarVJa36lB9WmYZjDjc0kHVLtADt9O4JBS/K6bGoV9yMRHaRlkh
 SJTnc1WGC0qaMpeV3vQF/XGk1Wr405egYBpArxgRg1n2SYPltWTIIt1rowWiFF0KGiBy86ouIbS
 tzWjztw8siaBETUpbtWs5w6Ym0dBI
X-Received: by 2002:a05:600c:2310:b0:3fb:d1db:5454 with SMTP id
 16-20020a05600c231000b003fbd1db5454mr1655358wmo.35.1690465425397; 
 Thu, 27 Jul 2023 06:43:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFNNkcpZZZoQTCtuvLKA9S/2aEqx3XjLUzUW8H6jP7uraezXsHXbBMd93Ho1Ikj5PKWqof+3A==
X-Received: by 2002:a05:600c:2310:b0:3fb:d1db:5454 with SMTP id
 16-20020a05600c231000b003fbd1db5454mr1655348wmo.35.1690465425050; 
 Thu, 27 Jul 2023 06:43:45 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h4-20020adffa84000000b0031417fd473csm2077965wrr.78.2023.07.27.06.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 06:43:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <76cea601-2730-21a7-f52b-1d53be343d6e@suse.de>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <76cea601-2730-21a7-f52b-1d53be343d6e@suse.de>
Date: Thu, 27 Jul 2023 15:43:44 +0200
Message-ID: <874jlp5v1r.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks a lot for the feedback!

> Hi Javier,
>
> this patch is completely broken. It's easy to fix though.
>
> Am 21.07.23 um 09:09 schrieb Javier Martinez Canillas:

[...]

>> +struct ssd130x_plane_state {
>> +	struct drm_plane_state base;
>
> You need to use a struct drm_shadow_plane_state here.
>

Yes, I already noticed this when testing Arnd's patch to drop
DRM_GEM_SHADOW_PLANE_FUNCS. I already have a patch ready.

[...]

+
>>   static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
>>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>
> This macro sets the callbacks that vmap/vunmap the GEM buffer during the 
> display update. They expect to upcast from drm_plane_state to 
> drm_shadow_plane_state.  And hence, your driver's plane state needs to 
> inherit from drm_shadow_plane_state.
>

Yup. I missed that. I'm now testing my patch and will post it.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

