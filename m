Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1CAA68C4
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 04:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F6410E0E0;
	Fri,  2 May 2025 02:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="psyiX3dR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D639110E0E0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 02:24:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5EFAA49EC3;
 Fri,  2 May 2025 02:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BC3C4CEE3;
 Fri,  2 May 2025 02:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746152673;
 bh=9qorAgROyzpc7oWL9m+ZvRKdYuQX6eAtBtcRGl9pkxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=psyiX3dRMKLr+DvQKKgjcLzhf1zkolzhwG3dzJr5p+Gi0rPeEvCrEZvlipKRqlMNt
 j5Osy7MQup2WIj3xt8cZ04OqVuSV40t6xO5Zr5es7tfcC2ybuH6X/FI8dHc/ObAzq8
 HOPj3O9+bk2qTI3THqGc1jiPtHinl3mbt70U/YduxBw/Ce0++Z7M158B7YxSGvaYy2
 uV64G0EZ36BRl1boeFRFl8+kcQjpxVx1q2+ZE7ScKJDfFTZkaVc3mgfEcQ0TaIXnS7
 O1LIL1SoEMmmTmmCx4JkTtaT217ltYQJksu5/+somXtMsKO1IJfhfLxKLQuqKYNWcD
 Z5XPZy2GHNc+g==
Date: Thu, 1 May 2025 19:24:30 -0700
From: Kees Cook <kees@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/ttm: Silence randstruct warning about casting
 struct file
Message-ID: <202505011922.04F401E@keescook>
References: <20250502002437.it.851-kees@kernel.org>
 <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
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

On Thu, May 01, 2025 at 07:13:12PM -0700, Matthew Brost wrote:
> On Thu, May 01, 2025 at 05:24:38PM -0700, Kees Cook wrote:
> > Casting through a "void *" isn't sufficient to convince the randstruct
> > GCC plugin that the result is intentional. Instead operate through an
> > explicit union to silence the warning:
> > 
> > drivers/gpu/drm/ttm/ttm_backup.c: In function 'ttm_file_to_backup':
> > drivers/gpu/drm/ttm/ttm_backup.c:21:16: note: randstruct: casting between randomized structure pointer types (ssa): 'struct ttm_backup' and 'struct file'
> >    21 |         return (void *)file;
> >       |                ^~~~~~~~~~~~
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> 
> I forgot the policy if suggest-by but will add:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Yeah, and feel free to snag authorship entirely if you want. I only
updated the comment, really. :)

> Thomas was out today I suspect he will look at this tomorrow when he is
> back too.

Cool, no rush. It's currently just a warning in -next re-exposed by
randstruct getting cleared for allmodconfig again. :)

Thanks!

-Kees

-- 
Kees Cook
