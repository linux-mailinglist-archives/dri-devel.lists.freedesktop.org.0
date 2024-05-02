Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A308B9DA2
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 17:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106D112514;
	Thu,  2 May 2024 15:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3wiF/8je";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16076112512
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714664428;
 bh=jeWAt2nM5grYREkrhRy/Hkrd8Ss2Q6b+lPh4MbLx0Uk=;
 h=From:To:Cc:Subject:Date:From;
 b=3wiF/8jemr422wSHNzkgNevOSnMtnvdNbkbwtQ3rYNUuBkblP6OavbD1Tup37ffDf
 hth/9dWEtQpo9IewX5uIl+g9cijTAK0ZBVIArkJtI1fTXnrVjEt2vEyF0zhT4DGbbB
 XK1611Kaz39WUdnLWzkB6x+/CQ0Jh3lHdQPjikipGnQWZlzlL91cjvJAtYmef5+Soz
 L6hMeLMuHD7wDsrmPxUyyVtGS0EgciC6ZZqdORDEexqJBSNX9iJmAVuLSJ3cCEAmBr
 hh1s9vMLp7dzTj0GSh81/2ABdOY1+cN+9BaMmfDbk3REgDs8LvYgkOq0miWkex4M5r
 pIfUs4NMmXEEg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC207378148F;
 Thu,  2 May 2024 15:40:27 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v3 0/5] drm/panthor: Collection of tiler heap related fixes
Date: Thu,  2 May 2024 17:40:20 +0200
Message-ID: <20240502154025.1425278-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
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

This is a collection of tiler heap fixes for bugs/oddities found while
looking at incremental rendering.

Ideally, we want to land those before 6.10 is released, so we don't need
to increment the driver version to reflect the ABI changes.

Changelog detailed in each commit.

Regards,

Boris

Antonino Maniscalco (1):
  drm/panthor: Fix tiler OOM handling to allow incremental rendering

Boris Brezillon (4):
  drm/panthor: Make sure the tiler initial/max chunks are consistent
  drm/panthor: Relax the constraints on the tiler chunk size
  drm/panthor: Fix an off-by-one in the heap context retrieval logic
  drm/panthor: Document drm_panthor_tiler_heap_destroy::handle validity
    constraints

 drivers/gpu/drm/panthor/panthor_heap.c  | 26 ++++++++++++++++---------
 drivers/gpu/drm/panthor/panthor_sched.c |  7 ++++++-
 include/uapi/drm/panthor_drm.h          | 20 +++++++++++++++----
 3 files changed, 39 insertions(+), 14 deletions(-)

-- 
2.44.0

