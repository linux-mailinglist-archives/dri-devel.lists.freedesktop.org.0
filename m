Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC149345D87
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 13:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA216E8D3;
	Tue, 23 Mar 2021 12:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B872E6E8D4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 12:00:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g25so10931227wmh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 05:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=FVtKo5jWx+3SADF4ukoqEH4dm/CLnkXyOS/C8B/YN74=;
 b=FERWySWSOM/W7EFVRKsXbUsUBktYQ2g0wNeTUma34kmuD7xrWuD5y5ZBNOLeX6s/uQ
 YmE7WR3db7FJTJJkLhvV1yap0Ehurf1atRYcqIgno5djdYvn69PUGwB1ZSNfdiKgFTV3
 2KWGpisExOBGA2hZ68BtWc06f7AQYDbgCclhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FVtKo5jWx+3SADF4ukoqEH4dm/CLnkXyOS/C8B/YN74=;
 b=tHVoqr6JG8pl86D/TCAYyq/ilQBQajzAUb3pNlJqVBnlz0e6jMf0pCeRZ+j+okHBBc
 5NWloqHeNM+ynwjMWgBzx4kYSOeNZ9/j245u4LQcqc5rGB8zfEIvNqAdA6cDsi1xGXHn
 m0j+Ko6tv68enRST4wB4CJh4gCUd5Lrrt3PjUqnM1ZgMbLYO1eEac/1zlfXR7v7vPjqf
 q22wc8HhDY4B3XMBoQVbaWjlhsCdyeu0C6s1sNkpuhN8w+MOSYlZIDK0nh4RALYz3mjC
 PvGTvFYXVYzJo+B9KOsZvlTtRmEkzk+j6XwKFfVKCThcqeS8V6bJD/QTPuqO5Oe9P7zu
 e3tQ==
X-Gm-Message-State: AOAM5304QGn2ICFKMhiR/MLT9h5VWHnNQ8Bs6OtaxH9Gelc30EUT2tJ2
 uijj4YUAitXMn4pqsOUV73E0ig==
X-Google-Smtp-Source: ABdhPJxARHVEyqF19UyUbqTXsQiNOuv2yKBtCTkGaA8qrztykEOb1q+KlOZakO4Qh5lWRW5aoJHbyg==
X-Received: by 2002:a1c:6243:: with SMTP id w64mr454513wmb.0.1616500832352;
 Tue, 23 Mar 2021 05:00:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k24sm2213978wmr.48.2021.03.23.05.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 05:00:31 -0700 (PDT)
Date: Tue, 23 Mar 2021 13:00:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFnYXdQlRnq1Vn8g@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Michal Hocko <mhocko@suse.com>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
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
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 12:51:13PM +0100, Christian K=F6nig wrote:
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

Yeah this is only for testing. There's two ways to test your shrinker:

- drive system agains the OOM wall, deal with lots of unrelated hangs and
  issues. Aside from this takes postively forever, which is not good if
  you want CI turn-around time measured in "coffee breaks" as time unit.

- have a debugfs file which reconstructs the calling context of direct
  reclaim sufficiently for lockdep to do its thing, and then test just
  your shrinker in isolation, without crashing your CI machines or even
  hurting it much.

Only one of these options is actually practical.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
