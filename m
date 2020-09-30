Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB2927FB4A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535626E867;
	Thu,  1 Oct 2020 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D4F89C52
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 16:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601483971; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paVCHoTZzxugphfacYrgC27YgCE33ait/aVR2jUpCUI=;
 b=obEE6kDeKtlKm0lW84+rYRtBTDkouLvkA5TBbDO/qq4pNDPmPHwD+cshjNAbUZP8775xeA
 piBjQyRhouvJspJolXTLueHx3iStOgHc7i/F7ICcuRkXsDiwK2IaKuRijCtmO2SkVtGX1G
 I+FGjiWnK2F7w/zMs6SFj3ZkwXCdcRU=
Date: Wed, 30 Sep 2020 18:39:18 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Christoph Hellwig <hch@lst.de>
Message-Id: <IXCHHQ.XHZEBJ42HOEJ1@crapouillou.net>
In-Reply-To: <20200930161124.GA6859@lst.de>
References: <20200928135405.73404219@canb.auug.org.au>
 <20200928060427.GA15041@lst.de> <KU5DHQ.C9RVOLP69UO81@crapouillou.net>
 <20200928113415.GA555@lst.de> <72ADHQ.T6LL1SHQF0RG3@crapouillou.net>
 <20200928121002.GA3219@lst.de> <GWEDHQ.HNERRUK8XXOM2@crapouillou.net>
 <20200930090252.GA9357@lst.de> <DB4HHQ.1KMN8GNWYJLC1@crapouillou.net>
 <20200930161124.GA6859@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le mer. 30 sept. 2020 =E0 18:11, Christoph Hellwig <hch@lst.de> a =E9crit =

:
> On Wed, Sep 30, 2020 at 03:33:13PM +0200, Paul Cercueil wrote:
>>  One thing missing for remap_pfn_range(), I have no alternative for =

>> this:
>> =

>>  vma->vm_page_prot =3D dma_pgprot(dev, vma->vm_page_prot,
>>  DMA_ATTR_NON_CONSISTENT);
>> =

>>  So I have to do:
>> =

>>  vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
>>  pgprot_val(vma->vm_page_prot) &=3D ~_CACHE_MASK;
>>  pgprot_val(vma->vm_page_prot) |=3D _CACHE_CACHABLE_NONCOHERENT;
>> =

>>  And that will only compile on MIPS, because these _CACHE_* macros =

>> are only
>>  defined there.
>> =

>>  I would need something like a pgprot_noncoherent(), I think.
> =

> dma_alloc_pages gives you cached memory, so you can't just use an
> uncached protection for the userspace mmap here.  If you want uncached
> memory you need to use dma_alloc_coherent paired with =

> dma_mmap_coherent.
> Or dma_alloc_wc for a slightly different flavor of uncached. (both
> of the map to dma_alloc_attrs / dma_mmap_attrs eventually).

I don't want uncached memory, I want non-coherent cached memory.

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
