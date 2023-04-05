Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564956D7672
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:10:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D19D10E86A;
	Wed,  5 Apr 2023 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568F510E86A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:10:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5002f12ccfeso5514a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 01:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680682217; x=1683274217;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OYng4RQQ65saANXRp3rGtw6wJ5XpKl4KZk/LZ3eaJXA=;
 b=W0rd5Bpgi1vliAc17Mz3poPX51Ck3XK/aFu3eyDWtMoFTsBpamjwatZZhbHkptinzk
 qOywYup0tGesJZgVgszoU0yCnqI7N0t2gZD+vCXBMYqIQZrK/bkKF3sH2Kk54IHUwg4H
 A5s2LlKiSixKGCLJC128ThGb7BHIMzFv4hGfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680682217; x=1683274217;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OYng4RQQ65saANXRp3rGtw6wJ5XpKl4KZk/LZ3eaJXA=;
 b=arCw+r268y9cp3NgpG7T576cTC/Gj3YjMAucuWy/bhaTsyiLiwHdTwZhe5VfmCcFHb
 +s4euEwJuzTuXT6r6Z2REhsdmm2uKDYZuzfoR0sbyshn9exK0n5oOHbu6ZsqIUZ+XW1m
 7HZZub9latCjxSpEhP40MNdfjTIFnt6kxo81zLtylg5s4R/3vSv+pF7m6n/zboUP2WMm
 WQTQjdK8Z82BC6ASesJe3Oog+fJWJVymhfq+jt7WU0F8rEbXE5cbKPFQyAoP9c5IQbCm
 yi8DU2vrgJIZpQfir2FYGgwlEr94yY8fIJrQcEoiQzp4IQfxjli0htvHZ0GHxAydajzv
 W2ig==
X-Gm-Message-State: AAQBX9cFlaYzlwmhOGibycnso4OMYaPNDzkPq57jAK21cfnxuB5YKUSX
 TWxyKvPJVjVBmDmblRtEuMBEng==
X-Google-Smtp-Source: AKy350aujdeQuLMeiv17bxm63ZZuJ5mEe+xCY00PLtSuADQnzCEH5US5Oz8r6EVUL9Weg5aN500Geg==
X-Received: by 2002:a17:906:1d4:b0:92e:f520:7762 with SMTP id
 20-20020a17090601d400b0092ef5207762mr1041803ejj.6.1680682217744; 
 Wed, 05 Apr 2023 01:10:17 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 hg15-20020a1709072ccf00b00939e76a0cabsm7062067ejc.111.2023.04.05.01.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:10:17 -0700 (PDT)
Date: Wed, 5 Apr 2023 10:10:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/vblank: Simplify drm_dev_has_vblank()
Message-ID: <ZC0s56+O0bsQPmpC@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230403160735.1211468-1-robdclark@gmail.com>
 <ZCyMiERvNHTP45o8@phenom.ffwll.local> <ZCyP55f2CFQqtP0a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCyP55f2CFQqtP0a@intel.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 12:00:23AM +0300, Ville Syrjälä wrote:
> On Tue, Apr 04, 2023 at 10:46:00PM +0200, Daniel Vetter wrote:
> > On Mon, Apr 03, 2023 at 09:07:35AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > What does vblank have to do with num_crtcs?  Well, this was technically
> > > correct, but you'd have to go look at where num_crtcs is initialized to
> > > understand why.  Lets just replace it with the simpler and more obvious
> > > check.
> > 
> > If you want to fix this, then I think the right fix is to rename num_crtcs
> > to be something like num_vblank_crtcs. It's a historical accident back
> > when vblanks without kms was a thing.
> > 
> > Plan B is someone gets really busy and fixes up the entire vblank mess and
> > moves it into drm_crtc struct. Now that the dri1 drivers are gone we could
> > indeed do that.
> 
> And easy first step could to simply wrap all the naked
> &dev->vblank[drm_crtc_index()] things into a function
> call with some cocci/etc. That way most of the vblank
> code doesn't need to care where that thing actually lives.

Yeah I think that might work out. Roughly:
- Wrap all the drm_vblank_crtc lookups
- Emebed it into drm_crtc, delete the drm_device->vblank array
- rename drm_device->num_crtc to something more meaningful maybe and move
  into drm_modeset_config

The big holdup always was step 2 because we still had to care about legacy
drivers without drm_crtc, which meant you'd have to have two paths, which
was kinda really annoying.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
