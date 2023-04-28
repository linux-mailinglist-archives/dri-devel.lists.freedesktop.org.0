Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F616F1B38
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:13:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EDA10E3D2;
	Fri, 28 Apr 2023 15:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C77810E3D4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682694791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=ehOooyUkp52ZJCuw27CFhk1l9gyTRgydZYxkO9J25oq38znfNchUZFoZDRvTk4cP7AqPXS
 KDwPazlfitU9/+zM9jPE13qMAYbON1y0N9dEqz0vaA2DhRay4l0EBLJoKkMoaBPzMG3TCj
 MT4+I/nKaEXNQdN/iFU6SpPSZkHwqt4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-gk5WCqqgO_6Bu1tpFqs10A-1; Fri, 28 Apr 2023 11:13:03 -0400
X-MC-Unique: gk5WCqqgO_6Bu1tpFqs10A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fcec825133so3361048f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 08:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682694773; x=1685286773;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6nMtf6Gzq3uJ6hYj+VP/gNrA7S63KDC0HhAUOQNVRE=;
 b=RuulCJ03AHZQ37CNytweqmIME8Gq8bxLuLhLpXM8QqHvhdyVf+wmsD7h6EtRS2g3t8
 CLUH5ed1fqT1nXpSjuv/YB+fWWFraVePlXB9DcDpgSDkTRX7b92LXJJmdBh3qTSpkuEj
 9siMfCsx5IRr/5L7OYNxDSSU63cK8N37HGTDRVjTDwzsmqMJVnQkFwSyGs471QEMrWPO
 bGvV020ZyUJEXTRJcM5vg4lOWHg1rZoM9cfvhOPI9WTEPajtdba13yDEvYE6W31rg51q
 VSDwJNBS762v9OXw61e+344cHul8AhcBjNgZ0EfLN4eUvoBd/QjSKmqhyo3YbDkKA7lY
 rTUg==
X-Gm-Message-State: AC+VfDwRVI3GWtCtigaLZEQlcWUYtyKGKG+gPQGVtAZRT0LEBZynI71/
 +YA50MTZJvY/idm5L2PPNt6FAURxPfvKbDe8pNDA/yL9JOAh0h8W6T6WhpDyCNl38FYgXjf9snZ
 32HKQYFny/8q1hL3CbenKyNIM+V56
X-Received: by 2002:a5d:4b50:0:b0:2fb:703d:1915 with SMTP id
 w16-20020a5d4b50000000b002fb703d1915mr4104081wrs.43.1682694772850; 
 Fri, 28 Apr 2023 08:12:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6YdjOvC7WPDQ+9GUn7fvYiqZ4HGFmEtMgoi3hW034RMkk1O2I0swh4tQ23ze2AgO9qMYdW6w==
X-Received: by 2002:a5d:4b50:0:b0:2fb:703d:1915 with SMTP id
 w16-20020a5d4b50000000b002fb703d1915mr4104063wrs.43.1682694772545; 
 Fri, 28 Apr 2023 08:12:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0030490c8ccafsm9345789wri.52.2023.04.28.08.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 08:12:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 12/19] fbdev/vfb: Use struct fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-13-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-13-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 17:12:51 +0200
Message-ID: <87leicf3bg.fsf@minerva.mail-host-address-is-not-set>
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

