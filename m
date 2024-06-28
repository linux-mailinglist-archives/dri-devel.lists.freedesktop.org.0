Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB991C51A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 19:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A7710ECD8;
	Fri, 28 Jun 2024 17:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="W6wgTfDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDA710ECDD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 17:44:58 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-424a4bc95f3so433575e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719596696; x=1720201496; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PFG4m2P9lrc/voTXf7MYXGSSv2AhfGiy4rGLJmPQ7ps=;
 b=W6wgTfDrZA8+P3NDjRF7KSQF/xY0tIBOcJ7EgBh959Mf3+omOxtnwxlvYF36XjtjTN
 p5TO31wha13J4KXlxfO4QBGcFgPGP+UEBrK5a+LZ8GsHaWdAzc8vx7G6xgomJbIfdJwB
 Ivewdo8ExXxTGCm9vwUcv6U7fnKaD3w70SOpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719596696; x=1720201496;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PFG4m2P9lrc/voTXf7MYXGSSv2AhfGiy4rGLJmPQ7ps=;
 b=LohBq9Rvruw4Mf8x5XNLPsfu80tpeC1Iru03TszPUxG1W8YLiyv7znZoyjbJKtX+rc
 QPvUYSTe+1cgGTlFg56btSrdp9O6sDwjR681dGZO/KaWjjtTbnur5fGas8ZZNOvcuYdl
 3FzOFrmQ9zW9lYWsO8PuIePyZRRfpZKLU9umlh3Gox1sxoxJYmNN+gUyZc51uNYAH/w3
 3p1sb1kf3X57NXt+DbP+rnsk3qHxByA0DQTDH32byezKI+DhGYvPmpcNoW3Xc2Cpgax8
 0WPZeJIoYNaw+JvF8jRk+oeZkRP/c+SR3E8odx6Gal+a1AVPK/d2xh0crSG6T/3EmD3a
 BakQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG8fiOHYR9peoP8bBhjLFc6VfxK8hYoEC6+U10z8Em4XBOY7SUUtFIjAyXud+5PTYLqrgj14ptAEvAiAJw0Hjgz2GCyIYi8i9Ncz3koMqu
X-Gm-Message-State: AOJu0YxFxbPiRjrzOkQA/wY8fPwW+u5NXdfqzgdFdqQADVgj4G3eWwt9
 OGbVPXL0rmBDZPnGBOEKBrzl2XgOZ0dCirPbW4B/Z+iN1c4U0xdoeQfp8zgP4S0=
X-Google-Smtp-Source: AGHT+IEwJxocm6WmlwUTvvhF/qJILTgIc/r+SbUwyzK30cSwW5Q2fXDcp5IvRDEkaQUEL1w6Vbi7eQ==
X-Received: by 2002:a05:600c:4aa9:b0:425:5ed5:b416 with SMTP id
 5b1f17b1804b1-4255ed5b5edmr61703235e9.1.1719596696262; 
 Fri, 28 Jun 2024 10:44:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1030c8sm2971157f8f.98.2024.06.28.10.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 10:44:55 -0700 (PDT)
Date: Fri, 28 Jun 2024 19:44:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Helen Koike <helen.koike@collabora.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: Time for drm-ci-next?
Message-ID: <Zn72laHlmWW3So9f@phenom.ffwll.local>
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
 <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
 <f20f80a7-c905-4a9e-8fa6-985d6b3b1662@collabora.com>
 <ZnvEHEIEJIYcsQgN@phenom.ffwll.local>
 <f6kf3smgaza7r7zif4frz6ugrdzcl4u3xqidgwgvuffydhjfzp@66afcetzo3uw>
 <ZnxUP8H5oATEYNBt@phenom.ffwll.local>
 <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGu0X43O0-p=LaVmDgZrHnkHctuv=uLeqG+JEJXbfh=mjg@mail.gmail.com>
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

On Thu, Jun 27, 2024 at 11:51:37AM -0700, Rob Clark wrote:
> On Wed, Jun 26, 2024 at 10:47 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jun 26, 2024 at 11:38:30AM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Jun 26, 2024 at 09:32:44AM GMT, Daniel Vetter wrote:
> > > > On Mon, Jun 24, 2024 at 10:25:25AM -0300, Helen Koike wrote:
> > > > >
> > > > >
> > > > > On 24/06/2024 02:34, Vignesh Raman wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On 15/03/24 22:50, Rob Clark wrote:
> > > > > > > Basically, I often find myself needing to merge CI patches on top of
> > > > > > > msm-next in order to run CI, and then after a clean CI run, reset HEAD
> > > > > > > back before the merge and force-push.  Which isn't really how things
> > > > > > > should work.
> > > >
> > > > This sounds more like you want an integration tree like drm-tip. Get msm
> > > > branches integrated there, done. Backmerges just for integration testing
> > > > are not a good idea indeed.
> 
> But AFAIU this doesn't help for pre-merge testing, ie. prior to a
> patch landing in msm-next
> 
> My idea was to have a drm-ci-next managed similar to drm-misc-next, if
> we have needed drm/ci patches we could push them to drm-ci-next, and
> then merge that into the driver tree (along with a PR from drm-ci-next
> to Dave).

I guess I'm confused about what kind of pre-merge testing we're talking
about then ... Or maybe this just doesn't work too well with the linux
kernel. The model is that you have some pile of trees, they're split up,
and testing of all the trees together is done in integration trees like
linux-next or drm-tip.

Criss-cross merging of trees just for integration testing is no-go. And
that seems to be the only reason you want drm-ci-next?

Also, this sounds more like msm being in a separate tree is the pain point
here, and solving "we have too many trees" by adding more isn't a good
idea ...

Or I'm just totally confused.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
