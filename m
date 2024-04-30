Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA88B743F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 13:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9B710E9B8;
	Tue, 30 Apr 2024 11:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YnG8QFC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF5010E353
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714476534;
 bh=LjivCZqOjOsISTS5/36T3btAp/1yM2T5iBuxVRIcsKk=;
 h=From:To:Cc:Subject:Date:From;
 b=YnG8QFC366kofoDGrGWBENM9OomWA0BeKHWP3zh0gwszM9/Zs9jI6z1P6HIdibw0Y
 TT8HtGQH/pPUWgJeKTccekq15V6ad+aGyZZfviH0kHvlMY2W2qHZ9S2v9PPYxu8ulY
 Der0LBCrVhIad03kP9W6uizrtpPVFKQJyX5Jol3UH0AEXnpK4+eXbEnhrm6yIjBbI3
 g+DoXmb/TMIUD7MykjQRVR5R8bF2AHhuwArY0diBjfunWijwns55ZLqGqDELjg73Es
 o2ApgnnKGec+QTxhrB92BBZ6/5qsnVgZrj1W5UQZpwuSP62PoXvFX5IK0sWrrC2hc/
 FYPnQPAxqYeUw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E911937813C4;
 Tue, 30 Apr 2024 11:28:53 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 0/4] drm/panthor: Collection of tiler heap related fixes
Date: Tue, 30 Apr 2024 13:28:48 +0200
Message-ID: <20240430112852.486424-1-boris.brezillon@collabora.com>
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

Regards,

Boris

Antonino Maniscalco (1):
  drm/panthor: Fix tiler OOM handling to allow incremental rendering

Boris Brezillon (3):
  drm/panthor: Make sure the tiler initial/max chunks are consistent
  drm/panthor: Relax the constraints on the tiler chunk size
  drm/panthor: Fix an off-by-one in the heap context retrieval logic

 drivers/gpu/drm/panthor/panthor_heap.c  | 58 +++++++++++++++++--------
 drivers/gpu/drm/panthor/panthor_sched.c |  7 ++-
 include/uapi/drm/panthor_drm.h          | 14 ++++--
 3 files changed, 58 insertions(+), 21 deletions(-)

-- 
2.44.0

