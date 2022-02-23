Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A2A4C14BD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4BB10F096;
	Wed, 23 Feb 2022 13:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C20A10F05E;
 Wed, 23 Feb 2022 13:51:16 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/helpers: Make the suballocation manager drm generic.
Date: Wed, 23 Feb 2022 14:51:09 +0100
Message-Id: <20220223135112.655569-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Second version of the patch. I didn't fix the copyright (which ame up
in the previous version), as I feel the original author should send a
patch for that.

I've made the suballocator into its own module, and did a cleanup pass on it.
The suballocator is generic enough to be useful for any resource that can be
subdivided and is guarded by a completion fence.

Maarten Lankhorst (3):
  drm: Extract amdgpu_sa.c as a generic suballocation helper
  drm/amd: Convert amdgpu to use suballocation helper.
  drm/radeon: Use the drm suballocation manager implementation.

 drivers/gpu/drm/Kconfig                    |   6 +
 drivers/gpu/drm/Makefile                   |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 320 +---------------
 drivers/gpu/drm/drm_suballoc.c             | 426 +++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon.h            |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c         |  10 +-
 drivers/gpu/drm/radeon/radeon_object.h     |  23 +-
 drivers/gpu/drm/radeon/radeon_sa.c         | 314 ++-------------
 drivers/gpu/drm/radeon/radeon_semaphore.c  |   6 +-
 include/drm/drm_suballoc.h                 |  78 ++++
 13 files changed, 603 insertions(+), 693 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.34.1

