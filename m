Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968411E15B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE9B6E03A;
	Fri, 13 Dec 2019 10:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C9D6E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:00:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so5894387wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wNP4rI1DOEGJNKJHekEUoF6Vehge/dTvDIo4/5mFf6E=;
 b=YsQksu/cONoPVHsqBo+Ol3YlvExGinuQQnGqL/9wnK6ssNjv2acpOzR/mF/5xjb0JC
 lLz2XwymDkMLftIpGSrkhlMGozPL55W9NaqX4oKer3AnYFXzByRAb9+fmwOtw3+Oqi0Q
 sRod9k8H6GnE0c2uXvhE2BaddqdnXk2tHRlqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=wNP4rI1DOEGJNKJHekEUoF6Vehge/dTvDIo4/5mFf6E=;
 b=RP8EXw8iNh7gU0SM1RkKULwyH4hUImCSNXMuGujYcsglr4VBAnNz5EDiQd+/4HtH2S
 bCL2DOsnT567jOEMQVNxKYF71u345QSjkTzRHEJImVkRLFZmUqwOU0IsF3bSzkqKFDk6
 pvB2wUlrKv+lAhDpKKbhzfYj5yX10PtfT/hmxBB81WElQYTJcBowmHqz5ruiEK3An7LQ
 kAdkK+sS2K7WtXiUuVMh++nB38ZHjO5IhmuwEH2SafSph6hK4uFM1UEeLco1OzFNcoNm
 h1EXL9oLk/Aq5AtkvqdgEkUc4uOzIIz1OVbYb0fkcxuOXRbTnJkFrXLBmo5QOke5LGHX
 ivig==
X-Gm-Message-State: APjAAAV3x+/KJ/znmIlyXm7vOFYFXXzky83gz3udeGMf5zT5G4+2VkWB
 +7HxjyuEF4pn5VbT0tSWXN+RCg==
X-Google-Smtp-Source: APXvYqzHj5Vgx4Q+eg2SkNOJ4kzSiCtnnqAp5kkKYacZ9gRqcN7iTxNesueCnGqcTcvmU+NnrlE1Zw==
X-Received: by 2002:a1c:8116:: with SMTP id c22mr11985885wmd.27.1576231202109; 
 Fri, 13 Dec 2019 02:00:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id n67sm3084493wmf.46.2019.12.13.02.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:00:01 -0800 (PST)
Date: Fri, 13 Dec 2019 10:59:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
Message-ID: <20191213095959.GA624164@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 gurchetansingh@chromium.org
References: <20191211081810.20079-1-kraxel@redhat.com>
 <20191211081810.20079-2-kraxel@redhat.com>
 <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
 <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
 <20191211123635.GY624164@phenom.ffwll.local>
 <20191211131830.iz3a2o4xzmmkjsp7@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211131830.iz3a2o4xzmmkjsp7@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: David Airlie <airlied@linux.ie>, gurchetansingh@chromium.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 02:18:30PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > btw on why udl does this: Imported bo are usually rendered by real hw, and
> > reading it uncached/wc is the more defensive setting. It would be kinda
> > nice if dma-buf would expose this, but I fear dma-api maintainers would
> > murder us if we even just propose that ... so it's a mess right now.
> 
> I suspect for imported dma-bufs we should leave the mmap() to the
> exporter instead of pulling the pages out of the sgt and map them
> ourself.

Uh yes. If we still do that, then yes very much we shouldn't. Even better
would be to just not do that, because the semantics of dumb gem mmap and
dma-buf mmap differ (the latter has the begin/end access ioctl).

If we can't ditch the mmap I think we should at least improve the helpers
to do the redirect to dma_buf_mmap directly and stop drivers from doing
silly stuff.

> > btw the issue extends to dma access by devices too, e.g. both i915 and
> > amdgpu can select the coherency mode at runtime (using e.g. the pcie
> > no-snoop transaction mode), and we have similar uncoordinated hacks in
> > there too, like in udl.
> 
> Hmm.  Ok.  I guess I'm not going to try solve all that properly just for
> the little virtio fix.
> 
> Just curious:  How do you tell your hardware?  Are there bits for that
> in the gtt, simliar to the caching bits in the x86 page tables?

Brace for contact ...

- on amdgpu it's a bit in the gpu pagetable. I think (but not sure, not an
  expert on these chips) that's the only way.

- on i915 it's a also a bit in the gpu pagetables, but userspace can
  override the caching/coherency mode on a per-texture/render target/*BO
  level in the command stream.

This is why gpus and dma-api don't mix well, since dma-api's goal is to
hide all this even from the driver. gpus otoh leak it all the way to
userspace. The trouble is as old as AGP from 1999 or so, I've become
somewhat cynic at trying to fix this for real and not just with hacks. The
disconnect between what we need and what dma-api kernel people want to
give us is too big to bridge it seems.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
