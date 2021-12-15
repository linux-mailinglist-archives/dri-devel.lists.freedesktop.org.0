Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B14765F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 23:33:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACF610F504;
	Wed, 15 Dec 2021 22:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C8810F4F9;
 Wed, 15 Dec 2021 22:32:56 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v203so59301470ybe.6;
 Wed, 15 Dec 2021 14:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nSNOK8CGzWG9o4EGKDRvXn+fAqlzalal6kJk2SdxUWo=;
 b=eC3NXcU4yGFKm5xMZeM4MGZaoslKrXV15YqG9yBjzGPizZgAP/O904vvsxhGYfCISP
 Y5VikEXhCSNPAeJdZQCSSqtd7jJbOAAi95PSnVadBG3qYrykd0h/vjfOkivZ29US7uE3
 mdav2zA/5s374hFZNnCTleWV0en0dkCmxu1LobprFcDQZk/Z3rExavhnCAewTbpVu6Iu
 oCJbryNIyTBMNLUvlGsFNMuVs2IDMjOfl80j2P5CEenf3T1WL7BDMbx9INxqOAsf3MGD
 8LxAVF9xYTJ4BPUD9nzosV/gus7ZKXKFUdtOLKmnQ5An52ysUM6k7isTwdclZAiVte+8
 YjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nSNOK8CGzWG9o4EGKDRvXn+fAqlzalal6kJk2SdxUWo=;
 b=tX93Ka0IqHaAq3D4TGfAijpWxzwSOe4wCOhKZjaQyzC24l3mjtfPg9WCj3yNF2J4z3
 QCIjA/G7GJHlDppVKi7aCPRGYIAVeFgqSyQr0OyEqoPIR568SLnOLGmM4Q4uw2y13ecg
 bAqs/N8g9zKfaX/aEDkt7DIizKwhBaTg6CqWgmRDegTwloiPgL75d1jCZBlDAva6Ih34
 MBjgyYZ6fAx/yw2dkexlVp4S1tnzr2yH9dy5FtYLiljSzMVN02cBB8gNYuwhEz1eknqi
 DHu0hTflTw3vF99pz+NCHDaO5UzbC1HvgnJOS22qKMx/enm661DmqIrQVNlGdypI/Xie
 6wNw==
X-Gm-Message-State: AOAM533hqoxApIWzF1/ZLKo60VL16uHj5iIJH4TgkEDBj7PB7O+dUjn+
 QbpTNBCJjUBfowPslgaaddtBDAcHz7s6/XdHWrreE6Lwwvc=
X-Google-Smtp-Source: ABdhPJxuFgIpoX7ccNghqERlx0qK6BbUWdm7zRvty5ahz4/qwp9TldKuNmT8joe6rdMvzt4WiWsrSmoMEPc5gpORnVE=
X-Received: by 2002:a05:6902:1507:: with SMTP id
 q7mr9583142ybu.671.1639607575998; 
 Wed, 15 Dec 2021 14:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20211209102335.18321-1-christian.koenig@amd.com>
 <b6acb31c-ec63-4242-32da-a35e950e5a67@sfritsch.de>
 <8aee128c-0699-5057-2655-4f7d91ac235b@gmail.com>
In-Reply-To: <8aee128c-0699-5057-2655-4f7d91ac235b@gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 16 Dec 2021 08:32:44 +1000
Message-ID: <CACAvsv7D7=Mud1YQ+GACFAqdvBGNp3rjY-eudkXy3uaefY6q+Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: wait for the exclusive fence after
 the shared ones v2
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, dmoulding@me.com,
 Stefan Fritsch <sf@sfritsch.de>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Dec 2021 at 19:19, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 11.12.21 um 10:59 schrieb Stefan Fritsch:
> > On 09.12.21 11:23, Christian K=C3=B6nig wrote:
> >> Always waiting for the exclusive fence resulted on some performance
> >> regressions. So try to wait for the shared fences first, then the
> >> exclusive fence should always be signaled already.
> >>
> >> v2: fix incorrectly placed "(", add some comment why we do this.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > Tested-by: Stefan Fritsch <sf@sfritsch.de>
>
> Thanks.
>
> >
> > Please also add a cc for linux-stable, so that this is fixed in 5.15.x
>
> Sure, but I still need some acked-by or rb from one of the Nouveau guys.
> So gentle ping on that.
Acked-by: Ben Skeggs <bskeggs@redhat.com>

>
> Regards,
> Christian.
>
> >
> > Cheers,
> > Stefan
> >
> >> ---
> >>   drivers/gpu/drm/nouveau/nouveau_fence.c | 28 +++++++++++++----------=
--
> >>   1 file changed, 15 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> b/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> index 05d0b3eb3690..0ae416aa76dc 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> >> @@ -353,15 +353,22 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
> >> struct nouveau_channel *chan, bool e
> >>             if (ret)
> >>               return ret;
> >> -    }
> >>   -    fobj =3D dma_resv_shared_list(resv);
> >> -    fence =3D dma_resv_excl_fence(resv);
> >> +        fobj =3D NULL;
> >> +    } else {
> >> +        fobj =3D dma_resv_shared_list(resv);
> >> +    }
> >>   -    if (fence) {
> >> +    /* Waiting for the exclusive fence first causes performance
> >> regressions
> >> +     * under some circumstances. So manually wait for the shared
> >> ones first.
> >> +     */
> >> +    for (i =3D 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
> >>           struct nouveau_channel *prev =3D NULL;
> >>           bool must_wait =3D true;
> >>   +        fence =3D rcu_dereference_protected(fobj->shared[i],
> >> +                        dma_resv_held(resv));
> >> +
> >>           f =3D nouveau_local_fence(fence, chan->drm);
> >>           if (f) {
> >>               rcu_read_lock();
> >> @@ -373,20 +380,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
> >> struct nouveau_channel *chan, bool e
> >>             if (must_wait)
> >>               ret =3D dma_fence_wait(fence, intr);
> >> -
> >> -        return ret;
> >>       }
> >>   -    if (!exclusive || !fobj)
> >> -        return ret;
> >> -
> >> -    for (i =3D 0; i < fobj->shared_count && !ret; ++i) {
> >> +    fence =3D dma_resv_excl_fence(resv);
> >> +    if (fence) {
> >>           struct nouveau_channel *prev =3D NULL;
> >>           bool must_wait =3D true;
> >>   -        fence =3D rcu_dereference_protected(fobj->shared[i],
> >> -                        dma_resv_held(resv));
> >> -
> >>           f =3D nouveau_local_fence(fence, chan->drm);
> >>           if (f) {
> >>               rcu_read_lock();
> >> @@ -398,6 +398,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
> >> struct nouveau_channel *chan, bool e
> >>             if (must_wait)
> >>               ret =3D dma_fence_wait(fence, intr);
> >> +
> >> +        return ret;
> >>       }
> >>         return ret;
>
