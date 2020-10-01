Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA1280722
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 20:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7D96E8D5;
	Thu,  1 Oct 2020 18:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2956E8D5;
 Thu,  1 Oct 2020 18:45:25 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7623900000>; Thu, 01 Oct 2020 11:44:32 -0700
Received: from [10.20.170.18] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 18:45:18 +0000
Date: Thu, 1 Oct 2020 13:45:15 -0500
From: Alex Goins <agoins@nvidia.com>
X-X-Sender: agoins@agoins-DiGiTS
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH RFC 0/1] drm/ttm: Allocate transparent huge pages without
 clearing __GFP_COMP
In-Reply-To: <4566cf03-1c9e-1626-6c92-7b5fa29d6b75@amd.com>
Message-ID: <alpine.DEB.2.20.2010011344360.18933@agoins-DiGiTS>
References: <20200930221821.13719-1-agoins@nvidia.com>
 <4566cf03-1c9e-1626-6c92-7b5fa29d6b75@amd.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-272512797-1601577919=:18933"
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601577872; bh=4VSo1s79PcEYekovpQD/6gkaFNEUkYfYmrnwO4ysQQI=;
 h=Date:From:X-X-Sender:To:CC:Subject:In-Reply-To:Message-ID:
 References:User-Agent:X-NVConfidentiality:MIME-Version:
 Content-Type:X-Originating-IP:X-ClientProxiedBy;
 b=lgJSB/tVznCMIDm1+XsYCy4ZyMFy7XqgHuwHhhwb6m0K//3jxlwXK2+ORzcvUkT3m
 ZcPv7zcft0i8AOxNR4HEaKBq+mSI7GoeMpw/jTq3N3sDgqTnrWPqBQ4AeFR7NFJ3qO
 WgIumC901uUs8lAQeX+Nu1WyVhj4TWXBBhwhd/yhs3yjOVeRL1AFafOfwdj+dqaK4+
 M/dqFFiBiyqOGsp9RTQMN2yqpjlwF4mmzSgL/qAhCxnNdkd6l5tLW9K5maUBpM7ly8
 nNWhhVToBDbk3VT6pdd9IDc+9MqYiKNFe+xLg8dbbA8veoGU7bODloNP1W+NRl8hIA
 pfhXcdDyrW/FA==
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
Cc: linux-mm@kvack.org, Zi Yan <ziy@nvidia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 John Hubbard <jhubbard@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--8323329-272512797-1601577919=:18933
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT

Hi Christian,

On Thu, 1 Oct 2020, Christian König wrote:

> Hi Alex,
> 
> first of all accessing the underlying page of an exported DMA-buf is
> illegal! So I'm not 100% sure what you're intentions are here, please
> explain further.

We have some mapping requirements that I was hoping I could address by mapping
these pages manually.

Are you sure that it's illegal to access the underlying pages of an exported
DMA-BUF? There appears to be quite a few usages of this already. See the usage
of drm_prime_sg_to_page_addr_arrays() in vgem, vkms, msm, xen, and etnaviv.
drm_gem_prime_import_dev() uses driver->gem_prime_import_sg_table() when
importing a DMA-BUF from another driver, and the listed drivers then extract the
pages from the given SGT using drm_prime_sg_to_page_addr_arrays(). These pages
can then be mapped and faulted in.

See commit af33a9190d02 ('drm/vgem: Enable dmabuf import interfaces'). After
importing the pages from the SGT, vgem can fault them in, taking a refcount with
get_page() first. get_page() throws a BUG if the refcount is zero, which it will
hit on each of the 'tail' pages from TTM THP allocations. 

All of this currently works fine with TTM DMA-BUFs when the kernel is built with
!CONFIG_TRANSPARENT_HUGEPAGE. However, 'echo never >
/sys/kernel/mm/transparent_hugepage/enabled' doesn't change how TTM allocates
pages.

> Then the reason for TTM not using compound pages is that we can't
> guarantee that they are mapped as a whole to userspace.
> 
> The result is that the kernel sometimes tried to de-compound them which
> created a bunch of problems.
> 
> So yes this is completely intentional.

Understood, I figured something like that was the case, so I wanted to get your
input first. Do you know what the problems were, exactly? Practical issues
aside, it seems strange to call something a transparent huge page if it's
non-compound.

Besides making these pages compound, would it be reasonable to split them before
sharing them, in e.g. amdgpu_dma_buf_map (and in other drivers that use TTM)?
That's where it's supposed to make sure that the shared DMA-BUF is accessible by
the target device.

Thanks,
Alex

> Regards,
> Christian.
> 
> Am 01.10.20 um 00:18 schrieb Alex Goins:
> > Hi Christian,
> > 
> > I've been looking into the DMA-BUFs exported from AMDGPU / TTM. Would
> > you mind giving some input on this?
> > 
> > I noticed that your changes implementing transparent huge page support
> > in TTM are allocating them as non-compound. I understand that using
> > multiorder non-compound pages is common in device drivers, but I think
> > this can cause a problem when these pages are exported to other drivers.
> > 
> > It's possible for other drivers to access the DMA-BUF's pages via
> > gem_prime_import_sg_table(), but without context from TTM, it's
> > impossible for the importing driver to make sense of them; they simply
> > appear as individual pages, with only the first page having a non-zero
> > refcount. Making TTM's THP allocations compound puts them more in line
> > with the standard definition of a THP, and allows DMA-BUF-importing
> > drivers to make sense of the pages within.
> > 
> > I would like to propose making these allocations compound, but based on
> > patch history, it looks like the decision to make them non-compound was
> > intentional, as there were difficulties figuring out how to map them
> > into CPU page tables. I did some cursory testing with compound THPs, and
> > nothing seems obviously broken. I was also able to map compound THP
> > DMA-BUFs into userspace without issue, and access their contents. Are
> > you aware of any other potential consequences?
> > 
> > Commit 5c42c64f7d54 ("drm/ttm: fix the fix for huge compound pages") should
> > probably also be reverted if this is applied.
> > 
> > Thanks,
> > Alex
> > 
> > Alex Goins (1):
> >    drm-ttm: Allocate compound transparent huge pages
> > 
> >   drivers/gpu/drm/ttm/ttm_page_alloc.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> 
> 
--8323329-272512797-1601577919=:18933
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--8323329-272512797-1601577919=:18933--
