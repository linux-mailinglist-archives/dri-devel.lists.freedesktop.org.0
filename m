Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC0A329561
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 01:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725246E0CC;
	Tue,  2 Mar 2021 00:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCE06E0CC;
 Tue,  2 Mar 2021 00:21:41 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603d85150000>; Mon, 01 Mar 2021 16:21:41 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 00:21:37 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 1/8] mm: Remove special swap entry functions
Date: Tue, 2 Mar 2021 11:21:35 +1100
Message-ID: <3156280.dJpzq75PnV@nvdebian>
In-Reply-To: <20210301174642.GP4247@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-2-apopple@nvidia.com>
 <20210301174642.GP4247@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614644501; bh=azDUrxm78xZYK+HMnHGyx9Cls7mv6No8+tEzyjhqkY4=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=OWpxffKeP4tRIYOnIzWmKU2ko4OneFNOwVj+FyTqa4wUuAyUq/G035xSN96rL3s4U
 CA2Le5hOQkxj09JDqjwtL+dcVozOjVJOqsAP/77YPxoAGDgKoCS+uC44nuPIHShHJu
 AQcoFQv2I5HrVxcpLUdaEYX96qs+Fbn+H4WH6IiNhxMuJse6m0q6LImPEePfGXcqS3
 y8rWRlSZ6kxZv7XVJ05BMWPXBFERIbAwCPh/cbO3qmpQiPSlkeCWEOdT2cGGNX3CKM
 xj85TG9o7jkYYmeYx1sJ/KOkEFDUPRj2HB/Euue8YPgbHDP8xnwpiiRC88gPjPdE07
 Dv/DTQIp44Jsg==
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

On Tuesday, 2 March 2021 4:46:42 AM AEDT Jason Gunthorpe wrote:
> 
> I wish you could come up with a more descriptive word that special
> here
> 
> What I understand is this is true when the swap_offset is a pfn?

Correct, and that points to a better name. Maybe is_pfn_swap_entry()? In which 
case adding a helper as Christoph suggested makes some more sense. Eg: 
pfn_swap_entry_to_page()

> > -static inline struct page *migration_entry_to_page(swp_entry_t entry)
> > -{
> > -	struct page *p = pfn_to_page(swp_offset(entry));
> > -	/*
> > -	 * Any use of migration entries may only occur while the
> > -	 * corresponding page is locked
> > -	 */
> > -	BUG_ON(!PageLocked(compound_head(p)));
> > -	return p;
> 
> And this constraint has been completely lost?

Yes, sorry I should have called that out. I didn't think loosing the check was 
a big deal, but I can add some checks to some of the call sites which would 
catch a page being incorrectly unlocked.

> A comment in front of the is_special_entry explaining all the rule
> would help alot

Will add one.

> Transformation looks fine otherwise

Thanks.

 - Alistair
 
> Jason
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
