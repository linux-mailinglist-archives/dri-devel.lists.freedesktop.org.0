Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F6A262BC9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 11:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28656ED9C;
	Wed,  9 Sep 2020 09:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A356ED9C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:27:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a9so1629735wmm.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e/KcuAN9QzdMFlBqjcdWiwsangKd6hbYBKhhvIQmYDI=;
 b=JppyDtynYf89A+LmTxDUG7uX7+lb9WDj1DK/r9h+ECxUT6Hypw5tA9bQaAU2CLCVz6
 lpOosLtgKSjFhRlUyWh/5lJzb7FS2JhP/tD50fc0IPxrJJnmXZy3Y9deClLiORgmtBPP
 Qqjvfx6Grx/sdbs5REtis2qe8kEAuSPh8D7KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e/KcuAN9QzdMFlBqjcdWiwsangKd6hbYBKhhvIQmYDI=;
 b=Gxti+eLAqerV2s3NerPco7FpaVMSgJg9TDq070nMJqav6IAinH1xYMf5OQhsrh051X
 GB+aON69G6IJs71bC5UTZica3rcTI8Ei5+5CeDTUrqDO20YkZDciuOd/S49ScXZ3ksta
 KH6h2CEs/ufpNt9WsiSc2Z5KkAk0+KkH5xU3W973kWb+OWFLIbB+lU83V3lD7Pbek66s
 7PviH+g9OtCZhjZAjlLgpr6bAdqyLDoF2znfT3gRG+x1jjbnjwyJ05Ai+YBwmXVgNSTo
 VBvRsSadDV/NpZQiCwbuom0an/h4Ntxf64itw2SIHOvVi+fWfppettEngdRv5eufxkFf
 IUPg==
X-Gm-Message-State: AOAM530Af/SQIQGvGHFV2eOlNDo45sxmoSjQEfn/7/GfDjTKg2pBdEnr
 S7noicHo5PW6HhRUCNkH3Sydsw==
X-Google-Smtp-Source: ABdhPJxZ00Tl5zRRg8F32Mtu493ed9A3G8xTrwmeQufNntsZu3Ii8rXVlvj2IgTVJiHp5gYMTqhUag==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr2536307wmc.98.1599643621934; 
 Wed, 09 Sep 2020 02:27:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p9sm2873213wma.42.2020.09.09.02.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 02:27:01 -0700 (PDT)
Date: Wed, 9 Sep 2020 11:26:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
Message-ID: <20200909092646.GA438822@phenom.ffwll.local>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
 <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
 <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 09, 2020 at 09:13:11AM +0200, Miklos Szeredi wrote:
> On Wed, Sep 9, 2020 at 9:04 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Wed, Sep 02, 2020 at 05:00:25PM -0700, Gurchetan Singh wrote:
> > > On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >
> > > > Hi Gurchetan,
> > > >
> > > > Now Miklos has queued, these tree virtio patches for shared memory
> > > > region in his tree as part of virtiofs dax patch series.
> > > >
> > > > I am hoping this will get merged in 5.10 through his tree.
> > > >
> > > >
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax
> > >
> > >
> > > Terrific ... !  Maybe we can queue the version Miklos has in drm-misc-next
> > > to avoid merge conflicts ?!?
> >
> > I guess it would either be merging the fuse tree into drm-misc-next,
> > or cherry-picking the three virtio shm patches from the fuse tree.
> 
> Maybe cleanest if we'd do a separate branch for the virtio patches and
> pull that into both the fuse-next and the drm-misc-next trees?

+1

If the trees are more closely related (e.g. drm and v4l or so) then
occasionally we just merge patches into one tree with acks from all the
other maintainers. But topic branch for the common bits feels better here.

Please send the topic pull request to drm-misc maintainers (Maarten,
Maxime, Thomas) so they can pull it in.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
