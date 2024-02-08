Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFBC84D7AD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 02:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E805A10E06B;
	Thu,  8 Feb 2024 01:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yUDDt+mZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC410E06B;
 Thu,  8 Feb 2024 01:56:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E43C061B23;
 Thu,  8 Feb 2024 01:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F693C433F1;
 Thu,  8 Feb 2024 01:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1707357383;
 bh=rVThkiSRe3KkWzz8wgEgHLkSR8j9heMzqKF037jczOY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=yUDDt+mZSSrAsObYnTUAk/OhxeX96BaLr5Y8tpQe4YqaooWEd4/eS7dpuHp1vkn13
 DGZrF4kxSizzi9e75I5QE0hdsAWZ78TzvC+YzBw9U0qq+uVOGPIEnVyjBDv+JhmoOC
 7FIzeR1kkM2mME9zqctRaKkRB8AxLyxqsRcDLtyE=
Date: Wed, 7 Feb 2024 17:56:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Hugh Dickins <hughd@google.com>, Chandan Babu R <chandan.babu@oracle.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christian Koenig
 <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 x86@kernel.org, linux-sgx@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH 2/2] xfs: disable large folio support in xfile_create
Message-Id: <20240207175621.dd773204e7928dbeee7a92bf@linux-foundation.org>
In-Reply-To: <20240112022250.GU723010@frogsfrogsfrogs>
References: <20240110092109.1950011-1-hch@lst.de>
 <20240110092109.1950011-3-hch@lst.de>
 <20240110175515.GA722950@frogsfrogsfrogs>
 <20240110200451.GB722950@frogsfrogsfrogs>
 <20240111140053.51948fb3ed10e06d8e389d2e@linux-foundation.org>
 <ZaBvoWCCChU5wHDp@casper.infradead.org>
 <20240112022250.GU723010@frogsfrogsfrogs>
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

On Thu, 11 Jan 2024 18:22:50 -0800 "Darrick J. Wong" <djwong@kernel.org> wrote:

> On Thu, Jan 11, 2024 at 10:45:53PM +0000, Matthew Wilcox wrote:
> > On Thu, Jan 11, 2024 at 02:00:53PM -0800, Andrew Morton wrote:
> > > On Wed, 10 Jan 2024 12:04:51 -0800 "Darrick J. Wong" <djwong@kernel.org> wrote:
> > > 
> > > > > > Fixing this will require a bit of an API change, and prefeably sorting out
> > > > > > the hwpoison story for pages vs folio and where it is placed in the shmem
> > > > > > API.  For now use this one liner to disable large folios.
> > > > > > 
> > > > > > Reported-by: Darrick J. Wong <djwong@kernel.org>
> > > > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > > 
> > > > > Can someone who knows more about shmem.c than I do please review
> > > > > https://lore.kernel.org/linux-xfs/20240103084126.513354-4-hch@lst.de/
> > > > > so that I can feel slightly more confident as hch and I sort through the
> > > > > xfile.c issues?
> > > > > 
> > > > > For this patch,
> > > > > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > > > 
> > > > ...except that I'm still getting 2M THPs even with this enabled, so I
> > > > guess either we get to fix it now, or create our own private tmpfs mount
> > > > so that we can pass in huge=never, similar to what i915 does. :(
> > > 
> > > What is "this"?  Are you saying that $Subject doesn't work, or that the
> > > above-linked please-review patch doesn't work?
> > 
> > shmem pays no attention to the mapping_large_folio_support() flag,
> > so the proposed fix doesn't work.  It ought to, but it has its own way
> > of doing it that predates mapping_large_folio_support existing.
> 
> Yep.  It turned out to be easier to fix xfile.c to deal with large
> folios than I thought it would be.  Or so I think.  We'll see what
> happens on fstestscloud overnight.

Where do we stand with this?  Should I merge these two patches into
6.8-rcX, cc:stable?
