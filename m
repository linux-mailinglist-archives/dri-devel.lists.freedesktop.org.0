Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1B39774D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 17:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1483B6EA89;
	Tue,  1 Jun 2021 15:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0388C6EA89
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 15:56:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id n4so14915845wrw.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aAtwxqrqeijlf2M2X8kgrQgOccPhdI2lOlR9pbzOewQ=;
 b=QLQAOAF2IJF5CHmDyAYFY5+gGkmemjTg7N0WhwIV3sMyWCgHiZjwy8s28i6XuselQ6
 pKASFpwuqOW471je21TFNlgXQP/KQGhLFYZeJhERtOBCiLGcbtUVYe7/CgXRQma6/HRG
 9iMW4r6t6hxSzGv+fNOSWAn5I+NhrGZI8MaLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aAtwxqrqeijlf2M2X8kgrQgOccPhdI2lOlR9pbzOewQ=;
 b=hHsI3/c4m6VK7eGc3kPdJrxwKO82rSxUiqokLB9J2QTzS4mAfmpDzR88U1UzCQ0pPN
 cNTvqOglnYX8HxQ8wghOt+40fezAMt9GxZCKFw4g/gXW2I+vtGBdolKW3D0epJry7old
 uxU2gN2UAowYOOo/vTAmFbT6OJlzuCez7kYWsEdmBocWHNlF8R8xkqwW/sQhE3BUUWgh
 vGFdjGtQ9PWF92bb2uVxi8KsIEuj4VS5MX68SskhTAuxtSirPlaHyApZOBUKg/cY/fNZ
 DagA2eViaNT9tKpSd5bf0D+NUNWL7p55kQE0/niWhj1Z/IKfr84fCRS8w6382gd7/kAy
 9Tdw==
X-Gm-Message-State: AOAM533ELas2AjnnLctzbZN+eETtqDLETgNk0pRxhZtyU2WaqKKb/rbP
 zBl4X/y5En5b/ld/rGp7SbktcQ==
X-Google-Smtp-Source: ABdhPJy49tMCCInGJP7GP3SGaXH0YGlvBk/A+8F1udwePpZYJqJZBaxcHxoaqVUOSLOpZTlDgHLBog==
X-Received: by 2002:adf:e307:: with SMTP id b7mr29332300wrj.325.1622563002735; 
 Tue, 01 Jun 2021 08:56:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a77sm17132037wmd.14.2021.06.01.08.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:56:42 -0700 (PDT)
Date: Tue, 1 Jun 2021 17:56:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Huacai Chen <chenhuacai@loongson.cn>, Greg KH <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] vgaarb: Call vga_arb_device_init() after PCI enumeration
Message-ID: <YLZYuM6SepbeLcI7@phenom.ffwll.local>
References: <20210528082607.2015145-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528082607.2015145-1-chenhuacai@loongson.cn>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, Xuefeng Li <lixuefeng@loongson.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 04:26:07PM +0800, Huacai Chen wrote:
> We should call vga_arb_device_init() after PCI enumeration, otherwise it
> may fail to select the default VGA device. Since vga_arb_device_init()
> and PCI enumeration function (i.e., pcibios_init() or acpi_init()) are
> both wrapped by subsys_initcall(), their sequence is not assured. So, we
> use subsys_initcall_sync() instead of subsys_initcall() to wrap vga_arb_
> device_init().
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Is there a bug report for this? Should we mark this cc: stable?

Also adding Bjorn/Greg since I have no idea whether this is the right fix.
It does do what it says on the tin, but that's maybe not the best approach
here.
-Daniel

> ---
>  drivers/gpu/vga/vgaarb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
> index 5180c5687ee5..4b8a62af34cf 100644
> --- a/drivers/gpu/vga/vgaarb.c
> +++ b/drivers/gpu/vga/vgaarb.c
> @@ -1564,4 +1564,4 @@ static int __init vga_arb_device_init(void)
>  	pr_info("loaded\n");
>  	return rc;
>  }
> -subsys_initcall(vga_arb_device_init);
> +subsys_initcall_sync(vga_arb_device_init);
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
