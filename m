Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A06D961F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD4B10EB99;
	Thu,  6 Apr 2023 11:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E4410EB95
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680781390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44fjV+187FPvFXymTOGRK1S1eUOwQG0BRNaEi6eqCcs=;
 b=NZaoKzyG6M/RauYJKK/NtSKj6sE5ImhbxF7bdI7oOZPF8Tq3fr7Q25RrEbihlrFPU0TWit
 D+JHgexLpb8aXfNGD6Z6hZ9Gcm/QQmyaDPiPRDvq0k9fWuDndF9V3j01RODTZNuc/W/cy8
 rNmimIZXdkesuIrNBEWtIuQCEV4NGsA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-ORhEhB8HMl64r1uDpj-f1g-1; Thu, 06 Apr 2023 07:43:09 -0400
X-MC-Unique: ORhEhB8HMl64r1uDpj-f1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay37-20020a05600c1e2500b003ee69edec16so20239006wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680781388;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44fjV+187FPvFXymTOGRK1S1eUOwQG0BRNaEi6eqCcs=;
 b=cKgErrdhjXbRt1IfzM3EB8VebRb4e/N8wC0w8D6uw66JzHMW8ca9ol5Hlemux/ICy3
 1dBw79Wor1i/JbGl12oxf6ukbFgG/T04K7xIBMAyPMbhqsLzGvptNBxNh8ZHHnsk7xwK
 cP9N5perheGsD5mufBOyNeYCGFWRRkDKdooyE8+DTDgntxz7A1of6yO3f4X9HUGiGyXc
 HR/9+vtid0+s96XTK/WuOEavouapox0oAoN3nVirNaBBwFXIbJgC57BuHmYE6wi2Xuuz
 +rDbv9oHt8T7K+TLMWKMLq5AYSS+SIOeIyJ1fDnCFYK04gHSo8dxoRpo5w/DCf0fpuHk
 a2fg==
X-Gm-Message-State: AAQBX9d47qli/AHVGL6Y5xGibYDWagCN69agUE8+9RewRhDf9D8CFt+V
 Dt42TO6/lm7equdltJX+eVsqEYpjpNzOe39ZAY/ZPEJpW7HqYKcn7LrID+/coERjTP4RoF6Ct3Z
 1hdthJ3LukRGblDjkaG1/g6VU38dM
X-Received: by 2002:a1c:4c09:0:b0:3ef:6fee:8057 with SMTP id
 z9-20020a1c4c09000000b003ef6fee8057mr7291103wmf.25.1680781388305; 
 Thu, 06 Apr 2023 04:43:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350avpYP09FE8ENI0Dv5nt1DTTcCCBLdEcEHHGCxnMqfka0MRyf029ul0rWy8je94skmNpDyaWA==
X-Received: by 2002:a1c:4c09:0:b0:3ef:6fee:8057 with SMTP id
 z9-20020a1c4c09000000b003ef6fee8057mr7291088wmf.25.1680781388023; 
 Thu, 06 Apr 2023 04:43:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002d45575643esm1559085wro.43.2023.04.06.04.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:43:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 1/2] drm/vkms: Use drmm_crtc_init_with_planes()
In-Reply-To: <20230116205800.1266227-1-mcanal@igalia.com>
References: <20230116205800.1266227-1-mcanal@igalia.com>
Date: Thu, 06 Apr 2023 13:43:06 +0200
Message-ID: <87edox8cdx.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

Hello Ma=C3=ADra,

> Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
> to get rid of the explicit destroy hook in struct drm_crtc_funcs.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

