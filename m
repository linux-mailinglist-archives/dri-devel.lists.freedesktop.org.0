Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F32026EE5DE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0F410E78D;
	Tue, 25 Apr 2023 16:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC99E10E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682440564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlOgM/8RxDeZnqZ/gTRy5yhr/nqixhxpPSszW3G2Gb4=;
 b=C+8qKN9pq6Nf3sFsbkvQ0qG8fSKGoB7H7ZdqKgjM1yxSsStSNg84Lp5pOPXgOnrkh2CF/4
 66PHBUkvf6PmRSwvnfIGZtbVUFIAI+TFgB6Qy39gBdP5BOERmXh1glPJ2+UyGMNImNqmsF
 Oq2ZRVFeIfjIlajIShZiQccNYnrEFYE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-ZPICT1fBMmqj4BqgdeTfEQ-1; Tue, 25 Apr 2023 12:36:02 -0400
X-MC-Unique: ZPICT1fBMmqj4BqgdeTfEQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f065208a64so34937095e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682440560; x=1685032560;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qlOgM/8RxDeZnqZ/gTRy5yhr/nqixhxpPSszW3G2Gb4=;
 b=iImcaLJ/H5zB2gxPkSExbV6qpwOhrnTwvfDTwzseCKoCkJsBdw45o/VrWR7WSqi47G
 l+PGxPeBJR7S+tCe8IL/HhMP2j9lR6RR0SBV2nOqK//xalB2+1f4pxslAf2aMUakajkL
 4YVl/imSgpZVRsu1Z0nTwgiym4FM7g25+wb3qT9sJXXBVX4Qe8Ngj6bxP9VCBZzcR8zU
 fwA93waKjS1Fe9ExvIafrbhmHf9UoGaeArbTr7VCtFMyCj4nHB00ZcTBrxePwCPyeIot
 1xe+riTYir2zMKypp5EBsOgTv/5Uc/0GPpDdyiTWFu4EDWs/ly/IgUhra9OjsCRogMlb
 Fiuw==
X-Gm-Message-State: AAQBX9ePJISRnfIX+QYDdeDTR92T7ba0U9PSTJnhvOlOVFDMgdmzLjzb
 cYxpoaGqu49ylttluqGzod4dl631F5LAHlOXwfczr5JNVV7YqI75/BMEhSEUEx70GFSZL81eNVm
 rrKV531VCA6E29ymezREWmmNDRiTl
X-Received: by 2002:a7b:cd88:0:b0:3f2:48dc:5e02 with SMTP id
 y8-20020a7bcd88000000b003f248dc5e02mr5905405wmj.27.1682440560771; 
 Tue, 25 Apr 2023 09:36:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZarFNWyULU3TGqyTbs5AXJzHTA2jvJ02WhL98OC157wbJAwpXkEfhLfRIOLGtkAkghY0ysZA==
X-Received: by 2002:a7b:cd88:0:b0:3f2:48dc:5e02 with SMTP id
 y8-20020a7bcd88000000b003f248dc5e02mr5905389wmj.27.1682440560453; 
 Tue, 25 Apr 2023 09:36:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003f17a00c214sm15336779wmi.16.2023.04.25.09.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:36:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH 2/6] fbdev: Use screen_buffer in fb_sys_{read,write}()
In-Reply-To: <20230425142846.730-3-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-3-tzimmermann@suse.de>
Date: Tue, 25 Apr 2023 18:35:54 +0200
Message-ID: <87a5yvj4wl.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use info->screen_buffer when reading and writing framebuffers in
> system memory. It's the correct pointer for this address space.
>

Maybe can expand the explanation a little bit with something like this?

"The struct fb_info has a union to store the framebuffer memory. This can
either be info->screen_base if the framebuffer is stored in I/O memory,
or info->screen_buffer if the framebuffer is stored in system memory.

Since the fb_sys_{read,write}() functions operate on the latter address
space, it is wrong to use .screen_base and .screen_buffer must be used
instead. This also get rids of all the casting needed due not using the
correct data type."

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

