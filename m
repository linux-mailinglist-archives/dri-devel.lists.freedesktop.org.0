Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E1812C85
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138D010E906;
	Thu, 14 Dec 2023 10:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C515F10E906
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:09:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1922E6216A;
 Thu, 14 Dec 2023 10:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69114C433C7;
 Thu, 14 Dec 2023 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702548572;
 bh=sj83K/4JenSCs5c0jZW5byPMqZx5MToX9bHZtccVSfU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X5gtxfxYXKYydFks9OeLo6P5GxcARPpatR86VYI94yIYRwJdpaviZ3/dvu2eHDIx/
 VUCkWdO0n0EZECaOLGnPgSM1JgSIBSfdwTz0iJWJlAslSbtk7yexUy0H4mjRTsgPKC
 BeROysdCui/NoI+LyG0QkVqoRtgPMFsF30j3ZxImiv64H+Axo+O16W3DYTHFTtpt0G
 vxM2MTouohUqYgTIgJej3wPxJOm0okSt9yFXt+KWUEpYxYXSBWwkgIuBNQmVJEqDCo
 VBRMF8PA9y9iBt8nxluqRWTXQvkRQOW16QIcoznID140ehWM5PvAkt5vZ5k2z16AjP
 odm+C7vOVyqGg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 5/5] drm/todo: Add entry to rename drm_atomic_state
Date: Thu, 14 Dec 2023 11:09:16 +0100
Message-ID: <20231214100917.277842-5-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214100917.277842-1-mripard@kernel.org>
References: <20231214100917.277842-1-mripard@kernel.org>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The name of the structure drm_atomic_state is confusing. Let's add an
entry to our todo list to rename it.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 41a264bf84ce..fb9ad120b141 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -120,6 +120,29 @@ Contact: Daniel Vetter, respective driver maintainers
 
 Level: Advanced
 
+Rename drm_atomic_state
+-----------------------
+
+The KMS framework uses two slightly different definitions for the ``state``
+concept. For a given object (plane, CRTC, encoder, etc., so
+``drm_$OBJECT_state``), the state is the entire state of that object. However,
+at the device level, ``drm_atomic_state`` refers to a state update for a
+limited number of objects.
+
+The state isn't the entire device state, but only the full state of some
+objects in that device. This is confusing to newcomers, and
+``drm_atomic_state`` should be renamed to something clearer like
+``drm_atomic_commit``.
+
+In addition to renaming the structure itself, it would also imply renaming some
+related functions (``drm_atomic_state_alloc``, ``drm_atomic_state_get``,
+``drm_atomic_state_put``, ``drm_atomic_state_init``,
+``__drm_atomic_state_free``, etc.).
+
+Contact: Maxime Ripard <mripard@kernel.org>
+
+Level: Advanced
+
 Fallout from atomic KMS
 -----------------------
 
-- 
2.43.0

