Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67932CB5A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 05:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4421A89B84;
	Thu,  4 Mar 2021 04:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED6A89B84;
 Thu,  4 Mar 2021 04:27:24 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B604061aa0002>; Wed, 03 Mar 2021 20:27:22 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar
 2021 04:27:21 +0000
Received: from nvdebian.localnet (172.20.145.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar 2021
 04:27:18 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date: Thu, 4 Mar 2021 15:27:16 +1100
Message-ID: <29906974.JcgKRUyaEZ@nvdebian>
In-Reply-To: <20210301161049.GJ4247@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-4-apopple@nvidia.com>
 <20210301161049.GJ4247@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614832042; bh=p4JDJbZednwqFrVYpTjMUfEe/DvW0PBtYvVi5ZHIeDg=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=eK4xtp0Lie2rFKeCJiwu9nlyb3pg65al7AaYhe5pFEkjuZypZcZWqWwBhIJF/wcDp
 PeQNy6FGBUd0zDIOEMAmPED2HCpYTvechpwR+GhIoYVRZFKyk01aJKt7ARncP8p8JZ
 ybgZM6eVhq/ekdvvxoHYF4ZUo3i3wFiUVmzFby7JbEpdKu/9FUzqaXW8BGo+t+IT56
 wnlFRZhUlyDxyoFeYFzg2G/DH1DkrOlKSB4Gze98CVtRP0KXBvoV+25QwHqG+JoaMn
 aZRBeoYSfmsvpz2jOgPXwj+ksEe+zXuX4lMEPiIXdghUNttv0RhWvDU/1dJpobBdT8
 cwnG9pSLeDbSQ==
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 2 March 2021 3:10:49 AM AEDT Jason Gunthorpe wrote:
> > +       while (page_vma_mapped_walk(&pvmw)) {
> > +               /*
> > +                * If the page is mlock()d, we cannot swap it out.
> > +                * If it's recently referenced (perhaps page_referenced
> > +                * skipped over this mm) then we should reactivate it.
> > +                */
> > +               if (vma->vm_flags & VM_LOCKED) {
> 
> And since we write the data without holding the PTLs this looks
> pointless, unless there is some other VM_LOCKED manipulation
> 

Thanks. I couldn't find any other manipulation of VM_LOCKED whilst holding the 
PTL so I'll remove this redundant check.

 - Alistair



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
