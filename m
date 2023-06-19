Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C28D7356D0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 14:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A37510E13D;
	Mon, 19 Jun 2023 12:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B3D10E13D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687177664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVrUyaauyyvwxcUddbauFV45YIITDOV45M/dy9o2iWA=;
 b=M6Yi1HMZwq93gsNlI3oneIx/64U98iI2Rc5MXAcAuccRUqveHeQQGCetTj77mR3+lEeGQi
 HFD7Sk8kA5Ktl4/Wv0V2ftrOCwtVvDtKjrUp4XCDt/9qHQCKBdUF3lAxmBp25aTOiZOrcO
 1PxiJIJo7DEDzSwlovWy7Iu0KotP1f0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-wbQjvZxYMPKM6drPfvmQ_A-1; Mon, 19 Jun 2023 08:27:39 -0400
X-MC-Unique: wbQjvZxYMPKM6drPfvmQ_A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC930101AA46;
 Mon, 19 Jun 2023 12:27:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B658D48FB01;
 Mon, 19 Jun 2023 12:27:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 590CB18003AB; Mon, 19 Jun 2023 14:27:37 +0200 (CEST)
Date: Mon, 19 Jun 2023 14:27:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-ID: <rig64luafho5rflev25kwyejxwi44n7hj5kioxhogj4wpg5pch@bvxc2mfiyhyd>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515170259.GA3848@monkey>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: James Houghton <jthoughton@google.com>, jmarchan@redhat.com,
 Dongwon Kim <dongwon.kim@intel.com>, Junxiao Chang <junxiao.chang@intel.com>,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-mm@kvack.org, mhocko@suse.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 10:04:42AM -0700, Mike Kravetz wrote:
> On 05/12/23 16:29, Mike Kravetz wrote:
> > On 05/12/23 14:26, James Houghton wrote:
> > > On Fri, May 12, 2023 at 12:20 AM Junxiao Chang <junxiao.chang@intel.com> wrote:
> > > 
> > > This alone doesn't fix mapcounting for PTE-mapped HugeTLB pages. You
> > > need something like [1]. I can resend it if that's what we should be
> > > doing, but this mapcounting scheme doesn't work when the page structs
> > > have been freed.
> > > 
> > > It seems like it was a mistake to include support for hugetlb memfds in udmabuf.
> > 
> > IIUC, it was added with commit 16c243e99d33 udmabuf: Add support for mapping
> > hugepages (v4).  Looks like it was never sent to linux-mm?  That is unfortunate
> > as hugetlb vmemmap freeing went in at about the same time.  And, as you have
> > noted udmabuf will not work if hugetlb vmemmap freeing is enabled.
> > 
> > Sigh!
> > 
> > Trying to think of a way forward.
> > -- 
> > Mike Kravetz
> > 
> > > 
> > > [1]: https://lore.kernel.org/linux-mm/20230306230004.1387007-2-jthoughton@google.com/
> > > 
> > > - James
> 
> Adding people and list on Cc: involved with commit 16c243e99d33.
> 
> There are several issues with trying to map tail pages of hugetllb pages
> not taken into account with udmabuf.  James spent quite a bit of time trying
> to understand and address all the issues with the HGM code.  While using
> the scheme proposed by James, may be an approach to the mapcount issue there
> are also other issues that need attention.  For example, I do not see how
> the fault code checks the state of the hugetlb page (such as poison) as none
> of that state is carried in tail pages.
> 
> The more I think about it, the more I think udmabuf should treat hugetlb
> pages as hugetlb pages.  They should be mapped at the appropriate level
> in the page table.  Of course, this would impose new restrictions on the
> API (mmap and ioctl) that may break existing users.  I have no idea how
> extensively udmabuf is being used with hugetlb mappings.

User of this is qemu.  It can use the udmabuf driver to create host
dma-bufs for guest resources (virtio-gpu buffers), to avoid copying
data when showing the guest display in a host window.

hugetlb support is needed in case qemu guest memory is backed by
hugetlbfs.  That does not imply the virtio-gpu buffers are hugepage
aligned though, udmabuf would still need to operate on smaller chunks
of memory.  So with additional restrictions this will not work any
more for qemu.  I'd suggest to just revert hugetlb support instead
and go back to the drawing board.

Also not sure why hugetlbfs is used for guest memory in the first place.
It used to be a thing years ago, but with the arrival of transparent
hugepages there is as far I know little reason to still use hugetlbfs.

Vivek? Dongwon?

take care,
  Gerd

