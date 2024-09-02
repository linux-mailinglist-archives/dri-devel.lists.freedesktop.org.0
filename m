Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972AF9687E8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 14:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7510E2EA;
	Mon,  2 Sep 2024 12:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="UGSjVYaD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A763E10E2EE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 12:50:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42bb8c6e250so31924605e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725281443; x=1725886243; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0/sWF3gWzpFjPB/JWKyIkm6uG6SQDLOpW+j7huRVCBo=;
 b=UGSjVYaDzQy3iMiay8X2qdZgXje5E8K2pyIZSR5OaWkCuTWcC6LfZAErGMrmrmAS/8
 qhCyM13bQ/b94MFMJ82uf40ByeT1Z+WWojf+o6kgmZpfcdW3hWxqJHYQiyFdUxe+XBLN
 96XBZxsg9dA/gxvUbHS7E+TmVzAdgELQguWQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725281443; x=1725886243;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0/sWF3gWzpFjPB/JWKyIkm6uG6SQDLOpW+j7huRVCBo=;
 b=Pr4NFvb7yW2KS6wJXPs9lFCPedHGXlE9rILPzlZt55ISPbeZqziQ2PegeoeishfwRU
 OosdaN0iNNM7sLpz6uM6EqeDQ19i2SU4CIw0nnVrw9hOrMHh7R6lnEE4LuKPMdMnmEn1
 I8f0gWDmUTuf5nPo6a/JJbIHFlu/RgZiP9mTNThDpMxOd3QfRKWeKcQnT0YkOeDdTceU
 vZ6fG762slIe+7scFHbokoW+6ffmJYZPV3x9SATbja1DxJJaa4DPhNpQ6TKDR9LGbA2d
 +V0Scfg5P3tNIRxw0OdSrACZ7eDAUwSnkX2YqCjF8sJAIc8f6FK2vHaV2gku/896kr4h
 BHnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWllnb6/szw/YqW9oKZkHDIV+0AH+JbhBMwmGD8YhLA9yqksgQmLcnel/vBtfLV62dLrSsezoyYm4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7HdcWfSSGPGz5Yg5J6CO5bs/KwjK8z0IHWLS0apvGxfs9ykN4
 0u+RkDy66olbQD09wxMDJkSBLN+BpXTyQkhNe5kKyGKuEGaW8qWwe74a200i58o=
X-Google-Smtp-Source: AGHT+IGidCLS066LrUOqR1DbKPT3XWtfavESnDIt+QH0VMlb2OPfJIQhJs8yE3Gdbqll+XiV8FfpBQ==
X-Received: by 2002:adf:fd0a:0:b0:374:c5e9:623e with SMTP id
 ffacd0b85a97d-374c9471877mr2373948f8f.43.1725281442825; 
 Mon, 02 Sep 2024 05:50:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e273e3sm136525265e9.30.2024.09.02.05.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 05:50:42 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:50:40 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtW0oKXrMnT5S-aW@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
 <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
 <5043c12a-e44a-416d-b2ce-70c07609f25e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5043c12a-e44a-416d-b2ce-70c07609f25e@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Sep 02, 2024 at 01:01:45PM +0200, Christian König wrote:
> Am 30.08.24 um 00:12 schrieb Matthew Brost:
> > On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
> > > On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> > > > But as Sima pointed out in private communication, exhaustive eviction
> > > > is not really needed for faulting to make (crawling) progress.
> > > > Watermarks and VRAM trylock shrinking should suffice, since we're
> > > > strictly only required to service a single gpu page granule at a time.
> > > > 
> > > > However, ordinary bo-based jobs would still like to be able to
> > > > completely evict SVM vram. Whether that is important enough to strive
> > > > for is ofc up for discussion.
> > > My take is that you don't win anything for exhaustive eviction by having
> > > the dma_resv somewhere in there for svm allocations. Roughly for split lru
> > > world, where svm ignores bo/dma_resv:
> > > 
> > > When evicting vram from the ttm side we'll fairly switch between selecting
> > > bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
> > > will eventually succeed in vacuuming up everything (with a few retries
> > > perhaps, if we're not yet at the head of the ww ticket queue).
> > > 
> > > svm pages we need to try to evict anyway - there's no guarantee, becaue
> > > the core mm might be holding temporary page references (which block
> > Yea, but think you can could kill the app then - not suggesting we
> > should but could. To me this is akin to a CPU fault and not being able
> > to migrate the device pages - the migration layer doc says when this
> > happens kick this to user space and segfault the app.
> 
> That's most likely a bad idea. That the core holds a temporary page
> reference can happen any time without any bad doing from the application.
> E.g. for direct I/O, swapping etc...
> 
> So you can't punish the application with a segfault if you happen to not be
> able to migrate a page because it has a reference.

See my other reply, it even happens as a direct consequence of a 2nd
thread trying to migrate the exact same page from vram to sram. And that
really is a core use case.

RESo yeah, we really can't SIGBUS on this case.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
