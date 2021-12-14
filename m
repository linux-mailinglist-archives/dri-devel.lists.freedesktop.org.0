Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2EE474599
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11F210E545;
	Tue, 14 Dec 2021 14:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6F810E11D;
 Tue, 14 Dec 2021 14:52:35 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id m17so17416119qvx.8;
 Tue, 14 Dec 2021 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xf7q3Jbcz4/LEcmcTeVISoI2B4bGeUUdk0hxUCLs5rs=;
 b=FHi3n63QOeG6gLzhJVCdkONlfQpsuxOmAKW/cofmDUuTckCd4qt7wzrPBtLFf38Tb+
 xczhmQro+FHcyY+W6wlhd2Sq+Q344IDjN7C31P+Vs/LqsdG1ym0O/AnPKb36EWvJW8y/
 /pr28c+ss/0UsW6wYuaNVwi0NwfBGCtzMBbNmDR73IqCHGKJj/ek4Xq8F83t9by2FunU
 IAFZ435a4UvJ5CbpXMzQ3/gEcwcr2pH08XvUHL//xRzEm2DOW9ur1GyrfFVnyu98v1kI
 fMMtbJ3zynCSm7ZbK99IzJ36XpRZZ7cd4a8Qr+lFLn//i6QS7Q9xAIgsFhZFdC2LAwr8
 hEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xf7q3Jbcz4/LEcmcTeVISoI2B4bGeUUdk0hxUCLs5rs=;
 b=pyk+t1odFHMq6ikdnbc+reXfsxNiDC5Yr0hW/SR6iAVWjMOwE6jtKEVRDIu5X14xKX
 mOXh0EFEslnqk7hj6QX/+mdpi9R1/iCXAIyNh9KXnnFnTJcAX0d97LCH4jb5+Utsbmg+
 iqrPNQKi5N6oJIRKNRuDeJ/qR80EFiduYefiq8skg1lJrq7huKbazYBb/l10Ph9sGEca
 +QRREYtw5/QdWSxXcme+hXr4We+KvWS03mKk1HwHTPmsHvwP68EyHjANjeXbF2v4IA0o
 hBkY5j9Ei4BZI21kQkwOQJlgsMqKpUa44UapAHxbRtmSJMH7XzqSN5u783s7fJ0aW7nD
 PCnw==
X-Gm-Message-State: AOAM530vH3Ku0SiCxcHzzbo7DmmNWs4Ws5H+rjWaQmk5LZ5fmyPmgniU
 FXhgrnSNB4ybQcyFEImsVrLYgIKtb6mLa6nPb1s=
X-Google-Smtp-Source: ABdhPJwS/wVbUCr/fISQSZfIT4fbHE551R+9VucYnxwH9401gRXCgl3ytnT4zp3UABFRvuUFhflcOEQJnA9jSart4iY=
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr5919659qvb.21.1639493554305; 
 Tue, 14 Dec 2021 06:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20211210195005.2582884-1-bob.beckett@collabora.com>
 <e7cad6ca-d106-c529-6f22-93a7847cd7c0@intel.com>
In-Reply-To: <e7cad6ca-d106-c529-6f22-93a7847cd7c0@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Dec 2021 14:52:08 +0000
Message-ID: <CAM0jSHNn4yq1u_Qwr9v9kUCcEexBmb+=LML2=OF1Rspyf-TDfA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: fix large buffer population
 trucation
To: Matthew Auld <matthew.auld@intel.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel list <linux-kernel@vger.kernel.org>, Oak Zeng <oak.zeng@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021 at 13:03, Matthew Auld <matthew.auld@intel.com> wrote:
>
> On 10/12/2021 19:50, Robert Beckett wrote:
> > ttm->num_pages is uint32_t which was causing very large buffers to
> > only populate a truncated size.
> >
> > This fixes gem_create@create-clear igt test on large memory systems.
> >
> > Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
> > Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>
> Nice catch,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Pushed to drm-intel-gt-next. Thanks again for the fix.

>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index 218a9b3037c7..923cc7ad8d70 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -166,7 +166,7 @@ static int i915_ttm_tt_shmem_populate(struct ttm_device *bdev,
> >       struct intel_memory_region *mr = i915->mm.regions[INTEL_MEMORY_SYSTEM];
> >       struct i915_ttm_tt *i915_tt = container_of(ttm, typeof(*i915_tt), ttm);
> >       const unsigned int max_segment = i915_sg_segment_size();
> > -     const size_t size = ttm->num_pages << PAGE_SHIFT;
> > +     const size_t size = (size_t)ttm->num_pages << PAGE_SHIFT;
> >       struct file *filp = i915_tt->filp;
> >       struct sgt_iter sgt_iter;
> >       struct sg_table *st;
> >
