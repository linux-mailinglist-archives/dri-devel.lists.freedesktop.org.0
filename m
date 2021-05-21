Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F438CAF3
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 18:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD2B89AB9;
	Fri, 21 May 2021 16:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C06389AB9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 16:27:52 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w12so16218859edx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zocc3hqCspOdv2YN7QgzKHxhJs7zMsKu0CRXDFbucUk=;
 b=b3ogvafGc8o6Kv7slomdQyw1DGPDI57pxLwpN0dkv6rVqoYq9AhfWR8qCCJctsCM/h
 zGQpPSVRajRAcTAjKQmGfs/WQ499ZRD370fmsu+wXMll28NufUYlXTZbRuhf2ehK65bW
 w3oqYCMPWeA1fz9oEOF/Fb6QVR6LvzDnAsk8SF2WZEFGUJij+omeEvudUeGNDrewIYLS
 +oAa4Pgb0IwOtaiOExjpbhdfKaZuN+/vEdt1SaNdJQgoo6L9yFN7LUjFtlXfvxZZztwv
 ilMsCJ0I5/SBvxDCkkpfI3gWPJH3olsIzsdE/UBhMdMKFohyiqatdPaG43tVcrSDapyU
 FqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zocc3hqCspOdv2YN7QgzKHxhJs7zMsKu0CRXDFbucUk=;
 b=eFSYiI+TVkOn0pScFfouw59RhgiHBYws1PP7HoGQ1L1oi2yeZV4+wqj3KT8iTORO0q
 4zcyl/qkmHRQLyhqwh31MXMK9ilKWwkXeKQdajtqoywrqANDrGidXmrFKEzdREGKzr8T
 CrRFAjEA84aO7sSLJ74TdMF3caQwkYu9y4KXg/sEfGZtRQcwr8/1mK4XbL11KQcqdK/k
 /lPOu5c2eVKM+fUbKd/EEd4AgX88fwzTB0gOwBrerGJxdmH718SfL/UgmOLqFN6pwRSA
 Msvt9J2t7f6m3COI/nDOlIp1M4ofufWYvVk4Q/u3cDxNH8YRQYrsqn9/tmutA9tBpDX1
 Q3CA==
X-Gm-Message-State: AOAM533VFIuzHFwz9PYiQjhbs0d7Xs1hepc4m/hEnQBJBFe1+OQ389fM
 /0ivb1HYa6HxByjtIemPnZpdiL/rEqS/0FXlh0wmeA==
X-Google-Smtp-Source: ABdhPJzr/HqaBN6uW/iaAuo6NoE7phHPTev9D97QKTNflky40GcgHeCYS4zMwMpFqdY7CUQgLeio2C2rm5sfUWQ0Vu0=
X-Received: by 2002:a05:6402:1719:: with SMTP id
 y25mr12147532edu.304.1621614470924; 
 Fri, 21 May 2021 09:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-2-jason@jlekstrand.net>
 <5698cfc1-471b-5e13-bf3f-1c7025dc9a2c@gmail.com>
In-Reply-To: <5698cfc1-471b-5e13-bf3f-1c7025dc9a2c@gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 21 May 2021 11:27:39 -0500
Message-ID: <CAOFGe95V8wnR4AqoQm1s+1y8Mv-+RzmYS1fMf_d=aUek3TGK5g@mail.gmail.com>
Subject: Re: [PATCH 1/4] dma-buf: add dma_fence_array_for_each (v2)
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 2:51 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 20.05.21 um 21:00 schrieb Jason Ekstrand:
> > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >
> > Add a helper to iterate over all fences in a dma_fence_array object.
> >
> > v2 (Jason Ekstrand)
> >   - Return NULL from dma_fence_array_first if head =3D=3D NULL.  This m=
atches
> >     the iterator behavior of dma_fence_chain_for_each in that it iterat=
es
> >     zero times if head =3D=3D NULL.
> >   - Return NULL from dma_fence_array_next if index > array->num_fences.
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> BTW: I'm only seeing this patch from the series. Looks like somehow the
> rest didn't made it into my inbox.

https://lists.freedesktop.org/archives/dri-devel/2021-May/307561.html

Not sure why it didn't make your mail.  This one was CC'd to you
because you're the author from a year ago or something.

--Jason


> > ---
> >   drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
> >   include/linux/dma-fence-array.h   | 17 +++++++++++++++++
> >   2 files changed, 44 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fe=
nce-array.c
> > index d3fbd950be944..2ac1afc697d0f 100644
> > --- a/drivers/dma-buf/dma-fence-array.c
> > +++ b/drivers/dma-buf/dma-fence-array.c
> > @@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fen=
ce, u64 context)
> >       return true;
> >   }
> >   EXPORT_SYMBOL(dma_fence_match_context);
> > +
> > +struct dma_fence *dma_fence_array_first(struct dma_fence *head)
> > +{
> > +     struct dma_fence_array *array;
> > +
> > +     if (!head)
> > +             return NULL;
> > +
> > +     array =3D to_dma_fence_array(head);
> > +     if (!array)
> > +             return head;
> > +
> > +     return array->fences[0];
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_first);
> > +
> > +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
> > +                                    unsigned int index)
> > +{
> > +     struct dma_fence_array *array =3D to_dma_fence_array(head);
> > +
> > +     if (!array || index >=3D array->num_fences)
> > +             return NULL;
> > +
> > +     return array->fences[index];
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_next);
> > diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-=
array.h
> > index 303dd712220fd..588ac8089dd61 100644
> > --- a/include/linux/dma-fence-array.h
> > +++ b/include/linux/dma-fence-array.h
> > @@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
> >       return container_of(fence, struct dma_fence_array, base);
> >   }
> >
> > +/**
> > + * dma_fence_array_for_each - iterate over all fences in array
> > + * @fence: current fence
> > + * @index: index into the array
> > + * @head: potential dma_fence_array object
> > + *
> > + * Test if @array is a dma_fence_array object and if yes iterate over =
all fences
> > + * in the array. If not just iterate over the fence in @array itself.
> > + */
> > +#define dma_fence_array_for_each(fence, index, head)                 \
> > +     for (index =3D 0, fence =3D dma_fence_array_first(head); fence;  =
   \
> > +          ++(index), fence =3D dma_fence_array_next(head, index))
> > +
> >   struct dma_fence_array *dma_fence_array_create(int num_fences,
> >                                              struct dma_fence **fences,
> >                                              u64 context, unsigned seqn=
o,
> > @@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int nu=
m_fences,
> >
> >   bool dma_fence_match_context(struct dma_fence *fence, u64 context);
> >
> > +struct dma_fence *dma_fence_array_first(struct dma_fence *head);
> > +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
> > +                                    unsigned int index);
> > +
> >   #endif /* __LINUX_DMA_FENCE_ARRAY_H */
>
