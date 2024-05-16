Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140788C75DC
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:18:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480610E0E1;
	Thu, 16 May 2024 12:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hADOyHmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5D310EC8C;
 Thu, 16 May 2024 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2rifsY3ZfO7/0fzkSDTLVkFyzcV2rayHUhkFq40ZMCk=; b=hADOyHmr/S8ay3SGnrGbwj0N2B
 TO/kxfnepuxMnbvfvyIup8ihdJoiq53Vfwhk6UEpNp9XmUR7IgZ5vaJkzSMIzCVNItNt42UdmuWN0
 Zg97txcq+C8dW+chdcbTC65je/ccv3WejXN04HAGy35ETfp4Rzh0wQH4SfbhFtXIEy0MdTWq9Cn8h
 HUPzfK72rcSewa0bp0HtM4rQeBmoYTh43RIP6ENn7SOM4eAUw36tvcABmGfcQ8Kda0EXblqyxJ435
 44aOiX5vuob504GsM9D+PMJkWLJ37vxEWsa2nfYjiNUKuo7qZDS6dfEgoTQo3FxIi5T37Yq59tFwK
 tbeZQ79Q==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s7a40-008odg-Nu; Thu, 16 May 2024 14:18:24 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC v2 0/2] Discussion around eviction improvements
Date: Thu, 16 May 2024 13:18:20 +0100
Message-ID: <20240516121822.19036-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reduced re-spin of my previous series after Christian corrected a few
misconceptions that I had. So lets see if what remains makes sense or is still
misguided.

To summarise, the series address the following two issues:

 * Migration rate limiting does not work, at least not for the common case
   where userspace configures VRAM+GTT. It thinks it can stop migration attempts
   by playing with bo->allowed_domains vs bo->preferred domains but, both from
   the code, and from empirical experiments, I see that not working at all. When
   both masks are identical fiddling with them achieves nothing. Even when they
   are not identical allowed has a fallback GTT placement which means that when
   over the migration budget ttm_bo_validate with bo->allowed_domains can cause
   migration from GTT to VRAM.

 * Driver thinks it will be re-validating evicted buffers on the next submission
   but it does not for the very common case of VRAM+GTT because it only checks
   if current placement is *none* of the preferred placements.

These two patches appear to have a positive result for a memory intensive game
like Assassin's Creed Valhalla. On an APU like Steam Deck the game has a working
set around 5 GiB, while the VRAM is configured to 1 GiB. Correctly respecting
the migration budget appears to keep buffer blits at bay and improves the
minimum frame rate, ie. makes things smoother.

From the game's built-in benchmark, average of three runs each:

						FPS
		migrated KiB	min	avg	max	min-1%	min-0.1%
  because	   20784781	10.00  37.00   89.67    22.00    12.33
  patched	    4227688	13.67  37.00   81.33    23.33    15.00

Disclaimers that I have is that more runs would be needed to be more confident
about the results. And more games. And APU versus discrete.

Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>

Tvrtko Ursulin (2):
  drm/amdgpu: Re-validate evicted buffers
  drm/amdgpu: Actually respect buffer migration budget

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 112 +++++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  21 ++++-
 2 files changed, 103 insertions(+), 30 deletions(-)

-- 
2.44.0

