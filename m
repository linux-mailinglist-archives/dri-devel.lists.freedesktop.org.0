Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E941A1126B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 21:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA26110E482;
	Tue, 14 Jan 2025 20:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TXTG0Aby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6975810E483
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 20:45:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D44DA41C22;
 Tue, 14 Jan 2025 20:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEFBC4CEDD;
 Tue, 14 Jan 2025 20:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736887523;
 bh=R1oFIOZuyTlZ9/KSoUnY5+kMbKSnchbcns49StwnNTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXTG0AbyqtcAzO6bElAJ+A1VCxciW52E5T26xpTEyw2whJqlqaaG2aoCpGwZFC/tQ
 8mtWaDLWzFKpBaTl7Bvl9SR59K2yiCPVqxKnlU4rcp0olpQOfBmpy4L8VkFIhY8qLP
 I9TFOiigEGmOvMfeSn42mImNnlR4zBre/X+pSsGjZnxEAiccE6Pjqo3MiybOct3e75
 RDDb81Pv/uLTjnUBF22O7+I/aIsWpjgZdcic+YlOUMtxSk8oJCBFuZmRu1NxpB/pzV
 KtFm/vNw9m5pUB+Ch4GykG6SPLObuzSAxKY7VI/N5WUlh0N2N7l70AnkhkAxAXv5yW
 T7o0gebuclBAQ==
Date: Tue, 14 Jan 2025 10:45:22 -1000
From: Tejun Heo <tj@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 cgroups@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
Message-ID: <Z4bM4unKfX_bTop5@slm.duckdns.org>
References: <20250113092608.1349287-1-mripard@kernel.org>
 <Z4Z6Y5Xy5m4wMu_l@phenom.ffwll.local>
 <20250114-convivial-axolotl-of-performance-7c2f63@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114-convivial-axolotl-of-performance-7c2f63@houat>
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

On Tue, Jan 14, 2025 at 04:02:55PM +0100, Maxime Ripard wrote:
> On Tue, Jan 14, 2025 at 03:53:23PM +0100, Simona Vetter wrote:
> > On Mon, Jan 13, 2025 at 10:26:05AM +0100, Maxime Ripard wrote:
> > > The dmem cgroup the page counting API implemented behing the
> > > PAGE_COUNTER kconfig option. However, it doesn't select it, resulting in
> > > potential build breakages. Select PAGE_COUNTER.
> > > 
> > > Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgroup")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202501111330.3VuUx8vf-lkp@intel.com/
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > 
> > Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
> 
> These patches have been pulled as a separate PR into drm-next, and I'm
> not sure how we should merge these patches.
> 
> Obviously, we'd need Tejun's, Johannes', or Michal's ack, but should we
> backmerged drm-next into drm-misc-next-fixes and apply them there?

Acked-by: Tejun Heo <tj@kernel.org>

Please route them with the existing dmem patches.

Thanks.

-- 
tejun
