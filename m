Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1C888ED49
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 18:56:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2BB10FEEB;
	Wed, 27 Mar 2024 17:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oJLaRwV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6516110FEF8;
 Wed, 27 Mar 2024 17:56:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 00EB7CE2534;
 Wed, 27 Mar 2024 17:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B8DC433C7;
 Wed, 27 Mar 2024 17:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711562208;
 bh=pKuISH9h1n83BoSbEk6oIRQvBztb2uVAQCVjoqJHhUw=;
 h=From:To:Cc:Subject:Date:From;
 b=oJLaRwV+CJsu2Yrg5VZootPUJY7AFWOEkOAzEDE2SL1OA52sYTmuQOHAfLhSaqRt6
 yusGg0Ou/c7wyIYWgoBR0mpsEeu5v7DZTINWbk1K7I6jEkagUTx4228++Eh9q6rlcS
 YHoNiJlhcF/ukHA0WGak2jy44J5O7zCArnXPeEW2Jzf+rdzuKHS2+Twe433TrbNtzg
 q8mYAkpcY0uT2EBAo1wtbCpr/c934Up7uVIUe6WoWgIDplJbm3j/w4JueLmA+FXTnu
 xWWYXh6H3An2kqJIVP6QNYrwHMs9T2MYZ4Tq2VRXlCbO9IsT5oBhGg5OGUmjzZHthm
 X3aIhw7ejkFyQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alon Levy <alevy@redhat.com>, Frediano Ziglio <fziglio@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/qxl: remove unused `count` variable from
 `qxl_surface_id_alloc()`
Date: Wed, 27 Mar 2024 18:55:55 +0100
Message-ID: <20240327175556.233126-1-ojeda@kernel.org>
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

Clang 14 in an (essentially) defconfig loongarch64 build for next-20240326
reports [1]:

    drivers/gpu/drm/qxl/qxl_cmd.c:424:6: error: variable 'count' set
    but not used [-Werror,-Wunused-but-set-variable]

The variable is already unused in the version that got into the tree.

Thus remove the unused variable.

Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
Closes: https://lore.kernel.org/lkml/CANiq72mjc5t4n25SQvYSrOEhxxpXYPZ4pPzneSJHEnc3qApu2Q@mail.gmail.com/
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Given there is a loop going on here, it would be good to double-check whether
this variable was supposed to be used for something useful or if it was just a
remnant of a version previous to v1.4.

 drivers/gpu/drm/qxl/qxl_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 281edab518cd..d6ea01f3797b 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -421,7 +421,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 {
 	uint32_t handle;
 	int idr_ret;
-	int count = 0;
 again:
 	idr_preload(GFP_ATOMIC);
 	spin_lock(&qdev->surf_id_idr_lock);
@@ -433,7 +432,6 @@ int qxl_surface_id_alloc(struct qxl_device *qdev,
 	handle = idr_ret;

 	if (handle >= qdev->rom->n_surfaces) {
-		count++;
 		spin_lock(&qdev->surf_id_idr_lock);
 		idr_remove(&qdev->surf_id_idr, handle);
 		spin_unlock(&qdev->surf_id_idr_lock);

base-commit: 26074e1be23143b2388cacb36166766c235feb7c
--
2.44.0
