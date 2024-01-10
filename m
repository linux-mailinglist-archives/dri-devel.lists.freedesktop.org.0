Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68682A1AB
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 21:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ADB10E66B;
	Wed, 10 Jan 2024 20:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274D10E66B;
 Wed, 10 Jan 2024 20:04:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EF19BCE1DA2;
 Wed, 10 Jan 2024 20:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5DEC433F1;
 Wed, 10 Jan 2024 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704917092;
 bh=74bvc1MrtZiDKmQ/bu3C4RVeT5D3DZCGTl3NffxKvZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BVS4MaRMctsxFwGuMyM23YFJV6gby6teko8iKECcrhunk0OEiqeoTkDr1l/TiVGJo
 D3PqK71jNSb9LbpdngAb4xBI+6SuDkZvu8aVnJYNxh/OMisBhHqJ1KhotiNpAmbU80
 wgGpQlW/jizt5hj1i4Su4y/pEDtNZeoWx582CriSM2ffbCyVxzXepeD/lZhUpUFhEL
 3pZ64QIq99+20Ie61mUYNRaPAw8gMJJKci/GPwmdlok9izzYq7VX5rwp35NC0GRRW9
 PaQ/HQP+gcVFQn1ip2QVte75pNWIrnqTRTsBfuM9W4XhUOM/TRqAV2Ms7tnOQHiw6E
 Dr+uuHbo0VtIA==
Date: Wed, 10 Jan 2024 12:04:51 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] xfs: disable large folio support in xfile_create
Message-ID: <20240110200451.GB722950@frogsfrogsfrogs>
References: <20240110092109.1950011-1-hch@lst.de>
 <20240110092109.1950011-3-hch@lst.de>
 <20240110175515.GA722950@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110175515.GA722950@frogsfrogsfrogs>
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
Cc: dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-sgx@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chandan Babu R <chandan.babu@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 09:55:15AM -0800, Darrick J. Wong wrote:
> On Wed, Jan 10, 2024 at 10:21:09AM +0100, Christoph Hellwig wrote:
> > The xfarray code will crash if large folios are force enabled using:
> > 
> >    echo force > /sys/kernel/mm/transparent_hugepage/shmem_enabled
> > 
> > Fixing this will require a bit of an API change, and prefeably sorting out
> > the hwpoison story for pages vs folio and where it is placed in the shmem
> > API.  For now use this one liner to disable large folios.
> > 
> > Reported-by: Darrick J. Wong <djwong@kernel.org>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Can someone who knows more about shmem.c than I do please review
> https://lore.kernel.org/linux-xfs/20240103084126.513354-4-hch@lst.de/
> so that I can feel slightly more confident as hch and I sort through the
> xfile.c issues?
> 
> For this patch,
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

...except that I'm still getting 2M THPs even with this enabled, so I
guess either we get to fix it now, or create our own private tmpfs mount
so that we can pass in huge=never, similar to what i915 does. :(

--D

> --D
> 
> > ---
> >  fs/xfs/scrub/xfile.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/fs/xfs/scrub/xfile.c b/fs/xfs/scrub/xfile.c
> > index 090c3ead43fdf1..1a8d1bedd0b0dc 100644
> > --- a/fs/xfs/scrub/xfile.c
> > +++ b/fs/xfs/scrub/xfile.c
> > @@ -94,6 +94,11 @@ xfile_create(
> >  
> >  	lockdep_set_class(&inode->i_rwsem, &xfile_i_mutex_key);
> >  
> > +	/*
> > +	 * We're not quite ready for large folios yet.
> > +	 */
> > +	mapping_clear_large_folios(inode->i_mapping);
> > +
> >  	trace_xfile_create(xf);
> >  
> >  	*xfilep = xf;
> > -- 
> > 2.39.2
> > 
> > 
> 
