Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7F27EE107
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056DD10E282;
	Thu, 16 Nov 2023 13:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D00E10E282
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700139882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5IVgqiEqoJ49lClny07bZ/gWmzQ0ruwNxmAm7UH1D8=;
 b=SkOFU3pimvwPPmyhkAnta7YRFC+Ny4jggLUOLeceqzfPWp7zPLfqSogY2AWE3AgAU6jCsJ
 dfuQtGqVM2JxFU3ga/ru1qfMzym42aqX1tnebWmGtRDX5xRJfoju9L4uaMRak4bJEw84s8
 IsBWS2cPIQIbBVUi6hC3G1IsyVUH3oo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-9Zvh9jEBObqIEUfzLyLqxg-1; Thu, 16 Nov 2023 08:04:41 -0500
X-MC-Unique: 9Zvh9jEBObqIEUfzLyLqxg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5082705f6dfso705440e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 05:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700139879; x=1700744679;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5IVgqiEqoJ49lClny07bZ/gWmzQ0ruwNxmAm7UH1D8=;
 b=dnVcfjuX8cUVh+rCN+0p57Olswf+aag2CKHc3oWDlCLK+ALKI2AG6AC/CiLjdfRf0s
 5/mTauLyznT/8qNNK+qIFoHHDzuePTFdiWsky+rkC51fL4G6h5kfKDi7X0zoc/sJgJJW
 idYezgDoWlvU7qGX1DymotB8zQSl3sU1UicOcQ0FwlrvHvdKvlc3sXTwQEP2Ad8Y5om0
 cUfZolnUJ1xdNUIe2tRfE+v5P9TMKhSuK3IZaXk4USGsX/hOTsqK8lzZn2u8FA01HC6i
 MJ2jFMg8L51dpzGiZtROz23aPgHFnD8F82Hw7ersKXx+Ip7Tk/K8Zd6UJKYZRcCkyX5e
 Wb4Q==
X-Gm-Message-State: AOJu0Ywp+bSRk2FYA3CmL2UI8C5Kbpi2/PE9fTfbpDwVzWBtIID1Pr2S
 teHZ9tJ/2y2wGLHtGJT+PJ98oXxGersloMAyzXM1udvW/zIQstCy86Hvx3UHNTErdIb8PyQhmZo
 KZdx9R01FXFn27JWdstM12oq+1FnO
X-Received: by 2002:ac2:5e7b:0:b0:509:4bb5:ff96 with SMTP id
 a27-20020ac25e7b000000b005094bb5ff96mr10215989lfr.59.1700139878990; 
 Thu, 16 Nov 2023 05:04:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELaHWoKPOZd1awvlQQBLF29JOnWe+UNE8/3EFkQX8H5SVGYJQjhbk8K1U5KZLOF8g7ZMrIXw==
X-Received: by 2002:ac2:5e7b:0:b0:509:4bb5:ff96 with SMTP id
 a27-20020ac25e7b000000b005094bb5ff96mr10215973lfr.59.1700139878694; 
 Thu, 16 Nov 2023 05:04:38 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b11-20020a05600010cb00b0032f9688ea48sm13604491wrx.10.2023.11.16.05.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 05:04:38 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 29/32] fbdev: Push pgprot_decrypted() into mmap
 implementations
In-Reply-To: <20231115102954.7102-30-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-30-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 14:04:37 +0100
Message-ID: <878r6x3l3u.fsf@minerva.mail-host-address-is-not-set>
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

> If a driver sets struct fb_ops.fb_mmap, the fbdev core automatically
> calls pgprot_decrypted(). But the default fb_mmap code doesn't handle
> pgprot_decrypted().
>
> Move the call to pgprot_decrypted() into each drivers' fb_mmap function.
> This only concerns fb_mmap functions for system and DMA memory. For
> I/O memory, which is the default case, nothing changes. The fb_mmap
> for I/O-memory can later be moved into a helper as well.
>
> DRM's fbdev emulation handles pgprot_decrypted() internally via the
> Prime helpers. Fbdev doesn't have to do anything in this case. In
> cases where DRM uses deferred I/O, this patch updates fb_mmap correctly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

