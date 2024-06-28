Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1A91C56F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368C610ECF0;
	Fri, 28 Jun 2024 18:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XE/9Lk+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E76410ECF0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:09:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-424ab8c2d95so1149035e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719598143; x=1720202943; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eq8hJ2tVlmnhkayZaNqPxohfUGUWhASztwmu/BkC3Gc=;
 b=XE/9Lk+ETjsFaKeteSMydcphE6Se3qUaeu+vC5RUd+9G+XDxrh9S4kKH7DkkPQonN2
 gEqANRH/KQT32XtWvxa/rggaNHQrYdpjD01wM9hJMxb/QCZFWD2mFnIAbuZyoPnF29Vi
 YILfJeWYamKyNKEl0J/xQTp4CLjxC6RGTHqq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719598143; x=1720202943;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eq8hJ2tVlmnhkayZaNqPxohfUGUWhASztwmu/BkC3Gc=;
 b=ri9JBInA51/D7eglkUGTdp52ExPv79bamTIw3taCdtgkXUqOJ1Pq6Dx3NkiokMDQQx
 wWIYOx2HCQXt7eEwYDhZi3DN55gPjxMqRQKjhjwvlX30j9XFZFVQMilySqoWjFvEPVfz
 azKgm4HpPOWc1J/fyWR307nls0M+GUVngOeUHHU7RbK44+OMYL1H0tevY/9DkCNk79p/
 DdHgfXOkkTuT83vMJ5Nmq6DDj66y3cBHBV1vXL42mtxztbGzoigLk8QRlMGMem5mVNx/
 VeCUa9iaxKVfPkv+SIGeHRfGBjylxznApYWwy4+4ZP62DrjASm4u4Etm6wrPcwiH/ujI
 HrTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSRo5VWK5xkWxaXhFG3/EWQ0yw3GoOC7e66cC2YrNzlet/pwsOAHDa9jBpqa/fSRWZuOlMe2PQMFlbNdOwLNKq0iEPQMwckxuMsk13fxQk
X-Gm-Message-State: AOJu0YwNGo5sVugz1Atw8+CBZkfBnh94tGKD72N/QzrrlLMOOtVAiUJd
 vZSGT6nzUUQu2JdPLSSB7+HSmkCM0BluiyBvWy03jl0jGQkTTZwmwdyMZlYoz6I=
X-Google-Smtp-Source: AGHT+IG4oYJXQWSmBPX1vfEY44VtkqA9hNLFbiaG5x1TqnWG57Xv2ywSur0IVaOleGxs/nQHoO3kmQ==
X-Received: by 2002:a5d:64c4:0:b0:367:42cd:7867 with SMTP id
 ffacd0b85a97d-36742cd7c11mr4257994f8f.3.1719598142761; 
 Fri, 28 Jun 2024 11:09:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb950sm2996120f8f.83.2024.06.28.11.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:09:02 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:09:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: Re: [rerere PATCH] nightly.conf: Merge drm-msm trees into drm-tip
Message-ID: <Zn78PEJpN8qNdxlV@phenom.ffwll.local>
References: <20240626184515.3961230-1-dmitry.baryshkov@linaro.org>
 <87bk3md9ms.fsf@intel.com> <8734oyckdw.fsf@intel.com>
 <je4acmn744pwhdgwek2cgd22reoanogofcqm43vl2sxoyhb2dr@wxst2ffxistw>
 <87h6ddbexv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6ddbexv.fsf@intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 28, 2024 at 12:21:32PM +0300, Jani Nikula wrote:
> On Fri, 28 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Thu, Jun 27, 2024 at 09:26:19PM GMT, Jani Nikula wrote:
> >> On Thu, 27 Jun 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >> > On Wed, 26 Jun 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >> >> In order to improve testing of drm/msm branches, add drm-msm trees to
> >> >> the list of the trees to be merged into drm-tip.
> >> >>
> >> >> Cc: Rob Clark <robdclark@gmail.com>
> >> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> >
> >> > It also helps in avoiding conflicts!
> >> >
> >> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> >> 
> >> Oh, this is with the assumption that you'll also maintain the branches
> >> with dim. I realized this was not spelled out, but I'm hoping it is the
> >> case.
> >
> > No, we use gitlab MRs in order to be able to pre-test patches. But it
> > doesn't stop anybody from running dim ub && dim push after merging an
> > MR.
> 
> IMO that's not quite enough.
> 
> The main problem with this (from drm-tip and dim POV) is that you won't
> notice if you push patches that cause conflicts in rebuilding
> drm-tip. That's then left for the next person to figure out, and for
> them it's completely unexpected.
> 
> We had this when AMD branches were part of drm-tip, and it really wasn't
> much fun, because the burden and benefits were quite lopsided. It's the
> main reason the branches were dropped.
> 
> Now, I think there's a non-trivial amount of people who want to see more
> of gitlab MR based workflows. This is a problem we'll inevitably need to
> tackle anyway. Perhaps rebuilding drm-tip could be a gitlab workflow,
> triggered automatically when any of the branches are pushed? With
> notifications for folks to figure out the conflicts. Maybe there could
> be some linux-next like logic to use older branches until the conflicts
> get fixed.

Yeah if the gitlab side just pushes without rebuilding drm-tip this isn't
going to work well and we'll need to go back. I was thinking that we
should be able to run dim rebuild-tip from gitlab CI flows, at least for
the cases where everything builds. If you need to fix things up you still
need to do a local run.

Even better would be if this runs pre-merge so that the MR fails to land
if there's new conflicts, but that's a bit more tricky.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
