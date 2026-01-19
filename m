Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603AD3B315
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 18:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F210E4D2;
	Mon, 19 Jan 2026 17:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kIHhj2Dr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA16310E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 17:03:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EBEE660054;
 Mon, 19 Jan 2026 17:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0910DC116C6;
 Mon, 19 Jan 2026 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768842187;
 bh=RX2WundYZWWGCWZSZ+xEthZOafxPMB2DvNlRgS5/ZpY=;
 h=Date:From:To:Cc:Subject:From;
 b=kIHhj2DrCAaXI2UGAzOvPFGXtY95I6UQbjAQifqGhMkkEDJaFLT5WVu5/jz67VEo+
 D82Nn3ZTXWvNB4tc2z3hxJXK3PDwPqoS8lawYlv1Qh9o6RPdj+hJIuObGnetMCXaHb
 Jn/0XTzSWyZ3Qlr7phs6UvQQOaXr8gqQnrs6xxozq5WStSKO0ry8NSgz92OmGUy1pR
 2lLWt5s2JztjxdstY+1I8cY6jKPr5Xin4FC9i89/56R9cIXXxPO0LaEL9wdmMezyW+
 RIJevSlSHfinnqMhBc4Ml0OGgQe+CFI/bdW53w9yVMVCcH81r8rSOGxYcjVcW+q3DE
 NP+AN8dqt9GUw==
Date: Mon, 19 Jan 2026 17:03:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Philip Yang <Philip.Yang@amd.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aW5jx4EHPBMZVFRV@sirena.org.uk>
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

  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c

between commit:

  80614c509810f ("drm/amdkfd: fix a memory leak in device_queue_manager_init()")

from the origin tree and commit:

  0cba5b27f1924 ("drm/amdkfd: Add domain parameter to alloc kernel BO")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 625ea8ab7a749,b542de9d50d11..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
