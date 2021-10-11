Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DE429546
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 19:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C356E8FC;
	Mon, 11 Oct 2021 17:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF5F6E8FC
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 17:07:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FE2F60E90;
 Mon, 11 Oct 2021 17:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633972032;
 bh=Lfv4NZzsm+WueI3HCxzWQCI4aS88zmyZ+L1V+IE+OJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rd0yD+EGMXOoL/nwTQqlImwXK49yGn8zh8Gj9P+YR0C/pe7rFyfj4uDaOjgLzWN+b
 P+qOPJX1PWEGuhEIVdIBHymKI3FSozh/wpk3szCxXk2NWIwGF9Z9MV3jLrujKZYWXk
 0w+PZdsQdqtRHlQc2TXYBXG6qpryaieOgK3MRN3w=
Date: Mon, 11 Oct 2021 19:07:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: Fw: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
Message-ID: <YWRvPB1h3Rch/Gjd@kroah.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
 <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
 <DM4PR12MB51368C12F6338C6F245D54B28BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
 <c4f1464d-19b6-04a3-e2d8-a153bfbb050a@amd.com>
 <YWBfvILqkBQ8VSYc@kroah.com>
 <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com>
 <YWRP1AbaRyfKKCiv@kroah.com> <878ryz1pq9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878ryz1pq9.fsf@intel.com>
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

On Mon, Oct 11, 2021 at 07:38:22PM +0300, Jani Nikula wrote:
> On Mon, 11 Oct 2021, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Mon, Oct 11, 2021 at 04:19:58PM +0200, Christian König wrote:
> >> > > > > And then throw it away, later, when you want to remove the directory,
> >> > > > > look it up with a call to debugfs_lookup() and pass that to
> >> > > > > debugfs_remove() (which does so recursively).
> >> > > > > 
> >> > > > > There should never be a need to save, or check, the result of any
> >> > > > > debugfs call.  If so, odds are it is being used incorrectly.
> >> > > Yeah, exactly that's the problem I see here.
> >> > > 
> >> > > We save the return value because the DRM subsystem is creating a debugfs
> >> > > directory for the drivers to use.
> >> > That's fine for now, not a big deal.  And even if there is an error,
> >> > again, you can always feed that error back into the debugfs subsystem on
> >> > another call and it will handle it correctly.
> >> 
> >> Problem is it isn't, we have a crash because the member isn't a pointer but
> >> an ERR_PTR instead.
> >
> > Again, that is fine, you can feed that into debugfs and it will "just
> > work".  Treat it as an opaque pointer, not a *dentry and you will be
> > fine.
> 
> Hmm, some of the patches add things like:
> 
> +
> +	if (!root)
> +		goto error;
> +
> 	minor->debugfs_root = debugfs_create_dir(name, root);
> 
> Superficially this seems okay, as it looks like debugfs_create_dir()
> doesn't actually cope with NULL values.

Yes it does, it puts things at the root of debugfs.

But why are you checking for NULL here, as the return value of a debugfs
call can never be NULL?

> However, since ->debugfs_root
> comes from debugfs_create_dir() I presume it'll never be NULL on errors
> anyway but rather an error pointer!

That is correct.

> So I think we probably need to go through the drm subsystem and look for
> existing similar patterns in fix them.

Please do.  I know I made one pass at it a while ago but I think someone
else went through and cleaned them up again.

thanks,

greg k-h
