Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB1284A6A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 12:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8E86E42E;
	Tue,  6 Oct 2020 10:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB836E455
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 10:41:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d4so2385391wmd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 03:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppdxET2PA0gOKIN5kGGdI9KhczoNu7DgS5stoBevgQE=;
 b=V9XsMoIGLC/zsM/kB8TOxJcs8Wrjs8fplUDZpxD92KTCEB9eoX1HguQq42evSkJ7AV
 0KeRvG+PIbroLnhtt9D9K1B1lDy7QPScKp3kzisQomTGD6k1N6er6Davt9ehntA0gMIu
 DIViALks5h9F35p6DpaRdqeZ6gdNUqgwAoWT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ppdxET2PA0gOKIN5kGGdI9KhczoNu7DgS5stoBevgQE=;
 b=TwLxVlkAhGWhYdQOdwKQOCXWbuUGlyhgI1ngPvhsCMjP8EugxjMiIKYDvTOZAdH62T
 MXUxjwRv5pkNNHE2vB+/B8srkO7XmutOS3YOJoMCKmFFyKmPbIeP4FFXiQIms0tZozdq
 Uy+tmFc7IqDp8vCv9uwDStuon/srJkvL+QScNT87El96iTil4dUhzaOgaIhxwIX96nz3
 ijsAvVRaiQQAp3FGoFGv1jTeFCX2q4JIWyGLVeK0LysLCGqsNAMp0MYid4DOfyClfrqb
 WkkH8bQwHY/q4xptgqLsxjf4n9XS1M3d+6WGekSJRLhKHvjRT5uv6wHtAJuO5ar+4QOs
 V/kg==
X-Gm-Message-State: AOAM53286bmMvo18DdOdba+RPOOC76eteFFaFrE9qjGch4pka/ucF9Ad
 QKpPDmPBiyO8d5uJHkZeEj3PKA==
X-Google-Smtp-Source: ABdhPJxmO06kzG4QQ1I3HEy61YhwUV447sv+LJYvQUMAmYEWxdffDW/wKWdF9BfEUBoKO6E7SGa0Tg==
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr4261579wmb.142.1601980885754; 
 Tue, 06 Oct 2020 03:41:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g83sm3384495wmf.15.2020.10.06.03.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 03:41:24 -0700 (PDT)
Date: Tue, 6 Oct 2020 12:41:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH rdma-next v5 0/4] Dynamicaly allocate SG table from the
 pages
Message-ID: <20201006104122.GA438822@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Doug Ledford <dledford@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maor Gottlieb <maorg@nvidia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
References: <20201004154340.1080481-1-leon@kernel.org>
 <20201005235650.GA89159@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005235650.GA89159@nvidia.com>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Maor Gottlieb <maorg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 08:56:50PM -0300, Jason Gunthorpe wrote:
> On Sun, Oct 04, 2020 at 06:43:36PM +0300, Leon Romanovsky wrote:
> > This series extends __sg_alloc_table_from_pages to allow chaining of
> > new pages to already initialized SG table.
> > 
> > This allows for the drivers to utilize the optimization of merging contiguous
> > pages without a need to pre allocate all the pages and hold them in
> > a very large temporary buffer prior to the call to SG table initialization.
> > 
> > The second patch changes the Infiniband driver to use the new API. It
> > removes duplicate functionality from the code and benefits the
> > optimization of allocating dynamic SG table from pages.
> > 
> > In huge pages system of 2MB page size, without this change, the SG table
> > would contain x512 SG entries.
> > E.g. for 100GB memory registration:
> > 
> >              Number of entries      Size
> >     Before        26214400          600.0MB
> >     After            51200            1.2MB
> > 
> > Thanks
> > 
> > Maor Gottlieb (2):
> >   lib/scatterlist: Add support in dynamic allocation of SG table from
> >     pages
> >   RDMA/umem: Move to allocate SG table from pages
> > 
> > Tvrtko Ursulin (2):
> >   tools/testing/scatterlist: Rejuvenate bit-rotten test
> >   tools/testing/scatterlist: Show errors in human readable form
> 
> This looks OK, I'm going to send it into linux-next on the hmm tree
> for awhile to see if anything gets broken. If there is more
> remarks/tags/etc please continue

An idea that just crossed my mind: A pin_user_pages_sgt might be useful
for both rdma and drm, since this would avoid the possible huge interim
struct pages array for thp pages. Or anything else that could be coalesced
down into a single sg entry.

Not sure it's worth it, but would at least give a slightly neater
interface I think.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
