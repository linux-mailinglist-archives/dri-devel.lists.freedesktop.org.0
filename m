Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37355D3B28B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85A010E1F8;
	Mon, 19 Jan 2026 16:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="brK4jAqp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4C510E1F8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:53:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C563240525;
 Mon, 19 Jan 2026 16:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565F0C19424;
 Mon, 19 Jan 2026 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768841634;
 bh=AJquatnu3rVRP9y4tSNmcDyNY34vgNG0lveCEyGdIko=;
 h=Date:From:To:Cc:Subject:From;
 b=brK4jAqpyj3AJrN0R6ZNHcCOTRwupCs2lr+lMY7m1IFdWb/SUfVQ/Ukz9r0pgsNDa
 d64wNp0npUjfVPh9Twzk3hgsNiDDlCK/R2Qo2XnK43E+WnzXzZf1eM3LdNWM0P1xLD
 YuBVkSqIDYTuftZpWcTpasr4nen39bS/d37COB1y9Yvf5JX6/zSf+mwQGYKc/pUYx9
 dpg1FLvGFnqKPEGMZRjmZeLdrPW+3Kc22CuBT+wP13lyZC5KdVw656uQxBzp0UzC/0
 iILsRA5sxlH+i0O3/LpUvN+5XHHUasXUBDFupHu4PMSniZTUpRYFDLUEpc4Hf2UlpJ
 9qcUvSsP6EYRg==
Date: Mon, 19 Jan 2026 16:53:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aW5hnvLrtQfjg0nG@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_pagemap.c

between commit:

  754c232384386 ("drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use")

from the origin tree and commits:

  75af93b3f5d0a ("drm/pagemap, drm/xe: Support destination migration over interconnect")
  ec265e1f1cfcc ("drm/pagemap: Support source migration over interconnect")
  3902846af36be ("drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/drm_pagemap.c
index 06c1bd8fc4d17,03ee39a761a41..0000000000000
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
