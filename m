Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA25D0C0C8
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD3D10E93A;
	Fri,  9 Jan 2026 19:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rKkJ1pP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32410E938;
 Fri,  9 Jan 2026 19:22:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B2BF60150;
 Fri,  9 Jan 2026 19:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EEAC4CEF1;
 Fri,  9 Jan 2026 19:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1767986575;
 bh=ZeAEQhQExtiQtbODK1SLMrltdmBdVELv64P6A1sK9Z4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rKkJ1pP+KZkWVh7sdaCZwlcc/XvO4rCGsHk2kJX8XODV3x9Lv3ZZRDyY1kT9XzDfY
 /80DgjZwjVPxJgWeM0U0vslpwnhN1gwTZKDWY0790fUVkPTietwm3vCdvERX1eqmMm
 dh8O4OeHSaywQQsOQUX4iETerEM2c6PSm+/+HGCo=
Date: Fri, 9 Jan 2026 11:22:54 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, Francois Dugast
 <francois.dugast@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Balbir Singh <balbirs@nvidia.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Message-Id: <20260109112254.3d831aff9f27ebe986536a4d@linux-foundation.org>
In-Reply-To: <aWFMOvGldokHHgIn@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
 <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
 <aWFMOvGldokHHgIn@lstrano-desk.jf.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Fri, 9 Jan 2026 10:43:06 -0800 Matthew Brost <matthew.brost@intel.com> wrote:

> On Fri, Jan 09, 2026 at 10:37:41AM -0800, Andrew Morton wrote:
> > On Fri, 9 Jan 2026 14:19:16 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> > 
> > > I'm not CCed on the other patches in the series or the cover letter, so 
> > > I don't see the context.
> > 
> > Both linux-mm and I received a random subset of this series.  Something
> > went wrong.
> 
> Apologies for the list workflow issues. Here is the link to the entire
> series [1].

Cool.  It might be best to spray it all out again, after any IT issues
are fixed.

> For future reference, when we submit core MM patches in a series, should
> we CC linux-mm plus MM maintainers on all patches in the series, even
> those that do not touch core MM?

I think that's best.  I personally don't like seeing just a subset,
although it's trivial to go find the rest on the list.  I've heard
others state that preference, I don't know where the consensus lies.

