Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3132979E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 10:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972A689B83;
	Tue,  2 Mar 2021 09:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066EF89B78;
 Tue,  2 Mar 2021 09:12:29 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603e017d0000>; Tue, 02 Mar 2021 01:12:29 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 09:12:26 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v3 6/8] mm: Selftests for exclusive device memory
Date: Tue, 2 Mar 2021 20:12:24 +1100
Message-ID: <4866160.ulnvbvOQiP@nvdebian>
In-Reply-To: <MN2PR12MB43440D6E37E35DAF962F556EC29A9@MN2PR12MB4344.namprd12.prod.outlook.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-7-apopple@nvidia.com>
 <MN2PR12MB43440D6E37E35DAF962F556EC29A9@MN2PR12MB4344.namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614676349; bh=FeQHtfi4mCSWbQH0/aD7Oy3q/R8JrFmF5liDHR+wnLk=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=HEiZZh4DK3KNf5gTFX02zJnM2b4ou/jDcSzCQDNZpPUD1j+uXhbse5auYqfmiU7Ec
 YXvVqk1kNu+9JT6l7F02Id1OMF+U0wEmNbvQu+/A3fXdEze7YxM7ab4F6YYYKwV/Fg
 Dm4znbewQozpm7A3c+OLIY1ia2ne7u3sRgRh+vejOiSB6QgLd6BMQm44HQa9cMzZFo
 k5ZNYwLJtxHXK1Cy2RXvbbUDWH1IntCrq79+XEho9Uqe5MtS3waXVyOSNZ7GIWALM8
 B+++XLu/MiXh8eoRa+xCczpfPLRtfclfNcVGwwZ6yWPMbfL6KvN2XP1foQfzlXEZuJ
 iqBU0ylYO9AMQ==
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 2 March 2021 10:14:56 AM AEDT Ralph Campbell wrote:
> > From: Alistair Popple <apopple@nvidia.com>
> > Sent: Thursday, February 25, 2021 11:19 PM
> > To: linux-mm@kvack.org; nouveau@lists.freedesktop.org;
> > bskeggs@redhat.com; akpm@linux-foundation.org
> > Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; dri-
> > devel@lists.freedesktop.org; John Hubbard <jhubbard@nvidia.com>; Ralph
> > Campbell <rcampbell@nvidia.com>; jglisse@redhat.com; Jason Gunthorpe
> > <jgg@nvidia.com>; hch@infradead.org; daniel@ffwll.ch; Alistair Popple
> > <apopple@nvidia.com>
> > Subject: [PATCH v3 6/8] mm: Selftests for exclusive device memory
> > 
> > Adds some selftests for exclusive device memory.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> One minor nit below, but you can add

Thanks Ralph. Will fix that.

> Tested-by: Ralph Campbell <rcampbell@nvidia.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> > +static int dmirror_exclusive(struct dmirror *dmirror,
> > +			     struct hmm_dmirror_cmd *cmd)
> > +{
> > +	unsigned long start, end, addr;
> > +	unsigned long size = cmd->npages << PAGE_SHIFT;
> > +	struct mm_struct *mm = dmirror->notifier.mm;
> > +	struct page *pages[64];
> > +	struct dmirror_bounce bounce;
> > +	unsigned long next;
> > +	int ret;
> > +
> > +	start = cmd->addr;
> > +	end = start + size;
> > +	if (end < start)
> > +		return -EINVAL;
> > +
> > +	/* Since the mm is for the mirrored process, get a reference first. */
> > +	if (!mmget_not_zero(mm))
> > +		return -EINVAL;
> > +
> > +	mmap_read_lock(mm);
> > +	for (addr = start; addr < end; addr = next) {
> > +		int i, mapped;
> > +
> > +		if (end < addr + (64 << PAGE_SHIFT))
> > +			next = end;
> > +		else
> > +			next = addr + (64 << PAGE_SHIFT);
> 
> I suggest using ARRAY_SIZE(pages) instead of '64' to make the meaning clear.
> 
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
