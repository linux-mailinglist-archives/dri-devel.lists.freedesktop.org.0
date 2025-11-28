Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 840CDC91822
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A2F10E77C;
	Fri, 28 Nov 2025 09:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WjD8Lzpp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD3810E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323330;
 bh=oaSbeGAmU5B+gQEa79WUKX4X8q+DlWccb0J/pPl82CA=;
 h=From:To:Cc:Subject:Date:From;
 b=WjD8LzpprdfIS2fhXxW8coaMpJOlxrvnD/05oTAqyb06e+9gKnQwksTZgSX6RyJQi
 RW8Jp7qOiP4sbl81pv2xi6GoPNp6NfEw2hVz/b2P51aDW6PsldH0vonnbmDwnW0PcX
 fkKrYCiRVJ/y+s8wMDAtKANdFl8empYT9cS00FQehMN0LmWcVM3GB5kSO0a6h3PJnu
 tgXZca94D5ixmWZXTZjqasCqHdT4sc3Y61CM15AhgAE3NDU/ggWX6xkfwYIohWnkgN
 FAT+yAEm2Qt4gcj160OBFKPQip90Xi8ye9ivpTVa/vHpGPNCBm2n7Qi4LUW8gl5B+k
 igeuA6YwESxiA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 28AC317E0ECB;
 Fri, 28 Nov 2025 10:48:50 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 0/8] drm/panthor: Misc scheduler fixes
Date: Fri, 28 Nov 2025 10:48:31 +0100
Message-ID: <20251128094839.3856402-1-boris.brezillon@collabora.com>
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
  drm/panthor: Fix the full_tick check
  drm/panthor: Fix the group priority rotation logic
  drm/panthor: Fix immediate ticking on a disabled tick
  drm/panthor: Fix the logic that decides when to stop ticking
  drm/panthor: Make sure we resume the tick when new jobs are submitted
  drm/panthor: Kill panthor_sched_immediate_tick()

 drivers/gpu/drm/panthor/panthor_sched.c | 203 ++++++++++++------------
 1 file changed, 100 insertions(+), 103 deletions(-)

-- 
2.51.1

