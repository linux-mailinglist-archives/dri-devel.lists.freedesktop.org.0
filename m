Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64774AA68DA
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 04:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB9B10E12D;
	Fri,  2 May 2025 02:47:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uA2+3X0Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4754E10E12D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 02:47:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBAAB44408;
 Fri,  2 May 2025 02:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270FCC4CEE3;
 Fri,  2 May 2025 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746154022;
 bh=kCsuUYT/SjUQVrPNwt+MDCVPrSpdg5Uljxu8zKa+2bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uA2+3X0YwVrQUFVA9HsqyCw5af9OMSANt0To2/hJS+SeOWEthCCcE5nlBXU8PPQQw
 2G9h7L18fn1sGbCjOfnE86TLGT2X/AACZaIThdUgIPdnL85HHiLf1eQIkloGdR5Q5C
 V5cKY+g/KJ7yKlGJKd9+nsWawOer6r/ApOZJthha6P1IToRMij8G+oTrZ1taauF2DG
 QSSXC1uJZM0rSE4hb5oKG+9VUensoClaZkRBbzWYu2P2SiMk0orkiRFX5YAnbgWaBM
 hKobl+lHiuMGVdDxmoNzzDD5Pl/lI9z1PPKDI1UsyGfSlsJcNSKp9nxCKrD+91KPZ6
 pFuHK50PMq6fg==
Date: Thu, 1 May 2025 19:46:59 -0700
From: Kees Cook <kees@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2] drm/ttm: Silence randstruct warning about casting
 struct file
Message-ID: <202505011944.E35A427@keescook>
References: <20250502002437.it.851-kees@kernel.org>
 <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
 <20250502023447.GV2023217@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502023447.GV2023217@ZenIV>
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

On Fri, May 02, 2025 at 03:34:47AM +0100, Al Viro wrote:
> On Thu, May 01, 2025 at 07:13:12PM -0700, Matthew Brost wrote:
> > On Thu, May 01, 2025 at 05:24:38PM -0700, Kees Cook wrote:
> > > Casting through a "void *" isn't sufficient to convince the randstruct
> > > GCC plugin that the result is intentional. Instead operate through an
> > > explicit union to silence the warning:
> > > 
> > > drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
> > > drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
> > >    21 |         return (void *)file;
> > >       |                ^~~~~~~~~~~~
> > > 
> > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > I forgot the policy if suggest-by but will add:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Thomas was out today I suspect he will look at this tomorrow when he is
> > back too.
> 
> [fsdevel and the rest of VFS maintainers Cc'd]
> 
> NAKed-by: Al Viro <viro@zeniv.linux.org.uk>
> 
> Reason: struct file should *NOT* be embedded into other objects without
> the core VFS being very explicitly aware of those.  The only such case
> is outright local to fs/file_table.c, and breeding more of those is
> a really bad idea.
> 
> Don't do that.  Same goes for struct {dentry, super_block, mount}
> in case anyone gets similar ideas.

Well, in that case, the NAK should be against commit e7b5d23e5d47
("drm/ttm: Provide a shmem backup implementation"), but that looks to
have had 15 revisions already...

But I will just back away slowly now. I was just fixing a warning
introduced by it. :)

-- 
Kees Cook
