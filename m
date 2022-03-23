Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D479D4E5793
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 18:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBA810E19E;
	Wed, 23 Mar 2022 17:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BD210E154
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 17:34:15 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id k10so2391070oia.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Oc3j7qx+RVq8AEkfbcM8wdtLT4RMF7Jazn9wGYELKYo=;
 b=lVkaipRA9cbbKsIlTwibO+57SxWnmiqryKv0QNJOucGwuc85AOdLhje9gbxr7u8Rdl
 VpwYNmHEpSm8s83sTXx0BOm0SGiY2Zyb7uZqmf9JT83N1ufvMp8kqJbrf/JTsFgT0GV8
 LP+8GyqiNFYGyloG+Q3LWwT01N2gsUJwTKOCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Oc3j7qx+RVq8AEkfbcM8wdtLT4RMF7Jazn9wGYELKYo=;
 b=OUtJgb/g3LmGyyIxPPnWehtAMqlstFcEWyAH+pBFslhvBdhbns7JVWqSpjOtZHCMOX
 ruuQPdx9Nfqp1KB780W6rwKveKwT17krMXpAitBQKo0xwHjE3UzzrI8+dQ4aOU3j9AvS
 ZXLB2J0IT8C/6c96ALyD5VOE3Z36semfTYJVza9yhGjaitE4OS96v5+L9NVfpDw8dYdq
 dU2B8feLG1lmLLYNcNpaXKDgrYIfyz7s9ROMgNqJnJhQDxGe7kv/lyGa/oJFqggDptw9
 mnz/tw/egYSDLcI00oZR43RSrPlzhEZIGXatShQMr/oLcv/+Jo9ne6H5vRHuYFT+xwjh
 mPzQ==
X-Gm-Message-State: AOAM531ztpqV2v89iYFxl0CMwi3xdMGx+BnepDVQj5DyHz64r1OF9OpQ
 FqmsPKsgj4fn3SRJA6Drn2lJpUSh4VUeY4GyAXnYXg==
X-Google-Smtp-Source: ABdhPJwpviu3DKqdy1TzqCT0HJi2lO9O1FtTVne+HEW/NX81Bk5OXD4zGWdVlTPf9979mrjITZUiEU+yyHfhF1gO/r0=
X-Received: by 2002:a54:4099:0:b0:2ec:d31c:481d with SMTP id
 i25-20020a544099000000b002ecd31c481dmr634810oii.7.1648056854641; Wed, 23 Mar
 2022 10:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-4-christian.koenig@amd.com>
 <Yjse+S0bf4P6QTfu@phenom.ffwll.local>
 <20220323163242.GJ64706@ziepe.ca>
In-Reply-To: <20220323163242.GJ64706@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Mar 2022 18:34:03 +0100
Message-ID: <CAKMK7uHRnYSSrrP_4p2JLBhsXX4TZcPFm44LS9wEwOR1R+fBBA@mail.gmail.com>
Subject: Re: [PATCH 04/23] RDMA: use dma_resv_wait() instead of extracting the
 fence
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Leon Romanovsky <leon@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Gal Pressman <galpress@amazon.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Maor Gottlieb <maorg@nvidia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022 at 17:32, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Mar 23, 2022 at 02:22:01PM +0100, Daniel Vetter wrote:
> > On Mon, Mar 21, 2022 at 02:58:37PM +0100, Christian K=C3=B6nig wrote:
> > > Use dma_resv_wait() instead of extracting the exclusive fence and
> > > waiting on it manually.
> > >
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> >
> > Jason, can you ack this for merging through drm trees please?
>
> Sure, it looks trivial, but I didn't see the whole series:
>
> Acked-by: Jason Gunthorpe <jgg@nvidia.com>

The entire series reworks how dma_resv stores fences (and what exactly
the mean), which is why we need to get users away from some of these
low-level accessors and towards functions at a slightly higher level.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
