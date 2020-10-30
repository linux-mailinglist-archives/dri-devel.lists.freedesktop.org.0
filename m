Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFBD29FFD8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEC46ED07;
	Fri, 30 Oct 2020 08:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F786E981;
 Fri, 30 Oct 2020 08:24:31 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A5E422253;
 Fri, 30 Oct 2020 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604046270;
 bh=gSmXKcEPU74GTRAjfSumqviFvknWDQc7X1JOOAmSq+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Si1Xp4kz2nZiduJ6OnRI3808vnUeGlBGzEWnvohCTFWiL8OcNDVlCtzhiiSyo7uzA
 KWQToIUK6uyhXgmnpE6atZe+J3Vo7O9puJespbTMC9te+eVnaZjc+YQgbIsXwNys2L
 dfWEeyNDkAPCuWamjOc+NQFyjoaE2fmTeWcsQD0Q=
Date: Fri, 30 Oct 2020 09:25:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
Message-ID: <20201030082518.GB1619669@kroah.com>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com>
 <20201030075716.GA6976@my--box>
 <5a7d8e8d-8db5-ff56-6448-3f1cefc11ef8@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a7d8e8d-8db5-ff56-6448-3f1cefc11ef8@amd.com>
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
Cc: Deepak R Varma <mh12gx2825@gmail.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, melissa.srw@gmail.com,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 09:00:04AM +0100, Christian K=F6nig wrote:
> Am 30.10.20 um 08:57 schrieb Deepak R Varma:
> > On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
> > > On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
> > > > Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsaf=
e()
> > > > function in place of the debugfs_create_file() function will make t=
he
> > > > file operation struct "reset" aware of the file's lifetime. Additio=
nal
> > > > details here: https://nam11.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Flists.archive.carbon60.com%2Flinux%2Fkernel%2F2369498&amp;=
data=3D04%7C01%7Cchristian.koenig%40amd.com%7Cddd7a6ac8164415a639708d87ca97=
004%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637396414464384011%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;sdata=3Do6GOHvMxNMuOPlC4nhDyURCHBLqfQZhYQq%2BiIMt3D3s%3=
D&amp;reserved=3D0
> > > > =

> > > > Issue reported by Coccinelle script:
> > > > scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > =

> > > > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > > > ---
> > > > Please Note: This is a Outreachy project task patch.
> > > > =

> > > >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20 ++++++++++------=
----
> > > >   1 file changed, 10 insertions(+), 10 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > index 2d125b8b15ee..f076b1ba7319 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > @@ -1551,29 +1551,29 @@ static int amdgpu_debugfs_sclk_set(void *da=
ta, u64 val)
> > > >   	return 0;
> > > >   }
> > > > -DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
> > > > -			amdgpu_debugfs_ib_preempt, "%llu\n");
> > > > +DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
> > > > +			 amdgpu_debugfs_ib_preempt, "%llu\n");
> > > Are you sure this is ok?  Do these devices need this additional
> > > "protection"?  Do they have the problem that these macros were written
> > > for?
> > > =

> > > Same for the other patches you just submitted here, I think you need =
to
> > > somehow "prove" that these changes are necessary, checkpatch isn't ab=
le
> > > to determine this all the time.
> > Hi Greg,
> > Based on my understanding, the current function debugfs_create_file()
> > adds an overhead of lifetime managing proxy for such fop structs. This
> > should be applicable to these set of drivers as well. Hence I think this
> > change will be useful.
> =

> Well since this is only created once per device instance I don't really c=
are
> about this little overhead.
> =

> But what exactly is debugfs doing or not doing here?

It is trying to save drivers from having debugfs files open that point
to memory that can go away at any time.  For graphics devices, I doubt
that is the case.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
