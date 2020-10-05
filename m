Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4672028473C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C503E6E416;
	Tue,  6 Oct 2020 07:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB2789AB6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 18:37:07 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id y198so6752683qka.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 11:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u3J6AKxubCllq2Ls7jrnfIH9wJzGGs2W2keKyCoQZ+g=;
 b=eN0A5e22fGI+9D7L6SnBKQWwDKTGT6A2sP8lBv5ySLpbcmf3PfBbHF2iMutUZFpPlh
 w3htf6sVN26BUBiEQwMJl/9SKhV9wenSbaw0Ngblhz/K+BWlCmn4PDdP71seEGgKDhJn
 EI05euYmWOHnzyl0KxDqo544jd74Rcgi6WhiyS+2C4ZGYV3/oydMjKLmzfnF7Key+1Xw
 Ma93hb6+RGildfaRFvy5Y2VJL2Rc7rtFtIO56w2vrpHgDx7Atids/vghgSE0VBGyimgQ
 uvvUuJzw4EU0nPQywaCcIxKzFxDpSAFENlo/i0BFbsFA+61tMShgDjlQrWvTN2JFip4Q
 P6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u3J6AKxubCllq2Ls7jrnfIH9wJzGGs2W2keKyCoQZ+g=;
 b=iDbkRgVNmFZuB+R3Qid2RgYyTO011i6wO0PfQpoFwnfXCCTl5+abQHsZewc+daaZ4S
 Dyo3EvR9/caaaMY5ltMNzMKwf0tmJU42TnIx8N82QouolvOQ3wgcBlKw+2ovfHOh93du
 jWcAV2EV/llDxYl5Rr4nvbFKRZlYKlYoQiskYrMJNdbe7zI3X9PrEvgE6OWAlf2PhNrv
 Xls5F2EqWeXRLy5w4FdwN8p4MRdwoMuykbBGAgBDRlM4iIyu7IX95vKrhsIXNoakgQ1u
 SMIdQkDUMNv5LkHnrYfshtAUUu7c4gugG0M7gwNyJPClFzcX2Di9itn0hPlzmZ0fxODJ
 CcNg==
X-Gm-Message-State: AOAM532dHQNgK/i7/cb2qH9I2zNBASUZjmXcF2eB4nOFsM7W8BUfk6gu
 T2e19Fp+7NY3iwbtKUyq3oRc1A==
X-Google-Smtp-Source: ABdhPJyiYyJ6QGbYxkNE1y766DNr8LNQurJWOP4L2+ndFQuLZsD7R3NQL8Vs0Mi8tA3m1+v8usWh/w==
X-Received: by 2002:a05:620a:1266:: with SMTP id
 b6mr1396650qkl.371.1601923026236; 
 Mon, 05 Oct 2020 11:37:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id d21sm387410qtp.97.2020.10.05.11.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 11:37:05 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPVM8-0008jm-C7; Mon, 05 Oct 2020 15:37:04 -0300
Date: Mon, 5 Oct 2020 15:37:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005183704.GC5177@ziepe.ca>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <20201004125059.GP9916@ziepe.ca>
 <CAKMK7uF0AfuYGsHzKXhF=k-mAW=Wx_APf9fY9M9ormnwypoxZA@mail.gmail.com>
 <20201005172854.GA5177@ziepe.ca>
 <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFzxWF7V=7vkeNC-8shsPZRgdz9fYTsn0ayENv2BpnFEg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, John Hubbard <jhubbard@nvidia.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 05, 2020 at 08:16:33PM +0200, Daniel Vetter wrote:

> > kvm is some similar hack added for P2P DMA, see commit
> > add6a0cd1c5ba51b201e1361b05a5df817083618. It might be protected by notifiers..
> 
> Yeah my thinking is that kvm (and I think also vfio, also seems to
> have mmu notifier nearby) are ok because of the mmu notiifer. Assuming
> that one works correctly.

vfio doesn't have a notifier, Alex was looking to add a vfio private
scheme in the vma->private_data:

https://lore.kernel.org/kvm/159017449210.18853.15037950701494323009.stgit@gimli.home/

Guess it never happened.

> > So, the answer really is that s390 and media need fixing, and this API
> > should go away (or become kvm specific)
> 
> I'm still not clear how you want fo fix this, since your vma->dma_buf
> idea is kinda a decade long plan and so just not going to happen:

Well, it doesn't mean we have to change every part of dma_buf to
participate in this. Just the bits media cares about. Or maybe it is
some higher level varient on top of dma_buf.

Or don't use dma_buf for this, add a new object that just provides
refcounts and P2P DMA connection for IO pfn ranges..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
