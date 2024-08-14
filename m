Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43829519CD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 13:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D834110E436;
	Wed, 14 Aug 2024 11:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mary.guillemard@collabora.com header.b="B3P64W6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861C810E436
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 11:24:23 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723634658; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=drrrib3PgACWU4DLDK7aTEnw+bGSJNXDrOpFJLK4ZAQshORSEWiIf/PiHsKqxBZ5HcCPQrjc56TD74KdYmr3EAnYYiU8lnyS9waJ2/DZTKxi1AJBbpyuNLkMpEcuZ4CrQLYr4q1n2P7y72yV/7X/C/yIPlbUetmGY06zM+Z8FYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723634658;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=TMK+Y9UR3sCfF0PcWam3voFzP/LTHIDFW55Ab2pv/wU=; 
 b=D6Mf94R+EetoPreUEEoc/RjczyuxCFFgKQpInHFpwmt6EsxbsGMWGhwUE+RJYyMH1Q3kHWomxjSv1WKRMUKKUKEroauFWT9SUvfKm4XAJRHjqzmM1cyr9C2y74PA40mytFFPVHdTDIUmWHlp3V7zevmFNE8iOGeIfAMutWZoAaM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mary.guillemard@collabora.com;
 dmarc=pass header.from=<mary.guillemard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723634658; 
 s=zohomail; d=collabora.com; i=mary.guillemard@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=TMK+Y9UR3sCfF0PcWam3voFzP/LTHIDFW55Ab2pv/wU=;
 b=B3P64W6/AK73kI/q9/WOwlPBDQ5rydJyaxMUr9YFCtbVb+gkWWeYqrwWmSFMAXH3
 4v2JgjNWJTrJ0eQGLaecuygajmOhsS2Lzallw7gtdHX/EBkqdrGKKkkCVbbeSkWQ9ce
 fW5Ms+8k1jTVVxvyPx6+Wjyd9tlJqOiXw9gUYxB4=
Received: by mx.zohomail.com with SMTPS id 1723634657098217.00384123545962;
 Wed, 14 Aug 2024 04:24:17 -0700 (PDT)
From: Mary Guillemard <mary.guillemard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: [PATCH v2 0/2] drm/panfrost: Wire cycle counters and timestamp info
 to userspace
Date: Wed, 14 Aug 2024 13:21:20 +0200
Message-ID: <20240814112121.61137-2-mary.guillemard@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Mali has hardware cycle counters and GPU timestamps available for
profiling.

This patch series adds support for cycle counters propagation and
also new timestamp info parameters.

Those new changes to the uAPI will be used in Mesa to implement
timestamp queries for OpenGL and Vulkan.

The Mesa MR using this series is available here [1].

v2:
- Rewrote to use GPU timestamp register
- Add missing include for arch_timer_get_cntfrq
- Squash job requirement uAPI changes and implementation in one patch
- Simplify changes based on Steven Price comments

[1]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30553

Mary Guillemard (2):
  drm/panfrost: Add SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY
    parameters
  drm/panfrost: Add cycle counter job requirement

 drivers/gpu/drm/panfrost/panfrost_drv.c  | 43 ++++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 12 +++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h  |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c  | 28 +++++++++------
 drivers/gpu/drm/panfrost/panfrost_regs.h |  2 ++
 include/uapi/drm/panfrost_drm.h          |  3 ++
 6 files changed, 76 insertions(+), 13 deletions(-)


base-commit: dfa5543193f303a7270ec7c725e656970faf7d57
-- 
2.45.2

