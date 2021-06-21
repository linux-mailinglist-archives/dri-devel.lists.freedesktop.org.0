Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E83AECD8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB746E1F8;
	Mon, 21 Jun 2021 15:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F5B6E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 15:53:28 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 v22-20020a0568301416b029044e2d8e855eso8983320otp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9ZbRwuIdQDNCcz/pnU9BDxlzoJgaD/x3T5Lkco7n4mA=;
 b=W3Z0uj9rKqdn6ZJWrTqOx/GtU569/5Kcpkjwszw5lCOk8Gp6wuyWlqD3Byp4rw7G8X
 H3GmU5dUycsvTjdwpOEFg0p5gVdvqtlcSZhrwPFr95/yWe267UjjvfxbxHiPNzA0zDC0
 1YhasX4QWal1E+Z/ANTRSPBCkY1v4jwrVzhb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9ZbRwuIdQDNCcz/pnU9BDxlzoJgaD/x3T5Lkco7n4mA=;
 b=PCt0+Hitdq0TWyNO9X4a+OSAQ/3VJHa++bJEZ1z07nSoo3N/PtSD3NKSkUNEabD3bL
 j8FoBd0tlu29UCzk+9WV+nOC4vqxGFCZziSDJVgFFPeMQ5xq2Cu+MSqhb09ndi1ie19Z
 iKnX3fvsxRzmu1KSLhVzjQ/ewI1lO1N0qlro+wYdpvMUlg9h42UKTWzxbcIKIOxEFvM2
 cva9az0OQRmXf8yDEMGdABtUeCNkUpVdqSgR21M/J/GceLCTySuXJspxWRTp8hfR2PMV
 eLHbwvUCIWi49mgNvrnKL41Pd4n8gBCeuqtEhtTMkcjZur7YsKHlBiLq7BY+g5808MfC
 y94w==
X-Gm-Message-State: AOAM532Z2WSJeFOq4wN1Msf6Aq93XWF1VcVsM++N2VJf5tf615PKuPRc
 gz4i9KsUeI0TkK5ppF83W5mpNEBmgm7K8NWSVY1HTg==
X-Google-Smtp-Source: ABdhPJytSq1TwW8sX7+Gd2OBgr6JZnE1MbVUqfwzWKowqyJPkP+thwgGRIJhAysYcpdKL8914lI9tz4uvczAUxKpTh8=
X-Received: by 2002:a05:6830:2370:: with SMTP id
 r16mr21533959oth.188.1624290808187; 
 Mon, 21 Jun 2021 08:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
 <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
In-Reply-To: <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 21 Jun 2021 17:53:15 +0200
Message-ID: <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 5:49 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.06.21 um 16:54 schrieb Daniel Vetter:
> > On Mon, Jun 21, 2021 at 03:03:26PM +0200, Christian K=C3=B6nig wrote:
> >> We actually need to wait for the moving fence after pinning
> >> the BO to make sure that the pin is completed.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> CC: stable@kernel.org
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_prime.c | 8 +++++++-
> >>   1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm=
/nouveau/nouveau_prime.c
> >> index 347488685f74..591738545eba 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> >> @@ -93,7 +93,13 @@ int nouveau_gem_prime_pin(struct drm_gem_object *ob=
j)
> >>      if (ret)
> >>              return -EINVAL;
> >>
> >> -    return 0;
> >> +    if (nvbo->bo.moving) {
> > Don't we need to hold the dma_resv to read this? We can grab a referenc=
e
> > and then unlock, but I think just unlocked wait can go boom pretty easi=
ly
> > (since we don't hold a reference or lock so someone else can jump in an=
d
> > free the moving fence).
>
> The moving fence is only modified while the BO is moved and since we
> have just successfully pinned it....

Yeah  ... so probably correct, but really tricky. Just wrapping a
ttm_bo_reserve/unreserve around the code you add should be enough and
get the job done?

> But in general I agree that it would be better to avoid this. I just
> didn't wanted to open a bigger can of worms by changing nouveau so much.

Yeah, but I'm kinda thinking of some helpers to wait for the move
fence (so that later on we can switch from having the exclusive fence
to the move fence do that, maybe). And then locking checks in there
would be nice.

Also avoids the case of explaining why lockless here is fine, but
lockless wait for the exclusive fence in e.g. a dynami dma-buf
importer is very much not fine at all. Just all around less trouble.
-Daniel

>
> Christian.
>
> > -Daniel
> >
> >> +            ret =3D dma_fence_wait(nvbo->bo.moving, true);
> >> +            if (ret)
> >> +                    nouveau_bo_unpin(nvbo);
> >> +    }
> >> +
> >> +    return ret;
> >>   }
> >>
> >>   void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
