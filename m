Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E08B6CDF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 10:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815CA10E889;
	Tue, 30 Apr 2024 08:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hYfUtAMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94ED10E889
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 08:36:21 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2db8021275eso13492391fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 01:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714466180; x=1715070980; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGVB/W5mrOB3l6iBdxjqJlIucqWuwhmZ4dypg7eBhxs=;
 b=hYfUtAMaNK8GI0xJgLqRZhF7FKy9dTyGvy/NkbPGeqL4DszyIggh5c7niMmzraqkx6
 Yd8LyjP6XirsJV0ty8ulvJPTBh3mtu/rRZ3n+eOrWzl2hfKdWelRTDIX7gjh/MaSNrxF
 sug5t2rV/Kg9SeJ9SP4e7L+3h2Zox5HWXLctI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714466180; x=1715070980;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fGVB/W5mrOB3l6iBdxjqJlIucqWuwhmZ4dypg7eBhxs=;
 b=FykvkAZUqvzFLydQcKKrX7wElxDNHRgAWizp4ou1k88YpfAEmx5J/lNKCIxqfDABn3
 C63wAbjqU6UAlVs69PScnQptd9hTpHJ0yaKFHv2hwtJM+L6eq6EYooFjLYNQNmkQvK5W
 WGg2JHTiunMXDrhtvxj4t2oNh58YYUtjihZRfZ+y78igkTootvOPDZJEDBa5MJ7SUAYR
 pr9+9TF0w9i8Iz78tfZIbqSqqNE+js/bRh6h3EscPJWlnDEdf3GCKFMK7eaoJlfBvBwT
 U7bcih+zdZ/q1ZvimjfSOcSP9rlVPTjqI8bhLaBhwSi5DCzIToEyXZoGKmfKxBeIWNZ8
 BkBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0flR6tb8IjknWwVcytbR7aK3Ei+LV7jLM6PgBicdM7OZdAwf5Z3TZyaM3g7cxIoXm88TP6a9l2gKnQiCv9VltWTnQE+rxAlPsDCNGT1Av
X-Gm-Message-State: AOJu0YywpEKAHGDWjhOd4txesluGhvF8MkWVy+9f3XNkLNXudskmo3rh
 DvCi7SY8EaLpWn/nAHP/eK0/UiJNXDC9wyjTL8PBIb4f4GzxBzsZGhojmNqVLNQ=
X-Google-Smtp-Source: AGHT+IEYFTGK3s8lpOgKS5ZwMqfeIgo5p84oT5kN52Xbo3XKHDHug3/cbMfIkcCiFuK9z1+GK7/Cnw==
X-Received: by 2002:a19:381a:0:b0:513:9d6b:6d6d with SMTP id
 f26-20020a19381a000000b005139d6b6d6dmr7386406lfa.5.1714466179684; 
 Tue, 30 Apr 2024 01:36:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b0041be78ae1f0sm11303980wmq.2.2024.04.30.01.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 01:36:19 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:36:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Cc: marius.vlad@collabora.com, mairacanal@riseup.net, jshargo@chromium.org,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v6 0/7] Adds support for ConfigFS to VKMS!
Message-ID: <ZjCtgSaL50YrS-F-@phenom.ffwll.local>
Mail-Followup-To: Brandon Pollack <brpol@chromium.org>,
 marius.vlad@collabora.com, mairacanal@riseup.net,
 jshargo@chromium.org, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
 hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
References: <20230829053201.423261-1-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829053201.423261-1-brpol@chromium.org>
X-Operating-System: Linux phenom 6.6.15-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:30:52AM +0000, Brandon Pollack wrote:
> Since Jim is busy with other work and I'm working on some things that
> rely on this, I've taken up the task of doing the iterations.  I've
> addressed the comments as best I can (those replies are to each
> individual change) and here is the patch set to go with those.
> 
> I added my own signoff to each commit, but I've left jshargo@ as the
> author of all the commits he wrote.  I'm sure there is still more to
> address and the ICT tests that were writtein parallel to this may also
> need some additions, but I'm hoping we're in a good enough state to get
> this in and iterate from there soon.
> 
> Since V6:
> ========
> rmdirs for documentation examples
> fix crtc mask for writebacks
> 
> Since V5:
> ========
> Fixed some bad merge conflicts and locking behaviours as well as
> clarified some documentation, should be good to go now :)
> 
> Since V4:
> ========
> Fixed up some documentation as suggested by Marius
> Fixed up some bad locking as suggested by Marius
> Small fixes here and there (most have email responses to previous chain
> emails)
> 
> Since V3:
> ========
> I've added hotplug support in the latest patch.  This has been reviewed some
> and the notes from that review are addressed here as well.
> 
> Relevant/Utilizing work:
> =======================
> I've built a while test framework based on this as proof it functions (though
> I'm sure there may be lingering bugs!).  You can check that out on
> crrev.com if you are interested and need to get started yourself (but be
> aware of any licensing that may differ from the kernel itself!  Make
> sure you understand the license:
> 
> https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/tast-tests/LICENSE
> 
> That said, you can see the changes in review on the crrev gerrit:
> 
> https://chromium-review.googlesource.com/c/chromiumos/platform/tast-tests/+/4666669
> 
> Outro:
> =====
> I really appreciate everyone's input and tolerance in getting these
> changes in.  Jim's first patch series was this, and other than some
> small cleanups and documentation, taking over it is also mine.

Sorry for not having looked at this earlier. I think overall it's looking
good, mostly just a bunch of comments on lifetime/locking questions.

I'm also wondering a bit how much we want to go overboard with igt tests,
since the lifetime fun is quite big here. I think at least some basic
tests that trying to do nasty things like unbind the driver in sysfs and
then try to use configfs, or keeping the vkms_device alive with an open fd
and removing the configfs directory would be really good.

One thing that's a bit tricky is that configfs is considered uapi, so must
be stable forever. And I think that's actually the right thing for us,
since we want compositors and other projects to use this for their
testing. So unlike igt tests using special debugfs interfaces, which are
ok to be very tightly coupled to kernel releases

Cheers, Sima
> 
> Thank you everyone :)
> 
> Brandon Pollack (1):
>   drm/vkms Add hotplug support via configfs to VKMS.
> 
> Jim Shargo (6):
>   drm/vkms: Back VKMS with DRM memory management instead of static
>     objects
>   drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
>   drm/vkms: Provide platform data when creating VKMS devices
>   drm/vkms: Add ConfigFS scaffolding to VKMS
>   drm/vkms: Support enabling ConfigFS devices
>   drm/vkms: Add a module param to enable/disable the default device
> 
>  Documentation/gpu/vkms.rst            |  20 +-
>  drivers/gpu/drm/Kconfig               |   1 +
>  drivers/gpu/drm/vkms/Makefile         |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c  | 723 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 102 ++--
>  drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
>  drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
>  drivers/gpu/drm/vkms/vkms_output.c    | 404 ++++++++++++--
>  drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  42 +-
>  11 files changed, 1514 insertions(+), 241 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> 
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
