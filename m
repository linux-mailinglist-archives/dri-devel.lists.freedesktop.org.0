Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB13D5D0E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414F6E99B;
	Mon, 26 Jul 2021 15:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5CB6E99B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:32:39 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id s48so6914485ybi.7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bZ8ITzaMhIy25WIgbU7Rv5rAp8WgRFR/o5Wo5Y00Zgs=;
 b=XPCiG2C6BtOyiY3SPKgdGfD1P26fpUSskyionO9fInoc7xnorCndvz5NvSkumqBoKb
 HY8sN9BG2mBujaDw5RTpJSazFQJm99nKRQs2grPH48ruh+oGm++89Tnq/wgVt8M00MJ5
 XSsSwEtUfHowhtAMeAi0z7WGuilLSYmmNpvqm/jSaqYWSbUmYuNQ1DwTJ4hzU6LSZ19r
 QJvAtDLl8gXydvzlWVR6d7nokkTpZ11dwwe08gsMQ1Dft3C6gAwIS35OfP+UA1Md0UnB
 ZqumfO4P1zOEKeu+m/XlTV+oVKpKgyeS23bdGjbO5II3EXO0fMlsxWZSOoHtl6fVrE0/
 /eOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bZ8ITzaMhIy25WIgbU7Rv5rAp8WgRFR/o5Wo5Y00Zgs=;
 b=KfkfEyp9rApLBDLtgwCMchBr6PU9rv4kae+MKNSZSeLqPvrpF/2YSwQOT1nZBWNU58
 JKhSwTcSr2ZlcLqKIMdTvBWOVImj9X9P+YispQIrskW5GElrOUgpYrJviz12lHgCsFC2
 mQ9Mg+hjadm8sM83jhr3pnjOCpZdvltBcbhlO8ieTRA3gFBnbQXwvCwo4m/+MC/+firt
 Zo2V6mVuOrdYHPYiyORMcuKy1uEmhnVP4KaPM0+j9aBsneZPaVRKh0C3rVU40+FlYVTf
 M34mgw4UlPKohdZK096vMC/bAjDcML8obwsmUrHSbVY74qo6YLBaAibfkr9tVTj6ecYF
 1GIg==
X-Gm-Message-State: AOAM532TT+8NK7sX6H7dcAWDHk4MLu7W5lo9WcVlR1RtY6SvKyCQjf+h
 00Wqxvf/91Hf6IzyFtCQmdLfk7Oiwc0qaR/tqKD/1w==
X-Google-Smtp-Source: ABdhPJy3I3PrvbBiDpzRwbGw8LEsMBhbJZzn33+0qI9dtbuPwFQ0dlIk3FAxk+tSMFC//rjVeoRLB696OL5PxG8F4pU=
X-Received: by 2002:a25:3750:: with SMTP id e77mr7221748yba.469.1627313558296; 
 Mon, 26 Jul 2021 08:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <CAM0jSHOgJQni53DJWP0NWJTAR82PNmb6zgt2Gm-faBd1sDaSHA@mail.gmail.com>
 <CAOFGe95CVvM=7UvH3yBBx9Qr4OPrkRUG7QAXgnSLkWgPGef10g@mail.gmail.com>
 <CAM0jSHNmO8ZGdvLkJhonReHmNXjBkgvjmki-yLmUUkbLTnqeLQ@mail.gmail.com>
In-Reply-To: <CAM0jSHNmO8ZGdvLkJhonReHmNXjBkgvjmki-yLmUUkbLTnqeLQ@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:32:27 -0500
Message-ID: <CAOFGe94ZZxm-cahbrzyDkgXGnXT7yVUiHjYO89-hbG8w2=k+Aw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915: Migrate memory to SMEM when
 imported cross-device (v8)
To: Matthew Auld <matthew.william.auld@gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 10:29 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Mon, 26 Jul 2021 at 16:11, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> >
> > On Mon, Jul 26, 2021 at 3:12 AM Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Fri, 23 Jul 2021 at 18:21, Jason Ekstrand <jason@jlekstrand.net> w=
rote:
> > > >
> > > > This patch series fixes an issue with discrete graphics on Intel wh=
ere we
> > > > allowed dma-buf import while leaving the object in local memory.  T=
his
> > > > breaks down pretty badly if the import happened on a different phys=
ical
> > > > device.
> > > >
> > > > v7:
> > > >  - Drop "drm/i915/gem/ttm: Place new BOs in the requested region"
> > > >  - Add a new "drm/i915/gem: Call i915_gem_flush_free_objects() in i=
915_gem_dumb_create()"
> > > >  - Misc. review feedback from Matthew Auld
> > > > v8:
> > > >  - Misc. review feedback from Matthew Auld
> > > > v9:
> > > >  - Replace the i915/ttm patch with two that are hopefully more corr=
ect
> > > >
> > > > Jason Ekstrand (6):
> > > >   drm/i915/gem: Check object_can_migrate from object_migrate
> > > >   drm/i915/gem: Refactor placement setup for i915_gem_object_create=
*
> > > >     (v2)
> > > >   drm/i915/gem: Call i915_gem_flush_free_objects() in
> > > >     i915_gem_dumb_create()
> > > >   drm/i915/gem: Unify user object creation (v3)
> > > >   drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
> > > >   drm/i915/gem: Always call obj->ops->migrate unless can_migrate fa=
ils
> > > >
> > > > Thomas Hellstr=C3=B6m (2):
> > > >   drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8=
)
> > > >   drm/i915/gem: Migrate to system at dma-buf attach time (v7)
> > >
> > > Should I push the series?
> >
> > Yes, please.  Do we have a solid testing plan for things like this
> > that touch discrete?  I tested with mesa+glxgears on my DG1 but
> > haven't run anything more stressful.
>
> I think all we really have are the migration related selftests, and CI
> is not even running them on DG1 due to other breakage. Assuming you
> ran these locally, I think we just merge the series?

Works for me.  Yes, I ran them on my TGL+DG1 box.  I've also tested
both GL and Vulkan PRIME support with the client running on DG1 and
the compositor running on TGL with this series and everything works
smooth.

--Jason


> >
> > --Jason
> >
> >
> > > >
> > > >  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++------=
--
> > > >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
> > > >  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  20 +-
> > > >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
> > > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  13 +-
> > > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 ++++++++++++++=
+++-
> > > >  .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
> > > >  7 files changed, 341 insertions(+), 136 deletions(-)
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
