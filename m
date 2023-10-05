Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194167B9D52
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8A710E401;
	Thu,  5 Oct 2023 13:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D210E401
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696512517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O/T6KAgZt6jRiWe+ybUB6AIX3nwcf0FJQNLQ46tRdPo=;
 b=G2OQWUwS0geLPnAiHaynp648s2IE1y4CBfW/4g2a2AA396xZUQRG9VQM2iFaDv6t6VG1gv
 2cweJksjgpEfXqe4ERgx/lmgyHHd0W/EKOrW80pjh9y3Ej4NlBWMElv+PiR3YxzFlsQCTA
 S15cJ59frCScxVUThsYam/H1JodALGE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-R9vnuUjIP9-dMuFvcf3GKg-1; Thu, 05 Oct 2023 09:28:26 -0400
X-MC-Unique: R9vnuUjIP9-dMuFvcf3GKg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so6655155e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 06:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696512505; x=1697117305;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DG7shVqw+DqkkC/CgOXstCgKuW3SoLye52Q36TTZ9VQ=;
 b=i+pC2Vn1bL/lvv5qP4ktHkKWroTR5e8kJ6vveBEfRqKgXefoagp8vPcsRQfRvQhYGu
 gWlxsLBBwwlxn9gDmuoe4B6If5d8J8eyS1k44ZDMixbN2sJXCtBtd5EzjHkgOiTnGKWo
 3Eg2dY6Q8Pqa/BtUP7Mqz1ixsStcoPDzzXRE9ElUEGMbZzoSUmd1QnHQUf9D5pVqdd4O
 8gYDjuoWCUsx8EzdqUfUcxkKlblkSlKtoDuWzCfJqiSrYwGYj5lbxzPqfmZQ4WsXNUhm
 M54/w9LG6WEP80/NYHyeVvF9X7CiwkSwmf/bWM/ZDrqsti1r1JVL1iatYGMBMUZgMV40
 u/fg==
X-Gm-Message-State: AOJu0Yzq85/0cB1mJ0xWHp0e+2V8FNhO2ub3p9lxJlloMGL6+oH9BqZN
 GrpwIIG86XsmmAf2aGVlyIj4cZQDQxJEkqmxyZbW/ngHz9b44ZDvtDdVt85CLMOPAiROeS77pnf
 P+4SsKknCijnlfpBocgUbdOR7sBcU
X-Received: by 2002:adf:fd8d:0:b0:317:55c:4936 with SMTP id
 d13-20020adffd8d000000b00317055c4936mr4620969wrr.9.1696512505488; 
 Thu, 05 Oct 2023 06:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnLz+FaqH4udg93KcrFvsXYTF6X8GRQHLtWcygKE7da2QKZC4hb6MYTaNlHDsOjTTXoScBmg==
X-Received: by 2002:adf:fd8d:0:b0:317:55c:4936 with SMTP id
 d13-20020adffd8d000000b00317055c4936mr4620958wrr.9.1696512505212; 
 Thu, 05 Oct 2023 06:28:25 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b2-20020a5d5502000000b00323330edbc7sm1797772wrv.20.2023.10.05.06.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 06:28:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 3/7] drm/format-helper: Pass format-conversion state
 to helpers
In-Reply-To: <20231005090520.16511-4-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-4-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 15:28:24 +0200
Message-ID: <877co119mv.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: David Lechner <david@lechnology.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Pass an instance of struct drm_format_conv_state to DRM's format
> conversion helpers. Update all callers.
>
> Most drivers can use the format-conversion state from their shadow-
> plane state. The shadow plane's destroy function releases the
> allocated buffer. Drivers will later be able to allocate a buffer
> of appropriate size in their plane's atomic_check code.
>
> The gud driver uses a separate thread for committing updates. For
> now, the update worker contains its own format-conversion state.
>
> Images in the format-helper tests are small. The tests preallocate
> a static page for the temporary buffer. Unloading the module releases
> the memory.
>
> v3:
> =09* store buffer in shadow-plane state (Javier, Maxime)
> =09* replace ARRAY_SIZE() with sizeof() (Jani)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: David Lechner <david@lechnology.com>
> ---

For the drm_format_helper.{h,c} and ssd130x driver changes:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

