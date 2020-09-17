Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67426DD8D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56736EC35;
	Thu, 17 Sep 2020 14:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7D96E94B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:31:13 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f142so1750099qke.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nZ4b46gqz9ZMj0oSIJhPTVW/Re5tOMNlNB8GqNDw+ps=;
 b=e9KgBjbTETq6hYc5oIxWtFuYQ1SoFGsGWxA4kvhtekqf6V6CMOH9pXjfTbuISASPWo
 4bZVeYOehOgOJ0u5bY/YPUtEgF4XQ19vKp8V/0m/N+sT6mdaGe9qVo9Gk0v4qi3fFJBN
 X0VFFFaoBVE1uVC0GdBYcfidqaVtx/8FIVkJLSOxg2eoJAkBgMswVryFqbAy2jhDn0Zm
 fimV1f+uedJRyrixr5wV3m+byauc/VMYGq6ivkwH0zO3SoZxBRNiWufSKrH3LcQiqEiP
 33anbnVMCvQ5wFzEuBZcN7VD9OgD57QNEm4Y1vFAatti5FabHopW0XlrAe28+0EdKa45
 YASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nZ4b46gqz9ZMj0oSIJhPTVW/Re5tOMNlNB8GqNDw+ps=;
 b=jSr265lja3OAT1MrzHAmQABF4kgWeBD6Fk1S8VIUM3apClMoQ7CxmFCXfMFxh9Pqww
 6jTlM5/klL6LP1u0n81tGKAQc1bYz9eOC0lUMF4MH1DgGxIX1/UrfTHnd3BXl3FYC2Nm
 XuF7dO4PR4LY/e3dIyHf4CoYUvrS77qRfPUvAWphh3O3o/JGQcWreahHQzbt8SeW68aQ
 dBzJqv+9n5It/cebogkA91UnHUQuNLFcbO15EDucN30X1BRpdtsmZwg6T50RnrlSl7Bo
 +cToXRvE22DGFOPS0mzl3Rw4IY3vXf8zldA1QCWQ9YyvdHKAhU6F7gUk+Y7Zl4AmYEcC
 MJTw==
X-Gm-Message-State: AOAM532Ued20MdDc6U7PIE1bTrxoJ9NkTta0pkYV4JGm20uaS/eXUri3
 I9Iu8uG/mqhmKJZ5/UC/C2kp1w==
X-Google-Smtp-Source: ABdhPJw56svcIeAcnROGFmKsbmVXol3TtQXkSVG9MOLdgGF5odtIzCjySvHoBe12rG9qsPWph3HcsA==
X-Received: by 2002:a37:814:: with SMTP id 20mr27843480qki.142.1600342272474; 
 Thu, 17 Sep 2020 04:31:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id y73sm21206411qkb.23.2020.09.17.04.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:31:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kIs86-000Q7S-Qt; Thu, 17 Sep 2020 08:31:10 -0300
Date: Thu, 17 Sep 2020 08:31:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917113110.GE8409@ziepe.ca>
References: <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
 <20200916140710.GA8409@ziepe.ca>
 <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:

> Yeah, but it doesn't work when forwarding from the drm chardev to the
> dma-buf on the importer side, since you'd need a ton of different
> address spaces. And you still rely on the core code picking up your
> pgoff mangling, which feels about as risky to me as the vma file
> pointer wrangling - if it's not consistently applied the reverse map
> is toast and unmap_mapping_range doesn't work correctly for our needs.

I would think the pgoff has to be translated at the same time the
vm->vm_file is changed?

The owner of the dma_buf should have one virtual address space and FD,
all its dma bufs should be linked to it, and all pgoffs translated to
that space.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
