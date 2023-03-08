Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20D06B1689
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 00:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D257510E75A;
	Wed,  8 Mar 2023 23:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5AF10E75A;
 Wed,  8 Mar 2023 23:34:00 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s41so332539oiw.13;
 Wed, 08 Mar 2023 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678318439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nKUiLVCrv6sWYIIB9vh7FoNv1/LPd9DHV86kLY+wfAA=;
 b=oH2lP2gJxfBjAe8IiOErFway8XzMxmINHz9QbcNvV1HhQPpYF4w7nliMEAubFkBVi2
 cks3TfK0MhvKcSUgRqiKvH2oEQFbeY1WwlNcj+mDOEqgNKaGPAV3+Sh9oEM34SDgfS76
 94Ekpx4FOJrh3IisxtWLo7VbAVWUcT00t+TIWc9Y71nmKMWY7WaLZuC8N8kQBB9L7mRz
 K7cNvVjFKQwAbUXCjosc2n4jZcI4Jl5wECk+S9gN9rr0Mql+IVk1D2SM2Y0pwMis9Yye
 XIFaN0dYE9Bi2INqVwURi9MVQxXFaNQI0IRAh4DT/z+vFwBQSndy2jUUc3cRLV1oOxjo
 nJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678318439;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKUiLVCrv6sWYIIB9vh7FoNv1/LPd9DHV86kLY+wfAA=;
 b=WXkdPPjAJTrWNJ9HzzIG7VjAwaCj+v4sDphbPPRgQhlL6BY+aWwwkzSp1LMAeM4J3Z
 ++IwbNzEUcTa8rIufNrVrylChm2PbUJZAaIE+GdSc5fuVCa8ugaK7eQXWFP0VWUtHqyC
 BeKFBAvkLsNxu/GeIOiz6v2jim+2KMC/Ns3E4z2jzBdEHCzUsR/reXLzoV23GA9Ttjq3
 OvMF5kdDSy4yK8aq6sczPNbrr3qcqBLKSnY+Kzv21uHhpwSqqasHm6uLtfPq6c2EdPQH
 K1xR8lCSjWTfe1BKod5MkDYJWIxmrZgsDAWLseLnAuK5+ng3njGl8+HKJlk+GHA3ZC4w
 h4Qg==
X-Gm-Message-State: AO0yUKXBHofJntVItOsKzh69jPsyTByiOYP8BPXA8goVtgLaifeG2MPU
 smtD+NDC1AHbyV0dpbEA9eV/bfD5xsBfpxzom2Q=
X-Google-Smtp-Source: AK7set9Qz7nkbaFWTYIgBvI2ydooLjOtTcqfk+KQhW5WId8g4I0dRkTIscRr8lL3MYXoLKizsTmFEfq7yVqSaIKPDFA=
X-Received: by 2002:aca:2111:0:b0:384:e145:e8b8 with SMTP id
 17-20020aca2111000000b00384e145e8b8mr2054810oiz.5.1678318439716; Wed, 08 Mar
 2023 15:33:59 -0800 (PST)
MIME-Version: 1.0
References: <1678305762-32381-1-git-send-email-quic_abhinavk@quicinc.com>
 <ZAjvc7jjKDNSJcjq@intel.com>
In-Reply-To: <ZAjvc7jjKDNSJcjq@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Mar 2023 15:33:48 -0800
Message-ID: <CAF6AEGvMyDb7kwZU5Uk14nRNOe1-eFUVmXEsnLiGKL7R0kOjPQ@mail.gmail.com>
Subject: Re: [RFC] drm: property: use vzalloc() instead of kvzalloc() for
 large blobs
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 8, 2023 at 1:23=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Mar 08, 2023 at 12:02:42PM -0800, Abhinav Kumar wrote:
> > For DRM property blobs created by user mode using
> > drm_property_create_blob(), if the blob value needs to be updated the
> > only way is to destroy the previous blob and create a new one instead.
> >
> > For some of the property blobs, if the size of the blob is more
> > than one page size, kvzalloc() can slow down system as it will first
> > try to allocate physically contiguous memory but upon failure will
> > fall back to non-contiguous (vmalloc) allocation.
> >
> > If the blob property being used is bigger than one page size, in a
> > heavily loaded system, this causes performance issues because
> > some of the blobs are updated on a per-frame basis.
> >
> > To mitigate the performance impact of kvzalloc(), use it only when
> > the size of allocation is less than a page size when creating property
> > blobs
>
> Not sure how badly this will eat into the vmalloc area.

Normally I wouldn't expect this to be much of a problem, but we don't
appear to restrict CREATEBLOBPROP to DRM_MASTER, which seems like it
might have been a mistake.. so perhaps we want to either restrict
CREATEBLOBPROP or put an upper threshold limit on total size of all
allocated blob props using vmalloc area?

BR,
-R

> Is there no GFP flag to avoid the expensive stuff instead?
>
> >
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/drm_property.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_prope=
rty.c
> > index dfec479830e4..40c2a3142038 100644
> > --- a/drivers/gpu/drm/drm_property.c
> > +++ b/drivers/gpu/drm/drm_property.c
> > @@ -561,7 +561,11 @@ drm_property_create_blob(struct drm_device *dev, s=
ize_t length,
> >       if (!length || length > INT_MAX - sizeof(struct drm_property_blob=
))
> >               return ERR_PTR(-EINVAL);
> >
> > -     blob =3D kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KE=
RNEL);
> > +     if (sizeof(struct drm_property_blob) + length > PAGE_SIZE)
> > +             blob =3D vzalloc(sizeof(struct drm_property_blob)+length)=
;
> > +     else
> > +             blob =3D kvzalloc(sizeof(struct drm_property_blob)+length=
, GFP_KERNEL);
> > +
> >       if (!blob)
> >               return ERR_PTR(-ENOMEM);
> >
> > --
> > 2.7.4
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
