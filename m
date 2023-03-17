Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C056BE978
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 13:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6227D10E36F;
	Fri, 17 Mar 2023 12:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153E10E372
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679056762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+fL89ed1PZASQZ762ZUWhIklybGEq1juLUuiQ8ObUL8=;
 b=Y7Q/uUKs3Z+O4jpe71zl9g/zkLlwxjtd/7CREZFNWgNYWvZN7V54D6NWqXC+9edAeyBF85
 o38CWDh5byH0G2yWvFB2wbR90YinU8ot6yCOsfjPar+sLRT7e0cj2VP1UyRiwx2qf66vUd
 PluPK7gA9I/FzJH6KDssEuo2TxfWoSU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-hZWzHTaiPWSbKljngdMGLQ-1; Fri, 17 Mar 2023 08:39:20 -0400
X-MC-Unique: hZWzHTaiPWSbKljngdMGLQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso779844wrb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679056759;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fL89ed1PZASQZ762ZUWhIklybGEq1juLUuiQ8ObUL8=;
 b=kFa1VIzO8WFRAaV35dI3ax5ycVfHZB1BHSOACH81jSwozXL5OiYXo3UseK9CI2FxQV
 rBWa7qOZPAUAgKWZJKnM+g3W6rrNDcWqnX9D2DdcoaE6iGjprQNf7TWsvaQTS8rZ99RX
 TI/3FuqS67d2K8jvWbJIYj41vzhci1hUWNh0SxZsH4/vigBqDI22Dvl6RkPrT890VeyQ
 r5Srp/gZwChn2j5I6dfm1Bpn8/gyviFRIUZX4R9UzrE5SOrON6UZvhZl/49uI9FATmoq
 JCpOfBuC6aBlO1ed51SO9IScki47ab74jyanmnLXro7s2bfAfax9cZ4yKB0iC+mX8i54
 7OEw==
X-Gm-Message-State: AO0yUKUcO4axVV87V5LPwUU/dg37XS77t2oZiZ4q34VHw9ACpb1zTo0A
 ZHuUiTnWf2++UESLT0oOQO+NteQEDaUWl0J/sxD1Pru0cOfhWqxb+IzfelhehnvJyKEgmw56Jh2
 siXvr3j1osZiKfB5tr94s9yPQT7HO
X-Received: by 2002:a5d:6905:0:b0:2cf:e336:cb14 with SMTP id
 t5-20020a5d6905000000b002cfe336cb14mr2184567wru.10.1679056759214; 
 Fri, 17 Mar 2023 05:39:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set8hDaT7QXkMfJBila1yH3Rtcgjevuc8hD1fqgauwA43LpbmTExeheZNAaJmTKHzzvpkjwP2jQ==
X-Received: by 2002:a5d:6905:0:b0:2cf:e336:cb14 with SMTP id
 t5-20020a5d6905000000b002cfe336cb14mr2184552wru.10.1679056758890; 
 Fri, 17 Mar 2023 05:39:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k6-20020a05600c1c8600b003e209b45f6bsm8304554wms.29.2023.03.17.05.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 05:39:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: Re: [PATCH 5/6] drm/fb-helper: Consolidate
 CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
In-Reply-To: <20230315161442.27318-6-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-6-tzimmermann@suse.de>
Date: Fri, 17 Mar 2023 13:39:18 +0100
Message-ID: <87pm97pn61.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Consolidate all handling of CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM by
> making the module parameter optional in drm_fb_helper.c.
>
> Without the config option, modules can set smem_start in struct
> fb_info for internal usage, but not export if to userspace. The
> address can only be exported by enabling the option and setting
> the module parameter. Also update the comment.
>

I was going to ask at what point we could just get rid of this Kconfig
symbol since it already depends on EXPERT anyways so most distros will
not enable it.

But I looked then and noticed that it was added just a few years ago in
commit 4be9bd10e22d "(drm/fb_helper: Allow leaking fbdev smem_start"),
so it seems that people still need that :(

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

