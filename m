Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3112AAE00
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78389781;
	Sun,  8 Nov 2020 22:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F9A6EA8E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 12:48:36 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j31so608385qtb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 04:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dT/suzaNkB3c7S+yaEZ14QPSLd3HnsKmQIxsHBswjYA=;
 b=JQfd8wBzk3V/4qXEdChqsDgUtvZ9OKF+td8b1EK2NBfvWYsVkmasAbBjZntX0rqdM7
 kltSlTy7iYIKPt9IXRVkNOzCqztDLU3CCuod/463qdFzfh+B9ljPI0ygOB5fhiyEHM8I
 MKC8x+s3iSxQt/7BvRoL428wDYhJ0DwKlSkrpAbOCQrDhwVEz9g2i0PhsEWR6+YrPysA
 iTmcGO9vmhbxWYrm5owaMABbQAQDQcsu/dw2Gc9ZKXHlsSav2bubgXgmbCPe7DCa50ZI
 JY33QQaidF0F98ieqItIn7AvgmG/zwo8zOLCgaCbavga7Jxg2VzeZUdiZy2P7E6+vJiy
 uc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dT/suzaNkB3c7S+yaEZ14QPSLd3HnsKmQIxsHBswjYA=;
 b=V/lg0sCu0zJ1oOCER9JQRBJfpdyYix+HdyDNYHFR4P//f85dkj02zC7akn7sHcy84k
 FNy+kKqAlE5NQe77Y5VKBfEVIvcYNe+bqbCghV7NR4Rm660qFnXkbgFV3XpDbS9UkGPc
 nUpRLMWWGjUzpFAIQlOFSZKoLA7fceQPeMtBZ+W1vi9XoOjeVLDiDVXw+BzjrjLGKlE3
 eZ/8YKzYO3Itt0Vbyj++XvxMVtUHVv8jmCUCdHDcMCdUzHKJU04+tmBQ+Th6mtaqfATE
 jRZcHL8JiZ3CllWaJsgslfjJITSoCpyB5pqYq4vBOJ1lcfkAFP//fKpV3VeVtNxtFYbr
 A64g==
X-Gm-Message-State: AOAM533aU2n/7p8rYXE8XXFj9f7VAmHLTdKXSxwmFD72pnPmFz7NQfxJ
 AiU/NbCM35FP5ifzLYInMkLhBw==
X-Google-Smtp-Source: ABdhPJxdLSvL+7ucIJuva+yEGO+hLgE5wOg7ZB6/6wXGjHV/nF9UoGM01M2i1Of2FF8JKh/+nxYYaw==
X-Received: by 2002:ac8:7408:: with SMTP id p8mr1223264qtq.320.1604666915029; 
 Fri, 06 Nov 2020 04:48:35 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x26sm402691qki.108.2020.11.06.04.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 04:48:34 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kb1AP-000lO1-8C; Fri, 06 Nov 2020 08:48:33 -0400
Date: Fri, 6 Nov 2020 08:48:33 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v8 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201106124833.GN36674@ziepe.ca>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-5-git-send-email-jianxin.xiong@intel.com>
 <20201106002515.GM36674@ziepe.ca>
 <MW3PR11MB45556A1524ABE605698B9A8EE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45556A1524ABE605698B9A8EE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 01:11:38AM +0000, Xiong, Jianxin wrote:
> > On Thu, Nov 05, 2020 at 02:48:08PM -0800, Jianxin Xiong wrote:
> > > @@ -966,7 +969,10 @@ static struct mlx5_ib_mr *alloc_mr_from_cache(struct ib_pd *pd,
> > >  	struct mlx5_ib_mr *mr;
> > >  	unsigned int page_size;
> > >
> > > -	page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> > > +	if (umem->is_dmabuf)
> > > +		page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);
> > 
> > You said the sgl is not set here, why doesn't this crash? It is certainly wrong to call this function without a SGL.
> 
> The sgl is NULL, and nmap is 0. The 'for_each_sg' loop is just skipped and won't crash.

Just wire this to 4k it is clearer than calling some no-op pgsz


> > > +	if (!mr->cache_ent) {
> > > +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> > > +		WARN_ON(mr->descs);
> > > +	}
> > > +}
> > 
> > I would expect this to call ib_umem_dmabuf_unmap_pages() ?
> > 
> > Who calls it on the dereg path?
> > 
> > This looks quite strange to me, it calls ib_umem_dmabuf_unmap_pages() only from the invalidate callback?
> 
> It is also called from ib_umem_dmabuf_release(). 

Hmm, that is no how the other APIs work, the unmap should be paired
with the map in the caller, and the sequence for destroy should be

 invalidate
 unmap
 destroy_mkey
 release_umem

I have another series coming that makes the other three destroy flows
much closer to that ideal.

> > I feel uneasy how this seems to assume everything works sanely, we can have parallel page faults so pagefault_dmabuf_mr() can be called
> > multiple times after an invalidation, and it doesn't protect itself against calling ib_umem_dmabuf_map_pages() twice.
> > 
> > Perhaps the umem code should keep track of the current map state and exit if there is already a sgl. NULL or not NULL sgl would do and
> > seems quite reasonable.
> 
> Ib_umem_dmabuf_map() already checks the sgl and will do nothing if it is already set.

How? What I see in patch 1 is an unconditonal call to
dma_buf_map_attachment() ?

> > > +		if (is_dmabuf_mr(mr))
> > > +			return pagefault_dmabuf_mr(mr, umem_dmabuf, user_va,
> > > +						   bcnt, bytes_mapped, flags);
> > 
> > But this doesn't care about user_va or bcnt it just triggers the whole thing to be remapped, so why calculate it?
> 
> The range check is still needed, in order to catch application
> errors of using incorrect address or count in verbs command. Passing
> the values further in is to allow pagefault_dmabuf_mr to generate
> return value and set bytes_mapped in a way consistent with the page
> fault handler chain.

The HW validates the range. The range check in the ODP case is to
protect against a HW bug that would cause the kernel to
malfunction. For dmabuf you don't need to do it

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
