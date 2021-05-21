Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DD38CD7B
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E216F8D2;
	Fri, 21 May 2021 18:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA4B6F8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 18:31:30 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so7693046otk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ssQbWaPKNXku5OPbuQHoPwspEJ/tPkBoh9sAADSrhpE=;
 b=Uu9hQaJ8bKy4+fr0LTNS3umKVdn2pBLHZTC89+aOZqisuEDloE2AHdKVFw/L4GscOe
 7QcjqpKQBCMOwKXyjfLKRblL5u2LxNv4W3W0bb2NsOkl6qO+W61qzrL2bwCO/GtDdLKF
 V9Z8g06gg5IAQ1e9Fy1CG3HrP7gBiT27yp15o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ssQbWaPKNXku5OPbuQHoPwspEJ/tPkBoh9sAADSrhpE=;
 b=pPjpBkmwTiU254DiKDHM6qamUfzuTjZlN1pxVQSBbCcjG/huJsZT9B3tEQ3hwOTACv
 aayXmDaMc4FsR8ZSg5at5gFL3M28Fvq2CSLxOWxS4qAgB0JSvpphBIPjTXdQo1uLEc9C
 qbPHcOxOB1wWjhECdAxN1pPtmOJY8mX2Rld1eACT/HZzDtsd1KY0V7gCHCHbe+kkS1xE
 ZFel1o6vQXJvLpdZzNznm+uoNdORw/HQwPZf0jC2PvFgWedQs3De33MS7vs6hsIVK0ts
 Q3LIvADyCGAhtlTk92pWRn7NL3wzk5fDzDc1Lr9ZECgsVD/6/FAZoRf+xt5J9P6YF6HZ
 ltXw==
X-Gm-Message-State: AOAM530rBM6PTFSLwEvYU82O6ihgaWpCxZQNQvZpe+L2U55sOzh5+6Ql
 QS7gXWlJZzP8TBPfb83ez++TNho6B3b6LoaFKQAJSA==
X-Google-Smtp-Source: ABdhPJzhfhr27C49nXr2j3YFwIcmfU6rMWfQl0gg9HCxKinGNWcpaTBpO3xe8YnDGQ5ZqRzBbnoGYtfER8u6/HY6jLY=
X-Received: by 2002:a9d:8ce:: with SMTP id 72mr9332384otf.188.1621621889460;
 Fri, 21 May 2021 11:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
In-Reply-To: <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 May 2021 20:31:18 +0200
Message-ID: <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 8:08 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 21.05.21 um 17:16 schrieb Daniel Vetter:
> > On Fri, May 21, 2021 at 05:00:46PM +0200, Bas Nieuwenhuizen wrote:
> >> On Fri, May 21, 2021 at 4:37 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >>> On Fri, May 21, 2021 at 11:46:23AM +0200, Bas Nieuwenhuizen wrote:
> >>>> On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.=
ch> wrote:
> >>>>> ---
> >>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
> >>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_cs.c
> >>>>> index 88a24a0b5691..cc8426e1e8a8 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>>>> @@ -617,8 +617,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_c=
s_parser *p,
> >>>>>          amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> >>>>>                  struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo=
);
> >>>>>
> >>>>> -               /* Make sure we use the exclusive slot for shared B=
Os */
> >>>>> -               if (bo->prime_shared_count)
> >>>>> +               /* Make sure we use the exclusive slot for all pote=
ntially shared BOs */
> >>>>> +               if (!(bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID=
))
> >>>>>                          e->tv.num_shared =3D 0;
> >>>> I think it also makes sense to skip this with
> >>>> AMDGPU_GEM_CREATE_EXPLICIT_SYNC? It can be shared but I don't think
> >>>> anyone expects implicit sync to happen with those.
> >>> Ah yes, I missed this entirely. So the "no implicit flag" is already
> >>> there, and the _only_ thing that's missing really is a way to fish ou=
t the
> >>> implicit fences, and set them.
> >>>
> >>> https://lore.kernel.org/dri-devel/20210520190007.534046-1-jason@jleks=
trand.net/
> >>>
> >>> So I think all that's really needed in radv is not setting
> >>> RADEON_FLAG_IMPLICIT_SYNC for winsys buffers when Jason's dma-buf ioc=
tl
> >>> are present (means you need to do some import/export and keep the fd
> >>> around for winsys buffers, but shouldn't be too bad), and then contro=
l the
> >>> implicit fences entirely explicitly like vk expects.
> >> That is the part I'm less sure about. This is a BO wide flag so we are
> >> also disabling implicit sync in the compositor. If the compositor does
> >> only do read stuff that is ok, as the inserted exclusive fence will
> >> work for that. But as I learned recently the app provided buffer may
> >> end up being written to by the X server which open a whole can of
> >> potential problems if implicit sync gets disabled between Xserver
> >> operations on the app provided buffer. Hence setting that on the WSI
> >> buffer is a whole new can of potential problems and hence I've said a
> >> submission based flag would be preferred.
> >>
> >> I can certainly try it out though.
> > Hm yeah that's the wrong flag. We need a flag on the drm_file which the
> > explicit userspace sets. And which is valid only for itself.
> >
> > There's a nice flags field when creating a ctx, but it's not validated =
and
> > there's already a comment that we have to filter out garbage priority, =
so
> > that's not use. I'll whip up something entirely untested just as a draf=
t.
>
> We could provide an IOCTL for the BO to change the flag.

That's not the semantics we need.

> But could we first figure out the semantics we want to use here?
>
> Cause I'm pretty sure we don't actually need those changes at all and as
> said before I'm certainly NAKing things which break existing use cases.

Please read how other drivers do this and at least _try_ to understand
it. I'm really loosing my patience here with you NAKing patches you're
not even understanding (or did you actually read and fully understand
the entire story I typed up here, and your NAK is on the entire
thing?). There's not much useful conversation to be had with that
approach. And with drivers I mean kernel + userspace here.

That's the other frustration part: You're trying to fix this purely in
the kernel. This is exactly one of these issues why we require open
source userspace, so that we can fix the issues correctly across the
entire stack. And meanwhile you're steadfastily refusing to even look
at that the userspace side of the picture.

Also I thought through your tlb issue, why are you even putting these
tlb flush fences into the shard dma_resv slots? If you store them
somewhere else in the amdgpu private part, the oversync issues goes
away
- in your ttm bo move callback, you can just make your bo copy job
depend on them too (you have to anyway)
- even for p2p there's not an issue here, because you have the
->move_notify callback, and can then lift the tlb flush fences from
your private place to the shared slots so the exporter can see them.

The kernel move fences otoh are a bit more nasty to wring through the
p2p dma-buf interface. That one probably needs something new.
-Daniel

>
> Regards,
> Christian.
>
> > -Daniel
> >
> >
> >
> >>> Are you bored enough to type this up for radv? I'll give Jason's kern=
el
> >>> stuff another review meanwhile.
> >>> -Daniel
> >>>
> >>>>>                  e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> >>>>>          }
> >>>>> --
> >>>>> 2.31.0
> >>>>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> http://blog.ffwll.ch
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
