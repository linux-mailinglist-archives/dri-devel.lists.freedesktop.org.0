Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8578E6EE56E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990E310E7A2;
	Tue, 25 Apr 2023 16:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C0510E778
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682439356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=47bgQGNaAeyNGSWS0q1PeP54wI3Fkx9tJmtH4n0GuFg=;
 b=ZC/H8+8s7SR8gVGwFMTK7EpN4M2kfd3V+p9fAhG+TOVPlKs28BUASIHKXEICxt/Lbszd3X
 CHO9lVaBqjDMsvs4C3r3fkAmcoOdOnBPbG+I6wu7jFRgm0O8JtYlnEsdNX/92f4cOmdhxP
 f6xr2P5WGMR9Nah0cOavUg872jFCqo0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-5CkoNI45Mu6D8lK45dcuPg-1; Tue, 25 Apr 2023 12:15:54 -0400
X-MC-Unique: 5CkoNI45Mu6D8lK45dcuPg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f16f50aeb5so22974325e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682439353; x=1685031353;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=47bgQGNaAeyNGSWS0q1PeP54wI3Fkx9tJmtH4n0GuFg=;
 b=bZNtXFQA81LxVPOfeU3pEgzCx7EvM7Dl9noCpyP2+mP1ih5+6U4fnbDNGPIFOjF5q4
 MI8mXoAAli7E5i6/oYz9MgA8NIEqCOKg0OhV8NZNUHnhf2/1QaVFLTNHxuZmsGZl9mm7
 GM0gM/wkARx07gbs7y66tI8lBPISHdPPHNPg3cHKDKLyH2qoqMkUhi7c2/OMMioFG1GL
 PJ54OYx20QT1KprWI2MsQkyDViQUbBJHvji/DpwQsNO3NG2hnC93eiEqp4CjDYo+6mwe
 kufdNs4Ez89aYTIRLs5HbTA3FjbMInsrXcJmNokQHiE7Hx+pXkusaTXfgZIS+dLvrAAS
 +gDg==
X-Gm-Message-State: AAQBX9cdRUVsJ9aiEtoZwdtWc49KZukheRvlEiaLzoX/wZnzMJSTwoRr
 +2foT8fH5gtLL26gkHMmh8Hgot8j6Rl909LN6HLUvEl8l1SMP6R86uPLCUhYDewQn0gAvwkC93R
 cnZlc+ZhM+5KL1oe+lA3t0/PXCtSK
X-Received: by 2002:a7b:cbd9:0:b0:3f1:952c:3c70 with SMTP id
 n25-20020a7bcbd9000000b003f1952c3c70mr9182245wmi.40.1682439353131; 
 Tue, 25 Apr 2023 09:15:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350adQEgL49wdb4ewQxdOYjifakCtfNmKUN8mm6DOnvjtC92yIJd9uc8+68p+F4VuT8mXExb5Qg==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:952c:3c70 with SMTP id
 n25-20020a7bcbd9000000b003f1952c3c70mr9182227wmi.40.1682439352792; 
 Tue, 25 Apr 2023 09:15:52 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c35c300b003f1836c98b7sm16560874wmq.48.2023.04.25.09.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:15:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH 1/6] fbdev: Return number of bytes read or written
In-Reply-To: <20230425142846.730-2-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-2-tzimmermann@suse.de>
Date: Tue, 25 Apr 2023 18:15:51 +0200
Message-ID: <87cz3shr9k.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Always return the number of bytes read or written within the
> framebuffer. Only return an errno code if framebuffer memory
> was not touched. This is the semantics required by POSIX and
> makes fb_read() and fb_write() compatible with IGT tests. [1]
>
> This bug has been fixed for fb_write() long ago by
> commit 6a2a88668e90 ("[PATCH] fbdev: Fix return error of
> fb_write"). The code in fb_read() and the corresponding fb_sys_()
> helpers was forgotten.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/fbdev.c # 1
> ---

The patch looks good to me and indeed the correct semantics AFAICT.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

