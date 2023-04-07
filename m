Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 659556DAB85
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 12:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD76B10EDAA;
	Fri,  7 Apr 2023 10:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0258E10E748
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 10:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680863281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cW6qwzUaz9B3jxqqOjdmFXBcyS1dIEIovEhA0ktAs14=;
 b=VZjnlprrjcMWooT8yPHOgZRAlMFsT1vmE9G/LRO1xxP7APyrviAP1ga4VFFPVTH9jk/qSJ
 TRUPuMeN8BYRGKnEW87WrO4ylwlPzM0Yte20l5GpejoItKIiHWhSDF03sfwi8uvmhasE7L
 MexWfpSW9QbE1PGfuJNiW61jmZnj5Ko=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584--obYIt6HNqaFWipP2H7OXw-1; Fri, 07 Apr 2023 06:27:59 -0400
X-MC-Unique: -obYIt6HNqaFWipP2H7OXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c19-20020a05600c0a5300b003f07515bce8so734241wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 03:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680863278;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cW6qwzUaz9B3jxqqOjdmFXBcyS1dIEIovEhA0ktAs14=;
 b=ZTwQmpV98dsKxtlelVqDtoY8E/rwgREK5rksNENMgTu62LsW1leOP3n4DZEfU7f8Mw
 5Y/Lms6AvI6KYSbjCqB7SgwCt4g3mjTOnagDzZI0a0j89APU8krOWI0u/0Ni+437KXeF
 GpxnlOxVBEX8RaA/hntx8iHBYyt9Z/YhNW/MdKSe/mMz1wur1qnRmZ04AdpDIwPD+gO5
 /TTNNVzjJju9C+VeBubnFlI6q1zkVB6FDJCFrnIW9WlR/N21OaeVTGkAsk2R8ah9ulb2
 K4szvfoKibiD7VrqIQQpvrv2So8fUDV6ufiVxm7GoxYR8mEVJME79x9Gm2G5XmJAFEz2
 WEHw==
X-Gm-Message-State: AAQBX9e/xT8OkSp587iLgUxRZaKFZ+swH4tnemoCaEaovBw1dEhGBJMH
 6O+D5+yt4exNoS5SbJdv+3LZm72C5sNsV8Khm2CagfNOGNyUc9WJozC4CcFVPWotekeb5KICGfB
 x4s98hQ/X6foC2lVNVUszaYZyuNBn
X-Received: by 2002:adf:fe0f:0:b0:2ee:e456:533c with SMTP id
 n15-20020adffe0f000000b002eee456533cmr1003385wrr.16.1680863278508; 
 Fri, 07 Apr 2023 03:27:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350bfdtGVRabr98CqCjVUzEr0kDdLvYILbeZ6D7QDV16n6ZJXlKkE4RFcUdkoI+mrBNkn5n5llg==
X-Received: by 2002:adf:fe0f:0:b0:2ee:e456:533c with SMTP id
 n15-20020adffe0f000000b002eee456533cmr1003373wrr.16.1680863278185; 
 Fri, 07 Apr 2023 03:27:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002da1261aa44sm4170159wrw.48.2023.04.07.03.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 03:27:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel.vetter@ffwll.ch,
 patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH v5 1/9] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <20230406132109.32050-2-tzimmermann@suse.de>
References: <20230406132109.32050-1-tzimmermann@suse.de>
 <20230406132109.32050-2-tzimmermann@suse.de>
Date: Fri, 07 Apr 2023 12:27:56 +0200
Message-ID: <87zg7k6l77.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> From: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> This one nukes all framebuffers, which is a bit much. In reality
> gma500 is igpu and never shipped with anything discrete, so there should
> not be any difference.
>
> v2: Unfortunately the framebuffer sits outside of the pci bars for
> gma500, and so only using the pci helpers won't be enough. Otoh if we
> only use non-pci helper, then we don't get the vga handling, and
> subsequent refactoring to untangle these special cases won't work.
>
> It's not pretty, but the simplest fix (since gma500 really is the only
> quirky pci driver like this we have) is to just have both calls.
>
> v4:
> - fix Daniel's S-o-b address
>
> v5:
> - add back an S-o-b tag with Daniel's Intel address
>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

