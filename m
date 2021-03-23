Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A7E345CC9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AB56E0FD;
	Tue, 23 Mar 2021 11:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5670D6E869
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:28:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so945485wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 04:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=D+NyPjsJ+1GW7mDMp5MrVh/C5QY0YA2fly1lgVcTiAk=;
 b=MxJ2KV2cgA5nNI+zvJlpHQd9qdF7OeZ/97M/ZIH7+QuKjpxqgEfvZzGEWdrOBsuxV4
 c1qoZ7ouegY596ymeKbbrAIw3ir2EWvKrq7bvyq4DhBHQwjQW62mEV4wsufiTa+QdHZT
 MkH7/RFpIvdW/rrAArbN5EGAftbWn7qYsza7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=D+NyPjsJ+1GW7mDMp5MrVh/C5QY0YA2fly1lgVcTiAk=;
 b=Oxo6R1E54VfkvNniUG3UrbOWVetQOHsEEpIFMYCtPzkx7BlVi6aBlrNvcKFXixhble
 UwVd9fyNYQifayBtkjHzl/qg1jee5IZG9Fiq86dxWwfWXg/ukTzzUhtGEgSesSXpYK1r
 9siwFiCgH32QZkCXX0W6YNoniGryYp7uAOR6KRh8deqG/dCHfEujoFAYwKqz4MQ1siR/
 at+H/mV4Yhq7ki+RRErcwPdF3L+2TDgQhmt/8FSOPx8wUcO1b/yqJA+LuW0GpearSnlE
 VyuwZY+aBN/O6s6gAlW+JeD/uDm8ZLe5l7OYUjfbMH8Nh9esIMTQGe2eFETHPXmn8Hkz
 lSTA==
X-Gm-Message-State: AOAM5311vxmYKEieaO+grRp3Cw1HGQ2mdDi/A5seocSJneCXMirpLFmo
 NVrKembCGQXsKOH58d4MYJzRrw==
X-Google-Smtp-Source: ABdhPJxKAjL5w3e8FQp+Ic49cpESgWVuGaVDBFqAJucj8k1zAMnKthjdGYROFZOmVrOFhaVxm8SE1g==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr2838646wmk.53.1616498902785; 
 Tue, 23 Mar 2021 04:28:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c11sm24060039wrm.67.2021.03.23.04.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 04:28:21 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:28:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Message-ID: <YFnQ1Lk6BTo8L7pr@phenom.ffwll.local>
Mail-Followup-To: Michal Hocko <mhocko@suse.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
References: <YFT2LSR97rkkPyEP@phenom.ffwll.local>
 <1ae415c4-8e49-5183-b44d-bc92088657d5@gmail.com>
 <CAKMK7uEDhuvSwJj5CX8vHgLb+5zm=rdJPmXwb-VQWdrW6GwQZw@mail.gmail.com>
 <e6e9df3e-cd2b-d80f-205d-6ca1865819b2@gmail.com>
 <YFigZ5+H95c/GI/S@phenom.ffwll.local>
 <20210322140548.GN1719932@casper.infradead.org>
 <YFi+UROYbQERYEEr@dhcp22.suse.cz>
 <CAKMK7uGM6EJvzktrANyeeemRPoW7O0ka-ZyKi==wL1zt3yM=5w@mail.gmail.com>
 <c78457bb-d93a-ff84-1cce-0fb3fa9f0cec@gmail.com>
 <YFma+ZxncvfBd++o@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFma+ZxncvfBd++o@dhcp22.suse.cz>
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 08:38:33AM +0100, Michal Hocko wrote:
> On Mon 22-03-21 20:34:25, Christian K=F6nig wrote:
> > Am 22.03.21 um 18:02 schrieb Daniel Vetter:
> > > On Mon, Mar 22, 2021 at 5:06 PM Michal Hocko <mhocko@suse.com> wrote:
> > > > On Mon 22-03-21 14:05:48, Matthew Wilcox wrote:
> > > > > On Mon, Mar 22, 2021 at 02:49:27PM +0100, Daniel Vetter wrote:
> > > > > > On Sun, Mar 21, 2021 at 03:18:28PM +0100, Christian K=F6nig wro=
te:
> > > > > > > Am 20.03.21 um 14:17 schrieb Daniel Vetter:
> > > > > > > > On Sat, Mar 20, 2021 at 10:04 AM Christian K=F6nig
> > > > > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > > > > Am 19.03.21 um 20:06 schrieb Daniel Vetter:
> > > > > > > > > > On Fri, Mar 19, 2021 at 07:53:48PM +0100, Christian K=
=F6nig wrote:
> > > > > > > > > > > Am 19.03.21 um 18:52 schrieb Daniel Vetter:
> > > > > > > > > > > > On Fri, Mar 19, 2021 at 03:08:57PM +0100, Christian=
 K=F6nig wrote:
> > > > > > > > > > > > > Don't print a warning when we fail to allocate a =
page for swapping things out.
> > > > > > > > > > > > > =

> > > > > > > > > > > > > Also rely on memalloc_nofs_save/memalloc_nofs_res=
tore instead of GFP_NOFS.
> > > > > > > > > > > > Uh this part doesn't make sense. Especially since y=
ou only do it for the
> > > > > > > > > > > > debugfs file, not in general. Which means you've ju=
st completely broken
> > > > > > > > > > > > the shrinker.
> > > > > > > > > > > Are you sure? My impression is that GFP_NOFS should n=
ow work much more out
> > > > > > > > > > > of the box with the memalloc_nofs_save()/memalloc_nof=
s_restore().
> > > > > > > > > > Yeah, if you'd put it in the right place :-)
> > > > > > > > > > =

> > > > > > > > > > But also -mm folks are very clear that memalloc_no*() f=
amily is for dire
> > > > > > > > > > situation where there's really no other way out. For an=
ything where you
> > > > > > > > > > know what you're doing, you really should use explicit =
gfp flags.
> > > > > > > > > My impression is just the other way around. You should tr=
y to avoid the
> > > > > > > > > NOFS/NOIO flags and use the memalloc_no* approach instead.
> > > > > > > > Where did you get that idea?
> > > > > > > Well from the kernel comment on GFP_NOFS:
> > > > > > > =

> > > > > > >   * %GFP_NOFS will use direct reclaim but will not use any fi=
lesystem
> > > > > > > interfaces.
> > > > > > >   * Please try to avoid using this flag directly and instead =
use
> > > > > > >   * memalloc_nofs_{save,restore} to mark the whole scope which
> > > > > > > cannot/shouldn't
> > > > > > >   * recurse into the FS layer with a short explanation why. A=
ll allocation
> > > > > > >   * requests will inherit GFP_NOFS implicitly.
> > > > > > Huh that's interesting, since iirc Willy or Dave told me the op=
posite, and
> > > > > > the memalloc_no* stuff is for e.g. nfs calling into network lay=
er (needs
> > > > > > GFP_NOFS) or swap on top of a filesystems (even needs GFP_NOIO =
I think).
> > > > > > =

> > > > > > Adding them, maybe I got confused.
> > > > > My impression is that the scoped API is preferred these days.
> > > > > =

> > > > > https://www.kernel.org/doc/html/latest/core-api/gfp_mask-from-fs-=
io.html
> > > > > =

> > > > > I'd probably need to spend a few months learning the DRM subsyste=
m to
> > > > > have a more detailed opinion on whether passing GFP flags around =
explicitly
> > > > > or using the scope API is the better approach for your situation.
> > > > yes, in an ideal world we would have a clearly defined scope of the
> > > > reclaim recursion wrt FS/IO associated with it. I've got back to
> > > > https://lore.kernel.org/amd-gfx/20210319140857.2262-1-christian.koe=
nig@amd.com/
> > > > and there are two things standing out. Why does ttm_tt_debugfs_shri=
nk_show
> > > > really require NOFS semantic? And why does it play with
> > > > fs_reclaim_acquire?
> > > It's our shrinker. shrink_show simply triggers that specific shrinker
> > > asking it to shrink everything it can, which helps a lot with testing
> > > without having to drive the entire system against the OOM wall.
> =

> Yes I figured that much. But...
> =

> > > fs_reclaim_acquire is there to make sure lockdep understands that this
> > > is a shrinker and that it checks all the dependencies for us like if
> > > we'd be in real reclaim. There is some drop caches interfaces in proc
> > > iirc, but those drop everything, and they don't have the fs_reclaim
> > > annotations to teach lockdep about what we're doing.
> =

> ... I really do not follow this. You shouldn't really care whether this
> is a reclaim interface or not. Or maybe I just do not understand this...

We're heavily relying on lockdep and fs_reclaim to make sure we get it all
right. So any drop caches interface that isn't wrapped in fs_reclaim
context is kinda useless for testing. Plus ideally we want to only hit our
own paths, and not trash every other cache in the system. Speed matters in
CI.

> > To summarize the debugfs code is basically to test if that stuff really
> > works with GFP_NOFS.
> =

> What do you mean by testing GFP_NOFS. Do you mean to test that GFP_NOFS
> context is sufficiently powerful to reclaim enough objects due to some
> internal constrains?
> =

> > My only concern is that if I could rely on memalloc_no* being used we c=
ould
> > optimize this quite a bit further.
> =

> Yes you can use the scope API and you will be guaranteed that _any_
> allocation from the enclosed context will inherit GFP_NO* semantic.

I think this is where I don't get yet what Christian tries to do: We
really shouldn't do different tricks and calling contexts between direct
reclaim and kswapd reclaim. Otherwise very hard to track down bugs are
pretty much guaranteed. So whether we use explicit gfp flags or the
context apis, result is exactly the same.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
