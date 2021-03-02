Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E859329D8A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2274689DC2;
	Tue,  2 Mar 2021 12:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09526E92D;
 Tue,  2 Mar 2021 12:02:07 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603e293f0000>; Tue, 02 Mar 2021 04:02:07 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 12:02:03 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 1/8] mm: Remove special swap entry functions
Date: Tue, 2 Mar 2021 23:02:01 +1100
Message-ID: <3345714.hC2lq6CL0I@nvdebian>
In-Reply-To: <2110609.1zlQqR5hOE@nvdebian>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226155909.GA2907711@infradead.org> <2110609.1zlQqR5hOE@nvdebian>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614686527; bh=b4u8wlHSQs9FvZtrdld+N7bU6bKVR4VIsqvExBaD4Rs=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=dCvuFv2nHakCS7lmDYO2pxF6pGlzQ4j5wasHy/HwPnpQbwFTJ4SkzTAsw+V480/yo
 GU6GDIY5sCyead7VMxIwQxY9J+SH+Dd1Yc+whx/HTBCLcXBAYtUmQ7vRQ1ZLts7uGI
 ORtUa8tOqSxCxJfrpOM1lbvVDuEBaKlc5aeB+qOT8QzxQA7XZwcVrgkSOQ5J55/qsT
 5omouGzUjYOojRdozUTNKFqLaHURFqh5FOyeJSzvikrM97UDKkytICAKlRXXTB3Jg7
 AnhYQA/D2u2YQeGtcqeGkNKxCsDG7H/6I77qB8qOrbv0JzI4ERftAYolHKQ9e2ejGX
 zGJjSgT2MgSyg==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 bskeggs@redhat.com, jgg@nvidia.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, 2 March 2021 7:52:53 PM AEDT Alistair Popple wrote:
> On Saturday, 27 February 2021 2:59:09 AM AEDT Christoph Hellwig wrote:
> > > -		struct page *page = migration_entry_to_page(entry);
> > > +		struct page *page = pfn_to_page(swp_offset(entry));
> > 
> > I wonder if keeping a single special_entry_to_page() helper would still
> > me a useful.  But I'm not entirely sure.  There are also two more open
> > coded copies of this in the THP migration code.
> 
> I think it might be if only to clearly document where these entries are 
used. 
> Will add it for the next version to see what it looks like.

Actually the main advantage ends up being that it becomes easy to retain the 
page locked check for migration entries.

 - Alistair 



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
