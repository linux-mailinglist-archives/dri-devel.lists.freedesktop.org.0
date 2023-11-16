Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F98E7EDED7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5AF10E5BB;
	Thu, 16 Nov 2023 10:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D79110E5BB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700131706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rw/Y06vMJw+yRqzRy2b73TtPoc6ulI8+aEjabQdVw8=;
 b=g3sp+MELYW0Fcw+qlg6RHsoBoxu5qIPBvu+V/E6PfaqmdpEGML8HgOMJolYjRA3X5Buj1C
 9jTiRsayaNIb1HZofS12UYn2tZqaaR53h2orYcDUZ3SqlAGBN6D5NpxpXfdDkxu3qLw+rM
 nQ/3X1q+hN/+kSyw9BkimDPLf7c55Fw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-6p_7mClhMY-UKRmcoJza1A-1; Thu, 16 Nov 2023 05:48:25 -0500
X-MC-Unique: 6p_7mClhMY-UKRmcoJza1A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-408f9cee5e8so3528695e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700131684; x=1700736484;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5rw/Y06vMJw+yRqzRy2b73TtPoc6ulI8+aEjabQdVw8=;
 b=WO43wclcB57qSyUBcVdpyjZpDWMiLRsrf+dRW4EZl/hydUhOjmzwPNUg/q8U/l/b4s
 fHU0ZqzuRWP46tX4W+g+5m+6NOarr/sympyVqcAVb6S8EDUbaaIYGPcd2cNHJ59hRpDy
 by0YLzmiSmNukSbdLwtNuFrsLwHYOgS7S2jiz6PmIRk6p7SIsyc0lcc0IBzk/RhJ8j2Q
 ECdkNcCpxWc2TqZkB/YRqSIxupbMBP/ByjQuM7StRbJwQB5nzR9gclQU2v8d8jVwmn0z
 KccrF90yT0haFMGYvnqnNeeZ0cu5n6sQHwuO8RQifyDb+w7Q6HK3Xsd/274GRV/xOF8h
 GaNg==
X-Gm-Message-State: AOJu0Yyp0h51w2RJPXaHqLxylJTBerGWAb20o8KyRCXxtH/96JE5HnLH
 g6InOD+W4IjihfZVHW3/6yHuSDULOZLMrYgW2WQtl9/HGF9KRl/H5K9/X15PYDMfq0zwDPqDwEz
 XbrLDE3O8r3drk5ASekaDDdWholF7w32xoUHV
X-Received: by 2002:adf:a310:0:b0:32f:c3d0:89db with SMTP id
 c16-20020adfa310000000b0032fc3d089dbmr9434877wrb.27.1700131684006; 
 Thu, 16 Nov 2023 02:48:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzSwHObq9d2iGtBdyJvnvCw1ejJvbv41YXOcU6exTztiExEie1pplMm3wL0yTYDrysaHHJBw==
X-Received: by 2002:adf:a310:0:b0:32f:c3d0:89db with SMTP id
 c16-20020adfa310000000b0032fc3d089dbmr9434865wrb.27.1700131683682; 
 Thu, 16 Nov 2023 02:48:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e2-20020adfa442000000b0032f7eaa6e43sm13345872wra.79.2023.11.16.02.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:48:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 17/32] fbdev/au1200fb: Initialize fb_ops with fbdev macros
In-Reply-To: <20231115102954.7102-18-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-18-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:48:02 +0100
Message-ID: <877cmi3rfh.fsf@minerva.mail-host-address-is-not-set>
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

> Initialize the instance of struct fb_ops with fbdev initializer
> macros for framebuffers in DMA-able virtual address space. Set the
> read/write, draw and mmap callbacks to the correct implementation
> and avoid implicit defaults. Also select the necessary helpers in
> Kconfig.
>
> Fbdev drivers sometimes rely on the callbacks being NULL for a
> default I/O-memory-based implementation to be invoked; hence
> requiring the I/O helpers to be built in any case. Setting all
> callbacks in all drivers explicitly will allow to make the I/O
> helpers optional. This benefits systems that do not use these
> functions.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

