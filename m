Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2E30FCE4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336306EE3E;
	Thu,  4 Feb 2021 19:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D126E0EA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 16:13:41 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id es14so1959349qvb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 08:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AdINSrul0jxHoqpecjG/aK/AQPWXH0qinrJ7WDX/N1E=;
 b=LSpoU7cl9e2rbcOscAQCUF5oo82hFT76e1i/LCG7AK7ECCAQQyhw5yG5tM37foZKsk
 H54Jh5ed4262z7S8K+Sptq1JkJPJoqxQmTOvQrwnjbdRWfOb1qbiqGIMobiXg9XRukBF
 JNTNGWrj9ckaMtxW6dImW//QrCA1WpDxrnQ8+IoSnw07yPeyv38VA+yd7sGGG9dZFTNN
 1Dy8eV4djxhKz1j3aBgk6C5V1NuaDTpQ5nAzfMs3SbP8ldp1/2jR3k21+bR71zJJxaXP
 fwfWgNUuVcGDr5IoKRshNfCDMqs8vBVQ26IzhS+zw+VJgua7i/+PhXG/Fw8WQ/2lrfpD
 m92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AdINSrul0jxHoqpecjG/aK/AQPWXH0qinrJ7WDX/N1E=;
 b=Nq6rQscbaFoWs2C2e/uUnx/izFSlHpi+UMRJXfcZSG2JE5gKRM2XTlvM8wtwAyKDtv
 jC6R5tv50VA5jcuqYBPVLAJlfzVHPMU5Hk+Se3sEf4K0uTqcl76oBQVUBnHnD9wJ+7IX
 Uj3V5BHSR0jRCZTC1ECNWHVFS3slsbuND7ecE0tuce76FzI6PuCgC2vk358zWx1xQbfq
 1Kk6o6djlWkAne/5I6jlc2+AbuQtsX+/Uc2OhUFX2lDmk2FDAUDhJs2r2h58fxyn3v8p
 OFcugzPXFczTY+4nMAEBF+U5XUQ0B6B02qeHnrrrc3qrB8bdR1mXKxbADCcsELb0AOXr
 A82g==
X-Gm-Message-State: AOAM532NnOtnK4FkqXPejvivLv7vRUgw8kPh3X/zSYmZAU8sIl7rwzqW
 NU85BXK1WK9x+Uww5iNh9tNJVg==
X-Google-Smtp-Source: ABdhPJxBWYsGlh0GFUj59qT9H98NmLKj9wdXTx1MMs/HM8XRMtGVSw+252D9rCVYiNi7Je0P31XC2w==
X-Received: by 2002:a0c:e442:: with SMTP id d2mr6605975qvm.43.1612455220609;
 Thu, 04 Feb 2021 08:13:40 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id x74sm5226993qkb.55.2021.02.04.08.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:13:40 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l7hGF-003Un7-HK; Thu, 04 Feb 2021 12:13:39 -0400
Date: Thu, 4 Feb 2021 12:13:39 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Message-ID: <20210204161339.GX4718@ziepe.ca>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 04 Feb 2021 19:34:32 +0000
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 10:19:48PM +0100, Daniel Vetter wrote:
> tldr; DMA buffers aren't normal memory, expecting that you can use
> them like that (like calling get_user_pages works, or that they're
> accounting like any other normal memory) cannot be guaranteed.
> 
> Since some userspace only runs on integrated devices, where all
> buffers are actually all resident system memory, there's a huge
> temptation to assume that a struct page is always present and useable
> like for any more pagecache backed mmap. This has the potential to
> result in a uapi nightmare.
> 
> To stop this gap require that DMA buffer mmaps are VM_SPECIAL, which
> blocks get_user_pages and all the other struct page based
> infrastructure for everyone. In spirit this is the uapi counterpart to
> the kernel-internal CONFIG_DMABUF_DEBUG.

Fast gup needs the special flag set on the PTE as well.. Feels weird
to have a special VMA without also having special PTEs?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
