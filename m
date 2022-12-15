Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039364E222
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 21:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9A10E0DC;
	Thu, 15 Dec 2022 20:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916D110E0DC;
 Thu, 15 Dec 2022 20:09:25 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id cg5so471826qtb.12;
 Thu, 15 Dec 2022 12:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIJwwX6o/b6aPEH4Ez3gITDnx0EFzLpqpuWyT53Asbg=;
 b=B9tVSL/8z7idokQLakcvklafcX+bg3mJwv5O1ke3l6U/5vzf0a5/l8/tpwqftvZoSu
 wZJ8CxDlEMFQW8lhcwT8czbx8iAnBuu5UIklvWnBIJKcMok7zCD/cb6IoGtMFFcLd+fN
 UzucgMACEX0bnFfyqOnXhMcH6LjMvrXtZyDgOvFAEebBaJVqzqKWToL1EF/PHe81jmgK
 LlKGAt87uiOLhekchUs7Pl8rptO5ZwdtgyAXSHXbngxnANNvvb6XrXJyN0E4ce+cMCU9
 eZUgOuIrin2i7fx02YoyFkTOgxCK/p2Vn+Oo2DrVn9sRoIyxcM0aRnwgjNtcj7p63H8Z
 RHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIJwwX6o/b6aPEH4Ez3gITDnx0EFzLpqpuWyT53Asbg=;
 b=Bl09mx4wLCQUaHii6mzHP4qaw6j6Kw6WlJyzygbamke/JXcA+WCTksACJvgj1dEqkQ
 /N/+ecro0oVNzZHXAXeJOGfkvPNarcWMWVgv8ENMyPyDAG0fatV18iuTAPNOUDTWTobZ
 JZ0PvPM5Gx0KYjYRtsEHXDWoPdOGqX/bjN9rhTnUvg61Lr9dYiQxdtP28yIwNEPjsomS
 KCJsLultNiV/YO9Quv7N8n1i/ttI3RYxIEGg6VOSQZBwSSKWt8RE41Th5E3LjfLQZzH1
 ejjM++Vkq52hUx3Og1aHGTciRpEEu6HTERwFcL0oLtR1SbjDqo20dOumzyz2z/9HXSqk
 MNRg==
X-Gm-Message-State: ANoB5plyNN81OzLPIgKgdnDqLfFQhXMmOQ7Ug1/haCo9DQbUgQRgWGxR
 c0tkv8mpFW90sHJ6Ophs5B8EhpHqqtmg0s3OFKjH+7Dt
X-Google-Smtp-Source: AA0mqf49s40gUJGEaE3LaBjQEIjJZF78JlQPSk1bJ+Mu+iSbCIyQGWAF38vhUQc1tApd1SUnRW0783hYr7K1Jhd9dMg=
X-Received: by 2002:ac8:544c:0:b0:3a8:93f:53aa with SMTP id
 d12-20020ac8544c000000b003a8093f53aamr1099142qtq.447.1671134964625; Thu, 15
 Dec 2022 12:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-6-christian.koenig@amd.com>
 <0169e3dd-c705-175d-9045-2baf0cbabb78@gmail.com>
In-Reply-To: <0169e3dd-c705-175d-9045-2baf0cbabb78@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 16 Dec 2022 06:09:13 +1000
Message-ID: <CAPM=9tx2=M3DO+nP60WfEpeF4XvSfA+4wqsNmvSVHuq=bdQWqg@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/qxl: stop using ttm_bo_wait
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Dave Airlie <airlied@redhat.com>

On Fri, 16 Dec 2022 at 00:20, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 25.11.22 um 11:21 schrieb Christian K=C3=B6nig:
> > TTM is just wrapping core DMA functionality here, remove the mid-layer.
> > No functional change.
>
> Any objections to this guys?
>
> I'm basically just following a suggestion from Daniel here and it
> already triggered a discussion about the timeout for i915.
>
> Thanks,
> Christian.
>
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/qxl/qxl_cmd.c | 16 ++++++++++++++--
> >   1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cm=
d.c
> > index 63aa96a69752..281edab518cd 100644
> > --- a/drivers/gpu/drm/qxl/qxl_cmd.c
> > +++ b/drivers/gpu/drm/qxl/qxl_cmd.c
> > @@ -579,7 +579,7 @@ void qxl_surface_evict(struct qxl_device *qdev, str=
uct qxl_bo *surf, bool do_upd
> >
> >   static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf=
, bool stall)
> >   {
> > -     int ret;
> > +     long ret;
> >
> >       ret =3D qxl_bo_reserve(surf);
> >       if (ret)
> > @@ -588,7 +588,19 @@ static int qxl_reap_surf(struct qxl_device *qdev, =
struct qxl_bo *surf, bool stal
> >       if (stall)
> >               mutex_unlock(&qdev->surf_evict_mutex);
> >
> > -     ret =3D ttm_bo_wait(&surf->tbo, true, !stall);
> > +     if (stall) {
> > +             ret =3D dma_resv_wait_timeout(surf->tbo.base.resv,
> > +                                         DMA_RESV_USAGE_BOOKKEEP, true=
,
> > +                                         15 * HZ);
> > +             if (ret > 0)
> > +                     ret =3D 0;
> > +             else if (ret =3D=3D 0)
> > +                     ret =3D -EBUSY;
> > +     } else {
> > +             ret =3D dma_resv_test_signaled(surf->tbo.base.resv,
> > +                                          DMA_RESV_USAGE_BOOKKEEP);
> > +             ret =3D ret ? -EBUSY : 0;
> > +     }
> >
> >       if (stall)
> >               mutex_lock(&qdev->surf_evict_mutex);
>
