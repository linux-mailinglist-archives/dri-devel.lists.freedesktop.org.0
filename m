Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C684F725F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1D410E6BD;
	Thu,  7 Apr 2022 02:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE5010E6B5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 02:57:02 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 0234828A5A9;
 Thu,  7 Apr 2022 03:56:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649300220; bh=9acSGAPbCAXZXE+VpJxZwWXm/bmGmEfcza0ZtidZHyE=;
 h=From:To:Cc:Subject:Date:From;
 b=d/Eo7b+ixk/+KnT7l+ukkjpNhjLzvoAT/Nm1XMwAVf3LNXyp8sqbhsjYBGXJ0TWlh
 LFxoSW8plVlMiwo6Ddfr6zB1SjlHDW+ogp/D4aUMviNCtCEiFUF73HEHh55Sj5TUoi
 Qr7EhbAZ8ZKzeIbuhYK8xIoXm2POSr/XYq7S6kew0VaTftLzOHZyPyn7xAQe72kWHT
 tRmunOdvqK1lRPN+jdCoxBPWPWZ1jvHklk2eg2jcr/vkmiekyE9eI5Ul44ebrqsiIV
 pvKXgDfP8p3zNmAXumwOU5g5wYOdszOSsb6IUv7jqvYYpscgld61H/wsza+Aerbvlb
 G5AhhOW4UKxuQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/ttm: Introduce TTM res manager debugfs helpers
Date: Wed,  6 Apr 2022 22:56:46 -0400
Message-Id: <20220407025652.146426-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

This series introduces generic TTM resource manager debugfs helpers and
refactors TTM drivers which have been using hand rolled out versions
of those to use the new code.

Because those entries are managed by TTM the location of them moves to
/sys/kernel/debug/ttm/. If there are any scripts which depend on the old
locations we can certainly add a new root dentry to
ttm_resource_manager_debugfs_init to preserve the old locations.

Zack Rusin (5):
  drm/ttm: Add common debugfs code for resource managers
  drm/vmwgfx: Add debugfs entries for various ttm resource managers
  drm/amdgpu: Use TTM builtin resource manager debugfs code
  drm/qxl: Use TTM builtin resource manager debugfs code
  drm/radeon: Use TTM builtin resource manager debugfs code

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 81 ++++---------------------
 drivers/gpu/drm/qxl/qxl_ttm.c           | 40 +++---------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 37 +++--------
 drivers/gpu/drm/ttm/ttm_resource.c      | 65 ++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 10 +++
 include/drm/ttm/ttm_resource.h          |  4 ++
 6 files changed, 104 insertions(+), 133 deletions(-)

-- 
2.32.0

