Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FA1B3F875
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6F710E5DE;
	Tue,  2 Sep 2025 08:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WbrmIWsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8549810E5DD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 13DAC44969;
 Tue,  2 Sep 2025 08:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99999C4CEF5;
 Tue,  2 Sep 2025 08:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756801991;
 bh=RSw/FevPuIg72kLXYX+y6FE8T6rOeXx1VhHt9C78V7E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WbrmIWsVxfHKK/d2jEVc/uodasQaXUxSPenru2Sn8bPUmc7lY/els15Tr/ze+Qb3k
 G+TO8bbbuQ6hxyOE+WstZedrxyQx9be52h+G4IsXZEuJTgrCBJbxW9SMkN47u2FZco
 efOxGr7BpmEUGFN8u4+WhGokvYzvFRjNXJmnvxxnIxaxxfImQW5gRYSFb5QDve9Hpq
 1i4vk+EPbAHfavbvgIMkHpA2p5KE3Q9fw+S/sBYcaZQU03gMdGXFHlOmAXJueatuA1
 Yb2evOmGFr7hpkY9bi1IxfWgBUQFCNjmhgbjbznsQzZSl5gRwz1Y1co33CaSqiHLEV
 ytDu1Lqs+zipg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:29 +0200
Subject: [PATCH 01/29] drm/atomic: Document atomic state lifetime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-1-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3774; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RSw/FevPuIg72kLXYX+y6FE8T6rOeXx1VhHt9C78V7E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVm+1FDpzW7NSZoNK288LE1UDtSPzzu6+73jK7ce6Z
 6GXJabt7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT+cLBWF8w4Ylg6Qq2+2Yf
 Vgium5h0f94t0Tuqr5ctjXOubktqWfZXOkR0ak906r7d5tqW/zRcXjA2tFvnnek4yT/tceDk0NC
 Hrzacl2i9HfalbPVJw7OlzRWH42cvPvZj6kenG9FHuCKbWUtkAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

How drm_atomic_state structures and the various entity structures are
allocated and freed isn't really trivial, so let's document it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-kms.rst |  6 ++++++
 drivers/gpu/drm/drm_atomic.c  | 45 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1edc758a6bc6fb5ff9c8e1c7749ff..dc0f61a3d29e752889077d855a4bea381f2e2c18 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -280,10 +280,16 @@ structure, ordering of committing state changes to hardware is sequenced using
 :c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
 
 Read on in this chapter, and also in :ref:`drm_atomic_helper` for more detailed
 coverage of specific topics.
 
+Atomic State Lifetime
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_atomic.c
+   :doc: state lifetime
+
 Handling Driver Private State
 -----------------------------
 
 .. kernel-doc:: drivers/gpu/drm/drm_atomic.c
    :doc: handling driver private state
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..b356d26faad4acaa25c1fe6f9bd5043b6364ce87 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -44,10 +44,55 @@
 #include <drm/drm_writeback.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+/**
+ * DOC: state lifetime
+ *
+ * &struct drm_atomic_state represents an update to video pipeline state.
+ *
+ * Its lifetime is:
+ *
+ * - at reset time, the entity reset implementation will allocate a
+ *   new, default, state and will store it in the entity state pointer.
+ *
+ * - whenever a new update is needed:
+ *
+ *   + we allocate a new &struct drm_atomic_state using drm_atomic_state_alloc().
+ *
+ *   + we copy the state of each affected entity into our &struct
+ *     drm_atomic_state using drm_atomic_get_plane_state(),
+ *     drm_atomic_get_crtc_state(), drm_atomic_get_connector_state(), or
+ *     drm_atomic_get_private_obj_state(). That state can then be
+ *     modified.
+ *
+ *     At that point, &struct drm_atomic_state stores three state
+ *     pointers for that particular entity: the old, new, and existing
+ *     (called "state") states. The old state is the state currently
+ *     active in the hardware, ie either the one initialized by reset()
+ *     or a newer one if a commit has been made. The new state is the
+ *     state we just allocated and we might eventually commit to the
+ *     hardware. The existing state points to the state we'll eventually
+ *     have to free, the new state for now.
+ *
+ *   + Once we run a commit, it is first checked and if the check is
+ *     successful, it is committed. Part of the commit is a call to
+ *     drm_atomic_helper_swap_state() which will turn the new state into
+ *     the active state. Doing so involves updating the entity state
+ *     pointer (&drm_crtc.state or similar) to point to the new state,
+ *     and the existing state will now point to the old state, that used
+ *     to be active but isn't anymore.
+ *
+ *   + When the commit is done, and when all references to our &struct
+ *     drm_atomic_state are put, drm_atomic_state_clear() runs and will
+ *     free all the old states.
+ *
+ *   + Now, we don't have any active &struct drm_atomic_state anymore,
+ *     and only the entity active states remain allocated.
+ */
+
 void __drm_crtc_commit_free(struct kref *kref)
 {
 	struct drm_crtc_commit *commit =
 		container_of(kref, struct drm_crtc_commit, ref);
 

-- 
2.50.1

