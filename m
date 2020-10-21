Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9438929591D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A4A6F3EA;
	Thu, 22 Oct 2020 07:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84E6EEAF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:20:24 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p88so3652791qtd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b4cfx4QZgYz15NDTJwDbByQvqvRvpDxc8U181kXRfhk=;
 b=CZio0pvjUOAZVmGpPYnoIJZ3k0VTIRDxHgnxsmYuQhsz2jEdpX7JlzXAa5B1lHI4hj
 1dkeZm3vsuYQ0+al/4Q5F2/2IuJErhNsTuza+Audcu3R6UagNTTPFO2TOlLXvivwU2k/
 TKA9JSMlFjnoXG+A2LL1MAujxpBHcxjoID0aD31L+i9KzL1iVOVlTBMfml1ncQpAA1Ef
 K50QmLDH8932V/fZEd6cOcCwLbIUGXgj3Ry86gAn7SRneMoAL4zkD8ulKknh501sjbP8
 vU0trDw7S+JXN+4tdtkGwNszgrrA7N4l+RnFY0GZRBBOKZJ2H2dSIxQhc+QJQE2SJt1m
 cPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b4cfx4QZgYz15NDTJwDbByQvqvRvpDxc8U181kXRfhk=;
 b=ffuHZg8h/vs6yJF5TRUuoxVOJ5zr2qYTuz52ca7MIJhspBmR0W967GFlGsgMvg75Sp
 DatmKPEbOTfue0SEYn5EjF7cNrVr7Lpz2mOp3c+FINAMs/SHp/ZB8IufZd4IbbfSdwRU
 XiIKmpr4mIJWssd289V9nnEfg9dkBplrd8g6zmjjmJFFPdoxN+TZYC62AC/IeXtQ1jlh
 2EZ8TsAhZOunWVf0UyvPdzGPlVQhQ+eaQeWwao6RP6bFPTZpQ2nKOEni/gRKEZAGpz/m
 LRW/8ZalgcqH8rxFDyRKiJQAIIrjN9k7yEmnuyt/I0jHa5UDIb+nbb3tSGqWZs2dHz0C
 kJ+w==
X-Gm-Message-State: AOAM5302lCUxZJ5ibTge/OAmBbXg+UDghKbiEDAOfjlZgkN8TsJyBjHQ
 ohkui4wJ3nsuxYv+9fhFjQdpPA==
X-Google-Smtp-Source: ABdhPJylFppbCqYnSmCDnE4ueYGv0xNZzmWfiqeCGK69SNIht11gj1i8NPwvoXi//7kIPj5qPGxCVQ==
X-Received: by 2002:ac8:1c39:: with SMTP id a54mr5530504qtk.344.1603322423832; 
 Wed, 21 Oct 2020 16:20:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id n63sm2410770qka.45.2020.10.21.16.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 16:20:23 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kVNP4-003k7m-9M; Wed, 21 Oct 2020 20:20:22 -0300
Date: Wed, 21 Oct 2020 20:20:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201021232022.GN36674@ziepe.ca>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca>
 <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
 <20201021163702.GM36674@ziepe.ca>
 <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
 Daniel Vetter <daniel.vetter@ffwll.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 09:24:08PM +0200, Daniel Vetter wrote:
> On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
> >
> > > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > > split that. So ideally ->mmap would never set up any ptes.
> >
> > /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
> >
> > pgoff doesn't get touched for MAP_SHARED either, so there are other
> > users that could work like this - eg anyone mmaping IO memory is
> > probably OK.
> 
> I was more generally thinking for io_remap_pfn_users because of the
> mkwrite use-case we might have in fbdev emulation in drm.

You have a use case for MAP_PRIVATE and io_remap_pfn_range()??

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
