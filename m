Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C60394A9E47
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B735B10EF0A;
	Fri,  4 Feb 2022 17:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384C810EF0C;
 Fri,  4 Feb 2022 17:48:15 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/3] drm/helpers: Make the suballocation manager drm
 generic.
Date: Fri,  4 Feb 2022 18:48:06 +0100
Message-Id: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
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
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The suballocation manager itself is not dependent on any implementation detail,
and can be made generic. I want to potentially use it inside i915, as it looks
like a clean implementation to do so. :)

Looking for feedback and some testing, as I don't have a amdgpu/radeon myself.
Only compile tested so far, so some stupid bugs may remain.

Maarten Lankhorst (3):
  drm: Extract amdgpu_sa.c as a generic suballocation helper
  drm/amd: Convert amdgpu to use suballocation helper.
  drm/radeon: Use the drm suballocation manager implementation.

 drivers/gpu/drm/Makefile                   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 320 +---------------
 drivers/gpu/drm/drm_suballoc.c             | 424 +++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon.h            |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c         |  10 +-
 drivers/gpu/drm/radeon/radeon_object.h     |  23 +-
 drivers/gpu/drm/radeon/radeon_sa.c         | 314 ++-------------
 drivers/gpu/drm/radeon/radeon_semaphore.c  |   6 +-
 include/drm/drm_suballoc.h                 |  78 ++++
 12 files changed, 595 insertions(+), 694 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.34.1

