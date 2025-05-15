Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F2AB8DA4
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF58C10E1A8;
	Thu, 15 May 2025 17:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M//QyOR+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6D610E1A8;
 Thu, 15 May 2025 17:23:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 660D3447F7;
 Thu, 15 May 2025 17:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3C3C4CEE7;
 Thu, 15 May 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747329796;
 bh=RvmHfZZ1f0AzI8waiCOB+v4pZfKLdBr4L5DOr1Kq/kE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M//QyOR+F8Sa79Y916HbAENQvxd6ibec3oKeleXrm5HLvgWMiCGxH0vs74+Y4K+rw
 Gb02RgIQ94HfIkYL+eSVzZvAILbxpO5GtsWev2RoegYcrUkxCu14rxRB/g4THAYjjp
 4nLvZ7nQw9bNYafm0fyEs6RRk5OFnu8hsEn35xRPtzUqIT+lYoIJlctSoK1GPZTWRP
 kr9tCpJq0UjoQ+JO+DdBT0V1yuCQAG7JN7Flw/e22c2nAN4pU7jeGbm+Voa4ZGkl48
 O/xVkyWCUhl7kRKC7flJhOF5ZZZjE8vLYQQO5+ZQ2NSBnsf4Pk3bOtk/FqRGFNJQff
 LSH5KIyi1wzhA==
Date: Thu, 15 May 2025 19:23:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@chromium.org>
Cc: phasta@kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
Message-ID: <aCYi_mkv47ckB6ox@pollux>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
 <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
 <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx771FFVDVFMn8YJkR9f9Ad-UQspJ9KKQw4u6Cu4TA7YPA@mail.gmail.com>
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

On Thu, May 15, 2025 at 09:15:08AM -0700, Rob Clark wrote:
> Basically it is a way to throttle userspace to prevent it from OoM'ing
> itself.  (I suppose userspace could throttle itself, but it doesn't
> really know how much pre-allocation will need to be done for pgtable
> updates.)

I assume you mean prevent a single process from OOM'ing itself by queuing up
VM_BIND requests much faster than they can be completed and hence
pre-allocations for page tables get out of control?
