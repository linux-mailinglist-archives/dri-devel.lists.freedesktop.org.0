Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB2314FD37
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 14:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0476EABF;
	Sun,  2 Feb 2020 13:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFE86EABD
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2020 13:17:12 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id g64so11027637otb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Feb 2020 05:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JexwpZ7uOUAzO/bZPt69XOsxgXW5ev8PRFd02TcEk8=;
 b=IE+nMVkXga9fWUwZKPOjqNIk95sq5yO14vZeu1ludYC7s0JaU1fr2jelppwPGlACgG
 83h28kTdOijU1EWLsvch7JEqnA+Ea0m9DfYb62/uQy108/7UV+m83daOiNSPwAckbp8F
 DpBcwguqXp7EEyyRRPBYZizpZiRhl1W8LshjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JexwpZ7uOUAzO/bZPt69XOsxgXW5ev8PRFd02TcEk8=;
 b=n4J+Wn8nQFWPcwYawqp1TW7aECEdT7Q0Xd4eMIazRS30Eu5ynt+JBH2dFVkqzwLu6Y
 ZAc4PJpOaZvVggCPziUgkSxDx/dpXU4TvwK/cYUPcrgBp3BP0rKdSKFXr3L+7vnr9NIj
 96lMGq/i7UCtd3E38CqoZG1HAvQEVb3HQO+wr1ypd0taBgwyHe1Hp6OqHBydCNA5iX+w
 +TmWW67BmzKcmlFwMga5xEa4CfTJOhTqTQfMl7WCTPqvTh8IlX99XB/do2pNy4hOeQP9
 W350LpJwfJBqAc2wZA1AVOXWCVjNKypNI47+5yi82YLaI1IS4d/y1Htlc+M/pMZDXnvG
 9GNw==
X-Gm-Message-State: APjAAAVXj+vRPgB1NEwO64TFevLAf5uH4FBuouElBLpnSPGTKSj3rfGm
 xW0OwfvfPeCNEhMG8XPuXFy1KVd7JWP3noSzqVAmDA==
X-Google-Smtp-Source: APXvYqyhJpSqQ8at/IdzLDOBcr/4/JYswhhc71+cJLzlo49FIW6k84QX0OWoAy1QjBLh4SW+3pmM+ASFc5nUW+iAsSg=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr14988663otl.188.1580649432010; 
 Sun, 02 Feb 2020 05:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20200201043209.13412-1-hdanton@sina.com>
 <20200201090247.10928-1-hdanton@sina.com>
 <20200201162537.GK1778@kadam>
In-Reply-To: <20200201162537.GK1778@kadam>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 2 Feb 2020 14:17:00 +0100
Message-ID: <CAKMK7uGHuvyrn=WghhHBk2miW__ctVHeDTDKz+XVJ9yLjpS97Q@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Hillf Danton <hdanton@sina.com>,
 David Miller <davem@davemloft.net>, Dave Airlie <airlied@linux.ie>,
 netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 1, 2020 at 5:26 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sat, Feb 01, 2020 at 05:02:47PM +0800, Hillf Danton wrote:
> >
> > On Sat, 1 Feb 2020 09:17:57 +0300 Dan Carpenter wrote:
> > > On Sat, Feb 01, 2020 at 12:32:09PM +0800, Hillf Danton wrote:
> > > >
> > > > Release obj in error path.
> > > >
> > > > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > > > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > > > @@ -196,10 +196,10 @@ static struct drm_gem_object *vgem_gem_c
> > > >           return ERR_CAST(obj);
> > > >
> > > >   ret = drm_gem_handle_create(file, &obj->base, handle);
> > > > - drm_gem_object_put_unlocked(&obj->base);
> > > > - if (ret)
> > > > + if (ret) {
> > > > +         drm_gem_object_put_unlocked(&obj->base);
> > > >           return ERR_PTR(ret);
> > > > -
> > > > + }
> > > >   return &obj->base;
> > >
> > > Oh yeah.  It's weird that we never noticed the success path was broken.
> > > It's been that way for three years and no one noticed at all.  Very
> > > strange.
> > >
> > > Anyway, it already gets freed on error in drm_gem_handle_create() so
> > > we should just delete the drm_gem_object_put_unlocked() here it looks
> > > like.

There's two refcounts here, one is the handle_count, and the other is
the underlying object refcount. I think the code is correct, except if
you race with a 2nd thread which destroys the object (through the
handle) while we still try to read gem_object->size in the caller of
this. So correct fix (I think at least) is to shuffle that temporary
reference on the object (not the handle) we hold while constructing it
around a bit, so there's no use-after free anymore in the case of a
race. I'm typing a patch for this.

Cheers, Daniel

> > Good catch, Dan :P
> > Would you please post a patch sometime convenient next week?
>
> Sure.  Will do.
>
> regards,
> dan carpenter
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
