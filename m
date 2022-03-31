Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE74EE225
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 21:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEDA10E082;
	Thu, 31 Mar 2022 19:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B258210E082;
 Thu, 31 Mar 2022 19:54:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b19so1204020wrh.11;
 Thu, 31 Mar 2022 12:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+woCqSRN/iPJPDhXido2RTys7AhCgzJm7RlMHPDtp4=;
 b=L8zzTUHI02LY2DUF6K1iFRY9ZUoFqty0Mfod+IdwlXRT49VTPLlTNtr6gUjNfio+lH
 UeIfRaTUOb8BICGNlKrumSq8EjzTMrf9tTcPciDWG0CFitmHeCl3gLLQNaG4q8KmCjZv
 UYcLumBp3/XXoj4KVE3vnJ1N8Bf1HAqnNFxUXcnB/xir0UFlooFLKIAOhS/FY59k1jLi
 7sYFTZSWsLgeaxm6RJ/8EKZtiJSEc8bJI1AwxAOJqIoG2AXOIRoFoWDZC2TSDfXYgbyZ
 0ukisy7tdPxLp4C0VX04Hg3zt0igZbMvSCezV/rV2akbZBgoL4XBJucJBGMO0FXseGb1
 5Qhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+woCqSRN/iPJPDhXido2RTys7AhCgzJm7RlMHPDtp4=;
 b=Nb5ljWJXDnBvbZewI9OgY7rk3s1PnkeYef2j0YNcUyjYncXzYUGK9wmax/0L+oP0fa
 CJe0rLjFgGpz4crXqSX0Oi9iD0fRbBpDR/kMl6M2CssSTns5gOGWgNEc1F88cAe7A7ZP
 gVTBai+RhkyDHE/7HzaCpKgXDnBOabQR1sCDm2zXHNuY7DUkvqH9QAPNmwfeeohktwzz
 +7YAc9Nzjoq83tprDYDiZz5haWNuRbjl3n5jjSOHVJOJzleXHNd4kxiH46Sn7A9No4VS
 k/xg0SLlRN4La2gy28MNtlh3Ps651vb0D8lrQkBo54PTQuP93sxN4oBpzmX6FBkW0tBO
 8jzg==
X-Gm-Message-State: AOAM532h356nGRlIA5fCSov4YV0O5xgEHhhn8yxrPG1hi39yeRinMvrJ
 PpbCEyB16GhZOSxWWNtd6YIYgvPM+4bGkPHthS0=
X-Google-Smtp-Source: ABdhPJxCn8bZA1ok0IRYryEvFh8skfsiOCJwEL2rMyo66Je1AvtOILxEmYjajETgMg9CBpv8K4ncluCui4jKiXIE0Yo=
X-Received: by 2002:adf:f20f:0:b0:203:fc73:a9a0 with SMTP id
 p15-20020adff20f000000b00203fc73a9a0mr5302332wro.418.1648756458095; Thu, 31
 Mar 2022 12:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220330204804.660819-1-robdclark@gmail.com>
 <20220330204804.660819-11-robdclark@gmail.com>
 <ad97096f-cc90-4f20-0f73-f33e9b275f1a@collabora.com>
 <CAF6AEGvZqM1OT_n1C+x+C1GTd4PbFkH4c7P-BseDOUGj7yj3Eg@mail.gmail.com>
 <22d9a9ff-1c44-ed41-6ae1-59a1f965ab6c@collabora.com>
In-Reply-To: <22d9a9ff-1c44-ed41-6ae1-59a1f965ab6c@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 31 Mar 2022 12:54:06 -0700
Message-ID: <CAF6AEGuX0EKU+XqvkhwNBgR733pa4ZPr2+i51uTQz85mjxh-2Q@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] drm/msm: Add a way for userspace to allocate GPU
 iova
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 12:41 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 3/31/22 22:02, Rob Clark wrote:
> > On Thu, Mar 31, 2022 at 11:52 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> ...
> >>> +/*
> >>> + * Get the requested iova but don't pin it.  Fails if the requested iova is
> >>> + * not available.  Doesn't need a put because iovas are currently valid for
> >>> + * the life of the object.
> >>> + *
> >>> + * Setting an iova of zero will clear the vma.
> >>> + */
> >>> +int msm_gem_set_iova(struct drm_gem_object *obj,
> >>> +                  struct msm_gem_address_space *aspace, uint64_t iova)
> >>> +{
> >>> +     int ret = 0;
> >>
> >> nit: No need to initialize the ret
> >
> > actually, we do
>
> Indeed, sorry :)
>
> ...
> >>>  int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
> >>>               struct msm_gem_address_space *aspace, uint64_t *iova,
> >>>               u64 range_start, u64 range_end);
> >> nit: There is an odd mix of uint64_t and u64 (and alike) in the MSM code
> >> :) The uint64_t variant shouldn't be used by kernel code in general and
> >> checkpatch should want about it.
> >
> > one of many things that I disagree with checkpatch about ;-)
> >
> > I prefer standard types to custom ones.  I _kinda_ get the argument in
> > case of uapi (but IMHO that doesn't apply to how drm uapi headers are
> > used)
>
> I'd understand if it was all either uint64_t or u64, but the mix.. hm.

yeah, fair, we could be a bit more consistent

BR,
-R
