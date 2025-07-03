Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B75AF8341
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3B10E903;
	Thu,  3 Jul 2025 22:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sMXE/b4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEC110E1DA;
 Thu,  3 Jul 2025 22:22:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 987505C4275;
 Thu,  3 Jul 2025 22:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC11C4CEE3;
 Thu,  3 Jul 2025 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751581366;
 bh=xMfaQUIups/QSpG10+tGwChaxWp6I/0bQKrWNq9pSlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sMXE/b4JDQwaOu06NqjBNp8d1wVPkvPCGSwBqx/wKzCMx6rOslJv2pnGv3Xs4gurg
 mMwAFyT96et44HgW4urp5dIRczHdF6NIt9bI2NGkFiqX9jHeBJGoAkOixgDEprzmGp
 71ADHE7QvVIkdIE6mxCpPKNzoDPQFWo5yS/iCWGnCcp3q1WaY0ve/5h7iY0UCPtjxH
 7OdAuxRcKOSVsxv1ETtGMudUbnUQJ5vSGLeDXH+gbTo3NCjfOTlIAD+d7xqG5/0Mrh
 zW02ymR7CyhcD3cyFrtC67DeikQf9a1yOqnAQukzV+ttuikI5gKnXEJ994xx+AteeW
 Ko6boW+UP7Hbg==
Date: Fri, 4 Jul 2025 00:22:42 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH] nouveau/gsp: add a 50ms delay between fbsr and driver
 unload rpcs
Message-ID: <aGcCshDBOPe5lc80@pollux>
References: <20250702232707.175679-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702232707.175679-1-airlied@gmail.com>
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

On Thu, Jul 03, 2025 at 09:27:07AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This fixes a bunch of command hangs after runtime suspend/resume.
> 
> This fixes a regression caused by code movement in the commit below,
> the commit seems to just change timings enough to cause this to happen
> now, and adding the sleep seems to avoid it.
> 
> I've spent some time trying to root cause it to no great avail,
> it seems like a bug on the firmware side, but it could be a bug
> in our rpc handling that I can't find.
> 
> Either way, we should land the workaround to fix the problem,
> while we continue to work out the root cause.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Fixes: 21b039715ce9 ("drm/nouveau/gsp: add hals for fbsr.suspend/resume()")

Applied to drm-misc-fixes with the following diff.

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index ff362a6d9f5c..23f80e167705 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1745,7 +1745,11 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
                        return ret;
                }

-               /* without this Turing ends up resetting all channels after resume. */
+               /*
+                * TODO: Debug the GSP firmware / RPC handling to find out why
+                * without this Turing (but none of the other architectures)
+                * ends up resetting all channels after resume.
+                */
                msleep(50);
        }

I also changed the 'Fixes' tag to:

Fixes: c21b039715ce ("drm/nouveau/gsp: add hals for fbsr.suspend/resume()")
