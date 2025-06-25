Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D391CAE8FAA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 22:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941B10E163;
	Wed, 25 Jun 2025 20:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="oVF8Xpcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A84510E163
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 20:46:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7B2745C4A90;
 Wed, 25 Jun 2025 20:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568BCC4CEF0;
 Wed, 25 Jun 2025 20:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1750884413;
 bh=K/l1wB+Ll5z0Rrr61fPVSHVcYgvKnqIg1GCwc9WsXqA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oVF8XpccIvNhd0EcVTboutnMegqMhcbuI0u3d6XUy6xfWTTiXk3S+EQdgLJ0ahUHB
 ibgWZ7pColS0VatdOP7u68/KM2+2Cxo7p8MGrf3GVZU8LRtGD1JThVgTMS7H+3/4Nl
 qi9jhlmgoC2co9CDiwPQLVrakTPIF4cOsy+z9SGI=
Date: Wed, 25 Jun 2025 13:46:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com"
 <syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 "David Hildenbrand" <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if
 there are no resv
Message-Id: <20250625134652.b9184bb34e073bd7cb014844@linux-foundation.org>
In-Reply-To: <IA0PR11MB718542BC4FF75C1891803372F87BA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
 <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
 <20250618170248.89ff5c3d3fe23233424fd4da@linux-foundation.org>
 <IA0PR11MB71859403C79419049C075E44F87DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250623163546.ddb768e0833f7a19af259a43@linux-foundation.org>
 <IA0PR11MB718542BC4FF75C1891803372F87BA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 25 Jun 2025 14:18:28 +0000 "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:

> > Cool, thanks, I'll paste that into the changelog ;)
> > 
> > So if this code path is rare but expected and normal, should we be
> > emitting this warning at all?
> I think it would be OK to drop the warning. Otherwise, Syzbot would continue
> to flag this issue.

OK.  Could you please propose such a patch?  With a fairly detailed
changelog explaining why the warning is bogus?  After all, we don't
want to be removing our ability to detect a real bug!
