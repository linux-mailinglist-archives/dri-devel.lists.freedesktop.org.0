Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9ED803253
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5310E19F;
	Mon,  4 Dec 2023 12:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006C610E1AF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:17:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 886E2B80DE5;
 Mon,  4 Dec 2023 12:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90143C433C8;
 Mon,  4 Dec 2023 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701692241;
 bh=j7fz9TpVL6EVLwwXHd58z4M5dDgEqA8PrXT/PNunyzU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DeYpG362q1xEvS7D2KdUjemN+zU58rYQr3SFFsH3GzB47sMv4y14cSWKOSEWzqrEj
 UHYOannkvV21rWLUbH3ZJwTh+aDzV3fNSTtjEw3TTTSG1CQVptviTVB9McVr5OxQQY
 IXIYH4295Z0HYNBsrwwan2vP5qk6LKdsh6f22gu+S2kOi3QXmkgZKRv7dqXWlNVUX/
 7t95/Ll/HhwvBqB5MDu0Y4e1fyvC0FIDpg/FAc+LKpE6TA1IFSrp/B16fcFWeGGVNj
 r9yWBY0+wsTvx/TyURX73l39n8Y5PDm7rn72G+GuVej69IAqNDgZ3l+iZOUMRZdzHn
 w+ipj3Gn4hLVQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 5/5] drm/todo: Add entry to rename drm_atomic_state
Date: Mon,  4 Dec 2023 13:17:07 +0100
Message-ID: <20231204121707.3647961-5-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204121707.3647961-1-mripard@kernel.org>
References: <20231204121707.3647961-1-mripard@kernel.org>
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b62c7fa0c2bc..fe95aea89d67 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -120,6 +120,24 @@ Contact: Daniel Vetter, respective driver maintainers
 
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
+The state isn't the entire device state anymore, but only the full state of
+some objects in that device. This is confusing to newcomers, and
+``drm_atomic_state`` should be renamed to something clearer like
+``drm_atomic_update``.
+
+Contact: Maxime Ripard <mripard@kernel.org>
+
+Level: Advanced
+
 Fallout from atomic KMS
 -----------------------
 
-- 
2.43.0

