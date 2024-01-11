Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE582B738
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 23:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDC310E0F9;
	Thu, 11 Jan 2024 22:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6942910E0F9;
 Thu, 11 Jan 2024 22:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0rn15vikwOjPu92WIZ1pOLLnXWU6x//npevyjHw8yaU=; b=EomzbTzJzQx9U5EbbMaV2qfdKn
 m+8Aks0QGEeOKbhHlYUfGI0ESzbPCwu4+T1iJwpAMaa+P+8S7WdUdv0uh9VymFzvAlHqWZdS+1v42
 VYO+5aZ+YLqzQ9VrPT3bL2J2+Jh26pmRT3GsCtQ+FuTAp5ogzJOhfRTDdZd5nGFmbyHf4Nic43+/j
 wDbX0twq5Rj7iSd2OySjSEWRPCXpPbuXe/3Q1RVKFIc6G732IcUWMPMXjEy7Po9B7TOpSfuH09+Si
 ksPBNd2g30LsyFYsilKTNDIkvoFAxmh97MurNp5o/ueUNwULbN3H1vFGwAFhHlhdxkhCRy3J2stsU
 Y5bchWlg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rO3o9-00FAPE-3J; Thu, 11 Jan 2024 22:45:53 +0000
Date: Thu, 11 Jan 2024 22:45:53 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] xfs: disable large folio support in xfile_create
Message-ID: <ZaBvoWCCChU5wHDp@casper.infradead.org>
References: <20240110092109.1950011-1-hch@lst.de>
 <20240110092109.1950011-3-hch@lst.de>
 <20240110175515.GA722950@frogsfrogsfrogs>
 <20240110200451.GB722950@frogsfrogsfrogs>
 <20240111140053.51948fb3ed10e06d8e389d2e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111140053.51948fb3ed10e06d8e389d2e@linux-foundation.org>
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-sgx@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 11, 2024 at 02:00:53PM -0800, Andrew Morton wrote:
> On Wed, 10 Jan 2024 12:04:51 -0800 "Darrick J. Wong" <djwong@kernel.org> wrote:
> 
> > > > Fixing this will require a bit of an API change, and prefeably sorting out
> > > > the hwpoison story for pages vs folio and where it is placed in the shmem
> > > > API.  For now use this one liner to disable large folios.
> > > > 
> > > > Reported-by: Darrick J. Wong <djwong@kernel.org>
> > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > 
> > > Can someone who knows more about shmem.c than I do please review
> > > https://lore.kernel.org/linux-xfs/20240103084126.513354-4-hch@lst.de/
> > > so that I can feel slightly more confident as hch and I sort through the
> > > xfile.c issues?
> > > 
> > > For this patch,
> > > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > 
> > ...except that I'm still getting 2M THPs even with this enabled, so I
> > guess either we get to fix it now, or create our own private tmpfs mount
> > so that we can pass in huge=never, similar to what i915 does. :(
> 
> What is "this"?  Are you saying that $Subject doesn't work, or that the
> above-linked please-review patch doesn't work?

shmem pays no attention to the mapping_large_folio_support() flag,
so the proposed fix doesn't work.  It ought to, but it has its own way
of doing it that predates mapping_large_folio_support existing.
