Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B74FCD22
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EAB10FB46;
	Tue, 12 Apr 2022 03:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D983210FB44
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:35:33 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id EA48C28384A;
 Tue, 12 Apr 2022 04:35:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649734531; bh=zeXqbMyw19upqvuRse9PP4tjiDeNJdVG04pi6PjiS7s=;
 h=From:To:Cc:Subject:Date:From;
 b=hiLOU45Cbf6L+jdxydwQWMWxULpOSIxUiQOd/ZfOYy2sfPH/AbMoDlAp7AJGI87uP
 jpEnwGRrAq0sY5eSajxnIq7QXsjympALAwiafGxunYSFX9w4+SihQZi+cNH57xQB+i
 fNmvt9jOs9uiZBUylTaEMBNEA52jqUOjEMefn8oNIe3Zg/7SA2zV+TW4ONhiuJtjpY
 Oz0tCRr2pyzeG3ZAi8CehLNGGSFK5OiNiwnw+GZN/VXu1wpYPrzKJB+U/Rfav4rbwL
 gSiDtHADlAjhVx/62q/xJJeRMVMOQTB8AFBESoaZDJnYYt0s98SkRl2zXwUW8JllJ1
 ve13836WIBnEA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/ttm: Introduce TTM res manager debugfs helpers
Date: Mon, 11 Apr 2022 23:35:21 -0400
Message-Id: <20220412033526.369115-1-zack@kde.org>
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

v2: Switch to using ttm_resource_manager's directly in the debugfs
callbacks

This series introduces generic TTM resource manager debugfs helpers and
refactors TTM drivers which have been using hand rolled out versions
of those to use the new code.

Zack Rusin (5):
  drm/ttm: Add common debugfs code for resource managers
  drm/vmwgfx: Add debugfs entries for various ttm resource managers
  drm/amdgpu: Use TTM builtin resource manager debugfs code
  drm/qxl: Use TTM builtin resource manager debugfs code
  drm/radeon: Use TTM builtin resource manager debugfs code

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 86 +++++--------------------
 drivers/gpu/drm/qxl/qxl_ttm.c           | 39 ++---------
 drivers/gpu/drm/radeon/radeon_ttm.c     | 36 ++---------
 drivers/gpu/drm/ttm/ttm_resource.c      | 34 ++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 18 ++++++
 include/drm/ttm/ttm_resource.h          |  4 ++
 6 files changed, 84 insertions(+), 133 deletions(-)

-- 
2.32.0

