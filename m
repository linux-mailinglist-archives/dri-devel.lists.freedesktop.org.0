Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07567E9694
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 07:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2C910E07A;
	Mon, 13 Nov 2023 06:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DC910E034
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 06:05:45 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-45d955fcabdso1167563137.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Nov 2023 22:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699855544; x=1700460344;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+O4c7eDef50yyoJSsJxpIFGb81PUKkG+p7ugALAq5oE=;
 b=en3mjNO1AMG9Q5LiUKMrxe4aVo4iu64BLye50+653+g6qhU/rAK4MkH0a6f7+dp+7l
 x7lWtlrN0U16Rd5Rq/jSJ3T0uki2kNan/hNS3Q8mLrzwnbKXKdtxo5GhK+KNxHo6rFaZ
 tCdvhsqt1+5c7yo9iOYwTP+pERWp3tl09y9ZVoFCd6xH43tp7L7vgdzGM0OunKWpQ3oO
 wxbPoxrkoSq0ObtV9oHuzloUMdF7jvqKocA15tEd9TSfk3e1yXqsPTa5G/mjET0E2rNN
 njQFSTrJgVsUJ5dNSISzx4R5xJJZmm0VN9B7FrX1Tf85bdppOAjZfbo2SKI7+Rt1BKnY
 qrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699855544; x=1700460344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+O4c7eDef50yyoJSsJxpIFGb81PUKkG+p7ugALAq5oE=;
 b=qNVYz2W3fYche+Z3cZJja6byl4v0HAfEEcCv0Vpr4JCmLap3WeKxL9HYwsHFb0Nv4H
 1LA9rkGV1TuIeBmfGpT/oIWZMyfslb9lXV5RVTSiY+rtOjYzKjXtl16xgdl5Sv792y9x
 7thrkEbHyaNkswpL9+4iJcbT86wS1v0GPfSowVzzRdvfypmBdM1Up7qLt/vBfwWaR8u4
 ZInFCKHpF0AtbPG9GtiJ333Na1anFFb32djgJTSDthRwymH450t+dbtcDw0obmzrJ5IJ
 8ueLmid6XZ2T9yJNUZswDYYVIWlpvttbfkmFsw6aocKZ1kTpnDAViRrS8K+9DokVJwjo
 iFSQ==
X-Gm-Message-State: AOJu0YyNjUsPIVBPtyZ7srQuoqroWXrjFJkxrLBMvSOB7XTBzQUnvw1x
 fJspTNfwkOqqwuCOWRotNFw1s72yxSmcPgoyNqFWkA==
X-Google-Smtp-Source: AGHT+IEzmDvkwRkaQiM0DAzYdV0kX0ZDqS9InenhAVr/MpvpHQQqRmx4Go8bctNEzwdfIOZ4RbhEG1ddlIqUfdGfcuo=
X-Received: by 2002:a05:6102:2c04:b0:45e:f8af:79c1 with SMTP id
 ie4-20020a0561022c0400b0045ef8af79c1mr2667348vsb.31.1699855544082; Sun, 12
 Nov 2023 22:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-9-almasrymina@google.com>
 <20231110151935.0859fd7a@kernel.org>
In-Reply-To: <20231110151935.0859fd7a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 12 Nov 2023 22:05:30 -0800
Message-ID: <CAHS8izN7MydkJPaHfj7Pw0V+xoDBkCmEVTc1TH24=hjXm98xnQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/12] net: support non paged skb frags
To: Jakub Kicinski <kuba@kernel.org>
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>, linux-kselftest@vger.kernel.org,
 Praveen Kaligineedi <pkaligineedi@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 10, 2023 at 3:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun,  5 Nov 2023 18:44:07 -0800 Mina Almasry wrote:
> >  #include <net/net_debug.h>
> >  #include <net/dropreason-core.h>
> > +#include <net/page_pool/types.h>
> > +#include <net/page_pool/helpers.h>
>
> >  /**
> >   * DOC: skb checksums
> > @@ -3402,15 +3404,38 @@ static inline void skb_frag_off_copy(skb_frag_t=
 *fragto,
> >       fragto->bv_offset =3D fragfrom->bv_offset;
> >  }
> >
> > +/* Returns true if the skb_frag contains a page_pool_iov. */
> > +static inline bool skb_frag_is_page_pool_iov(const skb_frag_t *frag)
> > +{
> > +     return page_is_page_pool_iov(frag->bv_page);
> > +}
>
> Maybe we can create a new header? For skb + page pool.
>
> skbuff.h is included by 1/4th of the kernel objects, we should not
> be adding dependencies to this header, it really slows down incremental
> builds.
>

My issue here is that all these skb helpers call each other so I end
up having to move a lot of the unrelated skb helpers to this new
header (maybe that is acceptable but it feels weird).

What I could do here is move all the page_pool_page|iov_* helpers to a
minimal header, and include only that one from skbuff.h, rather than
including all of net/page_pool/helpers.h

--=20
Thanks,
Mina
