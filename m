Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7523C86B511
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612E610E139;
	Wed, 28 Feb 2024 16:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="R88GMxdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E19110E139
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:33:33 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-412854b6d9cso6078245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 08:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709138011; x=1709742811; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WgQvwtvxcGpGVAUru1scGwAjIIhejFb4Ysc8iTbz7iE=;
 b=R88GMxdKhN9BVSJzUbEhvy7gS1daTQF9E82SldgVJa0GuXrKYHQsXiozVOu6pjZzNh
 Zd9yLSJYGTFRFB2Mu1PKVTfyEBukS4dMa9uZEiATOf5fLrvA7GE+gUcMDSKEw3vwjwe7
 dNdC8tCmU2qCr1/0dSe6oeP4iPSMRbMbF0Cm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709138011; x=1709742811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgQvwtvxcGpGVAUru1scGwAjIIhejFb4Ysc8iTbz7iE=;
 b=Z1HAiuFweLYNbM8IfIjPnqJNHLrVbMzIDtUHfKLDTBMUqqigEBOtYoTtccVoscy7eb
 xd/o28QPfVzVYUvi5a1/g8/kEAhj2zHHNS7bZ4BD+CyGVNN/3R3wVJUz4nzZ4bPBWlOX
 5frHLmj5JKC3JOGoba/KR+//bk9HQ1jVV9CNcBKdrifBGc2AbswuT+4jCud4tTHqEvNy
 DuSCPKbD2UwMHId34QyOtx7ETPZ5z/KTPTswVIYDNJRE4QfzPTlI3L1FcCVc+yB0jpSj
 tylU7nUyylxxIIY5XAdkNdJ9xS1jZisxMvRRqku6Exvn0G2TKo4g9Ji5eX6VyHUcka/E
 zBWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCgUmFQfRetpvaS6//zDId/TW3yV9ZCa4bhsSnNlfx5qQ6YQLqhtTFY0xrkXJV/2YJqKS5BuhAyadmUxCZ25aqXx30UjLYgZObe8GL8Gql
X-Gm-Message-State: AOJu0YyWZcOkeNtbvfc/rxC8LTXVVJYGuk12H0YfB3jEKXLhY3VYqyt2
 cNuiluZ7xN6lrZul6WgYcfTGc/Dd/9NT9R7lVDy62qVQqHCim4X7NKYHVoIxiwo=
X-Google-Smtp-Source: AGHT+IGFFZtYe55qhYOoxnFAy/8QlgPZRfJDW02ciPPAlasp8rN+EX8kYMuRhS0tfPZp5muQfyg1WA==
X-Received: by 2002:a5d:59c6:0:b0:33d:5983:d21c with SMTP id
 v6-20020a5d59c6000000b0033d5983d21cmr9972082wry.6.1709138011122; 
 Wed, 28 Feb 2024 08:33:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b0033d96b4efbasm15470458wrb.21.2024.02.28.08.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 08:33:30 -0800 (PST)
Date: Wed, 28 Feb 2024 17:33:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <Zd9gWOnpPf5XbR-j@phenom.ffwll.local>
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

Hi Stephen!

On Wed, Feb 21, 2024 at 09:46:43AM +1100, Stephen Rothwell wrote:
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

To test out the process we've moved drm.git first. It's now here:

https://gitlab.freedesktop.org/drm/kernel.git

Still the same two branches. Can you please update the url? We haven't
enabled the auto-mirror for this one, since we want to make sure the
upgrade path in the tooling works and people do switch over to the new
repo.

For the others the plan is keep the old places automatically mirrored, at
least until the dust has settled.

Thanks!


> git://git.freedesktop.org/git/drm/drm.git#topic/drm-ci
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
