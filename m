Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419949F7164
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 01:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5478E10E346;
	Thu, 19 Dec 2024 00:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nQsN9/4g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629AF10E277;
 Thu, 19 Dec 2024 00:35:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 339975C5A91;
 Thu, 19 Dec 2024 00:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E219DC4CED4;
 Thu, 19 Dec 2024 00:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734568522;
 bh=L+dA1Y2iKs8GrU+W1u7hscim0jxiFdHkRch/IoG0z+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQsN9/4gTGSQv7Gkh5u0sjfDPUM2sJVKTZBXM59JSQVG1lLo1ikiDVy9YUF7dio6S
 64e1CpTJlmzmJILu+ONXjm0ag8hhT/3h2MSS/qD07ebu/+yLnVx75T+atfBfnKpjCa
 rb43pVDhL1chgkUw1hxOpKag7IiSuS0vlwejFZ4dCJnQcrdEzieBLFO2l16+5uCej7
 QYsaJq8akOYaXHvwUFsWVQQllQbqf9kgm3x7pIrWu52Ut8CtxQwFxM9jheMQZMiU0g
 P7U4KTekDXudxMCCk7O3sAJuMnP7CZWKulqK7kaW55XwfQ7D9w4Fg5g/pGZfwgjP8m
 WI0YFSGmAzTYw==
Date: Wed, 18 Dec 2024 16:35:21 -0800
From: "Darrick J. Wong" <djwong@kernel.org>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Carlos Maiolino <cem@kernel.org>,
 Chandan Babu R <chandanbabu@kernel.org>,
 Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>
Subject: Re: [PATCH v1 2/3] xfs/libxfs: replace kmalloc() and memcpy() with
 kmemdup()
Message-ID: <20241219003521.GD6174@frogsfrogsfrogs>
References: <20241217225811.2437150-2-mtodorovac69@gmail.com>
 <20241217225811.2437150-4-mtodorovac69@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217225811.2437150-4-mtodorovac69@gmail.com>
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

On Tue, Dec 17, 2024 at 11:58:12PM +0100, Mirsad Todorovac wrote:
> The source static analysis tool gave the following advice:
> 
> ./fs/xfs/libxfs/xfs_dir2.c:382:15-22: WARNING opportunity for kmemdup
> 
>  → 382         args->value = kmalloc(len,
>    383                          GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
>    384         if (!args->value)
>    385                 return -ENOMEM;
>    386
>  → 387         memcpy(args->value, name, len);
>    388         args->valuelen = len;
>    389         return -EEXIST;
> 
> Replacing kmalloc() + memcpy() with kmemdump() doesn't change semantics.
> Original code works without fault, so this is not a bug fix but proposed improvement.

I guess this is all right, but seeing as this code is shared with
userspace ("libxfs"), making this change will just add to the wrappers
that we have to have:

void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
{
	void *p;

	p = kmalloc_node_track_caller_noprof(len, gfp, NUMA_NO_NODE, _RET_IP_);
	if (p)
		memcpy(p, src, len);
	return p;
}

Is this sufficiently better?  That's a question for the kernel
maintainer (cem) and the userspace maintainer (andrey, now cc'd).

--D

> Link: https://lwn.net/Articles/198928/
> Fixes: 94a69db2367ef ("xfs: use __GFP_NOLOCKDEP instead of GFP_NOFS")
> Fixes: 384f3ced07efd ("[XFS] Return case-insensitive match for dentry cache")
> Fixes: 2451337dd0439 ("xfs: global error sign conversion")
> Cc: Carlos Maiolino <cem@kernel.org>
> Cc: "Darrick J. Wong" <djwong@kernel.org>
> Cc: Chandan Babu R <chandanbabu@kernel.org>
> Cc: Dave Chinner <dchinner@redhat.com>
> Cc: linux-xfs@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> ---
>  v1:
> 	initial version.
> 
>  fs/xfs/libxfs/xfs_dir2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_dir2.c b/fs/xfs/libxfs/xfs_dir2.c
> index 202468223bf9..24251e42bdeb 100644
> --- a/fs/xfs/libxfs/xfs_dir2.c
> +++ b/fs/xfs/libxfs/xfs_dir2.c
> @@ -379,12 +379,11 @@ xfs_dir_cilookup_result(
>  					!(args->op_flags & XFS_DA_OP_CILOOKUP))
>  		return -EEXIST;
>  
> -	args->value = kmalloc(len,
> +	args->value = kmemdup(name, len,
>  			GFP_KERNEL | __GFP_NOLOCKDEP | __GFP_RETRY_MAYFAIL);
>  	if (!args->value)
>  		return -ENOMEM;
>  
> -	memcpy(args->value, name, len);
>  	args->valuelen = len;
>  	return -EEXIST;
>  }
> -- 
> 2.43.0
> 
> 
