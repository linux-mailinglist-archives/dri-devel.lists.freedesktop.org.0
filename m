Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EE65A4F6
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7730810E0FD;
	Sat, 31 Dec 2022 14:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2611 seconds by postgrey-1.36 at gabe;
 Fri, 30 Dec 2022 09:08:24 UTC
Received: from formenos.hmeau.com (helcar.hmeau.com [216.24.177.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CFC10E117
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 09:08:24 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1pBAh4-00CHKd-2Z; Fri, 30 Dec 2022 16:24:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 30 Dec 2022 16:24:46 +0800
Date: Fri, 30 Dec 2022 16:24:46 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rijo Thomas <Rijo-john.Thomas@amd.com>
Subject: Re: [PATCH v2] crypto: ccp - Allocate TEE ring and cmd buffer using
 DMA APIs
Message-ID: <Y66gTtjZf5ZT0lP0@gondor.apana.org.au>
References: <651349f55060767a9a51316c966c1e5daa57a644.1670919979.git.Rijo-john.Thomas@amd.com>
 <20221215132917.GA11061@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <5771ea99-eef7-7321-dd67-4c42c0cbb721@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5771ea99-eef7-7321-dd67-4c42c0cbb721@amd.com>
X-Mailman-Approved-At: Sat, 31 Dec 2022 14:30:00 +0000
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
Cc: John Allen <john.allen@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
 Jeshwanth <JESHWANTHKUMAR.NK@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S . Miller" <davem@davemloft.net>,
 linaro-mm-sig@lists.linaro.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-crypto@vger.kernel.org, stable@vger.kernel.org,
 Mythri PK <Mythri.Pandeshwarakrishna@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 23, 2022 at 05:45:24PM +0530, Rijo Thomas wrote:
>
> > dma_alloc_coherent memory is just as contiguous as __get_free_pages, and
> > calling dma_alloc_coherent from a guest does not guarantee that the memory is
> > contiguous in host memory either. The memory would look contiguous from the
> > device point of view thanks to the IOMMU though (in both cases). So this is not
> > about being contiguous but other properties that you might rely on (dma mask
> > most likely, or coherent if you're not running this on x86?).
> > 
> > Can you confirm why this fixes things and update the comment to reflect that.
> 
> I see what you are saying.
> 
> We verified this in Xen Dom0 PV guest, where dma_alloc_coherent() returned a memory
> that is contiguous in machine address space, and the machine address was returned
> in the dma handle (buf->dma).

So is this even relevant to the mainstream kernel or is this patch
only needed for Xen Dom0?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
