Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E8867905
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 15:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FED10E75D;
	Mon, 26 Feb 2024 14:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jT0VQ8k8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F4910E75B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 14:50:15 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a3f6aed454dso96926466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1708959013; x=1709563813; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vHi2E9LjIdChhnMIXpu/Wnn/NVWXjK1rQ2bzQOKMiAc=;
 b=jT0VQ8k8MHdYYNXpvbjMT+PoaJCZjhJ7E+A49AvAEDqTi3YIY6KMyJRc2ClUqYZKXS
 BuMRNVe+Wr+vfWEcqY3cPaGs7gq9Wzccs11zIMxSHTK2p7fcY2vNvpo9euQrSklW3hqD
 +zTQb77sonasHPvGZCy7IG3opXUR2DhoHyW1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708959013; x=1709563813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHi2E9LjIdChhnMIXpu/Wnn/NVWXjK1rQ2bzQOKMiAc=;
 b=panjtSIEJTdcSw8fFRYoYIEe6qoXK5lB8PhVqUbwRdNRMNu4EQ4YBlBQGVW4+ME8hT
 5IZmRmg5rUDfZLHKb73HEfYUoML12ge4wpsQfLLt6E9Xea8x5gopkuYiFcniyEc/zPMM
 v7ktnthXz12T/28Zq2+Cf+kZVacuR6BM9XbqI0cI7hwfteuis6hwu4N9CHk2RZqfUEPI
 lXfR4ynXOIPEs4KrHDcwbuXSxZPgoJ/wUMcWfXlpcppuJk2MPl0IjZE3kffx5t2/zzlY
 RtXleHC0jfG5xepSE90aiqD0dJZws5H+tWuQTn6lvBnCtOznWN8Kslxk6fWPxNc83F7I
 7DtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnbyS8Fu6XADRE7v7sTCZ7c7c+CUQNNiKbXnYMfRiLkdQnn9bspDy0j6WlwHR7CkibNYPklGq3CW40J1R0LrFfBuSSAIPwXjsN2o8kkHBp
X-Gm-Message-State: AOJu0Yy7T+/t9It9xW0rXXEuldXkbuxcjdBO6knERnp4xwDNJe4FIa5w
 x46Q09LsJvIXhjZf/yBi18zzY4pqRdtk2urgLhl4vICIXCJn6YA1ASaXCbom8AE=
X-Google-Smtp-Source: AGHT+IH/zdAHUnSc1FPcebv9vRNYBcwKBEw+3AqhpOSvXftcbWmVhrwKfSPFbD9FKpWji8cZanlFzw==
X-Received: by 2002:a17:906:3296:b0:a3e:9bce:b5b1 with SMTP id
 22-20020a170906329600b00a3e9bceb5b1mr4583966ejw.5.1708959013137; 
 Mon, 26 Feb 2024 06:50:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 le6-20020a170906ae0600b00a3e88f99cf1sm2517845ejb.149.2024.02.26.06.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:50:12 -0800 (PST)
Date: Mon, 26 Feb 2024 15:50:10 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <ZdylItWE9YyUKCKI@phenom.ffwll.local>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
 <20240221094643.4496313a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221094643.4496313a@canb.auug.org.au>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Wed, Feb 21, 2024 at 09:46:43AM +1100, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 20 Feb 2024 11:25:05 +0000 Daniel Stone <daniel@fooishbar.org> wrote:
> >
> > On Tue, 20 Feb 2024 at 09:05, Maxime Ripard <mripard@kernel.org> wrote:
> > > On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:  
> > > > This will be mostly transparent to current committers and users: we'll
> > > > still use dim, in the exact same way, the only change will be the URL of
> > > > the repo. This will also be transparent to linux-next, since the
> > > > linux-next branch lives in its own repo and is pushed by dim when
> > > > pushing a branch.  
> > >
> > > Actually, I double-checked and linux-next pulls our branches directly,
> > > so once the transition is over we'll have to notify them too.  
> > 
> > cc sfr - once we move the DRM repos to a different location, what's
> > the best way to update linux-next?
> > 
> > That being said, we could set up read-only pull mirrors in the old
> > location ... something I want to do in March (because what else are
> > you going to do on holiday?) is to kill the write repos on kemper
> > (git.fd.o), move them to being on molly (cgit/anongit.fd.o) only, and
> > just have a cronjob that regularly pulls from all the gl.fd.o repos,
> > rather than pushing from GitLab.
> 
> These are (I think) all the drm trees/branches that I fetch every day:
> 
> git://anongit.freedesktop.org/drm-intel#for-linux-next
> git://anongit.freedesktop.org/drm-intel#for-linux-next-fixes
> git://anongit.freedesktop.org/drm/drm-misc#for-linux-next
> git://anongit.freedesktop.org/drm/drm-misc#for-linux-next-fixes
> git://git.freedesktop.org/git/drm/drm.git#drm-fixes
> git://git.freedesktop.org/git/drm/drm.git#drm-next
> git://git.freedesktop.org/git/drm/drm.git#topic/drm-ci

This one you can drop right away, it's all merged, apologies for not
telling you earlier.
-Sima

> git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git#for-linux-next
> https://gitlab.freedesktop.org/agd5f/linux#drm-next
> https://gitlab.freedesktop.org/drm/msm.git#msm-next
> https://gitlab.freedesktop.org/drm/tegra.git#for-next
> https://gitlab.freedesktop.org/lumag/msm.git#msm-next-lumag
> 
> If someone could just send me all the new equivalent URLs when the
> change happens, I will fix them up in my config.
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
