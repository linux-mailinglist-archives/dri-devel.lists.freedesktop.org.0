Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D1124E3D9
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 01:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEBD6EC1E;
	Fri, 21 Aug 2020 23:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D16EC1E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 23:21:37 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2FBDB20738;
 Fri, 21 Aug 2020 23:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598052096;
 bh=QzsBSM5u7JGxRu/ciLFY8y7akMNJdP69NV9xh2R8jvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=D3PNG0sdPSD3mPcp20plSlrktFCtDBHymfxjoAkCJTF0xWbhYdG9I8/LK5zKQmOfc
 aVNBWa+C6CggUUGGV+olsDq6o9MmoD5h9q1OcDoDl3tuTi6/L4uwG/WzHeo5ThisZB
 bgh7ZNG+YssW/9/xO4xyBm7lxev6px6GfWmnJzfw=
Date: Fri, 21 Aug 2020 16:21:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
Message-Id: <20200821162134.97d551c6fe45b489992841a8@linux-foundation.org>
In-Reply-To: <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <c59111f9-7c94-8b9e-2b8c-4cb96b9aa848@redhat.com>
 <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: X86 ML <x86@kernel.org>, David Hildenbrand <david@redhat.com>,
 David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020 18:53:57 -0700 Dan Williams <dan.j.williams@intel.com> wrote:

> > I think I am missing some important pieces. Bear with me.
> 
> No worries, also bear with me, I'm going to be offline intermittently
> until at least mid-September. Hopefully Joao and/or Vishal can jump in
> on this discussion.

Ordinarily I'd prefer a refresh&resend for 2+ week-old series such as
this.

But given that v4 all applies OK and that Dan has pending outages, I'll
scoop up this version, even though at least one change has been suggested.

Also, this series has killed Zhen Lei's little cleanup
(http://lkml.kernel.org/r/20200817065926.2239-1-thunder.leizhen@huawei.com).
I don't think the affected code was moved elsewhere, so I'll drop that
patch.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
