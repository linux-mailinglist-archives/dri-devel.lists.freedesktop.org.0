Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2B3905542
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4AC10E882;
	Wed, 12 Jun 2024 14:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FihvLG7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D514910E885
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 14:36:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BEE96149A;
 Wed, 12 Jun 2024 14:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F429C116B1;
 Wed, 12 Jun 2024 14:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718202963;
 bh=8jXXcz13JWAMyrSat3JZapAIgAzavaJjrX08KmBSB0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FihvLG7djIuFRi472NFmjmCuA+vxvPwJ8H1c99aIXchmD43d9g6rGqrHiOAVQ4hId
 wJR1sup9xPzBEjvdeGYdMWDGcQNJ+80rZ1FWhekWMjp4RPDkOW3bMHevnSPqtrDG6J
 AArBNPWUTDACTVlHt5qJjlevk/qZCxMfVJ3x+2rCN4sid9KI67BmU+n5d46jraOqX4
 0r+XXkVZAIng3Z2tCJohHIiQkgiimI2S2Z7+K4DC2l/oqLwOyNpWjrkgqw7YzUy+fg
 fwnaAsqJEJ+4+e3GPSsHQnkvNSe2M2XjuyyLmrtuW1/lcCG+ZVUgBc4i6dbd8Mfvu4
 6LwAdWbwsgK4A==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH 3/3] drm/todo: Add TODO entry for "lints"
Date: Wed, 12 Jun 2024 16:35:53 +0200
Message-ID: <20240612143553.915966-3-mripard@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612143553.915966-1-mripard@kernel.org>
References: <20240612143553.915966-1-mripard@kernel.org>
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

Having lints would prove beneficial to prevent the same dark patterns
from reoccuring over and over again in drivers.

Add a TODO entry for that.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 94139c652663..16a9a24b33a6 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -717,10 +717,38 @@ doesn't or document it if it does would be of great help.
 
 Contact: Maxime Ripard <mripard@kernel.org>
 
 Level: Intermediate
 
+Create lints for KMS drivers
+----------------------------
+
+Over time, we've accumulated a list of dark patterns in KMS drivers that
+should be avoided. However, none of them are published anywhere, and not
+all reviewers are aware of them. It creates a situation where we have
+more drivers with problematic / deprecated code, even though we know
+that they shouldn't.
+
+We should create a set of coccinelle scripts that match these patterns,
+and make new drivers run that list. And possibly integrate them in CI.
+
+These patterns include:
+
+  - Drivers using kzalloc() or devm_kzalloc() to allocate their memory,
+    instead of drmm_kzalloc().
+
+  - Drivers not protecting their device resources (MMIO, clocks,
+    regulators, etc.) by drm_dev_enter() and drm_dev_exit().
+
+  - Drivers using drm_dev_unregister() instead of drm_dev_unplug().
+
+  - Drivers not calling drm_atomic_helper_shutdown() at shutdown
+
+Contact: Maxime Ripard <mripard@kernel.org>
+
+Level: Intermediate
+
 Enable trinity for DRM
 ----------------------
 
 And fix up the fallout. Should be really interesting ...
 
-- 
2.45.2

