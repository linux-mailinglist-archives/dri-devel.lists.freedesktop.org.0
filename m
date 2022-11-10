Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F37624AFA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 20:53:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7874B10E811;
	Thu, 10 Nov 2022 19:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934AF10E801;
 Thu, 10 Nov 2022 19:53:21 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 cb2-20020a056830618200b00661b6e5dcd8so1712305otb.8; 
 Thu, 10 Nov 2022 11:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zpfnjo6fuKJE8yLJQoDwZgOT81sN9KFgm37VuSuSsoI=;
 b=AEc2Ulr7BLL70AOCBMaHt2UsMwr6+9EP3ynlc/2fmvRfgc2VeZfad8L/9JGKr05Mii
 Utn9K6juw2NXoJGFoLdyDFz2JRoVTT2qm4GEmJ1EYHiiieVyEmQ31WMUlkFnvg/aNoof
 SC3QTWN3TrymEXwee/Ip9zkqYXICw+JukrR4lGl4aNqdNpGuCRFOzOvBKTWtOSi1tmLO
 Zz2xh2lFBy3166FYx6N8fwbBfkjpO/DneI8/lwtXM9olCW0za5reusXFxdcTZmG2zzAg
 r9zxULuvLY5Pt4MJGMnPxlxryrszCpq7vIQTFsnCLbkCLf6XnpUIM5WFlxrP2o5QRSLU
 UIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zpfnjo6fuKJE8yLJQoDwZgOT81sN9KFgm37VuSuSsoI=;
 b=vyVQ7M+KV+oU1nP/nww1TJbuXttdAfRA9z0L8VjLExxQTCwjkx92WPhVHyRTgYLU31
 l2cYMTHL9/RFABMrGXzz9EyVjlGfW83hqG1mDQ0HyM2nGs51PrefBRCpwbDb/cpowo1v
 D4mZ2oYEqVfIYGuzD5rNOyEyb7deqCwwfalRSP3TP6bTXncgEow81jLGwCDBR/vdlFOF
 okoZE+HiEJRu9qxt2MMfotAD3+qs5tpV27ztMUVrToAd0+y9hmr2uMnIZl6oTiBnjIm8
 8vW+G1LkfRlutu9I8vd49DGwbgSiM+Wk/ruRB3jafZ1LenRl24lLwxSSsgFdYzpH4sfe
 Tr/w==
X-Gm-Message-State: ACrzQf1Uy9scgIghLFSXLlzomHnlj58XL5ttWpX0uL4TlJFEmi8vQV0H
 SqVxLDBzZlj6ACYZ45yYiywpqTjHcg1AQbKqDnGTl6Ia
X-Google-Smtp-Source: AMsMyM6GTfCbCbTHTtTnna9tPa6LbeHqRl1Ez14DGsKLtXZMNbChl/N6T2J5nDrBsECpJgEcabjTphutuxhgBDTjARY=
X-Received: by 2002:a9d:7f05:0:b0:66c:7982:2d45 with SMTP id
 j5-20020a9d7f05000000b0066c79822d45mr1805642otq.123.1668110000768; Thu, 10
 Nov 2022 11:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20221110143314.708434-1-dongchenchen2@huawei.com>
 <075b9979-e956-1f01-2a57-0ff0e15d9de6@amd.com>
In-Reply-To: <075b9979-e956-1f01-2a57-0ff0e15d9de6@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 10 Nov 2022 14:53:09 -0500
Message-ID: <CADnq5_PKw4W18kY3jAhxjD6yMQqbt9X8OXwj4rb0opH3YsLBaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_cs_pass1
To: Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Xinhui.Pan@amd.com, yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Dong Chenchen <dongchenchen2@huawei.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 1:08 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Thanks for fixing this.
>
> Please add a Cc tag to stable, and repost.

No need for stable.  This patch just went upstream in 6.1, so I can
include it in my 6.1 fixes pull next week.  Applied.

Thanks!

Alex

>
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>
> Regards,
> Luben
>
> On 2022-11-10 09:33, Dong Chenchen wrote:
> > When p->gang_size equals 0, amdgpu_cs_pass1() will return directly
> > without freeing chunk_array, which will cause a memory leak issue,
> > this patch fixes it.
> >
> > Fixes: 4624459c84d7 ("drm/amdgpu: add gang submit frontend v6")
> > Signed-off-by: Dong Chenchen <dongchenchen2@huawei.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > index 1bbd39b3b0fc..0e24d6b80e0b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -287,8 +287,10 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
> >               }
> >       }
> >
> > -     if (!p->gang_size)
> > -             return -EINVAL;
> > +     if (!p->gang_size) {
> > +             ret = -EINVAL;
> > +             goto free_partial_kdata;
> > +     }
> >
> >       for (i = 0; i < p->gang_size; ++i) {
> >               ret = amdgpu_job_alloc(p->adev, num_ibs[i], &p->jobs[i], vm);
>
