Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE474D0011
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88A610E3D0;
	Mon,  7 Mar 2022 13:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B4A10E39E;
 Mon,  7 Mar 2022 13:30:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44EE0611A6;
 Mon,  7 Mar 2022 13:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00802C340E9;
 Mon,  7 Mar 2022 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646659816;
 bh=oBLz9AgNUk2wIEBHGy6U9s99emBLztMRAodnUzUj5w8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sFCk7udNm2J44RTzfUJ+MfPwopHSW/nmauJl4OmAbMfrWN2sP0SwIOWXTFvBG7ITK
 ZckklcNFLR5z7x04rHy7YPPgl/p5kkHiqVMVYe26/xj40ZZ/jSJS6b2bBHs4cT+qlg
 lSryt84BjNDG2rf9ETJvTM0G+a+p4bQl/Xod+mFKXtsAk8t/TDHR0+xtUPhy5OHE2n
 RV7OiySPImo+g4q9DZSj1HLZYgcZTUZlg7l86k4mMgBlrwGy8WT95FerjuTQ/xJ2ij
 Fs2tnxaydRH2XVd9fVLVS75/YXpyxiD2u+Dk0fyp2LN6w5OcLV76rEDlCEotG1qXaU
 ODeQnJrvkkvkg==
Date: Mon, 7 Mar 2022 15:29:35 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RFC 0/3] MAP_POPULATE for device memory
Message-ID: <YiYIv9guOgClLKT8@iki.fi>
References: <20220306053211.135762-1-jarkko@kernel.org>
 <YiSb7tsUEBRGS+HA@casper.infradead.org>
 <YiW4yurDXSifTYUt@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiW4yurDXSifTYUt@infradead.org>
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
Cc: Michal Hocko <mhocko@suse.com>, zhangyiru <zhangyiru3@huawei.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-unionfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, codalist@coda.cs.cmu.edu,
 Matthew Auld <matthew.auld@intel.com>, Vasily Averin <vvs@virtuozzo.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, G@iki.fi, linux-mips@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 06, 2022 at 11:48:26PM -0800, Christoph Hellwig wrote:
> On Sun, Mar 06, 2022 at 11:33:02AM +0000, Matthew Wilcox wrote:
> > On Sun, Mar 06, 2022 at 07:32:04AM +0200, Jarkko Sakkinen wrote:
> > > For device memory (aka VM_IO | VM_PFNMAP) MAP_POPULATE does nothing. Allow
> > > to use that for initializing the device memory by providing a new callback
> > > f_ops->populate() for the purpose.
> > 
> > As I said, NAK.
> 
> Agreed.  This is an amazingly bad interface.

So what would you suggest to sort out the issue? I'm happy to go with
ioctl if nothing else is acceptable.

BR, Jarkko
