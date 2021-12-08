Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F6046D2E0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 13:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2E56F63E;
	Wed,  8 Dec 2021 12:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C576F5FC;
 Wed,  8 Dec 2021 12:01:42 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 193so1698023qkh.10;
 Wed, 08 Dec 2021 04:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ac47yCDzGbB62pbQWVOPBxd2hhH97T+NHeyW7o92Jvc=;
 b=B4SUoQYWluH/XIv8f+QSXC+YZwRaYARnwT5DhpHUR2afbyBInXdpgamA5rlxghJL1+
 w0Vb65fd8D/AOxKLBhy/Iab+h0WoiCy/ttsXw5aJiGMllcbzeTubPczmDid946AXQB5q
 wHNUpg9gOn6ygZ1gMHy9Gi4kzgc1em0L0++TxoL0xZmEKyVQY4OFxTP6fEd7WW4OToDR
 Yisjmb2ZN7N9G9QGVEU+GUzyIZO+eErs1YlQqp3eRBkomV7jbCPlXuCfObiSISsHJyNz
 It4RFnQGeK8BVo4tbonCbepAGM17zkQFgxAbbAgle7RuVZNcuG7cH+SO7vwHG1xHTZGJ
 X8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ac47yCDzGbB62pbQWVOPBxd2hhH97T+NHeyW7o92Jvc=;
 b=YIBnSVng11GViO9k97p2p6wsFTWnji0Lm7/KH2leJtTLBfEUspwd5HK+iojU94YLqg
 xGQT0eYVIpZXXh0lC9V945u8ugCdp+1qMeBAzX0Fh8xGsmoD96EoKaTcAjRskblvTO+o
 CCOF3qO6FpvKUNM4krb8EOLH93TZ+vaqMfHR5qGR2ZS3oROMR+DnXM3dDvhSMuMPBQqk
 oAPBpr1eg2md9ZoSSV65WRTb/OJVJbkucBLmGwMnhrzBlcKQUt5SV3kj65LtE6QfYzkd
 nSlpyW/pqaJcr9gqjwABW3WSjmhO/VNyG5RGF7JhLUiKtnWo34uBF47EMlgHZ192DCnj
 K3hw==
X-Gm-Message-State: AOAM530aQSkWmBbpyQvopgGoauPj6cmluK+tkso98RQJRrEyyCoqbiDi
 7X6qpuKEInPY9guVL1KWYkaj923SWJvzxjRyd4+TwDp0KuM=
X-Google-Smtp-Source: ABdhPJxuBsn0l7S9ZMLXepjUb+uxQx3fFblNP3NIZm+xBAlFzvEDOtChiJZrbLcW9Gip+mevlKjkXiPLjns8rBR4r54=
X-Received: by 2002:a05:620a:2413:: with SMTP id
 d19mr6163514qkn.82.1638964901153; 
 Wed, 08 Dec 2021 04:01:41 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-10-maarten.lankhorst@linux.intel.com>
 <CAM0jSHNwB1Vtcv7owM8rEEXiTJEpuhYAf8j6i9f5xx8LH9kcig@mail.gmail.com>
In-Reply-To: <CAM0jSHNwB1Vtcv7owM8rEEXiTJEpuhYAf8j6i9f5xx8LH9kcig@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 8 Dec 2021 12:01:14 +0000
Message-ID: <CAM0jSHMG1xpUqNZs-JV4yD6G00kGgZoHed=xfR2s-S6UoLvwCQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 09/16] drm/i915: Ensure i915_vma tests do
 not get -ENOSPC with the locking changes.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Dec 2021 at 11:49, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Mon, 29 Nov 2021 at 13:58, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> >
> > Now that we require locking to evict, multiple vmas from the same object
> > might not be evicted. This is expected and required, because execbuf will
> > move to short-term pinning by using the lock only. This will cause these
> > tests to fail, because they create a ton of vma's for the same object.
> >
> > Unbind manually to prevent spurious -ENOSPC in those mock tests.
> >
> > Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Hmm, do we need this? It looks like we should be able to handle such
> scenarios, with already locked objects sharing the same dma-resv? Or
> is something else going on here?

Oh, because trylock still "fails' in such cases? Do the later changes
to evict_vm, where it is able to handle already locked objects fix
this? Do we not need similar treatment for things like evict_for_node?

>
> > ---
> >  drivers/gpu/drm/i915/selftests/i915_vma.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > index 1f10fe36619b..5c5809dfe9b2 100644
> > --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> > @@ -691,7 +691,11 @@ static int igt_vma_rotate_remap(void *arg)
> >                                         }
> >
> >                                         i915_vma_unpin(vma);
> > -
> > +                                       err = i915_vma_unbind(vma);
> > +                                       if (err) {
> > +                                               pr_err("Unbinding returned %i\n", err);
> > +                                               goto out_object;
> > +                                       }
> >                                         cond_resched();
> >                                 }
> >                         }
> > @@ -848,6 +852,11 @@ static int igt_vma_partial(void *arg)
> >
> >                                 i915_vma_unpin(vma);
> >                                 nvma++;
> > +                               err = i915_vma_unbind(vma);
> > +                               if (err) {
> > +                                       pr_err("Unbinding returned %i\n", err);
> > +                                       goto out_object;
> > +                               }
> >
> >                                 cond_resched();
> >                         }
> > @@ -882,6 +891,12 @@ static int igt_vma_partial(void *arg)
> >
> >                 i915_vma_unpin(vma);
> >
> > +               err = i915_vma_unbind(vma);
> > +               if (err) {
> > +                       pr_err("Unbinding returned %i\n", err);
> > +                       goto out_object;
> > +               }
> > +
> >                 count = 0;
> >                 list_for_each_entry(vma, &obj->vma.list, obj_link)
> >                         count++;
> > --
> > 2.34.0
> >
