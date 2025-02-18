Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88BA3AB2E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 22:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53DC10E77D;
	Tue, 18 Feb 2025 21:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O85q+Unb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7766F10E11D;
 Tue, 18 Feb 2025 21:39:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 712B85C4A4A;
 Tue, 18 Feb 2025 21:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE94C4CEE2;
 Tue, 18 Feb 2025 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739914761;
 bh=Jiyl+eVrn3hpJEVex+e67InmnPg7gp2kLVjr4AHyfFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O85q+UnbV1mz2/dFurgWgeiDq6tjvVQTQTWIps31AVSIzX8RPwHhDYHlxyei9fiT8
 nJ7y43Wd6wsQqvv4ilAOVdai7jDrdr2GA0vImvrLCxGjzr+cf22VKMTkqv9jYHHxYf
 fdLhu4UQGpULSoqcEC5zEBNrcGNMV1wZL1KDxkuQKgh8x3ZFKZpgVPWZEyHz9JHy9W
 VmKoxwprQEVSfXqsVMhGwR7BwvDqr12mhH4I1lFm+EH1B/2EANUXw/tTLO0eBjpTU3
 7OqgnhlDC0O6GD0YSYXs6A5Ry1R/3is1naElt9ZGnvZBXlTJOv93ZdoZukE5t4nUUn
 yhGwy6JnVeE9A==
Date: Tue, 18 Feb 2025 13:39:19 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Russ Weight <russ.weight@linux.dev>
Subject: Re: [PATCH] drm/nouveau: select FW caching
Message-ID: <Z7T-B3AqwFL2PWP-@bombadil.infradead.org>
References: <20250207012531.621369-1-airlied@gmail.com>
 <Z68_m1iHYN_7a_hH@cassiopeiae> <Z69Awxng8zedDwws@cassiopeiae>
 <Z7SZJXP4APNLNqh2@bombadil.infradead.org>
 <Z7TCWzTVQeEDt0j8@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7TCWzTVQeEDt0j8@cassiopeiae>
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

On Tue, Feb 18, 2025 at 06:24:43PM +0100, Danilo Krummrich wrote:
> On Tue, Feb 18, 2025 at 06:28:53AM -0800, Luis Chamberlain wrote:
> > 
> > What I recommend is to look into why we disable it by default, I think
> 
> I think FW_CACHE is enabled by default, no?
> 
> > its sold old obscure reasoning but now suspect it was udev being dumb,
> > in line with why we also try to defensively try to ignore duplicate
> > udev requests for module requests causing a flood. Refer to commit
> > 9b9879fc03275ff ("modules: catch concurrent module loads, treat them as
> > idempotent") for details.
> 
> Thanks, that helps a lot.
> 
> Given that this commit landed in v6.5

That commit lets us ignore the udev floods for superfluous module
requests only.

> I guess there's not really a concern to
> force enable FW_CACHE for Nouveau as a fix for commit 176fdcbddfd2
> ("drm/nouveau/gsp/r535: add support for booting GSP-RM"), which landed in v6.7.

I'd recommmend to look into *why* folks didn't like fw cache to look at
disabling it in the first place, and look and see if udev was acting up
and doing stupid things preventing suspend.

 Luis
