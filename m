Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52608918A51
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 19:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4157010E973;
	Wed, 26 Jun 2024 17:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="hREe+Mn0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC6010E973
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 17:47:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-367339ddcdeso36909f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719424066; x=1720028866; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ddXUxy4REUncSbZcZ+HhAM7a7+RgpKmEeD0uJPEI2ls=;
 b=hREe+Mn0ByJDb4KzhBy2qX/pxBGHdmX+XehZ12BUsdJUWRHU1M5n/JcGzaFfcKJywh
 magFok8b67kjAiDR6osb/PpwWD7Sac3wxpx2Zc72Xde7lDwE2Qxrew7sI0IImRuV0eCl
 Xq1W/vyZJh6ImrbJRw49vWFa2NmqtiLTssaLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719424066; x=1720028866;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddXUxy4REUncSbZcZ+HhAM7a7+RgpKmEeD0uJPEI2ls=;
 b=EWHh7i1zQ4s8T5oimP6br5VEKTu/OcAkqMDT/dQHn1mYn4FdIZH5U5QJPyYWN8pnq1
 AHP33rvKgtIPY0thBDfo3KqcG4t4IB7qyscOjNjRG73e+SljhllbbfF14X7RB75gO7tE
 r8/1k4cb9vJHsp7x511rgWLxEEQ/3aRIWUKV6/EopDa8rLNUTt2/5PlHLdFSKPtTJOSw
 +p0zh9ZBh8AlDccFIFQdfSPuQTnoIz7lImfdr/DTYCjijtPO+sdZIxpNJv3sobd4IJMe
 R/mAoFprXYYVhEM6OEQPuiAqYUxTFy+kX4HBjomX5/JnrG1LQE6H5eshgODIGidAF7yr
 KLrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGeuJpN1rluimJkIVd+fC+iRciJcOBRTTPP13c0O1COolpo/0FoZEaVTkzhRUf8MpRS0YYG+QpvH6Mu14tsGmJdEc0RCfX/lx0nq02m06j
X-Gm-Message-State: AOJu0Yx7K1QZDiBNW16nR3aIldJ4EzNBcwW0Fai/DOZI14GDRNWWRIma
 kklyoK85N/J5pHVLJMv9d7vJvLNkFw8PiX+wMtQ5TuWaZdATaCWdNvvOrauj5mo=
X-Google-Smtp-Source: AGHT+IF/wKiHR161UYeJktSy9Ahq63JfgB1EGVRfwzIooZsfyVytj7qudDCF9nl08Hsv8XMJswGF/A==
X-Received: by 2002:a05:600c:1d02:b0:422:70d4:7e72 with SMTP id
 5b1f17b1804b1-42487eebcdfmr100575355e9.2.1719424065832; 
 Wed, 26 Jun 2024 10:47:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8246297sm34558715e9.8.2024.06.26.10.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 10:47:45 -0700 (PDT)
Date: Wed, 26 Jun 2024 19:47:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: Time for drm-ci-next?
Message-ID: <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
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

On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > 
> > > 
> > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > Hi,
> > > > 
> > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > Basically, I often find myself needing to merge CI patches on top of
> > > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > > back before the merge and force-push.  Which isn't really how things
> > > > > should work.
> > 
> > This sounds more like you want an integration tree like drm-tip. Get msm
> > branches integrated there, done. Backmerges just for integration testing
> > are not a good idea indeed.
> 
> Is it fine to get drm/msm{-fixes,-next} into drm-tip?

Should be.

> > What exactly is the issue in backmerging drm-misc-next (well through
> > drm-next really)?
> 
> drm-misc-next is its own tree with separate cadence, its own bugs and
> misfeatures. But probably just picking up drm-next for the tests should
> be fine.

Well, more CI should make the situation better for everyone. And I don't
think you can avoid issues with topic branches, since usually there's
enough stuff going on that you still often need parts of drm-next. The
clean topic branches only tend to happen with other subsystems, where the
interactions are much less.

I think aim for more integration testing first with something like
drm-tip, one-off topic branches if really needed for e.g. the gitlab
version upgrade (but still prefer backmerges if that's enough) and see
where it goes?

If other trees introduce bugs it's imo much better to hit them early than
in the middle of the next merge window, which is what you'd get with
maximum amount of topic branches and tree separation. And the merge window
is already really wobbly, we need to make that better.

Cheers, Sima

> > Also if there is an issue, generally we do ad-hoc topic branches.
> > 
> > I'm very very skeptical of boutique trees with tiny focus, we've had that
> > before drm-misc, it's a mess. Definitely no enthusiasm for getting back
> > to that kind of world.
> > -Sima
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
