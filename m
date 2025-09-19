Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C9B8A716
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4825310EA49;
	Fri, 19 Sep 2025 15:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F8sylJGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70E110EA20;
 Fri, 19 Sep 2025 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y9fQ7qJP+Cl/tbDM45PVBpuHn1Nbd2wov23KuZJkb88=; b=F8sylJGJJrmzNEXbaCCuwmF3OU
 IGcf+h9pBk1g8UO9ahuPmvYBmW3rEI8tIfsqLFB9tfIZqpBJZ5RG9wUj6D4J9JDgUguNyMNCy8sjM
 tISH3PAHwY93bDTCn83ifYcACTjvV9OOo2cUXD3/6D+w7nKBxUwSJ6ZJSG1btumA2nOqL3NOSTa02
 sJkFtr7T0bVCb6X83ACc24MHTtvnAKxbC800PPsJfTfTmNFv0bXNH6PbC9QRDhUEgRVB1OsdK+nr0
 LSABxCSzIN828PQ/ODE/QzBTBzBeXjAnZLG+IE0tYfeIhUsMeQ2DG/215ctwmEpWF5mWN2/S977dR
 /sYnp6nw==;
Received: from [189.6.16.239] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzdSJ-00E9aV-7R; Fri, 19 Sep 2025 17:55:27 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 0/2] drm: revert the remaining commits about dma_buf handling
Date: Fri, 19 Sep 2025 12:54:27 -0300
Message-ID: <20250919155519.1104256-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Hi all,

I just talked with Thomas that these two patches are preventing amdgpu
driver to be unloaded:

`modprobe: FATAL: Module amdgpu is in use.`

and there is no process using the driver.

We agreed that the best approach now is to completely revert the work
done for improving DMA bug handling to avoid any loose ends. With these
reverts we are just back to the old behavior and amdgpu loading and
unloading will return to normal.

Best Regards,

Melissa

Melissa Wen (2):
  Revert "drm/framebuffer: Acquire internal references on GEM handles"
  Revert "drm/gem: Acquire references on GEM handles for framebuffers"

 drivers/gpu/drm/drm_framebuffer.c | 31 +--------------
 drivers/gpu/drm/drm_gem.c         | 64 +++++--------------------------
 drivers/gpu/drm/drm_internal.h    |  2 -
 include/drm/drm_framebuffer.h     |  7 ----
 4 files changed, 11 insertions(+), 93 deletions(-)

-- 
2.47.2

