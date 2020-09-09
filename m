Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A10262BD7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 11:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB076EDA4;
	Wed,  9 Sep 2020 09:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532286EDA4
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 09:28:54 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id m7so256965oie.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0inJuL4sRrcKHUwGFyK4jcWRNyHCE5SmI1z8/yZdqng=;
 b=Z+/F/UciBmwLwyI+aeCSc/z+F1B6GpzP66/J5VBB0pDIUSXHtRUxgUWVgoAZt8p7uE
 cwTS7msQi7fGqe2ulcBfjIovjHtnBZpxH33wvWvbeLVINJHapcsRWwYZJWxJmTBnc9wg
 UCyrhSkiFit6p4LPORAuTyYmlYTYOXTVtwM9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0inJuL4sRrcKHUwGFyK4jcWRNyHCE5SmI1z8/yZdqng=;
 b=YuC7cF1Dab+hFdmJVYkD/JWvnyJo/B+UNAfM35J7AfbRS3Ws9wpLcV0A4TKlV66+M+
 tWzYYlT/sb1W30vvScdnfJjAkZEXYE3sQ+Ypb4NgB2zGlLBVrdRVf+ZgRj5hocGE/+ce
 wHnLDtRj8XOwCKg98eWhgN2vHia5XkhlS+pnFCoripWXDM+COQ7Ich+dyIhQjkbtSfZV
 2ODFoN9ZtQAUnfGrRaj3oO87UpAQDy+lqn8mnkw/5r304NE0fPDC5//iNdSNyEYNqHBR
 xk874BOGtMij/N2OcZsZKhahtYNerFJCaWa9PtgdB4ID5DWkfneFJAg4uz7cpivTZYeu
 d/cQ==
X-Gm-Message-State: AOAM530253qnOzSd9bbcYax9E/SB79HDnUZSZlHRi5nxmdF+7USsHAel
 t+C7lTJWp30i0veckRGWZRYfyeZUqWJ8e2i6pQ+PPg==
X-Google-Smtp-Source: ABdhPJz6mrcNGS1b3Q7dra8w0NC+dIMkaNxf4t/d/+aad6O0Py+SxYsRzsI+Lf4PLd4M093uIPqsHoqGpgN8NGLoHo8=
X-Received: by 2002:aca:de41:: with SMTP id v62mr32883oig.128.1599643732207;
 Wed, 09 Sep 2020 02:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
 <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
 <20200909070349.uyvg44xakdftibxh@sirius.home.kraxel.org>
 <CAJfpegsMEZoCQe7frsr9Kaq6EZsuRFWP3zs7sgrxnUDLzfcx_w@mail.gmail.com>
 <20200909092646.GA438822@phenom.ffwll.local>
In-Reply-To: <20200909092646.GA438822@phenom.ffwll.local>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 9 Sep 2020 11:28:40 +0200
Message-ID: <CAKMK7uHzES32APTafwYjWc=-hswGe3q7Re4Rw354hKwA+mb0zg@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
To: Miklos Szeredi <miklos@szeredi.hu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 9, 2020 at 11:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 09, 2020 at 09:13:11AM +0200, Miklos Szeredi wrote:
> > On Wed, Sep 9, 2020 at 9:04 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > On Wed, Sep 02, 2020 at 05:00:25PM -0700, Gurchetan Singh wrote:
> > > > On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > > >
> > > > > Hi Gurchetan,
> > > > >
> > > > > Now Miklos has queued, these tree virtio patches for shared memory
> > > > > region in his tree as part of virtiofs dax patch series.
> > > > >
> > > > > I am hoping this will get merged in 5.10 through his tree.
> > > > >
> > > > >
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax
> > > >
> > > >
> > > > Terrific ... !  Maybe we can queue the version Miklos has in drm-misc-next
> > > > to avoid merge conflicts ?!?
> > >
> > > I guess it would either be merging the fuse tree into drm-misc-next,
> > > or cherry-picking the three virtio shm patches from the fuse tree.
> >
> > Maybe cleanest if we'd do a separate branch for the virtio patches and
> > pull that into both the fuse-next and the drm-misc-next trees?
>
> +1
>
> If the trees are more closely related (e.g. drm and v4l or so) then
> occasionally we just merge patches into one tree with acks from all the
> other maintainers. But topic branch for the common bits feels better here.
>
> Please send the topic pull request to drm-misc maintainers (Maarten,
> Maxime, Thomas) so they can pull it in.

Works better when I add them :-)
-Daniel

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
