Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54F7AAC9A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 10:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C391810E038;
	Fri, 22 Sep 2023 08:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8975910E038
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695371343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xUT8FtJmdwXZ1XdzLxxJQDSF0F15AqqVAfggCoYwa/o=;
 b=JQjm1m5Y6NdPRz6o1+yrBAU9eudVCHhMq9LCtrhYC4kEIyOPB2ngin6g7Q1rSkuiUj6wXV
 JJBVMVDmoN0/qwDBLv8lF5mndDx8wylqRtTAOwCuOle9tXPaSZJIzdjNRXPqmK3PAzUJsj
 oruXWwnndZpEeO3LjQDJABQyWqGTM3o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-BgGW9C8rMcWQgPYywKsk1A-1; Fri, 22 Sep 2023 04:29:01 -0400
X-MC-Unique: BgGW9C8rMcWQgPYywKsk1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-404fa5c1d99so14493375e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 01:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695371340; x=1695976140;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xUT8FtJmdwXZ1XdzLxxJQDSF0F15AqqVAfggCoYwa/o=;
 b=oBrVOAfYyW5ZvkdcCuHVhlrhXeGrkC1MLFpJPoCCYXviN/IAK/W9qV5Ygl+rxQJBHx
 vXyGjHCwdqRQgkyj7h1nlhuIi+NueFB7pR2nuyE9YUDl+2t+fG55l6e+xRuXZb9ubzRp
 xJZmFkdKfimXE/uAxRxvrpP1ur5ApHyrc2IRYkqfEWlhdSNRDFFyvT6IypKnEFmFoaBF
 6A76Ov7OiZeMG2BU/A4ZB9UZwdvZb2jHQWxjy82S7PJuW1J5OfCBZEA29s13xchRwHM1
 C8w8t5rWMXBp60cW6mGbfQkXpzay8n9GXlbcRQmLg7A0riqkqkdIICrF3IWEOgieViS+
 KiWg==
X-Gm-Message-State: AOJu0YyiNNiWsvAmleDbNv6451Fl7L/8tHFH1X7Rn3Kp8kHquxZKwo7N
 thf63Y76UAsWTzDHeEZ97Go6O5/96/db2m2fcg7GxkJBQOVD9pxb0GxKqbBVx7HFzwkeFn0nAEh
 HBXg7JtS8Bdkc4f7AJNNi2MFPXVgR
X-Received: by 2002:a05:600c:1e0b:b0:405:4002:825a with SMTP id
 ay11-20020a05600c1e0b00b004054002825amr568128wmb.13.1695371340731; 
 Fri, 22 Sep 2023 01:29:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrR9BIVVw8Y2WgBOUvl/XqDvvu2Yb9s8zAvf4Vn3nfvNA1NNc3OCwyRPJ1UY+bCHomzJ5jcg==
X-Received: by 2002:a05:600c:1e0b:b0:405:4002:825a with SMTP id
 ay11-20020a05600c1e0b00b004054002825amr568100wmb.13.1695371340371; 
 Fri, 22 Sep 2023 01:29:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05600c21ce00b003fefcbe7fa8sm4004012wmj.28.2023.09.22.01.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 01:29:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
 deller@gmx.de
Subject: Re: [PATCH v5 2/5] fbdev: Replace fb_pgprotect() with
 pgprot_framebuffer()
In-Reply-To: <20230922080636.26762-3-tzimmermann@suse.de>
References: <20230922080636.26762-1-tzimmermann@suse.de>
 <20230922080636.26762-3-tzimmermann@suse.de>
Date: Fri, 22 Sep 2023 10:28:59 +0200
Message-ID: <87wmwik3w4.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align pgprot_framebuffer() with other pgprot_()
> functions.
>
> v4:
> 	* fix commit message (Christophe)
> v3:
> 	* rename fb_pgprotect() to pgprot_framebuffer() (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

