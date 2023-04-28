Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AC6F1B3A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 17:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525BC10E3C8;
	Fri, 28 Apr 2023 15:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FBB10E3C8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 15:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682694830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CtuyV//oUjSwLm+8sbTRXQA1ElJkX8KhmdItyI9uBhU=;
 b=JhNCpmkwCv1r563qNNcXg8+0h8NFejpIzaN5mQKn0cKzCC5dtqTlgkebN+5D5XOtHbGdge
 dnYm0k0hWdKHycskE/WVm8u3kqmPmocnGuXR3EtRcnp4bG17eTaEYUSLmEZotPAXVUxVIV
 oLXZnqdLUESFSYpt4jnxI3fNl9ZFCNI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-MUQHXOzwO3WEWZp9ilyR_Q-1; Fri, 28 Apr 2023 11:13:44 -0400
X-MC-Unique: MUQHXOzwO3WEWZp9ilyR_Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f8b5e23d23so6060096f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 08:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682694810; x=1685286810;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CtuyV//oUjSwLm+8sbTRXQA1ElJkX8KhmdItyI9uBhU=;
 b=YmW+2Y66XFf4xggIMopXprumP4ZkpRpVbseAiTS4Lu5wVztkE1Lu5h4o5il5Qmpf4O
 0DC0pXFw1yRCW7XQrl992VCRhtcXlgsiki6DVLZIMIUuj4Uh4Q5qZiynNU+k7uumN3VD
 OHbJlbZgyVdMWqFglaLysvFDs12fgBMYtZI1cS3XDZ6xIVot31Nndr7FIEC49wVX8tQh
 8//e/cq1fullFggdycxeZblZ6O8bHAIbWBcF5tNG4DPwEQQ/2efOcFu7R+cer8HpEVvq
 dXVFDm9zX4RkOzYTIaL6hmPaXtAVEUwH8xVH4c73XWNU3+Wq8cBJHORk0OH1XsTZgc0I
 Gjjg==
X-Gm-Message-State: AC+VfDwjDbTe+4xz0IP46JFRSRcU4/rSTo9xaUqe0PerPCKlfTZa1R/9
 4IFoDpFXNR+tPn7VxERIvqiqF0KdFf+DVQAbO7w6te68K+G5Z0VR6ObGmvRa4VnIhrnlEF1xyGi
 txzSSpCId/4Ox7FczQdlvmHATTLGU
X-Received: by 2002:adf:ead0:0:b0:2f8:24f7:cc4a with SMTP id
 o16-20020adfead0000000b002f824f7cc4amr4133291wrn.57.1682694810231; 
 Fri, 28 Apr 2023 08:13:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67wwp6HF/HWcvyhUopIWNpcf97IrzpNeWwcGIERxbIXZRLrRielx1u31rlCkwTnYtHxiDZOA==
X-Received: by 2002:adf:ead0:0:b0:2f8:24f7:cc4a with SMTP id
 o16-20020adfead0000000b002f824f7cc4amr4133269wrn.57.1682694809932; 
 Fri, 28 Apr 2023 08:13:29 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p10-20020a1c544a000000b003f03d483966sm28021876wmi.44.2023.04.28.08.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 08:13:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH v2 13/19] fbdev/xen-fbfront: Use struct
 fb_info.screen_buffer
In-Reply-To: <20230428122452.4856-14-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-14-tzimmermann@suse.de>
Date: Fri, 28 Apr 2023 17:13:28 +0200
Message-ID: <87ildgf3af.fsf@minerva.mail-host-address-is-not-set>
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
> .screen_base and .screen_buffer must be used instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

