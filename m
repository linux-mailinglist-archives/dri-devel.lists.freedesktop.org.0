Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC34DE02B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7543510E174;
	Fri, 18 Mar 2022 17:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD3710E174
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:43:41 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 8BBF828909B;
 Fri, 18 Mar 2022 17:43:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1647625419; bh=kWeahNkLnsiTKsFkavu5kjlxAexbsA1UusvbdRp3X84=;
 h=From:To:Cc:Subject:Date:From;
 b=EYoi2sPad9x3zcV+gpC/BJ6KQQ2fZFxZAn1qfBAAzJHtUg+V6XDmNk/rFnZN3i4I1
 FRUEmy3KkYV6igzxpk5h1/+k1GAcHMCUE4FQncvOV6rYNuyj0UGzty7O73JM6mVWPS
 WpJ0Cu4uZ9JX78o23LoS7mAU6XTmY1gPfPKE2vBi2CZ0LDhY3WLmDSbOabpuLQD7gy
 wy2BbdNPMUsJLfbAx+K3q4pWWxrjSFTJKg8jnxw6IlCrxPh5UBaw1maiY5m/3AHYEY
 H9WOGx4BLWhyzo4K95fuZO5y9Pmo3DAusgHHxOQGTMhnaBzuOMhZEMf9XLV1uNNqwG
 3HHmlN25QZvuQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/vmwgfx: Set of various correctness fixes
Date: Fri, 18 Mar 2022 13:43:27 -0400
Message-Id: <20220318174332.440068-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

This is a set of various smaller fixes. The 5th, drm/ttm one needs to be
looked at by Christian, especially because it's a kernel oops. The others
are largely trivial vmwgfx fixes.

Zack Rusin (5):
  drm/vmwgfx: Fix an invalid read
  drm/vmwgfx: Fix mob cursor allocation race
  drm/vmwgfx: validate the screen formats
  drm/vmwgfx: Disable command buffers on svga3 without gbobjects
  drm/ttm: Fix a kernel oops due to an invalid read

 drivers/gpu/drm/ttm/ttm_range_manager.c  |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c      | 11 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      | 38 +++++++++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h      |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 14 ++++-----
 5 files changed, 38 insertions(+), 28 deletions(-)

-- 
2.32.0

