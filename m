Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EB7AA68E2
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 04:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48E10E368;
	Fri,  2 May 2025 02:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="wWJocYSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 992 seconds by postgrey-1.36 at gabe;
 Fri, 02 May 2025 02:51:30 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED72C10E368
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P8bGVFcQNC8bUMcQFTsN63CjDxjXndvf41sHelhW6H0=; b=wWJocYSy4eEtn2ABOR4emJvlY/
 6Tnj9e1xzI+e33h7hXaotSUYbz4BhuLe5sco8BPyM2GklEjHS5hFpp3X8VFJpeN8zY854LaEaZzCE
 boOkWSUpK/cHocbZVJMuT+BPEcDeLOVFRajKMBmAvKWA5st1J60p0MTJnqaj7061jJqXaa27fP0RB
 DGHpsPoz6ZHW0aNdmaL0VLocXD8wngmT+TSv/c+IlsST2UPiZqavOodfz1zE6v/QPuo94hz66VDPz
 RHLZQOpmf7CPd2ztkj0h6V74x6S5r6LvzDUHcIDkvWwhcs4QN5vaY3hO979aB4Q5pvXp1Z+lJArx+
 1imCFZ0Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uAgEh-0000000FDhl-3Vaf; Fri, 02 May 2025 02:34:47 +0000
Date: Fri, 2 May 2025 03:34:47 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Kees Cook <kees@kernel.org>,
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
Message-ID: <20250502023447.GV2023217@ZenIV>
References: <20250502002437.it.851-kees@kernel.org>
 <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
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

On Thu, May 01, 2025 at 07:13:12PM -0700, Matthew Brost wrote:
> On Thu, May 01, 2025 at 05:24:38PM -0700, Kees Cook wrote:
> > Casting through a "void *" isn't sufficient to convince the randstruct
> > GCC plugin that the result is intentional. Instead operate through an
> > explicit union to silence the warning:
> > 
> > drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
> > drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
> >    21 |         return (void *)file;
> >       |                ^~~~~~~~~~~~
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> I forgot the policy if suggest-by but will add:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Thomas was out today I suspect he will look at this tomorrow when he is
> back too.

[fsdevel and the rest of VFS maintainers Cc'd]

NAKed-by: Al Viro <viro@zeniv.linux.org.uk>

Reason: struct file should *NOT* be embedded into other objects without
the core VFS being very explicitly aware of those.  The only such case
is outright local to fs/file_table.c, and breeding more of those is
a really bad idea.

Don't do that.  Same goes for struct {dentry, super_block, mount}
in case anyone gets similar ideas.
