Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4F6DF95A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B281510E44E;
	Wed, 12 Apr 2023 15:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC4510E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681312009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xyPybtfqJoKlA8Okt+qCT/JDRf7WEonxbjGB7Z3wGNs=;
 b=e40oUEXYiUVKuRVmlpTwxS550n9Yclh9+zT6oZvmOshBC5JU6NdD7JRTNKLZrGUnEhz/cX
 tKmdJL66MJGDxopwTNdZ+oXlfFoiutMsOI9VObF7OMoUQqGcRRy4SfyeSW5p/m9o9+E8Ha
 oiPsD7mngSobgAx7sqIMiGJV2DeIF70=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-MoMIR3f1MQC0A0KcSxSrYg-1; Wed, 12 Apr 2023 11:06:47 -0400
X-MC-Unique: MoMIR3f1MQC0A0KcSxSrYg-1
Received: by mail-wr1-f70.google.com with SMTP id
 e25-20020adfa459000000b002cfe70737d2so1950914wra.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681312005; x=1683904005;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xyPybtfqJoKlA8Okt+qCT/JDRf7WEonxbjGB7Z3wGNs=;
 b=pKv8r9/t4txGkZWFsyOiCRxM0bW8DOHnx44uFLbD+wIWZ1ygUtCSvuWVfmHjYJV//6
 bShADP+w0NPRhi2slt9qWC+TjegbLanDSyBXXfm/ZBtjmvr7xHU8Hwkv/5EuaiFtJEAI
 9IUP+wM5dWlwOzA7AegBKoaCxqF1uobBBBFYxLl6fE/Gl0vJdjO4QSG0OTpZyFcSdOJT
 2zTSJkowpAAjhm9kyLEjbqdW2P5HJ8Zy7l/kQPN6acUsk/gFAcbOsFwCfeggq4rWApYe
 /e6ZFpvFXeUkxb4565Onyeo7hM1RpJUk5g90Fxu6Z4Fj7NwqKgAlzQ/vNWzP6QyL2SOf
 WimA==
X-Gm-Message-State: AAQBX9fJ3hFcmAWZeLkv4hyMZKUS42WdrmDYd0T/9Afc6L6zu83V6Rmg
 OBrJxB0cgHMVL8al5BJBDFyP+7Txq5hRm3Z/nhn/hMRsO7laxyRkt/2bches5eVe0hsZMOhmj2D
 szfydC4SFYeg/gOycCdHM+dm7qimdhB66fUiS
X-Received: by 2002:adf:eccb:0:b0:2f2:4b6c:12fe with SMTP id
 s11-20020adfeccb000000b002f24b6c12femr2197400wro.45.1681312004918; 
 Wed, 12 Apr 2023 08:06:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZbTdyZOoyS4BiqG90rWAZSRjbx/wr2MM+QK5LrEiNiLxk9vlfwGesPFmVtk80cXAp+oPCO2g==
X-Received: by 2002:adf:eccb:0:b0:2f2:4b6c:12fe with SMTP id
 s11-20020adfeccb000000b002f24b6c12femr2197320wro.45.1681312003454; 
 Wed, 12 Apr 2023 08:06:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4c90000000b002cf1c435afcsm17415542wrs.11.2023.04.12.08.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:06:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, lyude@redhat.com
Subject: Re: [PATCH 1/2] drm/mgag200: simplify offset and scale computation.
In-Reply-To: <20230412133912.610294-2-jfalempe@redhat.com>
References: <20230412133912.610294-1-jfalempe@redhat.com>
 <20230412133912.610294-2-jfalempe@redhat.com>
Date: Wed, 12 Apr 2023 17:06:41 +0200
Message-ID: <87pm89rvge.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> Now that the driver handles only 16, 24 and 32-bit framebuffer,
> it can be simplified.
>
> No functional changes.
>
> offset:
> 16bit: (bppshift = 1)
> offset = width >> (4 - bppshift) => width / 8 => pitch / 16
>
> 24bit:  (bppshift = 0)
> offset = (width * 3) >> (4 - bppshift)  => width * 3 / 16 => pitch / 16
>
> 32bit:  (bppshift = 2)
> offset = width >> (4 - bppshift) => width / 4 => pitch / 16
>
> scale:
> 16bit:
> scale = (1 << bppshift) - 1 => 1
> 24bit:
> scale = ((1 << bppshift) * 3) - 1 => 2
> 32bit:
> scale = (1 << bppshift) - 1 => 3
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Thanks a nice simplication indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

