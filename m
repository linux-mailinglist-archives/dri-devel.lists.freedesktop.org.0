Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43749DEAE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EFE10F003;
	Thu, 27 Jan 2022 10:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F70410F002
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:03:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c192so1491937wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hgAj8AjMrz1A7BDxAJfFuQ4EGSqn2ucoZeTxIYc92rk=;
 b=Q6vOh8E4uR7I456lRL9xd46Oxh3hEA4vw9DMBgAJlBFtPFLc2lys7DZQTXZA3Weh2T
 0ZCv0WZK46pzIyXAbmjOFG5AJ3peSyMI2Er0qQC/Md1poCrDjupHiiq08TIHvhriXkRP
 QFcc5vS4ZI++Fea3tzi88TKsVzXqwdeIiDBaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hgAj8AjMrz1A7BDxAJfFuQ4EGSqn2ucoZeTxIYc92rk=;
 b=w/L7FrPznHC7npYVmLL0DF8Bq21h9vKxVIYiQ32VzNhBI1hJ4+TEf9V3LfNcr8PGSF
 +cIhOa6idfaY5tO0IA4zl7N/sMT9pMtOS07GFZk4lfvNZXW4OEzggx0y8O6C+009jjOW
 lJIa3slLYT+3KDwezc5rjj7ufM6BmqO0Lk6KKNRnEWNeISQfe2wcuCQ269JlBe/1z0Ro
 ezpk88A9hSLVHIz9xAAdZ+KhmXrHRhaP57JHUjmbG0dV/73UXamMyu3ZKy5T6RZ83QAW
 /5VziPCKci9/b5zRLt6vmNUnhpSlthlSp6AeWofzkpTuQI3g/GzwYYLbUE6CDN791ui1
 s8gQ==
X-Gm-Message-State: AOAM5308KkwftvZMSP5mIXSb+gpytytu0+/NvMzTmOLMAGBw0PGpJE2v
 739YEq6DZVw3REV2FWjTRLmmjw==
X-Google-Smtp-Source: ABdhPJzSG06zHL7QC0W9qJ4UoSviuojSBNboAnS5fPgZRPU8eJNpqde7XN8cpCkl7ua39RHdPNVpmA==
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr10758110wma.129.1643277810650; 
 Thu, 27 Jan 2022 02:03:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s9sm1699065wrr.84.2022.01.27.02.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 02:03:30 -0800 (PST)
Date: Thu, 27 Jan 2022 11:03:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomohito Esaki <etom@igel.co.jp>
Subject: Re: [RFC PATCH v5 0/3] Add support modifiers for drivers whose
 planes only support linear layout
Message-ID: <YfJt7zQNUnSpMP+l@phenom.ffwll.local>
Mail-Followup-To: Tomohito Esaki <etom@igel.co.jp>,
 dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Simon Ser <contact@emersion.fr>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Mark Yacoub <markyacoub@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Evan Quan <evan.quan@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Daniel Stone <daniel@fooishbar.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>
References: <20220127032539.9929-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127032539.9929-1-etom@igel.co.jp>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 12:25:36PM +0900, Tomohito Esaki wrote:
> Some drivers whose planes only support linear layout fb do not support format
> modifiers.
> These drivers should support modifiers, however the DRM core should handle this
> rather than open-coding in every driver.
> 
> In this patch series, these drivers expose format modifiers based on the
> following suggestion[1].
> 
> On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> > I think the best way forward here is:
> >   - add a new mode_config.cannot_support_modifiers flag, and enable
> > this in radeon (plus any other drivers in the same boat)
> >   - change drm_universal_plane_init() to advertise the LINEAR modifier
> > when NULL is passed as the modifier list (including installing a
> > default .format_mod_supported hook)
> >   - remove the mode_config.allow_fb_modifiers hook and always
> > advertise modifier support, unless
> > mode_config.cannot_support_modifiers is set
> 
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20190509054518.10781-1-etom@igel.co.jp/#24602575

Two procedural things:
- There's an r-b on all the patches from Andy from the last round, please
  include that.
- Please also include a changelog per-patch (at least going forward), that
  helps with judging where a patch series is.

But aside from this I think this looks ready.

Cheers, Daniel

> 
> v5:
> * rebase to the latest master branch (5.17-rc1+)
> 	+ "drm/plane: Make format_mod_supported truly optional" patch [2]
>   [2] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3
> 
> * change default_modifiers array from non-static to static
> * remove terminator in default_modifiers array
> * use ARRAY_SIZE to get the format_modifier_count
> * keep a sanity check in plane init func
> * modify several kerneldocs
> 
> v4: https://www.spinics.net/lists/dri-devel/msg329508.html
> * modify documentation for fb_modifiers_not_supported flag in kerneldoc
> 
> v3: https://www.spinics.net/lists/dri-devel/msg329102.html
> * change the order as follows:
>    1. add fb_modifiers_not_supported flag
>    2. add default modifiers
>    3. remove allow_fb_modifiers flag
> * add a conditional disable in amdgpu_dm_plane_init()
> 
> v2: https://www.spinics.net/lists/dri-devel/msg328939.html
> * rebase to the latest master branch (5.16.0+)
>       + "drm/plane: Make format_mod_supported truly optional" patch [2]
> 
> v1: https://www.spinics.net/lists/dri-devel/msg327352.html
> * The initial patch set
> 
> Tomohito Esaki (3):
>   drm: introduce fb_modifiers_not_supported flag in mode_config
>   drm: add support modifiers for drivers whose planes only support
>     linear layout
>   drm: remove allow_fb_modifiers
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
>  drivers/gpu/drm/drm_framebuffer.c             |  6 ++---
>  drivers/gpu/drm/drm_ioctl.c                   |  2 +-
>  drivers/gpu/drm/drm_plane.c                   | 23 +++++++++++--------
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  6 +++--
>  drivers/gpu/drm/radeon/radeon_display.c       |  2 ++
>  .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
>  include/drm/drm_mode_config.h                 | 18 +++++----------
>  include/drm/drm_plane.h                       |  3 +++
>  14 files changed, 45 insertions(+), 32 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
