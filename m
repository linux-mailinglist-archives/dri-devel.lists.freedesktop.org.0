Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A88A7A10
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 03:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B47010F469;
	Wed, 17 Apr 2024 01:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XVMmncuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DBF112FFD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=APtxS9+t4Z7TBA/o+AReb2t/bjN5NuUC2RKGGZz1N04=; b=XVMmncuMwzCo+GbfOeiO+GtAR4
 g19oIaJ3whB3dVptuLHV+U/SMK61rr5neST/6hJD4xjppEfnAoZdmFPe/PPikT589iPcwBglHxfJi
 56Mekd2QlWD5eCj1DanHRVl21T7HjaBW0TPwPAuholWhP2cxwhGa3c0vuqC0+XoJpD893oXR0TEYr
 PqNLrV67WezMREcoi1/2p6twBMOjBlYiButh6CBNcdXiA5+N0XGi38yjj6IipjHKFzZwT6XMYJzpi
 LuwnpV7GosPqB3sQX0GONM72rMRP0khhfCZ4gzVjWvvKdSlbTeeQ5nEWtWQf2HqZDsjT0or2R3qlX
 bqY7SrEQ==;
Received: from [177.34.169.177] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rwtoy-005Mj1-W2; Wed, 17 Apr 2024 03:10:45 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/4] drm/v3d: Fix GPU stats inconsistencies and
 race-condition
Date: Tue, 16 Apr 2024 21:53:05 -0300
Message-ID: <20240417011021.600889-1-mcanal@igalia.com>
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

The first version of this series had the intention to fix two major
issues with the GPU stats:

1. We were incrementing `enabled_ns` twice by the end of each job.
2. There is a race-condition between the IRQ handler and the users

The first of the issues was already addressed and the fix was applied to
drm-misc-fixes. Now, what is left, addresses the second issue.

Apart from addressing this issue, this series improved the GPU stats
code as a whole. We reduced code repetition as a whole, creating functions
to start and update the GPU stats. This will likely reduce the odds of
issue #1 happen again.

Best Regards,
- Maíra

v1 -> v2: https://lore.kernel.org/dri-devel/20240403203517.731876-1-mcanal@igalia.com/T/

	* As the first patch was a bugfix, it was pushed to drm-misc-fixes.
	* [1/4]: Add Chema Casanova's R-b
	* [2/4]: s/jobs_sent/jobs_completed and add the reasoning in the commit
		message (Chema Casanova)
	* [2/4]: Add Chema Casanova's and Tvrtko Ursulin's R-b
	* [3/4]: Call `local_clock()` only once, by adding a new parameter to the
		`v3d_stats_update` function (Chema Casanova)
	* [4/4]: Move new line to the correct patch (2/4) (Tvrtko Ursulin)
	* [4/4]: Use `seqcount_t` as locking primitive instead of a `rw_lock` (Tvrtko Ursulin)

Maíra Canal (4):
  drm/v3d: Create two functions to update all GPU stats variables
  drm/v3d: Create a struct to store the GPU stats
  drm/v3d: Create function to update a set of GPU stats
  drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handler

 drivers/gpu/drm/v3d/v3d_drv.c   | 19 +++----
 drivers/gpu/drm/v3d/v3d_drv.h   | 40 +++++++++++---
 drivers/gpu/drm/v3d/v3d_gem.c   |  9 ++--
 drivers/gpu/drm/v3d/v3d_irq.c   | 48 ++---------------
 drivers/gpu/drm/v3d/v3d_sched.c | 94 +++++++++++++++++----------------
 drivers/gpu/drm/v3d/v3d_sysfs.c | 13 ++---
 6 files changed, 105 insertions(+), 118 deletions(-)

-- 
2.44.0

