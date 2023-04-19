Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD76E7B3E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AE610E9AE;
	Wed, 19 Apr 2023 13:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F6910E17D;
 Wed, 19 Apr 2023 13:49:21 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1842c7c2daaso689544fac.0; 
 Wed, 19 Apr 2023 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681912160; x=1684504160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym31HW14DbhCOWHrnpXKAPN5kGz7nsQnyeLEhvgz9o8=;
 b=g6DUqsbuqHCbSnGehf924bmMmY5pk8Jf320EWXg+W/jXCTmRx9mO2tW0hXviPMnP/v
 n0jaFKOt1zAjyYScjefGItuXl3SpqypDwKjPys8cAemLMLZpQwWKuV5awwimcpx4xAtT
 xl83lQBtTvOAwJiZkIFzI8KCJ003nRW1JHU316/6AFEGSwbuaibWiB4gh6b9d+7F1u3V
 GCGN2MuPwgpU2ywXp0cqvC2bBdq7j+8yuPbgHQhudUfSJg4FPAwZwFCzOL6XiR0snabn
 gAgK5coRUH2r7NecaHDAXzGS5sOcIoOl25ti9vny7GH/T5ocwf6oXtq1CtTQz9TYsfHC
 vx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681912160; x=1684504160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym31HW14DbhCOWHrnpXKAPN5kGz7nsQnyeLEhvgz9o8=;
 b=EZeYNhtM49BWOf51L1zI5Pvp4dYt0KvSEJAH0chiaOfkp3RQQ/LKt05U1u+GEk82Bd
 Dx+OXVF9h5Nbk4I3XfDQRsx8LWM7ecSqrMyl5WOkFxpfMdHrvGWP72biqS8TNbQEh3W7
 0ZtUSIxuMP9QHSF55jNcrqoNnNfVfJjtv7QYsuT5ZCouKOXWySuv4wXXv8QMrHTeFPSB
 NdlfchVRfQrYJXxDs02NhcGLBm3uGqTGOYHJu+cmLa+0BLUzXMnuHIjYY/C96dZe1mS0
 ysJQsYki7nkImrMpvRSugptVXiLSErgtig5vOuHEWMzRUu2Zkky5xygaDIPFfmyNa+AQ
 YEYA==
X-Gm-Message-State: AAQBX9funLSPB5fnWRfxk0h6MQm2d/iX5Hcc1SfMJBCSyDv95ZI7Y3Oh
 CiWyDlKQG8qHaUdnHYsRkjPlNSDlHRk89gHUF/E=
X-Google-Smtp-Source: AKy350b110hiRRnRO2oyRNWOm123YhKy0RQQnjnzlfFFQSuvDWkapRzEnWNE+yypdLSgtPsQ+wPMtI+zb8uc8w41WC4=
X-Received: by 2002:a05:6870:c229:b0:187:e563:77b9 with SMTP id
 z41-20020a056870c22900b00187e56377b9mr3674088oae.45.1681912159993; Wed, 19
 Apr 2023 06:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230419122058.3420-1-hackyzh002@gmail.com>
 <62ae58cb-9fec-37ca-fd40-12bf0c1c5ba3@amd.com>
In-Reply-To: <62ae58cb-9fec-37ca-fd40-12bf0c1c5ba3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Apr 2023 09:49:08 -0400
Message-ID: <CADnq5_MTgMtHM87YQJcZLcENevcHOuQihoTz-xRetypJ6BQSXQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hackyzh002 <hackyzh002@gmail.com>, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Apr 19, 2023 at 8:24=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 19.04.23 um 14:20 schrieb hackyzh002:
> > The type of size is unsigned, if size is 0x40000000, there will be an
> > integer overflow, size will be zero after size *=3D sizeof(uint32_t),
> > will cause uninitialized memory to be referenced later
> >
> > Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the seri=
es.
>
> > ---
> >   drivers/gpu/drm/radeon/radeon_cs.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeo=
n/radeon_cs.c
> > index 46a27ebf4..a6700d727 100644
> > --- a/drivers/gpu/drm/radeon/radeon_cs.c
> > +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> > @@ -270,7 +270,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *=
p, void *data)
> >   {
> >       struct drm_radeon_cs *cs =3D data;
> >       uint64_t *chunk_array_ptr;
> > -     unsigned size, i;
> > +     u64 size;
> > +     unsigned i;
> >       u32 ring =3D RADEON_CS_RING_GFX;
> >       s32 priority =3D 0;
> >
>
