Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39A345D46
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D166E8C6;
	Tue, 23 Mar 2021 11:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CC96E8C6;
 Tue, 23 Mar 2021 11:47:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616500018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tVCFDSW+Wg+Vv3qM3o+3xBVx/wVrj6oBYyLDMD5T3p0=;
 b=H0klc++nQTU56KJLqJHExfutlIiECMjC7FmYaidwh/64jI6kyCH5SfD1CdgRjN4LmmsGHz
 2HiA6ZSDwvpsXrxCWfAg/VYuHojKhxt6od88uI+dNPP9XQ4OXxN5BqtimGsWlQUg9kG5Nr
 fWfotsS5xltn1xbTLh4C8OFoPie6wgM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C869AE42;
 Tue, 23 Mar 2021 11:46:58 +0000 (UTC)
Date: Tue, 23 Mar 2021 12:46:57 +0100
From: Michal Hocko <mhocko@suse.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFnVMRNmWG+qv+4i@dhcp22.suse.cz>
References: <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz>
 <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 23-03-21 12:28:20, Daniel Vetter wrote:
> On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
[...]
> > > > fs_reclaim_acquire is there to make sure lockdep understands that this
> > > > is a shrinker and that it checks all the dependencies for us like if
> > > > we'd be in real reclaim. There is some drop caches interfaces in proc
> > > > iirc, but those drop everything, and they don't have the fs_reclaim
> > > > annotations to teach lockdep about what we're doing.
> > 
> > ... I really do not follow this. You shouldn't really care whether this
> > is a reclaim interface or not. Or maybe I just do not understand this...
> 
> We're heavily relying on lockdep and fs_reclaim to make sure we get it all
> right. So any drop caches interface that isn't wrapped in fs_reclaim
> context is kinda useless for testing. Plus ideally we want to only hit our
> own paths, and not trash every other cache in the system. Speed matters in
> CI.

But what is special about this path to hack around and make it pretend
it is part of the fs reclaim path?
-- 
Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
