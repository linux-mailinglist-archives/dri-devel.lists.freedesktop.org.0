Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0E28979D3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 22:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B014112EF3;
	Wed,  3 Apr 2024 20:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rd9XilRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5E112ED2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1yuy46zhhvvOszDHV5uSNy/5HhRQStFDn9mTspCQvzA=; b=rd9XilRRRMukYhtC3Xv4ffxFwq
 sg4xAq+gfx5njcuZ602QE4O7syhaSwKwLmYf6nQhUCuocZHZLzXzI0EFQumvBtTkdN7Jw1DrImklC
 xxYPpjrGs0XsURrI3v+u4C0b2PU9RqomF0ZBlfc72qBnMakQVYzV8uVncztv3xWquQJN4gx2SAdB8
 86Q/ZvCCsSnVVe3JjXy8iKth0d/0aGWIPaIxF2A/rcNjNwhAjpLj65E3C4plXHOB6XBb3nibVrccz
 TaUFcjcm+IxfwD8RD8/W1lxdp7g0TYjeJAQAMvbqZTsl55iCojfj+HesXAaGzO52htL1bWGC5ZRRR
 hwmg9M2w==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rs7Kp-00124v-UV; Wed, 03 Apr 2024 22:35:52 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/5] drm/v3d: Fix GPU stats inconsistancies and race-condition
Date: Wed,  3 Apr 2024 17:24:49 -0300
Message-ID: <20240403203517.731876-1-mcanal@igalia.com>
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

This series addresses two major issues on the GPU stats:

1. Currently, we are incrementing `enabled_ns` twice by the end of each job.
2. There is a race-condition between the IRQ handler and the users

Apart from addressing this issues, this series improved the GPU stats
code as a hole. We reduced code repetition as a hole, creating functions
to start and update the GPU stats. This will likely reduce the odds of
issue #1 happen again.

Note that I incrementally improved the code, creating small atomics
commits to ease the reviewing process. Also, I separated the first
patch, that has the fix to issue #1, in order to keep the fix separated
from code improvements.

The issue #1 is addressed on the first patch, while issue #2 is
addressed in the last patch. Patches #2 to #4 are code improvements.

Best Regards,
- Maíra

Maíra Canal (5):
  drm/v3d: Don't increment `enabled_ns` twice
  drm/v3d: Create two functions to update all GPU stats variables
  drm/v3d: Create a struct to store the GPU stats
  drm/v3d: Create function to update a set of GPU stats
  drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handler

 drivers/gpu/drm/v3d/v3d_drv.c   | 24 +++++---
 drivers/gpu/drm/v3d/v3d_drv.h   | 26 ++++++---
 drivers/gpu/drm/v3d/v3d_gem.c   |  9 +--
 drivers/gpu/drm/v3d/v3d_irq.c   | 52 ++----------------
 drivers/gpu/drm/v3d/v3d_sched.c | 97 ++++++++++++++++++---------------
 drivers/gpu/drm/v3d/v3d_sysfs.c | 18 +++---
 6 files changed, 104 insertions(+), 122 deletions(-)

--
2.44.0

