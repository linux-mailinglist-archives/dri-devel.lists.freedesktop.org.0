Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55B3D5CAF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 17:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9EE6FE97;
	Mon, 26 Jul 2021 15:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BFA572D7F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 15:11:21 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id a93so15421184ybi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 08:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BDfwKIgSKbxznyYPJRVzxNju+XZ1+lwgPHYGCuhA5pA=;
 b=jWiIPmZDg1jCBIqZv0cgAmanq2J7sUeaoqbGcMR5vKQ9saX/aLrhpYk4LLNhdxKFSh
 8hrcEx1FxartIX7f5zlCUvfeVhZ7pz38POwhSusGeUM3WFJqfcE54PsNtpp0sX8PVnAl
 Q9DUdjCs+fVhqp95GIyLowoiocfD/VQw97nW4SpazC0c8YMCJoeZnGtMoRXEjg5HUnDQ
 fFYerCmN/7BRMoRvlj17ZA/pUjh5VwhW/8vgk9z9kmb/Au8Vby5dr8g+ElJfz/IRe191
 OidW3mMXyf5cOWTTbToQUdT+hx3tURXwyZpFwH8XyvmP+dhG8KPXCJW9Lc+p9707DTL4
 k8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BDfwKIgSKbxznyYPJRVzxNju+XZ1+lwgPHYGCuhA5pA=;
 b=V64DKXJWPY3fEPtt2F0nqOPzCd4XsOkW7syOFa/FRgFZ1BMOYIlnUKEaqYu1DX+qI/
 bf0cxuqHe+cm0ShWbsKoUjNP5hLlHe9JoTjiakjBhEPkFBPjYeq0pCQ4lrX6VqikkYUb
 jdsfnXd+t4UvnKTB+S78eDXhcwXIe+fnnZrGMyLtJoJLvHS9wR6jUVBRk/gkzPFV3oZf
 iX8zoi2RmHXaDDdBOpwZkeFRUjwgTfUP3I9ATSlssnuCfuYIbckp+oH423fTJmaMGcv0
 92jkrzkM/1HOGIWtgYj9I/KVQ7Jya1OeAHTSBgkg0MgDSXvm2TjmiMhWS80DHCmsP18/
 Zg5A==
X-Gm-Message-State: AOAM530tRHe3p+jvGcUzHImub3AolIunebVVxpAidyWfTntz//mOu5+e
 h9lD47lc4KrlvoijsoTiM6YmYAeUid9cgAjxrDeISg==
X-Google-Smtp-Source: ABdhPJyATk0zkFzsgvDBrEHmWSwloqdqBBw6ZaZ4wfrikFlaRGMdXmqKXlk03IKz4SxHmYqXwGGgMiRHlztE0r7bip0=
X-Received: by 2002:a25:d714:: with SMTP id o20mr10260386ybg.287.1627312280173; 
 Mon, 26 Jul 2021 08:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210723172142.3273510-1-jason@jlekstrand.net>
 <CAM0jSHOgJQni53DJWP0NWJTAR82PNmb6zgt2Gm-faBd1sDaSHA@mail.gmail.com>
In-Reply-To: <CAM0jSHOgJQni53DJWP0NWJTAR82PNmb6zgt2Gm-faBd1sDaSHA@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 26 Jul 2021 10:11:08 -0500
Message-ID: <CAOFGe95CVvM=7UvH3yBBx9Qr4OPrkRUG7QAXgnSLkWgPGef10g@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 3:12 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 23 Jul 2021 at 18:21, Jason Ekstrand <jason@jlekstrand.net> wrote=
:
> >
> > This patch series fixes an issue with discrete graphics on Intel where =
we
> > allowed dma-buf import while leaving the object in local memory.  This
> > breaks down pretty badly if the import happened on a different physical
> > device.
> >
> > v7:
> >  - Drop "drm/i915/gem/ttm: Place new BOs in the requested region"
> >  - Add a new "drm/i915/gem: Call i915_gem_flush_free_objects() in i915_=
gem_dumb_create()"
> >  - Misc. review feedback from Matthew Auld
> > v8:
> >  - Misc. review feedback from Matthew Auld
> > v9:
> >  - Replace the i915/ttm patch with two that are hopefully more correct
> >
> > Jason Ekstrand (6):
> >   drm/i915/gem: Check object_can_migrate from object_migrate
> >   drm/i915/gem: Refactor placement setup for i915_gem_object_create*
> >     (v2)
> >   drm/i915/gem: Call i915_gem_flush_free_objects() in
> >     i915_gem_dumb_create()
> >   drm/i915/gem: Unify user object creation (v3)
> >   drm/i915/gem/ttm: Only call __i915_gem_object_set_pages if needed
> >   drm/i915/gem: Always call obj->ops->migrate unless can_migrate fails
> >
> > Thomas Hellstr=C3=B6m (2):
> >   drm/i915/gem: Correct the locking and pin pattern for dma-buf (v8)
> >   drm/i915/gem: Migrate to system at dma-buf attach time (v7)
>
> Should I push the series?

Yes, please.  Do we have a solid testing plan for things like this
that touch discrete?  I tested with mesa+glxgears on my DG1 but
haven't run anything more stressful.

--Jason


> >
> >  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 177 ++++++++--------
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  58 ++++--
> >  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  20 +-
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  13 +-
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 190 +++++++++++++++++-
> >  .../drm/i915/gem/selftests/i915_gem_migrate.c |  15 --
> >  7 files changed, 341 insertions(+), 136 deletions(-)
> >
> > --
> > 2.31.1
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
