Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C5D69F863
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 16:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE63A10EA32;
	Wed, 22 Feb 2023 15:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5779610EA32;
 Wed, 22 Feb 2023 15:55:21 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id f5so1366880qkh.5;
 Wed, 22 Feb 2023 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=saj3BiOUv8TiUw3L7YFkO0PUJ/tXd3q9uJ49ovUM8sE=;
 b=CmKTWrxIKlz7AVFTXvHeSdE538LnVJ9hef0GchgKdtiu3KSU5PthdxEke4Yza0DhE6
 LCBRXHANN/uH3a9sa84d8Hj+Xk889MqBHP8ndvBbpdcB7thMY3GlA/lZqBWBWzaPmJo0
 Fjqk/rLzUY6L0Gbpy7U23GyqH93ATd4ZU0h3YBmZWObkCvdslWOFysVsCff7lnpsHdAx
 2WoOdn9Ejdl9VtyN0vLkuswbYdc8A4LlgL3dew+fnwt+ulzkzVYP6FDAPOqs21buZT7J
 PC+UPBwXTzRtfw9ZmtdSaAYqGUK6Yv6f82h26Ir76Juc1Pcs5jdTYdMwiA9isr9nHmIi
 0fGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=saj3BiOUv8TiUw3L7YFkO0PUJ/tXd3q9uJ49ovUM8sE=;
 b=2kiJW75lluq5tjirhBRth+MG7WYJ8KerWI4paOdZNG1nbe6K29QE0E7cCNJYQJ2s5+
 wbUNrEgiie/gRF3ensHDcp7PNVokI/YzJiAsgouqbX685v50aYps1ocYJCIUP7g8pyL2
 G6a4SdE3jFataB4eDKs/m7dCIlZRIJSxyb811eg5Kw0Yg7q5ACqkkFDeLv2gzNlAB3dm
 DBHs/fi3RP8CGok6uGDrJ+bgpG2OpU7qJR+oKwwqDz836q1aYly1S0VXfdgNrYPNRgWb
 0FDa4SgrwwyKoR9dAEfp9bV49u4SWzapT372mUnsybryNSlxEgGuApKUYuYo4njqUd88
 K4hw==
X-Gm-Message-State: AO0yUKWf0/vW5Bs3n3NtevbpyVyzSZWs6yeOFx3XcLJlB1xvP65VKtZC
 Cg+SSwkJHB+WpQl3HYj0taGX2ZWzr5jhcIVjkCw=
X-Google-Smtp-Source: AK7set8bf6lP1s6ypm6jnpmXdn70rTkn5YmDMmCpMTW3NxWzHOTkop5Jow8BwPhs9IsE+pN9We1E32jaWMhSMe6NUHQ=
X-Received: by 2002:a05:620a:831a:b0:742:3e52:f855 with SMTP id
 pa26-20020a05620a831a00b007423e52f855mr53039qkn.2.1677081320370; Wed, 22 Feb
 2023 07:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-4-robdclark@gmail.com>
 <b056a87c-b6b2-25e0-25c7-f7d422793a3e@linux.intel.com>
In-Reply-To: <b056a87c-b6b2-25e0-25c7-f7d422793a3e@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Feb 2023 07:55:08 -0800
Message-ID: <CAF6AEGv6vaoV_Rro8zSkwtBVTkeQXLdEOnCNBp_8xbkaxa_nOg@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] dma-buf/fence-chain: Add fence deadline support
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 2:27 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 18/02/2023 21:15, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Propagate the deadline to all the fences in the chain.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for this o=
ne.
> > ---
> >   drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fe=
nce-chain.c
> > index a0d920576ba6..4684874af612 100644
> > --- a/drivers/dma-buf/dma-fence-chain.c
> > +++ b/drivers/dma-buf/dma-fence-chain.c
> > @@ -206,6 +206,18 @@ static void dma_fence_chain_release(struct dma_fen=
ce *fence)
> >       dma_fence_free(fence);
> >   }
> >
> > +
> > +static void dma_fence_chain_set_deadline(struct dma_fence *fence,
> > +                                      ktime_t deadline)
> > +{
> > +     dma_fence_chain_for_each(fence, fence) {
> > +             struct dma_fence_chain *chain =3D to_dma_fence_chain(fenc=
e);
> > +             struct dma_fence *f =3D chain ? chain->fence : fence;
>
> Low level comment - above two lines could be replaced with:
>
>         struct dma_fence *f =3D dma_fence_chain_contained(fence);
>
> Although to be fair I am not sure that wouldn't be making it less
> readable. From the point of view that fence might not be a chain, so
> dma_fence_chain_contained() reads a bit dodgy as an API.

It does seem to be the canonical way to do it since 18f5fad275ef
("dma-buf: add dma_fence_chain_contained helper").. looks like I
missed that when I rebased.  I guess for consistency it's best that I
use the helper.

BR,
-R

> Regards,
>
> Tvrtko
>
> > +
> > +             dma_fence_set_deadline(f, deadline);
> > +     }
> > +}
> > +
> >   const struct dma_fence_ops dma_fence_chain_ops =3D {
> >       .use_64bit_seqno =3D true,
> >       .get_driver_name =3D dma_fence_chain_get_driver_name,
> > @@ -213,6 +225,7 @@ const struct dma_fence_ops dma_fence_chain_ops =3D =
{
> >       .enable_signaling =3D dma_fence_chain_enable_signaling,
> >       .signaled =3D dma_fence_chain_signaled,
> >       .release =3D dma_fence_chain_release,
> > +     .set_deadline =3D dma_fence_chain_set_deadline,
> >   };
> >   EXPORT_SYMBOL(dma_fence_chain_ops);
> >
