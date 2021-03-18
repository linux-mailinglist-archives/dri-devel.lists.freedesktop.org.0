Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 203593406A0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 14:13:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212A46E0DA;
	Thu, 18 Mar 2021 13:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F1D6E0DA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 13:13:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v4so5479349wrp.13
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RN1aiZ6RJ/if7REZS1LAAvDyJQvNsdGdiQlrmvTsdiY=;
 b=Gtqp46MJtdQbCPssQstDYavp587uiEW1FtTLuj/3zlPOQKFucFQe3ICvyuc8A1SgYi
 8ybcL91yErfPHoMkz9GhNJxRORLp8w4dojMcFTaK4iuDwy7zPnziv0uIvmvbTBhEHE5E
 FPGI7ZZ1ZMdtjOy11qFrP1UG3L+fLZwg4MlIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RN1aiZ6RJ/if7REZS1LAAvDyJQvNsdGdiQlrmvTsdiY=;
 b=VlcLq+UTrwq3ZKyqAcC0E5eybBdGMAnOmiqaK5yJGk/Xfn8K8QGEsK7ZwbxuKgtYnt
 bu5DALbLqnZmdZ1D7uGrrHymU5kteOsTYlV86pAkygC1Ms9a4C35cKd+wmtiiYiFPTRU
 JRoscWx4TQ24YIaI/6I55kCKXch9A1bNQeSHE8hzQRgUfl6Rf//A28MnbKk6hKTkYyiv
 4O1n8nTwUJ+Ober/XZmHrWX9fAbge0EAxU9893B9BHLgeAA+RAooAzQ6sse6BYFpa/ae
 S+9IbsGXDf9NJjx52ys+H2r2yi94Pyvcu6xEdQhpZFC0pKleUN2PpRF8WjWbSKL/C5Du
 Pj3w==
X-Gm-Message-State: AOAM532FJM6rAIUC8bVsoHTTmewMaDo1KToo1KiHrTeMV5PE0woJSjLp
 y3SV+htkrdUXBVjNcs2h+Ew7rg==
X-Google-Smtp-Source: ABdhPJwnpjCEuLxdvrIw6DknvjlSN00pW4J/MANn/U6OeBl/WUX9+H/I9ozPrZ+6BZZxsMp1rXTI4A==
X-Received: by 2002:a5d:6810:: with SMTP id w16mr9727789wru.333.1616073220875; 
 Thu, 18 Mar 2021 06:13:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm2758102wmd.27.2021.03.18.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:13:40 -0700 (PDT)
Date: Thu, 18 Mar 2021 14:13:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/3] dma-buf: add dma_fence_array_for_each (v2)
Message-ID: <YFNSAqJ3BM41VCGR@phenom.ffwll.local>
References: <20210316045322.2020294-1-jason@jlekstrand.net>
 <20210317221940.2146688-1-jason@jlekstrand.net>
 <20210317221940.2146688-2-jason@jlekstrand.net>
 <889da927-d7a1-bcf3-1887-542798863faf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <889da927-d7a1-bcf3-1887-542798863faf@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 10:38:11AM +0100, Christian K=F6nig wrote:
> Am 17.03.21 um 23:19 schrieb Jason Ekstrand:
> > From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
> > =

> > Add a helper to iterate over all fences in a dma_fence_array object.
> > =

> > v2 (Jason Ekstrand)
> >   - Return NULL from dma_fence_array_first if head =3D=3D NULL.  This m=
atches
> >     the iterator behavior of dma_fence_chain_for_each in that it iterat=
es
> >     zero times if head =3D=3D NULL.
> >   - Return NULL from dma_fence_array_next if index > array->num_fences.
> =

> Is there any reason you send this patch alone out once more?
> =

> I don't see any changes compared to the last version.

Last patch has changed. Also I think mail delivery is a bit wobbly right
now.
-Daniel

> =

> Christian.
> =

> > =

> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >   drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
> >   include/linux/dma-fence-array.h   | 17 +++++++++++++++++
> >   2 files changed, 44 insertions(+)
> > =

> > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fe=
nce-array.c
> > index d3fbd950be944..2ac1afc697d0f 100644
> > --- a/drivers/dma-buf/dma-fence-array.c
> > +++ b/drivers/dma-buf/dma-fence-array.c
> > @@ -201,3 +201,30 @@ bool dma_fence_match_context(struct dma_fence *fen=
ce, u64 context)
> >   	return true;
> >   }
> >   EXPORT_SYMBOL(dma_fence_match_context);
> > +
> > +struct dma_fence *dma_fence_array_first(struct dma_fence *head)
> > +{
> > +	struct dma_fence_array *array;
> > +
> > +	if (!head)
> > +		return NULL;
> > +
> > +	array =3D to_dma_fence_array(head);
> > +	if (!array)
> > +		return head;
> > +
> > +	return array->fences[0];
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_first);
> > +
> > +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
> > +				       unsigned int index)
> > +{
> > +	struct dma_fence_array *array =3D to_dma_fence_array(head);
> > +
> > +	if (!array || index >=3D array->num_fences)
> > +		return NULL;
> > +
> > +	return array->fences[index];
> > +}
> > +EXPORT_SYMBOL(dma_fence_array_next);
> > diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-=
array.h
> > index 303dd712220fd..588ac8089dd61 100644
> > --- a/include/linux/dma-fence-array.h
> > +++ b/include/linux/dma-fence-array.h
> > @@ -74,6 +74,19 @@ to_dma_fence_array(struct dma_fence *fence)
> >   	return container_of(fence, struct dma_fence_array, base);
> >   }
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
> > +#define dma_fence_array_for_each(fence, index, head)			\
> > +	for (index =3D 0, fence =3D dma_fence_array_first(head); fence;	\
> > +	     ++(index), fence =3D dma_fence_array_next(head, index))
> > +
> >   struct dma_fence_array *dma_fence_array_create(int num_fences,
> >   					       struct dma_fence **fences,
> >   					       u64 context, unsigned seqno,
> > @@ -81,4 +94,8 @@ struct dma_fence_array *dma_fence_array_create(int nu=
m_fences,
> >   bool dma_fence_match_context(struct dma_fence *fence, u64 context);
> > +struct dma_fence *dma_fence_array_first(struct dma_fence *head);
> > +struct dma_fence *dma_fence_array_next(struct dma_fence *head,
> > +				       unsigned int index);
> > +
> >   #endif /* __LINUX_DMA_FENCE_ARRAY_H */
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
