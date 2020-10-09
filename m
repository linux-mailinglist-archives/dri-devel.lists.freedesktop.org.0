Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA1289FC2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9043D6EE92;
	Sat, 10 Oct 2020 10:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628186ECCC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 12:21:13 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id c5so7729168qtw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 05:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GEBFnNzCc2Aa+VvpaaWfqgqAphuQOGzaQHxTmQfOeXI=;
 b=dRexUDY3H8MczQ4QLPjINl81RcewsEJoOwrcRnS/wdN6+1ahY+3vJqHFQSRB3AKEat
 Z5ZaXXZPosq4Wbd2jnV/U3qSyNEiSVNzFD8cJAswQl5FTJES+qJJJxPuS2/N1xstVsKE
 DmLKmIoNq1PULtGkiX9+m6e1iqZaCGoeY5Z+TbjwSmpmk3vladKQnD3eC3IjfehfAuWk
 OAoO3ZuMd+rz9DNMaLq4YRdS5/enCBHoI5KrUmpa+3FN6vqOFl+XYKf3xsXAEqCHUZGe
 a3qzy4AHPVKLKT9jFp2Z0TSDspqDK1w0Z9U5mPCKkR2TBx/oNoqCaY/YIuclFEo3wtty
 CzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GEBFnNzCc2Aa+VvpaaWfqgqAphuQOGzaQHxTmQfOeXI=;
 b=rnwTWrJQHEntf8Vm8CCJiRMBosBIFxq/D3U1+bC+dNjRJAqhqSnXPDPM9U/Wqv9uSl
 dT6smXaQN8V234zmB0RxUsxDHqdeGPmc5SD1JYUD+23OGUskbHaNXKVFuE0S4sLLAwYl
 Ojx7xFIQqvAZFJ9O2/h3rqQ3eCIUNnVM2+OOIgx0Pqljrn2u2fOQlIx31E3aIgJpBjKz
 lRQOxxRL9X8ac1Tqt5/FIvVbQEpAfGkPIDeQWCV3LrWS2fgXVQhxrkB1i7Ne3lOSwGTb
 ODtz6dblUStaV/W+eTUVc6ExaWqW6/8l4y/sJay8EDkHBDEDZes0N0Z6LR+iWhNMmLjI
 Ddiw==
X-Gm-Message-State: AOAM5335Z5RhIwbkKneO6YHg1Ym3MD+iNpTtA6qG2sBe9SldCnYZuxbf
 Z0YCtwCM9okJAODlmmlAD2HvJA==
X-Google-Smtp-Source: ABdhPJxabis31V1ruCjg81xS+awnWmlIxScXs/iSYcl2LZthnsEHjAadouQof92mVKkzbF3fOMDQng==
X-Received: by 2002:ac8:1910:: with SMTP id t16mr12554428qtj.351.1602246072505; 
 Fri, 09 Oct 2020 05:21:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x7sm3318061qkc.24.2020.10.09.05.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 05:21:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQrOZ-001xjJ-2z; Fri, 09 Oct 2020 09:21:11 -0300
Date: Fri, 9 Oct 2020 09:21:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201009122111.GN5177@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009123421.67a80d72@coco.lan>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 12:34:21PM +0200, Mauro Carvalho Chehab wrote:
> Hi,
> 
> Em Fri,  9 Oct 2020 09:59:26 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
> 
> > Way back it was a reasonable assumptions that iomem mappings never
> > change the pfn range they point at. But this has changed:
> > 
> > - gpu drivers dynamically manage their memory nowadays, invalidating
> > ptes with unmap_mapping_range when buffers get moved
> > 
> > - contiguous dma allocations have moved from dedicated carvetouts to
> > cma regions. This means if we miss the unmap the pfn might contain
> > pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> > 
> > - even /dev/mem now invalidates mappings when the kernel requests that
> > iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
> > ("/dev/mem: Revoke mappings when a driver claims the region")
> > 
> > Accessing pfns obtained from ptes without holding all the locks is
> > therefore no longer a good idea.
> > 
> > Unfortunately there's some users where this is not fixable (like v4l
> > userptr of iomem mappings) or involves a pile of work (vfio type1
> > iommu). For now annotate these as unsafe and splat appropriately.
> > 
> > This patch adds an unsafe_follow_pfn, which later patches will then
> > roll out to all appropriate places.
> 
> NACK, as this breaks an existing userspace API on media.

It doesn't break it. You get a big warning the thing is broken and it
keeps working.

We can't leave such a huge security hole open - it impacts other
subsystems, distros need to be able to run in a secure mode.

> While I agree that using the userptr on media is something that
> new drivers may not support, as DMABUF is a better way of
> handling it, changing this for existing ones is a big no, 
> as it may break usersapace.

media community needs to work to fix this, not pretend it is OK to
keep going as-is.

Dealing with security issues is the one case where an uABI break might
be acceptable.

If you want to NAK it then you need to come up with the work to do
something here correctly that will support the old drivers without the
kernel taint.

Unfortunately making things uncomfortable for the subsystem is the big
hammer the core kernel needs to use to actually get this security work
done by those responsible.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
