Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B8A030C1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 20:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CD210E9EB;
	Mon,  6 Jan 2025 19:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u/ReIXZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E4510E9E2;
 Mon,  6 Jan 2025 19:37:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 629A15C5794;
 Mon,  6 Jan 2025 19:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D8BC4CED6;
 Mon,  6 Jan 2025 19:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736192227;
 bh=WnZuz0qKrybhpoiLa0j4dwGCQ4rcoHccHIv7G+mEsXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/ReIXZDTWW1yig1l9ueUwqHVdRZktR2qHs1nKXHq7wDwC+yOD6K81jHqpbPemU1i
 x5uLV9TW/wAOt/q+On9LpT0Jickk8owx5AIeKEsKo636776KdllLaM2N1YashJA/vB
 +7H4HPfoQ8P0Dcb9dd2AIwlXGvhkAqybEFY1Do6l7CdyvYo0aV9+jRvh9LM4LRdpke
 P5KduKip1po04WwLfV4bazEeO1hVBxd2y+cxBJ4hU8rtgbUWjKn68ZxoIrQ5kPppo0
 /5BDpmE3+t8SGvGahZros1sLPsmpMfJKJDh7qY1H4XDfJRgMQjvFnWOOYTXOmfblxZ
 7i5cwRUHb7kbA==
Date: Mon, 6 Jan 2025 11:37:06 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Mirsad Todorovac <mtodorovac69@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Carlos Maiolino <cem@kernel.org>,
 Chandan Babu R <chandanbabu@kernel.org>,
 Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v1 2/3] xfs/libxfs: replace kmalloc() and memcpy() with
 kmemdup()
Message-ID: <20250106193706.GG6174@frogsfrogsfrogs>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <20241217225811.2437150-4-mtodorovac69@gmail.com>
 <20241219003521.GD6174@frogsfrogsfrogs>
 <cdnpycsyf37gbcp6yxx36pxgilothhdpajmtwle5pphjxshn6o@j5enpjtww3xx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cdnpycsyf37gbcp6yxx36pxgilothhdpajmtwle5pphjxshn6o@j5enpjtww3xx>
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

On Sun, Dec 29, 2024 at 01:58:19PM +0100, Andrey Albershteyn wrote:
> On 2024-12-18 16:35:21, Darrick J. Wong wrote:
> > On Tue, Dec 17, 2024 at 11:58:12PM +0100, Mirsad Todorovac wrote:
> > > The source static analysis tool gave the following advice:
> > > 
> > > ./fs/xfs/libxfs/xfs_dir2.c:382:15-22: WARNING opportunity for kmemdup
> > > 
> > >  → 382         args->value = kmalloc(len,
> > >    383                          GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
> > >    384         if (!args->value)
> > >    385                 return -ENOMEM;
> > >    386
> > >  → 387         memcpy(args->value, name, len);
> > >    388         args->valuelen = len;
> > >    389         return -EEXIST;
> > > 
> > > Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
> > > Original code works without fault, so this is not a bug fix but proposed improvement.
> > 
> > I guess this is all right, but seeing as this code is shared with
> > userspace ("libxfs"), making this change will just add to the wrappers
> > that we have to have:
> > 
> > void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
> > {
> > 	void *p;
> > 
> > 	p = kmalloc_node_track_caller_noprof(len, gfp, NUMA_NO_NODE, _RET_IP_);
> > 	if (p)
> > 		memcpy(p, src, len);
> > 	return p;
> > }
> > 
> > Is this sufficiently better?  That's a question for the kernel
> > maintainer (cem) and the userspace maintainer (andrey, now cc'd).
> > 
> > --D
> 
> There's still possibility to set wrong length in args->valuelen,
> which I suppose what this change tries to prevent.
> 
> But otherwise wrapper looks good to me

Ok, proceed then.
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D


> > 
> > > Link: https://lwn.net/Articles/198928/
> > > Fixes: 94a69db2367ef ("xfs: use __GFP_NOLOCKDEP instead of GFP_NOFS")
> > > Fixes: 384f3ced07efd ("[XFS] Return case-insensitive match for dentry cache")
> > > Fixes: 2451337dd0439 ("xfs: global error sign conversion")
> > > Cc: Carlos Maiolino <cem@kernel.org>
> > > Cc: "Darrick J. Wong" <djwong@kernel.org>
> > > Cc: Chandan Babu R <chandanbabu@kernel.org>
> > > Cc: Dave Chinner <dchinner@redhat.com>
> > > Cc: linux-xfs@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org
> > > Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> > > ---
> > >  v1:
> > > 	initial version.
> > > 
> > >  fs/xfs/libxfs/xfs_dir2.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/xfs/libxfs/xfs_dir2.c b/fs/xfs/libxfs/xfs_dir2.c
> > > index 202468223bf9..24251e42bdeb 100644
> > > --- a/fs/xfs/libxfs/xfs_dir2.c
> > > +++ b/fs/xfs/libxfs/xfs_dir2.c
> > > @@ -379,12 +379,11 @@ xfs_dir_cilookup_result(
> > >  					!(args->op_flags & XFS_DA_OP_CILOOKUP))
> > >  		return -EEXIST;
> > >  
> > > -	args->value = kmalloc(len,
> > > +	args->value = kmemdup(name, len,
> > >  			GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
> > >  	if (!args->value)
> > >  		return -ENOMEM;
> > >  
> > > -	memcpy(args->value, name, len);
> > >  	args->valuelen = len;
> > >  	return -EEXIST;
> > >  }
> > > -- 
> > > 2.43.0
> > > 
> > > 
> > 
> 
> -- 
> - Andrey
> 
> 
