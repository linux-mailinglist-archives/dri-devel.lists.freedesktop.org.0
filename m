Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9648C0429
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 20:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50FE11316F;
	Wed,  8 May 2024 18:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NEbAvdIU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052B111316F;
 Wed,  8 May 2024 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oo5hLL9fENgZv7D4DWM1MUQ95tH/SYYP523mfBORQWQ=; b=NEbAvdIUsrB03zhl9nn1nZNdQw
 Xc/Pl3xwXx92no8Yypom0SYkcRI9lCeu7inEYZfDQVOe7HjlxmE5m8K+4GcODAMrQ5M1atcz4PRuV
 Euf68TEPj/5p+DYHPlWa8DqWB9pRHo+M9l7tsrFcS6v7+J73vUG/smTJwTB8BWsxwAVFkIImcMfDx
 tVhtt0dbW3lN8xDnylAQytaGNbJhkuAx+RLWD/CmLvcq9azkbYXKmAymdKixmbIcKr7mmBI02s4KF
 bGgCeYNof7haiP4smNq3vKZJAKpXvck5XS+Ml77eQevvY8yPdKnV5iRGFMTOyJ3wEl77ja/UVsDvO
 5O56Vaqw==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4ljn-002zR6-Jb; Wed, 08 May 2024 20:09:55 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
Subject: [RFC 0/5] Discussion around eviction improvements
Date: Wed,  8 May 2024 19:09:40 +0100
Message-ID: <20240508180946.96863-1-tursulin@igalia.com>
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

Last few days I was looking at the situation with VRAM over subscription, what
happens versus what perhaps should happen. Browsing through the driver and
running some simple experiments.

I ended up with this patch series which, as a disclaimer, may be completely
wrong but as I found some suspicious things, to me at least, I thought it was a
good point to stop and request some comments.

To perhaps summarise what are the main issues I think I found:

 * Migration rate limiting does not bother knowing if actual migration happened
   and so can over-account and unfairly penalise.

 * Migration rate limiting does not even work, at least not for the common case
   where userspace configures VRAM+GTT. It thinks it can stop migration attempts
   by playing with bo->allowed_domains vs bo->preferred domains but, both from
   the code, and from empirical experiments, I see that not working at all. Both
   masks are identical so fiddling with them achieves nothing.

 * Idea of the fallback placement only works when VRAM has free space. As soon
   as it does not, ttm_resource_compatible is happy to leave the buffers in the
   secondary placement forever.

 * Driver thinks it will be re-validating evicted buffers on the next submission
   but it does not for the very common case of VRAM+GTT because it only checks
   if current placement is *none* of the preferred placements.

All those problems are addressed in individual patches.

End result of this series appears to be driver which will try harder to move
buffers back into VRAM, but will be (more) correctly throttled in doing so by
the existing rate limiting logic.

I have run a quick benchmark of Cyberpunk 2077 and cannot say that I saw a
change but that could be a good thing too. At least I did not break anything,
perhaps.. On one occassion I did see the rate limiting logic get confused while
for a period of few minutes it went to a mode where it was constantly giving a
high migration budget. But that recovered itself when I switched clients and did
not come back so I don't know. If there is something wrong there I don't think
it would be caused by any patches in this series.

Series is probably rough but should be good enough for dicsussion. I am curious
to hear if I identified at least something correctly as a real problem.

It would also be good to hear what are the suggested games to check and see
whether there is any improvement.

Cc: Christian König <christian.koenig@amd.com>
Cc: Friedrich Vock <friedrich.vock@gmx.de>

Tvrtko Ursulin (5):
  drm/amdgpu: Fix migration rate limiting accounting
  drm/amdgpu: Actually respect buffer migration budget
  drm/ttm: Add preferred placement flag
  drm/amdgpu: Use preferred placement for VRAM+GTT
  drm/amdgpu: Re-validate evicted buffers

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 38 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  8 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 21 ++++++++++--
 drivers/gpu/drm/ttm/ttm_resource.c         | 13 +++++---
 include/drm/ttm/ttm_placement.h            |  3 ++
 5 files changed, 65 insertions(+), 18 deletions(-)

-- 
2.44.0

