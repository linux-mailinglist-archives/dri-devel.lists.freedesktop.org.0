Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D29345D9A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0BA6E8CF;
	Tue, 23 Mar 2021 12:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26AC6E8CF;
 Tue, 23 Mar 2021 12:06:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1616501159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubkNv0IBq9hFDX1nFQfvcQDGdBJM58OvXcv+fHHXwRE=;
 b=Q0cBfWAKpz0mIo+FE3mbbdmuM+ij28enHdJQhee5v9eHvN6yRojHDoNMMQsc2l4gP6DCSY
 X0Edvz00l2QWoysRCcVX7Y/aPFsq5YyNfjbvgpb3bNq/VJqCMOZaNjxj9raYIOAwTRC2RY
 z1O+TdpGTCboqRQOWIx9Ip3UdoKhalo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C003AD6D;
 Tue, 23 Mar 2021 12:05:59 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:05:58 +0100
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFnZpjym0vfOU+Nr@dhcp22.suse.cz>
References: <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz>
 <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
 <YFnVMRNmWG+qv+4i@dhcp22.suse.cz>
 <d1d7170b-7566-32c3-9883-49e5573e7339@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1d7170b-7566-32c3-9883-49e5573e7339@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 23-03-21 12:51:13, Christian K=F6nig wrote:
> =

> =

> Am 23.03.21 um 12:46 schrieb Michal Hocko:
> > On Tue 23-03-21 12:28:20, Daniel Vetter wrote:
> > > On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
> > [...]
> > > > > > fs_reclaim_acquire is there to make sure lockdep understands th=
at this
> > > > > > is a shrinker and that it checks all the dependencies for us li=
ke if
> > > > > > we'd be in real reclaim. There is some drop caches interfaces i=
n proc
> > > > > > iirc, but those drop everything, and they don't have the fs_rec=
laim
> > > > > > annotations to teach lockdep about what we're doing.
> > > > ... I really do not follow this. You shouldn't really care whether =
this
> > > > is a reclaim interface or not. Or maybe I just do not understand th=
is...
> > > We're heavily relying on lockdep and fs_reclaim to make sure we get i=
t all
> > > right. So any drop caches interface that isn't wrapped in fs_reclaim
> > > context is kinda useless for testing. Plus ideally we want to only hi=
t our
> > > own paths, and not trash every other cache in the system. Speed matte=
rs in
> > > CI.
> > But what is special about this path to hack around and make it pretend
> > it is part of the fs reclaim path?
> =

> That's just to teach lockdep that there is a dependency.
> =

> In other words we pretend in the debugfs file that it is part of the fs
> reclaim path to check for the case when it really becomes part of the fs
> reclaim path.

OK, our emails crossed and I can see your response only after replying
to your other email. OK, this makes more sense now. But as pointed in
other email this will likely not do what you think. Let's continue
discussing in the other subthread to reduce the further confusion.
-- =

Michal Hocko
SUSE Labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
