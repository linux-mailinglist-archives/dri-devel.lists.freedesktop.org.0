Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1204292A6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 16:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9D789FA6;
	Mon, 11 Oct 2021 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C56E89FA6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 14:53:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB6F360EBD;
 Mon, 11 Oct 2021 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633963991;
 bh=kbigrBKDcGfRw9vh8QRP3YnmxFFgxeVijtx0SA6WcKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5lCtfVThFDRJ8dxh+JODr+/qO5i6Yx7I4SgckEkM98lqxQHBAf/4/7/wq8Rc5F3p
 62Qb8lZjjsene/HJi8A0XBbebbZyHVrJDN/Og/CokDXjxn3CIXx4DtH1+wMIZzyMo0
 3+dTIqqXzuu+JjaGHfL9JuaWaO+uHj3axu9eIBdo=
Date: Mon, 11 Oct 2021 16:53:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: Fw: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
Message-ID: <YWRP1AbaRyfKKCiv@kroah.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
 <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
 <DM4PR12MB51368C12F6338C6F245D54B28BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
 <c4f1464d-19b6-04a3-e2d8-a153bfbb050a@amd.com>
 <YWBfvILqkBQ8VSYc@kroah.com>
 <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <936fed94-e56b-e4a6-6d1d-9830e8907d6c@gmail.com>
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

On Mon, Oct 11, 2021 at 04:19:58PM +0200, Christian König wrote:
> > > > > And then throw it away, later, when you want to remove the directory,
> > > > > look it up with a call to debugfs_lookup() and pass that to
> > > > > debugfs_remove() (which does so recursively).
> > > > > 
> > > > > There should never be a need to save, or check, the result of any
> > > > > debugfs call.  If so, odds are it is being used incorrectly.
> > > Yeah, exactly that's the problem I see here.
> > > 
> > > We save the return value because the DRM subsystem is creating a debugfs
> > > directory for the drivers to use.
> > That's fine for now, not a big deal.  And even if there is an error,
> > again, you can always feed that error back into the debugfs subsystem on
> > another call and it will handle it correctly.
> 
> Problem is it isn't, we have a crash because the member isn't a pointer but
> an ERR_PTR instead.

Again, that is fine, you can feed that into debugfs and it will "just
work".  Treat it as an opaque pointer, not a *dentry and you will be
fine.

thanks,

greg k-h
