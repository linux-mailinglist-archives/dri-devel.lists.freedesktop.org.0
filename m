Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5006276C91
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 11:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73F26E197;
	Thu, 24 Sep 2020 09:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225286E197
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 09:01:03 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id l15so6310337wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=qCkDGWZX97ynHjFjHujFdo86OA+40MBxMrOQVS3IaAM=;
 b=cdCbheIqDUrioR30U47CVZw9JlOK2RPWQTZac1BPS+YgMoDhzxWikJBl2shJ/hgzs/
 amQx5nr8ytP39HZ4aAXf8BcUb93DuCHAHfbpxhZnjLnWobdDQgbC9zDm2Nja9gQwXfW6
 50xC7yGpQg8fOMyDOM5oODamWlgtzFKUXDgB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=qCkDGWZX97ynHjFjHujFdo86OA+40MBxMrOQVS3IaAM=;
 b=lA1v/uLuyXeCJrXYmyvWqQOvGGbf3rYdPhieo2zcxMT3ka/Lv/oJZiz/bK1w8qL/EO
 Gyhj6vwvJzoSkXjcmxATEmxoiHardQ7zc1E9ddFZdQvHfDm1HQGXmv13n9gsUA9BYlXQ
 kKPFXZptoWP0QSfB3FDToxGOSPI6xVkJoaLNc1LamGwy3TGnqevLAkQwzA3u7HE3K3Mg
 5bFLzY7yTO9Oivjs1Sv83636b4oJWHkNRulapbIBl7ljiDy/t6AeetcNbWqPUIlER4c5
 3TDTMkFVsJjNMZzmgZojSyV7mGthkAk36X43waUK3yqexZuo02MWhtjS9DN3hpAjHVFE
 ErAw==
X-Gm-Message-State: AOAM532dvmykPxjNFbkAY6bn7508659+46VJUgfD13Ypev7oROq8ppjw
 S9lr1FskTYfo8Bp+WD8+gylDTA==
X-Google-Smtp-Source: ABdhPJzB0Ca6IeAFm7nX17AldeXw82XTj2lvvGYh5jO1nS4wPy/iE0qMIHIZUoLfVNkqnHAY4Hqxpw==
X-Received: by 2002:a1c:a593:: with SMTP id o141mr3718420wme.88.1600938062413; 
 Thu, 24 Sep 2020 02:01:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w21sm2516264wmk.34.2020.09.24.02.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 02:01:01 -0700 (PDT)
Date: Thu, 24 Sep 2020 11:00:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH 01/11] drm/ttm: add ttm_bo_pin()/ttm_bo_unpin() v2
Message-ID: <20200924090059.GZ438822@phenom.ffwll.local>
References: <20200922133208.1273-1-christian.koenig@amd.com>
 <CAPM=9tzhALOXZeuzGaaNS=ThrZNXLSZuaKYnp7XK7SyzX+8-yw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tzhALOXZeuzGaaNS=ThrZNXLSZuaKYnp7XK7SyzX+8-yw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Roland Scheidegger <sroland@vmware.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 01:01:14PM +1000, Dave Airlie wrote:
> On Tue, 22 Sep 2020 at 23:32, Christian K=F6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > As an alternative to the placement flag add a
> > pin count to the ttm buffer object.
> =

> These all look good to me, nice cleanup.
> =

> For the series:
> Reviewed-by: Dave Airlie <airlied@redhat.com>

Yeah I like, but plenty of review already so I wont bother.

I do wonder whether we should/could lift this one more level to
drm_gem_object, since cma/shmem gem helpers have this too.

But they have hand-rolled locking for it of dubious quality, and don't use
dma_resv_lock for any of this unfortunately. And I guess that would need
to be fixed first.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
