Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C0188719
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F6D6E150;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED5F89D40
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:56:21 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id m2so8694472qvu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 05:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9afDjhZOSyJUHdf1GkVOxnQKnlyCaNPiE4Hy3XHDSEs=;
 b=bCMGba0BzNqcZVGrUScR5wOIQdfIMNMh+BS9C/6fqIBz5nk0TM7qUVTwELz0nIVulu
 1AHU6ziIdLeUPbQmfDJiZe/LPOnZ6Rb1ggGHNQHCGy4QRD3nLhatQmGOuY4ITpZKRP9l
 FpSNVZxEnPpiq1I+RoP8x4T0aCI2IeE6CxEIA5yAgylAydxVHRnZeX33BtAMHWSUv9FZ
 cnsZRAx9FtXra5OfQ5fXNx6mec2VIjDhStLpIsXeS4MqLtPVqzlYSMxe2FkBvhRz5iWJ
 UI6J/+5Ogq87iPM2RVJZi0DfCrHtLmiD9H3ZTVP31/72FFHLDtZyELRonIfX5eOMf/WF
 kSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9afDjhZOSyJUHdf1GkVOxnQKnlyCaNPiE4Hy3XHDSEs=;
 b=VN/Gg8uibCdxNpsce+epoVOCyiGE+eEbMRileRg0CsJgLiN83suVKBZPXl0j6W+bJq
 d5V6Rsr10VcJ3/qPuOVjl897zSOy1leSlgNuW/qn7iOHUMrxL4Q+TH60q9FvK4ScE+/z
 x8q6Ui1188Zv+YRZruvAJ+PwP4xNyxeITIvyWfLqjSKtk7kLs3nuSRv8sxJhaPPL2jap
 q92cwUK5BLCc0REIpx6FsMdom5pus2ZSQLliOidPbZ6HMpkGGQLODqxyN0luEcJXJ3mX
 ezQfZjbCe826PNt20y0Yy8PBkE+bnN8B177ICVey5WxTjUq2dmBjyKqKBXm83HA3Hk2C
 /qGw==
X-Gm-Message-State: ANhLgQ3Ac4IY1PvgaUJQkdV6T4rRdqpVggmTWDOCJSp0Lxp3c1hA6RaX
 BzlXXqeJlIjR9d6DFzcmhzOHTg==
X-Google-Smtp-Source: ADFU+vtUduROMwqOJJyWfZqPAANVdbItSWyPg2bF11scOuNemFeQ0dw4lzjtAU2ST+aV6YNENmxwdw==
X-Received: by 2002:a0c:b203:: with SMTP id x3mr24403145qvd.197.1584363380456; 
 Mon, 16 Mar 2020 05:56:20 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 82sm19477339qkd.62.2020.03.16.05.56.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 05:56:19 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDpI3-0003yQ-BR; Mon, 16 Mar 2020 09:56:19 -0300
Date: Mon, 16 Mar 2020 09:56:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 3/8] mm/hmm: do not call hmm_vma_walk_hole() while
 holding a spinlock
Message-ID: <20200316125619.GD20941@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-4-jgg@ziepe.ca>
 <20200316090503.GC12439@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316090503.GC12439@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 10:05:03AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 11, 2020 at 03:35:01PM -0300, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> > 
> > This eventually calls into handle_mm_fault() which is a sleeping function.
> > Release the lock first.
> > 
> > hmm_vma_walk_hole() does not touch the contents of the PUD, so it does not
> > need the lock.
> 
> So how did this manage to not be noticed before?

I'm still struggling a bit with how this PUD stuff works.. However
AFAICT:

1) The first hunk around pud_none() is actualy covering a race. In the
   non-race case the page walker will directly call
   hmm_vma_walk_hole() for pud_none so it would be very hard to hit
   this

2) I'm not 100% sure, but I think pud_present() == pud_none(), as
   there is no swap entry for PUD I don't know what a non-present
   but non-none entry is or how to create one. This is possibly dead
   code due to #1

3) To hit hmm_range_need_fault() requesting fault you would need
   a read-only huge PUD and a fault requesting write. I suspect
   creating a read only huge PUD entry is very rare - not something
   someone would deliberately construct.

4) To even trigger the PUD flow at all you need the 1G THP or the
   special 1G DAX pages which I strongly suspect people are not
   testing with.

> The fix looks fine assuming we want something backportable before
> starting the cleanups:

I found it easier to make the other cleanup patches make sense if they
didn't introduce all kinds of new logic too..

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
