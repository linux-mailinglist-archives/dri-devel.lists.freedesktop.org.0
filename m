Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241E289FCA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313B36EEA4;
	Sat, 10 Oct 2020 10:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FED46ED76
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 18:01:48 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id 13so5157222qvc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JtTniNbWimQFTlPWxNfhtRJTUnIfWE2pIrRn0nLquTU=;
 b=f/szaRC+vLdnDgqFvq8AOddrp6VSsc5+VOKHgdN1Blfz+Kdocq0LgJzoYOwFNRhbsb
 R58LfaQQ3n9+kujlpK+dXsyPtLR7PpkdHaoMjpLP5dFUu9uKpYtIgwUv2SzANG3wJ4HI
 uZ2jIrHb3l+wKyafHdJPZ5UpeQcq4bXudJq3VH1qWYsmCJKZjK3dkCknvRMRvHtmwEaJ
 +C7ytvDBDqqX8xISydsOLSJIZQl1e2A9hJato/1mUA5uyCKy3VQWCdd1nWlOILZ9XItf
 xtRqWEAdtlSCbEhxBM5pVhNugecQkdco1xNKTq95myZ76QxSJibw5Xyqk8ww4uW9rkwK
 T0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JtTniNbWimQFTlPWxNfhtRJTUnIfWE2pIrRn0nLquTU=;
 b=T8PZSzM/7YpelikDDHK+EjDN/Lyqe1V2E25cCrlZyipb3n15WOalb3nhhrmFOZHo0m
 6/kAzsDAqq6bx0y1jqozYlEOAzw7JI3siu+L8+7+GA6uN+DYBhVHJVGMlHFi1EUddmef
 ov23xs2BUnTnGP5Rh3D7MLTMjU82VIxsivcmljeVICDdt1BU+GGSBewCZP28CTq05sIt
 Mdb7mmYmMba9kJDvDksP1aJO/MccqnpzeYfNx6rOjRAkZWj9VAGQpwmxduiNZ2a6o9Xe
 yYNwuzqIurfGmBsHLrnG4ESKc7u4Rwz+7acwxiSOzLmU4X2eSn9HgqxYbY6vMfX9/kgx
 5h7g==
X-Gm-Message-State: AOAM5312rYmFaA9fWNqJx1+goxf7UPcAQvgHuFZvA/mmynIFVHxe64jR
 I1V/C1IL0F/GpR/8u6BAHJVY5A==
X-Google-Smtp-Source: ABdhPJwGH8DcAarR0OMfhGw63SRnoeGEeh/DF4k79ebCsxHoTPcqFkl2Atp6g4SjeQTYysb9k3E+GQ==
X-Received: by 2002:ad4:52c6:: with SMTP id p6mr12553168qvs.38.1602266507532; 
 Fri, 09 Oct 2020 11:01:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 68sm6690974qkg.108.2020.10.09.11.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 11:01:46 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQwi9-002b28-P5; Fri, 09 Oct 2020 15:01:45 -0300
Date: Fri, 9 Oct 2020 15:01:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201009180145.GB5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan> <20201009124850.GP5177@ziepe.ca>
 <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 07:52:05PM +0200, Daniel Vetter wrote:

> > > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > > flag that it would be denying the core mm code to set __GFP_MOVABLE.
> >
> > We can't tell from the VMA these kinds of details..
> >
> > It has to go the other direction, evey mmap that might be used as a
> > userptr here has to be found and the VMA specially created to allow
> > its use. At least that is a kernel only change, but will need people
> > with the HW to do this work.
> 
> I think the only reasonable way to keep this working is:
> - add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);
> - add dma-buf export support to fbdev and v4l
> - roll this out everywhere we still need it.

It seems to me there is a technical way forward to restore user
compat, so it is really no different than RDMA/DRM pain we both
suffered before.

Thus no justification to NAK it. If media wants things to keep working
they have to do the technical path like you outline above.

> Realistically this just isn't going to happen. 

If your series goes ahead it will get solved. Someone will take on the
huge project to either add DMA buf to the drivers people still care
about, or do the work above to transparently handle in kernel.

If we allow things to keep working without consequence then nobody
will do it.

The only reason we did the 4 years of work in RDMA was because Linus
went in and broke the uABI for a security fix. It was hundreds of
patches to fix it, so I don't have much sympathy for "it is too hard"
here.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
