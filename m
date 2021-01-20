Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534722FCD6E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 10:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5B96E156;
	Wed, 20 Jan 2021 09:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740C56E156
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:28:58 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c12so3832783wrc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EuMk1HsGvXG72o1sJuM2wmg5seWvbCU4qLLOVTwy0NE=;
 b=lBxxZ4GswSVInyIxok3oXd1n3ACnkplEL70CX7GL6vnjXBiD+YEwUhmwNtp6zJleUD
 3981xzipZZMKe5sQl5eU0/ArlERfH11VSDh4HQIYLAX0kdxsmCtrkP4FADpOP3bsomjs
 H6e0vNw6efvefo8rhalodYyz2U8LJegAtVrT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EuMk1HsGvXG72o1sJuM2wmg5seWvbCU4qLLOVTwy0NE=;
 b=AMzXgbq9LU+WZIzKW/vmuztpeS+5AL+tT4Mx+mXh7od0JUjhRlHY4WDfiINpF+gZdp
 pXGjhFCqjZxBkpEkWYMzbsMvgmtDzHfvLYhNGWvRkdNwylivT+XdFASN5GQIekqB6rE1
 yV2U127+64t03W5TJPw9fE2+z9CgzYRY+OkQIX/KF4SYlsSom9+PVLjG1fFskFYacGek
 lMIOIwv7KyZP6JBglcX21kXnKP4gxFPFyITo7mFr6EjyHAnZ85jZme8jCAkALkWsLKPD
 xZ4QKif7QNIjXdZsLvFfuj9/xNsDiMQ4fQXovc3d6VkpZ6jeIB/JrY26NQAh5sO58bp7
 R55Q==
X-Gm-Message-State: AOAM530kjK7RgucMqz74/1fW2zrjA9Ffubu2mz5dXBtnHDQCTyyYtH39
 P0hBlEzk+VAZXHfgNVZDHEbzAw==
X-Google-Smtp-Source: ABdhPJz+7b1bfqPP1JPo1hQ73zoaI4YvCSGRGRon/YOUXqz5kdYShnSsvNDKLimtcSvC2Nj5XgdHQw==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr8211262wrt.21.1611134937140; 
 Wed, 20 Jan 2021 01:28:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i59sm3215375wri.3.2021.01.20.01.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:28:56 -0800 (PST)
Date: Wed, 20 Jan 2021 10:28:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/syncobj: Fix use-after-free
Message-ID: <YAf31kUyABDlbEiL@phenom.ffwll.local>
References: <20210119130318.615145-1-daniel.vetter@ffwll.ch>
 <dd14c09f-acbe-3fa5-2088-a68951847707@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd14c09f-acbe-3fa5-2088-a68951847707@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 02:08:12PM +0100, Christian K=F6nig wrote:
> Am 19.01.21 um 14:03 schrieb Daniel Vetter:
> > While reviewing Christian's annotation patch I noticed that we have a
> > user-after-free for the WAIT_FOR_SUBMIT case: We drop the syncobj
> > reference before we've completed the waiting.
> > =

> > Of course usually there's nothing bad happening here since userspace
> > keeps the reference, but we can't rely on userspace to play nice here!
> > =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Fixes: bc9c80fe01a2 ("drm/syncobj: use the timeline point in drm_syncob=
j_find_fence v4")
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: <stable@vger.kernel.org> # v5.2+
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Pushed to drm-misc-fixes, thanks for reviewing.
-Daniel

> =

> > ---
> >   drivers/gpu/drm/drm_syncobj.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 6e74e6745eca..349146049849 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -388,19 +388,18 @@ int drm_syncobj_find_fence(struct drm_file *file_=
private,
> >   		return -ENOENT;
> >   	*fence =3D drm_syncobj_fence_get(syncobj);
> > -	drm_syncobj_put(syncobj);
> >   	if (*fence) {
> >   		ret =3D dma_fence_chain_find_seqno(fence, point);
> >   		if (!ret)
> > -			return 0;
> > +			goto out;
> >   		dma_fence_put(*fence);
> >   	} else {
> >   		ret =3D -EINVAL;
> >   	}
> >   	if (!(flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
> > -		return ret;
> > +		goto out;
> >   	memset(&wait, 0, sizeof(wait));
> >   	wait.task =3D current;
> > @@ -432,6 +431,9 @@ int drm_syncobj_find_fence(struct drm_file *file_pr=
ivate,
> >   	if (wait.node.next)
> >   		drm_syncobj_remove_wait(syncobj, &wait);
> > +out:
> > +	drm_syncobj_put(syncobj);
> > +
> >   	return ret;
> >   }
> >   EXPORT_SYMBOL(drm_syncobj_find_fence);
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
