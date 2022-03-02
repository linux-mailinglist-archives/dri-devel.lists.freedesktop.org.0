Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17B94CB915
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1831D10EF39;
	Thu,  3 Mar 2022 08:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53ED010E881
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 17:39:48 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d07ae0b1bfso26703817b3.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 09:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dy0qp9jCXbPntD4DO3PEqENN3OVYL+ttjW34ldJW1N4=;
 b=rTJfN+ckozxJqKGtZdlPXeI5MVQrMQ7QYGCs1ZhDMe8r2zXJq7AwPE9maiPiKm5tav
 EgbvovAvWOJfuknYH5parBhdU3qRQK4eMmIYWiEp7x5GJJBP7ra7Kl3rz53i/RHxLpzP
 zgzh3fTH5pdVdMlyEmhfkwh+WNVeD6hkUpPi8HerSTOOSMSUJJUsBJF3EFe7qVWDs7la
 6r/xb4sukN/LGC3kyUnrNw6cUIQtBRLOPsmxvc1Lh6l33IW2fnLGd8RKeaoy2ayrItR3
 2ElcH/l9yxhiSPl0PxtmRdmVV2I5BZtCf8bxzSuACzD4hRo85rMVG7E4HuBgbmfI/a1w
 GieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dy0qp9jCXbPntD4DO3PEqENN3OVYL+ttjW34ldJW1N4=;
 b=VwdxrPGrBUi+iandNHSyboB3J9aRAKcjjmQ9B3m4UqZJy9SeS6SeS4bvhMWVpHKp31
 XX3meAHSboCxgWmjxRdAYeIBuMDjfjIcsamAHL3xM14AL5D984HO8s0enmO6WhYA4BAH
 pPK37pm2IVhgHNsuxXNIU0sCdFseLxjH+yCPZHkBt/BCt8+dhlt3eid1joizn128o4o8
 u5uWK/cZ3tJQtTX42NgA2W/iLPVs0torS8p+JEAEsXLME9W9PdrPzgDAim4g07E+0Aep
 SP24XOLphSolDY6VGg4iC+6NXuCHZzRApZshRs7jE9w/hDD8rE3eJPUt54niz7ivCq++
 pBJA==
X-Gm-Message-State: AOAM530xsqtWzLPfgWwv4jNqLES1q1unyxk4ceTDFXfICMZqqsDvIJnL
 WOW+YIrS8ThIkYFiQNZyr+qefSZbKH/XVxS8eCSiWiAhkt+GkA==
X-Google-Smtp-Source: ABdhPJwM4h3zmVhxZWOdwwslRdmHI5+XE2WwkEuYJT7++2fJnN/8iiL5UJDntVOMznD5AVyPzNpImUScUkfHYUpQ9Ek=
X-Received: by 2002:a81:1d51:0:b0:2ca:73e5:9bd6 with SMTP id
 d78-20020a811d51000000b002ca73e59bd6mr31774376ywd.490.1646242787212; Wed, 02
 Mar 2022 09:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-5-christian.koenig@amd.com>
 <YcOWyHzY22ZCCvef@phenom.ffwll.local>
 <95929048-b381-78d1-462c-e7b910c784b0@gmail.com>
 <YeGlbLXXuUITZlQP@phenom.ffwll.local>
 <0b7b9a9f-65d8-706e-163b-5363df426c8b@gmail.com>
In-Reply-To: <0b7b9a9f-65d8-706e-163b-5363df426c8b@gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 2 Mar 2022 11:39:36 -0600
Message-ID: <CAOFGe97FoE7LZeUutMgi_THR9GAjvRNqfdroSFqPsjyWVqp83Q@mail.gmail.com>
Subject: Re: [PATCH 04/24] dma-buf: add dma_resv_get_singleton v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008bd1ee05d93fc430"
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:33:09 +0000
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008bd1ee05d93fc430
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 5:26 AM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 14.01.22 um 17:31 schrieb Daniel Vetter:
> > On Mon, Jan 03, 2022 at 12:13:41PM +0100, Christian K=C3=B6nig wrote:
> >> Am 22.12.21 um 22:21 schrieb Daniel Vetter:
> >>> On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian K=C3=B6nig wrote:
> >>>> Add a function to simplify getting a single fence for all the fences
> in
> >>>> the dma_resv object.
> >>>>
> >>>> v2: fix ref leak in error handling
> >>>>
> >>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>> ---
> >>>>    drivers/dma-buf/dma-resv.c | 52
> ++++++++++++++++++++++++++++++++++++++
> >>>>    include/linux/dma-resv.h   |  2 ++
> >>>>    2 files changed, 54 insertions(+)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> >>>> index 480c305554a1..694716a3d66d 100644
> >>>> --- a/drivers/dma-buf/dma-resv.c
> >>>> +++ b/drivers/dma-buf/dma-resv.c
> >>>> @@ -34,6 +34,7 @@
> >>>>     */
> >>>>    #include <linux/dma-resv.h>
> >>>> +#include <linux/dma-fence-array.h>
> >>>>    #include <linux/export.h>
> >>>>    #include <linux/mm.h>
> >>>>    #include <linux/sched/mm.h>
> >>>> @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_resv *obj,
> bool write,
> >>>>    }
> >>>>    EXPORT_SYMBOL_GPL(dma_resv_get_fences);
> >>>> +/**
> >>>> + * dma_resv_get_singleton - Get a single fence for all the fences
> >>>> + * @obj: the reservation object
> >>>> + * @write: true if we should return all fences
> >>>> + * @fence: the resulting fence
> >>>> + *
> >>>> + * Get a single fence representing all the fences inside the resv
> object.
> >>>> + * Returns either 0 for success or -ENOMEM.
> >>>> + *
> >>>> + * Warning: This can't be used like this when adding the fence back
> to the resv
> >>>> + * object since that can lead to stack corruption when finalizing t=
he
> >>>> + * dma_fence_array.
> >>> Uh I don't get this one? I thought the only problem with nested fence=
s
> is
> >>> the signalling recursion, which we work around with the irq_work?
> >> Nope, the main problem is finalizing the dma_fence_array.
> >>
> >> E.g. imagine that you build up a chain of dma_fence_array objects like
> this:
> >> a<-b<-c<-d<-e<-f.....
> >>
> >> With each one referencing the previous dma_fence_array and then you ca=
ll
> >> dma_fence_put() on the last one. That in turn will cause calling
> >> dma_fence_put() on the previous one, which in turn will cause
> >> dma_fence_put() one the one before the previous one etc....
> >>
> >> In other words you recurse because each dma_fence_array instance drops
> the
> >> last reference of it's predecessor.
> >>
> >> What we could do is to delegate dropping the reference to the containi=
ng
> >> fences in a dma_fence_array as well, but that would require some
> changes to
> >> the irq_work_run_list() function to be halve way efficient.o
> >>
> >>> Also if there's really an issue with dma_fence_array fences, then tha=
t
> >>> warning should be on the dma_resv kerneldoc, not somewhere hidden lik=
e
> >>> this. And finally I really don't see what can go wrong, sure we'll en=
d
> up
> >>> with the same fence once in the dma_resv_list and then once more in t=
he
> >>> fence array. But they're all refcounted, so really shouldn't matter.
> >>>
> >>> The code itself looks correct, but me not understanding what even goe=
s
> >>> wrong here freaks me out a bit.
> >> Yeah, IIRC we already discussed that with Jason in length as well.
> >>
> >> Essentially what you can't do is to put a dma_fence_array into another
> >> dma_fence_array without causing issues.
> >>
> >> So I think we should maybe just add a WARN_ON() into
> dma_fence_array_init()
> >> to make sure that this never happens.
> > Yeah I think this would be much clearer instead of sprinkling half the
> > story as a scary&confusing warning over all kinds of users which
> > internally use dma fence arrays.
>

Agreed.  WARN_ON in dma_fence_array_init() would be better for everyone, I
think.


> > And then if it goes boom I guess we could fix it internally in
> > dma_fence_array_init by flattening fences down again. But only if
> actually
> > needed.
>
> Ok, going to do that first then.
>

Sounds good.  This patch looks pretty reasonable to me.  I do have a bit of
a concern with how it's being used to replace calls to
dma_resv_excl_fence() in later patches, though.  In particular, this may
allocate memory whereas dma_resv_excl_fence() does not so we need to be
really careful in each of the replacements that doing so is safe.  That's a
job for the per-driver reviewers but I thought I'd drop a note here so
we're all aware of and watching for it.

--Jason


> >
> > What confused me is why dma_resv is special, and from your reply it
> sounds
> > like it really isn't.
>
> Well, it isn't special in any way. It's just something very obvious
> which could go wrong.
>
> Regards,
> Christian.
>
> > -Daniel
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>> I guess something to figure out next year, I kinda hoped I could
> squeeze a
> >>> review in before I disappear :-/
> >>> -Daniel
> >>>
> >>>> + */
> >>>> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> >>>> +                     struct dma_fence **fence)
> >>>> +{
> >>>> +  struct dma_fence_array *array;
> >>>> +  struct dma_fence **fences;
> >>>> +  unsigned count;
> >>>> +  int r;
> >>>> +
> >>>> +  r =3D dma_resv_get_fences(obj, write, &count, &fences);
> >>>> +        if (r)
> >>>> +          return r;
> >>>> +
> >>>> +  if (count =3D=3D 0) {
> >>>> +          *fence =3D NULL;
> >>>> +          return 0;
> >>>> +  }
> >>>> +
> >>>> +  if (count =3D=3D 1) {
> >>>> +          *fence =3D fences[0];
> >>>> +          kfree(fences);
> >>>> +          return 0;
> >>>> +  }
> >>>> +
> >>>> +  array =3D dma_fence_array_create(count, fences,
> >>>> +                                 dma_fence_context_alloc(1),
> >>>> +                                 1, false);
> >>>> +  if (!array) {
> >>>> +          while (count--)
> >>>> +                  dma_fence_put(fences[count]);
> >>>> +          kfree(fences);
> >>>> +          return -ENOMEM;
> >>>> +  }
> >>>> +
> >>>> +  *fence =3D &array->base;
> >>>> +  return 0;
> >>>> +}
> >>>> +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
> >>>> +
> >>>>    /**
> >>>>     * dma_resv_wait_timeout - Wait on reservation's objects
> >>>>     * shared and/or exclusive fences.
> >>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> >>>> index fa2002939b19..cdfbbda6f600 100644
> >>>> --- a/include/linux/dma-resv.h
> >>>> +++ b/include/linux/dma-resv.h
> >>>> @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dma_resv
> *obj, uint64_t context,
> >>>>    void dma_resv_add_excl_fence(struct dma_resv *obj, struct
> dma_fence *fence);
> >>>>    int dma_resv_get_fences(struct dma_resv *obj, bool write,
> >>>>                            unsigned int *num_fences, struct dma_fenc=
e
> ***fences);
> >>>> +int dma_resv_get_singleton(struct dma_resv *obj, bool write,
> >>>> +                     struct dma_fence **fence);
> >>>>    int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv
> *src);
> >>>>    long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all,
> bool intr,
> >>>>                               unsigned long timeout);
> >>>> --
> >>>> 2.25.1
> >>>>
>
>

--0000000000008bd1ee05d93fc430
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jan 17, 2022 at 5:26 AM Christian K=C3=B6nig &lt;<a href=3D"=
mailto:ckoenig.leichtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am=
 14.01.22 um 17:31 schrieb Daniel Vetter:<br>
&gt; On Mon, Jan 03, 2022 at 12:13:41PM +0100, Christian K=C3=B6nig wrote:<=
br>
&gt;&gt; Am 22.12.21 um 22:21 schrieb Daniel Vetter:<br>
&gt;&gt;&gt; On Tue, Dec 07, 2021 at 01:33:51PM +0100, Christian K=C3=B6nig=
 wrote:<br>
&gt;&gt;&gt;&gt; Add a function to simplify getting a single fence for all =
the fences in<br>
&gt;&gt;&gt;&gt; the dma_resv object.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; v2: fix ref leak in error handling<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:=
christian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt=
;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/dma-buf/dma-resv.c | 52 +++++++++++++=
+++++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 include/linux/dma-resv.h=C2=A0 =C2=A0|=C2=A0 =
2 ++<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 54 insertions(+)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/=
dma-resv.c<br>
&gt;&gt;&gt;&gt; index 480c305554a1..694716a3d66d 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/dma-buf/dma-resv.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/dma-buf/dma-resv.c<br>
&gt;&gt;&gt;&gt; @@ -34,6 +34,7 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;linux/dma-resv.h&gt;<br>
&gt;&gt;&gt;&gt; +#include &lt;linux/dma-fence-array.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;linux/export.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;linux/mm.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;linux/sched/mm.h&gt;<br>
&gt;&gt;&gt;&gt; @@ -657,6 +658,57 @@ int dma_resv_get_fences(struct dma_re=
sv *obj, bool write,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 EXPORT_SYMBOL_GPL(dma_resv_get_fences);<br>
&gt;&gt;&gt;&gt; +/**<br>
&gt;&gt;&gt;&gt; + * dma_resv_get_singleton - Get a single fence for all th=
e fences<br>
&gt;&gt;&gt;&gt; + * @obj: the reservation object<br>
&gt;&gt;&gt;&gt; + * @write: true if we should return all fences<br>
&gt;&gt;&gt;&gt; + * @fence: the resulting fence<br>
&gt;&gt;&gt;&gt; + *<br>
&gt;&gt;&gt;&gt; + * Get a single fence representing all the fences inside =
the resv object.<br>
&gt;&gt;&gt;&gt; + * Returns either 0 for success or -ENOMEM.<br>
&gt;&gt;&gt;&gt; + *<br>
&gt;&gt;&gt;&gt; + * Warning: This can&#39;t be used like this when adding =
the fence back to the resv<br>
&gt;&gt;&gt;&gt; + * object since that can lead to stack corruption when fi=
nalizing the<br>
&gt;&gt;&gt;&gt; + * dma_fence_array.<br>
&gt;&gt;&gt; Uh I don&#39;t get this one? I thought the only problem with n=
ested fences is<br>
&gt;&gt;&gt; the signalling recursion, which we work around with the irq_wo=
rk?<br>
&gt;&gt; Nope, the main problem is finalizing the dma_fence_array.<br>
&gt;&gt;<br>
&gt;&gt; E.g. imagine that you build up a chain of dma_fence_array objects =
like this:<br>
&gt;&gt; a&lt;-b&lt;-c&lt;-d&lt;-e&lt;-f.....<br>
&gt;&gt;<br>
&gt;&gt; With each one referencing the previous dma_fence_array and then yo=
u call<br>
&gt;&gt; dma_fence_put() on the last one. That in turn will cause calling<b=
r>
&gt;&gt; dma_fence_put() on the previous one, which in turn will cause<br>
&gt;&gt; dma_fence_put() one the one before the previous one etc....<br>
&gt;&gt;<br>
&gt;&gt; In other words you recurse because each dma_fence_array instance d=
rops the<br>
&gt;&gt; last reference of it&#39;s predecessor.<br>
&gt;&gt;<br>
&gt;&gt; What we could do is to delegate dropping the reference to the cont=
aining<br>
&gt;&gt; fences in a dma_fence_array as well, but that would require some c=
hanges to<br>
&gt;&gt; the irq_work_run_list() function to be halve way efficient.o<br>
&gt;&gt;<br>
&gt;&gt;&gt; Also if there&#39;s really an issue with dma_fence_array fence=
s, then that<br>
&gt;&gt;&gt; warning should be on the dma_resv kerneldoc, not somewhere hid=
den like<br>
&gt;&gt;&gt; this. And finally I really don&#39;t see what can go wrong, su=
re we&#39;ll end up<br>
&gt;&gt;&gt; with the same fence once in the dma_resv_list and then once mo=
re in the<br>
&gt;&gt;&gt; fence array. But they&#39;re all refcounted, so really shouldn=
&#39;t matter.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The code itself looks correct, but me not understanding what e=
ven goes<br>
&gt;&gt;&gt; wrong here freaks me out a bit.<br>
&gt;&gt; Yeah, IIRC we already discussed that with Jason in length as well.=
<br>
&gt;&gt;<br>
&gt;&gt; Essentially what you can&#39;t do is to put a dma_fence_array into=
 another<br>
&gt;&gt; dma_fence_array without causing issues.<br>
&gt;&gt;<br>
&gt;&gt; So I think we should maybe just add a WARN_ON() into dma_fence_arr=
ay_init()<br>
&gt;&gt; to make sure that this never happens.<br>
&gt; Yeah I think this would be much clearer instead of sprinkling half the=
<br>
&gt; story as a scary&amp;confusing warning over all kinds of users which<b=
r>
&gt; internally use dma fence arrays.<br></blockquote><div><br></div><div>A=
greed.=C2=A0 WARN_ON in dma_fence_array_init() would be better for everyone=
, I think.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; And then if it goes boom I guess we could fix it internally in<br>
&gt; dma_fence_array_init by flattening fences down again. But only if actu=
ally<br>
&gt; needed.<br>
<br>
Ok, going to do that first then.<br></blockquote><div><br></div><div>Sounds=
 good.=C2=A0 This patch looks pretty reasonable to me.=C2=A0 I do have a bi=
t of a concern with how it&#39;s being used to replace calls to dma_resv_ex=
cl_fence() in later patches, though.=C2=A0 In particular, this may allocate=
 memory whereas dma_resv_excl_fence() does not so we need to be really care=
ful in each of the replacements that doing so is safe.=C2=A0 That&#39;s a j=
ob for the per-driver reviewers but I thought I&#39;d drop a note here so w=
e&#39;re all aware of and watching for it.</div><div><br></div><div>--Jason=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
&gt;<br>
&gt; What confused me is why dma_resv is special, and from your reply it so=
unds<br>
&gt; like it really isn&#39;t.<br>
<br>
Well, it isn&#39;t special in any way. It&#39;s just something very obvious=
 <br>
which could go wrong.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; -Daniel<br>
&gt;<br>
&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; I guess something to figure out next year, I kinda hoped I cou=
ld squeeze a<br>
&gt;&gt;&gt; review in before I disappear :-/<br>
&gt;&gt;&gt; -Daniel<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; + */<br>
&gt;&gt;&gt;&gt; +int dma_resv_get_singleton(struct dma_resv *obj, bool wri=
te,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct dma_fence **fence)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +=C2=A0 struct dma_fence_array *array;<br>
&gt;&gt;&gt;&gt; +=C2=A0 struct dma_fence **fences;<br>
&gt;&gt;&gt;&gt; +=C2=A0 unsigned count;<br>
&gt;&gt;&gt;&gt; +=C2=A0 int r;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 r =3D dma_resv_get_fences(obj, write, &amp;count, =
&amp;fences);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 if (count =3D=3D 0) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *fence =3D NULL;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt;&gt; +=C2=A0 }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 if (count =3D=3D 1) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *fence =3D fences[0];<=
br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(fences);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt;&gt;&gt; +=C2=A0 }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 array =3D dma_fence_array_create(count, fences,<br=
>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_fence_con=
text_alloc(1),<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01, false);<br=
>
&gt;&gt;&gt;&gt; +=C2=A0 if (!array) {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (count--)<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dma_fence_put(fences[count]);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(fences);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt;&gt;&gt;&gt; +=C2=A0 }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 *fence =3D &amp;array-&gt;base;<br>
&gt;&gt;&gt;&gt; +=C2=A0 return 0;<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +EXPORT_SYMBOL_GPL(dma_resv_get_singleton);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 /**<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* dma_resv_wait_timeout - Wait on reser=
vation&#39;s objects<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0* shared and/or exclusive fences.<br>
&gt;&gt;&gt;&gt; diff --git a/include/linux/dma-resv.h b/include/linux/dma-=
resv.h<br>
&gt;&gt;&gt;&gt; index fa2002939b19..cdfbbda6f600 100644<br>
&gt;&gt;&gt;&gt; --- a/include/linux/dma-resv.h<br>
&gt;&gt;&gt;&gt; +++ b/include/linux/dma-resv.h<br>
&gt;&gt;&gt;&gt; @@ -438,6 +438,8 @@ void dma_resv_replace_fences(struct dm=
a_resv *obj, uint64_t context,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 void dma_resv_add_excl_fence(struct dma_resv =
*obj, struct dma_fence *fence);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 int dma_resv_get_fences(struct dma_resv *obj,=
 bool write,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int *num_fences, struct dma=
_fence ***fences);<br>
&gt;&gt;&gt;&gt; +int dma_resv_get_singleton(struct dma_resv *obj, bool wri=
te,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct dma_fence **fence);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 int dma_resv_copy_fences(struct dma_resv *dst=
, struct dma_resv *src);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 long dma_resv_wait_timeout(struct dma_resv *o=
bj, bool wait_all, bool intr,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout);=
<br>
&gt;&gt;&gt;&gt; -- <br>
&gt;&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;&gt;<br>
<br>
</blockquote></div></div>

--0000000000008bd1ee05d93fc430--
