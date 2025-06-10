Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9C2AD2E3D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC87F10E09A;
	Tue, 10 Jun 2025 07:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CA410E09A;
 Tue, 10 Jun 2025 07:02:56 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 0/5] drm/xe: Make struct xe_ggtt private.
Date: Tue, 10 Jun 2025 09:02:34 +0200
Message-ID: <20250610070241.875636-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

SRIOV-VF node shifting code uses a complicated system with balloons
to limit allocation and size. Since size never changes after init,
shifting can simply be done by taking the the GGTT lock.

First introduce a function to shift an entire GGTT, this removes the
need for the balloons, then also perform the display code pinning
through a callback, and finally privatize the struct.

No other users outside of xe_ggtt remain.

Maarten Lankhorst (4):
  drm/xe: Start using ggtt->start in preparation of balloon removal
  drm/xe: Rewrite GGTT VF initialisation
  drm/xe: Convert xe_fb_pin to use a callback for insertion into GGTT
  drm/xe: Move struct xe_ggtt to xe_ggtt.c

Tomasz Lis (1):
  drm/mm: Introduce address space shifting

 drivers/gpu/drm/drm_mm.c                    |  24 ++
 drivers/gpu/drm/xe/Makefile                 |   3 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c      | 111 +++----
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 336 ++++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.h                |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |  53 +--
 drivers/gpu/drm/xe/xe_sriov_vf.c            |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 254 ---------------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |  18 --
 include/drm/drm_mm.h                        |   1 +
 11 files changed, 261 insertions(+), 559 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
 delete mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h

-- 
2.45.2

