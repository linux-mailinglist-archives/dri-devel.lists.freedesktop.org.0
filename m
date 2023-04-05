Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633446D7B69
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA6910E8EA;
	Wed,  5 Apr 2023 11:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C4510E8F0
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680694444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tk18jdSB5PL8M24Q9AEmOWNrBMpUmu7JVWWnzwGtR04=;
 b=cojBmMloHioOlExpRZ0pZ0OKNDP7IJBzTWpUiWuJsyn9TfTq1VC0aQz0hj1qBg54TXOi2m
 Ue4X+IIhy7lDkqW/zNhk/1vP92vdMLHjD5Ahauh4ZEPgghGLUsagFEyYIGLPwM9XlbK1nP
 a0exPMcuhss4ebhUhf/QqD5kNd4gXcY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-L-a3wDXuPZOqwzORc4fLBQ-1; Wed, 05 Apr 2023 07:34:03 -0400
X-MC-Unique: L-a3wDXuPZOqwzORc4fLBQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o28-20020a05600c511c00b003ef69894934so15084616wms.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680694442;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tk18jdSB5PL8M24Q9AEmOWNrBMpUmu7JVWWnzwGtR04=;
 b=3fQ/fX8ZSlMyEUnBtdgtluyD3zReDDbcFsh0yZUKgCXNYQlXfAdPj/MazSv2boLpYZ
 3XCHp7Mt+r1m07suOqNvINgSfKs50uezHaZ+Xd+2Jz1htN3kaHQ+GZul+YO2UYPju1fM
 JWbowHWa4jSRd/JA3Xab3s6iHlKcUUdq33/CjgCxOmFS+q9dX/BmSIpNHLg9rSsPfNtc
 6pKdx3pJ2C1u0y+NARWICn9WcBU0PmBZrttL/usT0rCIihKkKjgklva3BfgIbeayf4FE
 Tz58WFD4zds9df7F34QL8WowOKFASvu/fdWyVf5ehACwY1jQzhbIIihivwNrWb6rGOu0
 tPRg==
X-Gm-Message-State: AAQBX9cbmOPs3wwtp06s+IjWMsdjM7ZHPtclAjcEoUhvl4KLOHxeFP/j
 KjtcrktgJYv2jFzukGTitSkWt+V0rjx6LiYhmjzODbCg7zONaDkRUk/aP3wclVXVavk51VyReuF
 ahWasOMVnO37ofOV9edQLU01u9Gv5
X-Received: by 2002:adf:f2d1:0:b0:2cf:f0c3:79ba with SMTP id
 d17-20020adff2d1000000b002cff0c379bamr3508284wrp.67.1680694442710; 
 Wed, 05 Apr 2023 04:34:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350YUjKA961Ix1B03KyblFGKgk9FaYELj3MXThs4Hw8qWQfuaORfFYONMGsntnJe5AvWYZuwF8A==
X-Received: by 2002:adf:f2d1:0:b0:2cf:f0c3:79ba with SMTP id
 d17-20020adff2d1000000b002cff0c379bamr3508272wrp.67.1680694442440; 
 Wed, 05 Apr 2023 04:34:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u17-20020adfed51000000b002c6e8af1037sm14710349wro.104.2023.04.05.04.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:34:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/8] video/aperture: Move vga handling to pci function
In-Reply-To: <20230404201842.567344-5-daniel.vetter@ffwll.ch>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <20230404201842.567344-5-daniel.vetter@ffwll.ch>
Date: Wed, 05 Apr 2023 13:34:01 +0200
Message-ID: <87v8iabm1i.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> A few reasons for this:
>
> - It's really the only one where this matters. I tried looking around,
>   and I didn't find any non-pci vga-compatible controllers for x86
>   (since that's the only platform where we had this until a few
>   patches ago), where a driver participating in the aperture claim
>   dance would interfere.
>
> - I also don't expect that any future bus anytime soon will
>   not just look like pci towards the OS, that's been the case for like
>   25+ years by now for practically everything (even non non-x86).
>
> - Also it's a bit funny if we have one part of the vga removal in the
>   pci function, and the other in the generic one.
>
> v2: Rebase.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/video/aperture.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

