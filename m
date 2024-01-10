Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A745C829D98
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A1710E607;
	Wed, 10 Jan 2024 15:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BC810E607;
 Wed, 10 Jan 2024 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=39NamAoxPWMrCZaJEOF8WH1zyLewDTeBBeunTxnTycY=; b=Fe04VqEjetu6tDXLZhxHNA4HKy
 VJycpIBjiVmVELkZ97TvGjWx3WlWJkM9LjthNGeXZu1eQB00JzR+Mr8DPWSLutF2Ja7yvCikoXpwP
 znm58+XJoLj7R0uD7Hx45tuQ7OTT9LAfkSJZ5K7Io5Y70+/NrgDwKIb7T/qHWATzIF61w7jVsdCHD
 wbc1oFr9DT07rRTNm6qmIaLNIbc0eCkZbU0NTxz4X2Di+W6u9RQ9iHT3ftKO6E0Ny3QEy4eFnbtni
 x/rjcAclsaEEZ796tcOTmiG3Izzzqvou+CMphB5MlYfmbrJPLBISQVnCl/A9NSim5B8e/iwIuDV2F
 aXTMD4bg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1rNaay-00BfcE-JQ; Wed, 10 Jan 2024 15:34:20 +0000
Date: Wed, 10 Jan 2024 15:34:20 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: disable large folios for shmem file used by xfs xfile
Message-ID: <ZZ64/F/yeSymOCcI@casper.infradead.org>
References: <20240110092109.1950011-1-hch@lst.de>
 <ZZ6Pfk8tLXbvs4dE@casper.infradead.org>
 <170490002493.164187.5401160425746227111@jlahtine-mobl.ger.corp.intel.com>
 <170490050245.164862.16261803493864298341@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170490050245.164862.16261803493864298341@jlahtine-mobl.ger.corp.intel.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Christoph Hellwig <hch@lst.de>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-sgx@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 05:28:22PM +0200, Joonas Lahtinen wrote:
> Quoting Joonas Lahtinen (2024-01-10 17:20:24)
> > However we specifically pass "huge=within_size" to vfs_kern_mount when
> > creating a private mount of tmpfs for the purpose of i915 created
> > allocations.
> > 
> > Older hardware also had some address hashing bugs where 2M aligned
> > memory caused a lot of collisions in TLB so we don't enable it always.
> > 
> > You can see drivers/gpu/drm/i915/gem/i915_gemfs.c function
> > i915_gemfs_init for details and references.
> > 
> > So in short, functionality wise we should be fine either default
> > for using 2M pages or not. If they become the default, we'd probably
> > want an option that would still be able to prevent them for performance
> > regression reasons on older hardware.
> 
> To maybe write out my concern better:
> 
> Is there plan to enable huge pages by default in shmem?

Not in the next kernel release, but eventually the plan is to allow
arbitrary order folios to be used in shmem.  So you could ask it to create
a 256kB folio for you, if that's the right size to manage memory in.

How shmem and its various users go about choosing the right size is not
quite clear to me yet.  Perhaps somebody else will do it before I get
to it; I have a lot of different sub-projects to work on at the moment,
and shmem isn't blocking any of them.  And I have a sneaking suspicion
that more work is needed in the swap code to deal with arbitrary order
folios, so that's another reason for me to delay looking at this ;-)
