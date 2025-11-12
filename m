Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA5C5216E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6926010E02F;
	Wed, 12 Nov 2025 11:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kp4C//cc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FC910E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762948314;
 bh=Ocqn0LvsmKW0uF7dKa1D6rTkg+3Q83tWJV4J6ayhavM=;
 h=From:To:Cc:Subject:Date:From;
 b=kp4C//ccpxN4LotEbnT0qaCWULDPl7Z8OtfOvHfV2xSmdmeZ9gQUxHhuDPWJzau81
 hl8JQGSLyEUciJ4rrL3VAc59IJ0w/j7ZVbEM2NbMoS7yuSPq/Y6tiCEzzO/iEEH7Fq
 13eU1cW1lzo5RyfwC2Mi4WSz4V+KiBF0p3SrqHiyGnWL19dCCoE0rW733V3s6rzqLV
 /4rEpZbv8H/thV3/gL60bNiEQWef4VZgaqy4IPL4umOOvDEznTOX0MRZuDhUIh44Uj
 Mhe5x2TvxzoYkSDAlWxFtNEP0MTV4g0UI8VvOCfpZ7FuwTzLIvONT/mkS5rdfx4UG0
 Pmvft6DkMFCxw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DE72317E129C;
 Wed, 12 Nov 2025 12:51:53 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: [PATCH v2 0/8] drm/panthor: Misc scheduler fixes
Date: Wed, 12 Nov 2025 12:51:34 +0100
Message-ID: <20251112115142.1270931-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
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

Hello,

This series is a collection of fixes that seem to address the problem
reported here [1]. In order to validate those changes, I added a few
IGT tests [2], but I'd like to extend the test coverage before claiming
this is working properly. Until I get to it, I thought I'd post what
I have for preliminary review/testing.

No major changes in this version, for more details, check the changelog
in each patch.

Regards,

Boris

[1]https://gitlab.freedesktop.org/panfrost/linux/-/issues/48
[2]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/tree/panthor-sched?ref_type=heads

Boris Brezillon (8):
  drm/panthor: Simplify group idleness tracking
  drm/panthor: Don't try to enable extract events
  drm/panthor: Fix the group priority rotation logic
  drm/panthor: Fix the full_tick check
  drm/panthor: Fix immediate ticking on a disabled tick
  drm/panthor: Fix the logic that decides when to stop ticking
  drm/panthor: Make sure we resume the tick when new jobs are submitted
  drm/panthor: Kill panthor_sched_immediate_tick()

 drivers/gpu/drm/panthor/panthor_sched.c | 190 ++++++++++++------------
 1 file changed, 98 insertions(+), 92 deletions(-)

-- 
2.51.1

