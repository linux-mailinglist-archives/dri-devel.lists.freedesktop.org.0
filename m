Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD356F1A74
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 16:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D381210E34A;
	Fri, 28 Apr 2023 14:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3A010E34A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682692033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=YttZWMEw0Q7ls3/c2+nXVeQJdi37K5Vx3czcL6CojANMOc+gijiuvFjMX6iLJDqVQ0ojyN
 B/qX9qPZ3ggVotjlh+AdJcnDT8pncvhogiuAxnAh3LV7ZIUS71KcCLn2exgRGV6pKN0gNQ
 XFQDaYLTFBqLBjW8FMs/L7VpxNmhxU0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-TNjzE4zyNd60cngcLl3Kxg-1; Fri, 28 Apr 2023 10:27:12 -0400
X-MC-Unique: TNjzE4zyNd60cngcLl3Kxg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f40f52c604so5944514f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 07:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682692031; x=1685284031;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=V8MBaeV/Sr3bwKgA0nJ3Mxe1rhau2wL/23AeVaIS41xJ8cRhqeTFqirHYhZu9zhnGY
 VvA4xYNonzRX13VQ4DPssCDG/b8VfF4IPXPEKkEhheMUGnNWuc7INEImllXhxpDt6lmM
 tkfT6eFMbexRgh2q0xzW0otf9fp5aQ9amwAEGGSRZyRTlV6DXf5y/YtwvkzYOjM1m9dg
 Im0fX4B/fhqDj6dc7XSBxwhMfsoc69nvjKJ3IVsuiCV2NoNxvfl9ozUhmTlO0lwcYtrO
 kS7YLaVQkGYE3QGDJmjnuoNosoEm0iN8Gz1ZoYT9ts4LJ0HGlj8yqnT6N6qBfK8yYN1v
 4/3Q==
X-Gm-Message-State: AC+VfDxUkFA31w3Jlhe25mUxceeZtJRzBw5RosmRZyrdCE9ZNb7PVTz8
 aVEg2RaEuPhCrsC+qup+ihta8X9EfF2gksSxf+mxFfVbnwL4IIdHIBbsoqTBy+40lQVG365/hEo
 fV3F89XdsJOxQCaygH1WTkW/DI9xZ
X-Received: by 2002:adf:f810:0:b0:2c5:5a65:79a0 with SMTP id
 s16-20020adff810000000b002c55a6579a0mr4391333wrp.53.1682692030864; 
 Fri, 28 Apr 2023 07:27:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SrnpwcaTYOywstWBue2E99v9XRtq5SQQKVfxAHqBZBI0YeI6o+i4KonyzhoKKhmbKGMmicw==
X-Received: by 2002:adf:f810:0:b0:2c5:5a65:79a0 with SMTP id
 s16-20020adff810000000b002c55a6579a0mr4391318wrp.53.1682692030550; 
 Fri, 28 Apr 2023 07:27:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b002cff06039d7sm21148541wrx.39.2023.04.28.07.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 07:27:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 05/19] fbdev/au1200fb: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-6-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-6-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 16:27:08 +0200
Message-ID: <877ctwgk03.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>
> The struct fb_info has a union to store the framebuffer memory. This can
> either be info->screen_base if the framebuffer is stored in I/O memory,
> or info->screen_buffer if the framebuffer is stored in system memory.
>
> As the driver operates on the latter address space, it is wrong to use
> .screen_base and .screen_buffer must be used instead. This also gets
> rid of casting needed due to not using the correct data type.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

