Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837557CD656
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 10:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B9510E3BF;
	Wed, 18 Oct 2023 08:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D7E10E3C2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 08:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697617549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LjzSocfdAfDkrBURoH/UDEiTk7o5qnArVSGlXdT8TDY=;
 b=bQuvNXI6+3KknQTlh68CBJP/J53FerbWJHv63ghxCHov5h+MHcmgkCATXYIR3FRPwOOTfA
 GXRDQBr1EEVgAmSqIO0nBkeQo359ivjhlyR+Q843wM93/mBHb30mq6WSaFy5XN8b5y9lf1
 CwvaBN4Pdmdt6Ke5ynVSvX327F6qNj0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-yw48DBBrMKuNdqRKJ--n6g-1; Wed, 18 Oct 2023 04:25:45 -0400
X-MC-Unique: yw48DBBrMKuNdqRKJ--n6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32cbe54ee03so3934777f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 01:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697617544; x=1698222344;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LjzSocfdAfDkrBURoH/UDEiTk7o5qnArVSGlXdT8TDY=;
 b=mmNgQOEbJkQR2LHWk7PuG52tG1e4+rZk8v76+8SLZNXEbxSmlks0VsLe4uMkzGdCbe
 JOgZZe8DUrxibDU2WaMQrQ6UYIta+BPlEoyn3x5Qcc4nrOpOblAxOmrjFeZ1h+gHDHbW
 wUSvTE1r/HMM4AdWk1UUE7p9/CL6nKQPIEwxmsS6o8jwSVexwVuoR3+OOuMYK3u6/pf/
 F+IuWMGnxd8Dmj86tDr9WO0YowfWfwPDqNuFXhhlpJ4TYuaFQ6bRd00KzHxB4i4j/0LO
 e8mjYwaicjyR6JyelzQHX4t2PNZN/poYxwzvA/fs+O/njgzwFAQ3H7W7goRSt2FgHTH+
 QYQQ==
X-Gm-Message-State: AOJu0YzCFKx8ILxSlZuzV8GkbaD1e5llkuRdwUL46SEKyi/qYjsGaT8L
 UhaXRmDy4LAtatT1eGFLAGTG8UzL5/ownsFD3KRu9MrNMhhMPMJcD2BM+dz2rS/Kyb/oUNYHJGZ
 hylIRPy7LSk+2SpsKwC8vDVrmCvsu
X-Received: by 2002:a5d:4c89:0:b0:32d:8094:f4c8 with SMTP id
 z9-20020a5d4c89000000b0032d8094f4c8mr3650285wrs.19.1697617544652; 
 Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4Q8xItiTztaLFOsH4D6hLMKERtw9q396FzIJnVUMQIU6RTlte1VKHlDSYg+C3e5HZRfxSQ==
X-Received: by 2002:a5d:4c89:0:b0:32d:8094:f4c8 with SMTP id
 z9-20020a5d4c89000000b0032d8094f4c8mr3650275wrs.19.1697617544348; 
 Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
Received: from localhost (210.red-80-36-22.staticip.rima-tde.net.
 [80.36.22.210]) by smtp.gmail.com with ESMTPSA id
 j14-20020adfea4e000000b0032d81837433sm1584752wrn.30.2023.10.18.01.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 01:25:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 sam@ravnborg.org, arnd@arndb.de, daniel@ffwll.ch
Subject: Re: [PATCH 00/46] fbdev: Init fb_ops with helpers for I/O memory
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
Date: Wed, 18 Oct 2023 10:25:43 +0200
Message-ID: <877cnkqquw.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Initialize struct fb_ops for drivers for hardware with framebuffers
> in I/O-memory ranges with the respective helper macros. Also select
> the appropriate Kconfig dependencies.
>
> The patchset is part of a larger effort to modularize the fbdev core
> and make it more adaptable. Most of these drivers do not initialize
> the fb_read, fb_write and fb_mmap callbacks in fb_ops. By leaving the
> callback pointers to NULL, they rely on the fbdev core to invoke the
> I/O-memory helpers by default. This default makes it impossible to
> remove the I/O-memory helpers on systems that don't need them. Setting
> the pointers explicitly will allow for the removal of the default. If
> a callback in fb_ops is unset, the operation will then be unsupported.
>
> Initializing struct fb_ops via helpers macros will also allow for a
> fine-grained setup, depending on Kconfig options. For example, it
> will be possible to leave out file I/O if FB_DEVICE has not been
> set.
>
> This patchset contains the majority of fbdev driver work. The updated
> drivers now initialize fb_ops with __FB_DEFAULT_IOMEM_OPS_RDWR,
> __FB_DEFAULT_IOMEM_OPS_DRAW and/or __FB_DEFAULT_IOMEM_OPS_MMAP if
> possible. Some drivers now use FB_DEFAULT_IOMEM_OPS, which sets all
> fields correctly. In Kconfig, each driver selects FB_IOMEM_FOPS to
> get the helpers for I/O memory. Drivers that use _RDWR, _DRAW and
> _MMAP unconditionally select FB_IOMEM_HELPERS, which selects the
> correct modules automatically.
>

I looked to all the driver changes as well and couldn't spot any issues.
For all the driver patches:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

