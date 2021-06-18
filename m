Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05283AD453
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 23:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6516EA1F;
	Fri, 18 Jun 2021 21:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E686EA1F;
 Fri, 18 Jun 2021 21:18:46 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 r14-20020a4ad4ce0000b029024b4146e2f5so1117306oos.1; 
 Fri, 18 Jun 2021 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i0K+CAkNDpvB9BB97WZi89Hi6upuBxwc1H/Mi+DoJdg=;
 b=fnkDSVaxmmiYYY7PApmGvgt3XGZMKQQuXdKVCe8SV5LmeC02fsTYaSifl9w/lKEHex
 1Z4pBuWzh9z0n4hEZBwZENE71tqMxeS5wpROgfbo1WuaMGjwZPc1kjqx+CjzQMhJysKo
 wnEN6bmn8EindP4YDnEdnDMtpRivzjOF8QCxsz3woF3poD2CS8v7/1Rv15/ISBXBHxht
 Q+ec7OplAgnu7st7fbSptLw3eqt+rjdvA3PtcnFCs3mt0lCh1SDD3DboCKfo/cBzTPhU
 Wd7E19I+l5gfE+AyJC2lQBpO26flNLHi1WG7YivbYHRfepAl0NA1jA/2ZX/E4MEAA6b2
 Ikdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i0K+CAkNDpvB9BB97WZi89Hi6upuBxwc1H/Mi+DoJdg=;
 b=kv8jB+txElX3DLnSGD0lF5OXq/fCGUvtlFHRq6YKpXsA81PVlrW9KRPChwI7aMeOHj
 zmROBPmepdb6NxT94gYvglQ+od8H03RI3TfEnlUECp4ODGIPvGQrAqDb8odX7d+8J0cp
 0i0TK/Z6ZD3vMNsJgfuIym0mji0VpJVIu0sVp5bajFvpyure18FepJXAYLbPPpmFYZ9z
 tBjSNc8qFJjyivGdmnv2nb01r2vpd/wO1Lu/MuPzZC0YeTZaowLw7tbe3PSigBOCn+Zd
 rJTzCbfogw35WWBM0Hfnuw56jsbftIRKnqEs9p1sdoU1fL6TSL/rtbjP8S6qB1GLE5uz
 QpQg==
X-Gm-Message-State: AOAM530bS+rbsXq0aaTiokHdee+iJYVDhh023Rsbj7n6UWeVw7ZPKpVr
 Bqcr3Cd0WM0yS0cyZKpsNOjtXp1S165jaXdSXnM=
X-Google-Smtp-Source: ABdhPJwAdPB2OKndxiBb3QLHU+rMPZGzghYSrerKY4S9jGUMqziKf7k9wPNnlVoECnFAIi2jVZbvAGsi+JDiVVIGxbk=
X-Received: by 2002:a4a:2242:: with SMTP id z2mr10559229ooe.90.1624051126161; 
 Fri, 18 Jun 2021 14:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <YMxbQXg/Wqm0ACxt@mwanda>
 <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
 <adee15a2-f531-688c-1121-7504163ae441@amd.com>
In-Reply-To: <adee15a2-f531-688c-1121-7504163ae441@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 17:18:34 -0400
Message-ID: <CADnq5_MtwTXEv=HitiyBfdSyBb-izSRiR3W=zxKNKRNvxdKO1A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 11:40 AM Felix Kuehling <felix.kuehling@amd.com> wr=
ote:
>
> Am 2021-06-18 um 4:39 a.m. schrieb Christian K=C3=B6nig:
> > Am 18.06.21 um 10:37 schrieb Dan Carpenter:
> >> There is a reversed if statement in amdgpu_preempt_mgr_new() so it
> >> always returns -ENOMEM.
> >>
> >> Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of
> >> git://anongit.freedesktop.org/drm/drm-misc into drm-next")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Most be some fallout from merging it with the TTM changes.
> >
> > Anyway, patch is Reviewed-by: Christian K=C3=B6nig <christian.koenig@am=
d.com>
>
> This is obviously not for amd-staging-drm-next. Christian, are you going
> to apply it to the relevant branches?

I've applied it to my drm-next branch.

Alex


>
> Thanks,
>   Felix
>
>
> >
> > Thanks,
> > Christian.
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> index f6aff7ce5160..d02c8637f909 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> >> @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct
> >> ttm_resource_manager *man,
> >>       struct amdgpu_preempt_mgr *mgr =3D to_preempt_mgr(man);
> >>         *res =3D kzalloc(sizeof(**res), GFP_KERNEL);
> >> -    if (*res)
> >> +    if (!*res)
> >>           return -ENOMEM;
> >>         ttm_resource_init(tbo, place, *res);
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
