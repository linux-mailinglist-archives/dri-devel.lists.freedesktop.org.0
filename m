Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A13AC726
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 11:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7CC6E9A9;
	Fri, 18 Jun 2021 09:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301E6E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 09:13:08 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 w22-20020a0568304116b02904060c6415c7so9081140ott.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=naLHEsuCCs4Fcb1r5mYO3/AVmqvBmoebiHpV20smRWA=;
 b=GHd7IR2qJU3StSL8QB47NRhFSsRGnHy4mieFnZDwqtAklNf7YBRKDvm/IGy9KBjnS1
 eWpMhv4Sg51xeG4ZfRuiPbZXWh2KWgD/LetEgJ0ZwB8NBngmTRHyiGkntSfaHEZAMRwe
 sqzEQ6yR0Zn4RU38m44TBbeJhAdr2ERNYV3BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=naLHEsuCCs4Fcb1r5mYO3/AVmqvBmoebiHpV20smRWA=;
 b=C9A3Meiaww4w6rDmcuTNAs7Nxo4Bcm4oRbJl4j8mD4Q/0kph8jlm27A+6Rwhl4SPxW
 0zPl/x9nn3AkK6xBmu1pNM2FCqDCETZksD/2H7oU4kSDZ9CjnQwexJ3gY3UlAQASX3Uc
 sOMcb7maKdzk75vhDIaqjpOfl1GN7KPSioFZ6wJAliPbFsF91N4OYRLGwGNFUe0EIXRC
 tZZ2j3+wq7lyx9hp2hVGaE3ugTsJx4Milm6njyyG/KsHhwGRUTXweQtWJ1nDbUjvJOgE
 oqQv/RMh0mIEq669sfIGDOrYPx5xV4YVsS93O2c2EL/ZnRIviXgmPkbt1bGKnxBJjXjy
 gg4w==
X-Gm-Message-State: AOAM530sgw89R/JXL8/akfT+bcyH6Mq61zEf7hmCU6XioYfanaPtyAhd
 6A+XF9YsYeH61n/MgI+DW/yybQxkssmUbCYHHWQgLQ==
X-Google-Smtp-Source: ABdhPJxgpitxyVtOLxsFHGCQMUCu/rZqASW5/KbUvmThXsKPZTwp9fwtH9L3/bRNWE5tLQeLoP0eBWfvljngPPaBFEo=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr8438414otb.281.1624007588286; 
 Fri, 18 Jun 2021 02:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-3-desmondcheongzx@gmail.com>
 <YMuCYqLafn5sGcFo@phenom.ffwll.local>
 <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
In-Reply-To: <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 11:12:57 +0200
Message-ID: <CAKMK7uE-3S_vOm7DsqFyvHngSTwoc5ibzt46-9FcC550Qd9+jw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 5:05 AM Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
> On 18/6/21 1:12 am, Daniel Vetter wrote:
> > On Tue, Jun 15, 2021 at 10:36:45AM +0800, Desmond Cheong Zhi Xi wrote:
> >> This patch ensures that the device's master mutex is acquired before
> >> accessing pointers to struct drm_master that are subsequently
> >> dereferenced. Without the mutex, the struct drm_master may be freed
> >> concurrently by another process calling drm_setmaster_ioctl(). This
> >> could then lead to use-after-free errors.
> >>
> >> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> >> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >> ---
> >>   drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
> >>   1 file changed, 43 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> >> index da4f085fc09e..3e6f689236e5 100644
> >> --- a/drivers/gpu/drm/drm_lease.c
> >> +++ b/drivers/gpu/drm/drm_lease.c
> >> @@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
> >>    */
> >>   bool _drm_lease_held(struct drm_file *file_priv, int id)
> >>   {
> >> +    bool ret;
> >> +
> >>      if (!file_priv || !file_priv->master)
> >>              return true;
> >>
> >> -    return _drm_lease_held_master(file_priv->master, id);
> >> +    mutex_lock(&file_priv->master->dev->master_mutex);
> >
> > So maybe we have a bug somewhere, and the kerneldoc isn't 100% clear, but
> > I thought file_priv->master is invariant over the lifetime of file_priv.
> > So we don't need a lock to check anything here.
> >
> > It's the drm_device->master derefence that gets us into trouble. Well also
> > file_priv->is_owner is protected by dev->master_mutex.
> >
> > So I think with your previous patch all the access here in drm_lease.c is
> > ok and already protected? Or am I missing something?
> >
> > Thanks, Daniel
> >
>
> My thinking was that file_priv->master is invariant only if it is the
> creator of master. If file_priv->is_master is false, then a call to
> drm_setmaster_ioctl will invoke drm_new_set_master, which then allocates
> a new master for file_priv, and puts the old master.
>
> This could be an issue in _drm_lease_held_master, because we dereference
> master to get master->dev, master->lessor, and master->leases.
>
> With the same reasoning, in other parts of drm_lease.c, if there's an
> access to drm_file->master that's subsequently dereferenced, I added a
> lock around them.
>
> I could definitely be mistaken on this, so apologies if this scenario
> doesn't arise.

You're right, I totally missed that setmaster can create a new master
instance. And the kerneldoc for drm_file->master doesn't explain this
and mention that we must hold drm_device.master_mutex while looking at
that pointer. Can you pls do a patch which improves the documentation
for that?

Now for the patch itself I'm not entirely sure what we should do.
Leaking the dev->master_mutex into drm_lease.c just because of the
setmaster ioctl is kinda unsightly. And we don't really care about the
fpriv->master changing under us, we only need to make sure it doesn't
get freed. And drm_master is refcounted already.

So alternative solution: We add a drm_file_get_master() function which
calls drm_master_get under the lock, and we use that instead of
directly derefencing drm_file->master? Ofc then needs drm_master_put
instead of mutex_unlock. Kerneldoc should then also point at this new
function as the correct way to look at drm_file->master state.

This way it's 100% clear we're dealing with a lifetime issue and not a
consistency issues.

What do you think?
-Daniel


>
> Best wishes,
> Desmond
>
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
