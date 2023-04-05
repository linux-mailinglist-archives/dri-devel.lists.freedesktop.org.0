Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 959396D7AF0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02EA10E8DB;
	Wed,  5 Apr 2023 11:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478B210E8DB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 11:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680693391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cVhwSQ9SQ80tLu7hzx0o6yiYsifY16dvvnSyg4DEcP8=;
 b=GKutgdmhGxm4yX6ZepRVPS3ml7yyVgI8ytlbPZacx7uTJAAqvAOvzpit3Rk+omDbe6wpRA
 xqF/5imtMCYYvNDOVqNQGWU6y/jXFe2FJGL342RRkWZp3ifQIR0K+1T5y1sM2IBsWug9xX
 qK+BBjMLzs/6wRQTkqUM0rA7AI0lIuE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460--rBYJEamPfqiSrik7_5Rvw-1; Wed, 05 Apr 2023 07:16:30 -0400
X-MC-Unique: -rBYJEamPfqiSrik7_5Rvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k1-20020a05600c1c8100b003ee6dbceb81so17390324wms.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 04:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680693389;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cVhwSQ9SQ80tLu7hzx0o6yiYsifY16dvvnSyg4DEcP8=;
 b=wYI+bxiIaBYnnbzxn4KvQxdOlOgJkCNCmTniRJrOrXmiSapminirlRrpgyuZ216xaX
 EYPpKHqrXWgsgAPjl+kEThn3k3JNnl60t7zPDXtPbGVgmD6PArq1cAJPv6gUvTv1Hdn7
 VfBxYg6sNlsPAkS+0OY5mhOK0zx2VYP1yLKMwwWhYXbfaSC/v1F8pEOgTDEHeHex+ET6
 roOqQ2H7u9SEOkzCCt8Zkx5Wgcoh+ahNtDBSoSvppkocnocFUJoJ428WxxoSPR/kPtQg
 55FgHq+6R08Wm0EJy+K+K4MIVh+meScU06ySfV0PMuZCWzWzBa6T+j2rOY+5mPMu2qPZ
 vpwA==
X-Gm-Message-State: AAQBX9eY5pI47N2yCeZEshkjbzoqRESmXZr6dQt0LhIhMAGRDEuKX/Bm
 c+JUyRPfueGZ4Nba3ZDnSgjhUxn7mjmCN/ZcDtjU+JvvsBkiwez36dV1ezBN8T6HpdPq6MNTDXd
 2/y8XZHtSLLv7JhRexroRaOjHEhxx
X-Received: by 2002:adf:f8c6:0:b0:2d8:708a:d84 with SMTP id
 f6-20020adff8c6000000b002d8708a0d84mr3524525wrq.19.1680693389138; 
 Wed, 05 Apr 2023 04:16:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjUjPzTzVRFYcucN8Al2yk8a7Ppzptzj7S8evPnSYBWVMJvgO9TesyCLFRwV+Xz4Gy5pag2A==
X-Received: by 2002:adf:f8c6:0:b0:2d8:708a:d84 with SMTP id
 f6-20020adff8c6000000b002d8708a0d84mr3524513wrq.19.1680693388798; 
 Wed, 05 Apr 2023 04:16:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b13-20020adff24d000000b002c573778432sm14624766wrp.102.2023.04.05.04.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:16:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
In-Reply-To: <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
Date: Wed, 05 Apr 2023 13:16:27 +0200
Message-ID: <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>
> Your comment says that it calls a PCI function to clean up to vgacon. 
> That comment explains what is happening, not why. And how the PCI and 
> vgacon code work together is non-obvious.
>
> Again, here's my proposal for gma500:
>
> // call this from psb_pci_probe()
> int gma_remove_conflicting_framebuffers(struct pci_dev *pdev, const
> 					struct drm_driver *req_driver)
> {
> 	resource_size_t base = 0;
> 	resource_size_t size = (resource_size_t)-1;
> 	const char *name = req_driver->name;
> 	int ret;
>
> 	/*
> 	 * We cannot yet easily find the framebuffer's location in
> 	 * memory. So remove all framebuffers here.
> 	 *
> 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then
> 	 *       we might be able to read the framebuffer range from the
> 	 *       device.
> 	 */
> 	ret = aperture_remove_conflicting_devices(base, size, name);
> 	if (ret)
> 		return ret;
>
> 	/*
> 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> 	 * otherwise the vga fbdev driver falls over.
> 	 */
> 	ret = vga_remove_vgacon(pdev);
> 	if (ret)
> 		return ret;
>
> 	return 0;
> }
>

If this is enough I agree that is much more easier code to understand.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

