Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C626226DB76
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 14:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74B76E101;
	Thu, 17 Sep 2020 12:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB86E101
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:26:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k15so1845193wrn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=776kE571jxALYsOg06ejCyM2zHb/SfLHRc5/m8v10ss=;
 b=IVQpQa30jthrbYlgwDGmu0dc3mjMkTqbdMKMaSnRvLnHMKlNvHBoPDQ8r760u+SVPm
 59vgHhoVxmVxKNvGKFX9QbbbOEpWzNWMXSHfbRt/bDygT1XUo/rI/mTP8lwcUxWU928G
 cOYIpmnvb7A0tsT+gMKdSIF7Iz7lnU7Ky2wTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=776kE571jxALYsOg06ejCyM2zHb/SfLHRc5/m8v10ss=;
 b=KBEhUPMFKHXRmgU5x3E9H9BA0ucUpAcdf57IomVy5yUDyo9BPGfIo/iSxdewlrTpgx
 tcVWkLxfQzshzNgtUwijATOVBnV3Gmzrv4/4YLs5KqhYCCrWOZrIKbGuOwXEpYbyfka3
 wTPTmrgbZWX4Zsoe5nm+QBchetmrHGZO61udkvM6OpqlTg9s70OcDDb+C7fp2solYBLi
 uIe+F5GIZWEWRsT0x5dmGnqQgaTqW3sBvQ1kpDvhYLdV+I68vLEF05Iv3baZ8pv9hZbt
 RuiVsfaZswvzIV89HBwDxxx9q1L666V04WCTtRUcBazttl6VRaunbNwCZWCpHOO6VeNJ
 gDlA==
X-Gm-Message-State: AOAM5302Xg4sv1BGUljlvPIpCUGmL1xwl2q+3NpZH7i8Ois8yd3MSNVb
 OYkUHE/y2K2CxMKYOqnuo4OtvA==
X-Google-Smtp-Source: ABdhPJxsVUfr3DZLp2Gh7FRSChhAJlPPexeSjbdhob6/sk140ihZIXopzA3J7Zp+4xfpjlTSOU6Fyg==
X-Received: by 2002:a5d:4a49:: with SMTP id v9mr34943739wrs.153.1600345599608; 
 Thu, 17 Sep 2020 05:26:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u186sm10458866wmu.34.2020.09.17.05.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 05:26:38 -0700 (PDT)
Date: Thu, 17 Sep 2020 14:26:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917122636.GW438822@phenom.ffwll.local>
Mail-Followup-To: christian.koenig@amd.com, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
 <CAKMK7uFdwrT3HACPh3ADAKvhXJ-Hf3dExZmgJVAQ1KKjSai_0w@mail.gmail.com>
 <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Linux MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 02:24:29PM +0200, Christian K=F6nig wrote:
> Am 17.09.20 um 14:18 schrieb Jason Gunthorpe:
> > On Thu, Sep 17, 2020 at 02:03:48PM +0200, Christian K=F6nig wrote:
> > > Am 17.09.20 um 13:31 schrieb Jason Gunthorpe:
> > > > On Thu, Sep 17, 2020 at 10:09:12AM +0200, Daniel Vetter wrote:
> > > > =

> > > > > Yeah, but it doesn't work when forwarding from the drm chardev to=
 the
> > > > > dma-buf on the importer side, since you'd need a ton of different
> > > > > address spaces. And you still rely on the core code picking up yo=
ur
> > > > > pgoff mangling, which feels about as risky to me as the vma file
> > > > > pointer wrangling - if it's not consistently applied the reverse =
map
> > > > > is toast and unmap_mapping_range doesn't work correctly for our n=
eeds.
> > > > I would think the pgoff has to be translated at the same time the
> > > > vm->vm_file is changed?
> > > > =

> > > > The owner of the dma_buf should have one virtual address space and =
FD,
> > > > all its dma bufs should be linked to it, and all pgoffs translated =
to
> > > > that space.
> > > Yeah, that is exactly like amdgpu is doing it.
> > > =

> > > Going to document that somehow when I'm done with TTM cleanups.
> > BTW, while people are looking at this, is there a way to go from a VMA
> > to a dma_buf that owns it?
> =

> Only a driver specific one.
> =

> For TTM drivers vma->vm_private_data points to the buffer object. Not sure
> about the drivers using GEM only.

For gem drivers (which includes the ones using vram helpers, which uses
ttm internally) that points at the drm_gem_object pointer. I guess that
might be something we can unify a bit on the ttm mmap paths of the
remaining driver, now that there's a drm_gem_object embedded anyway.
-Daniel

> =

> Why are you asking?
> =

> Regards,
> Christian.
> =

> > =

> > Jason
> > _______________________________________________
> > Linaro-mm-sig mailing list
> > Linaro-mm-sig@lists.linaro.org
> > https://lists.linaro.org/mailman/listinfo/linaro-mm-sig
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
