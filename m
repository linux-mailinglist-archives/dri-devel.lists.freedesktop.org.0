Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15347B3F87A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3A710E5DD;
	Tue,  2 Sep 2025 08:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q7LRzvje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9B410E5DD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DC8EB6021A;
 Tue,  2 Sep 2025 08:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608BFC4CEF8;
 Tue,  2 Sep 2025 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802000;
 bh=uSx8gxP4bhNu5Nz4ZWIuRfI4kUACjD7tGQ0Jp8coKBs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q7LRzvjetM6f92/xddbunTpDsoStUcxjc428/OHH+Lt0A93m0hOnGE7EqXJYteCpt
 rawRyZzWPW/3l8B/u3ra2ixG0Er5YSEKW4j3d0MO1Kg7jGqFN7cMXVjP4ZzV/xQEAM
 8OHjyr7aQmoUBTx8M78Avxxzf++BWrcyrXoI1FMfZECQ6H48EtnrzzS5XrG6EiWn8I
 JNiB+BZ6Roj8Wo/Mjk7Nbd3S51dJHS6qTJFWkKi5ZpYQQvdaQ0aKB8kyC4lsQSE41g
 GkNp72SO/MoOAI6PUpiCn6adTefbq26FKusWIAn8KyIgdMXJ12x/HM45GaGXZZv+/I
 GMV7XQb0Ytz9Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:32 +0200
Subject: [PATCH 04/29] drm/atomic_helper: Skip over NULL private_obj pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-4-14ad5315da3f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=843; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uSx8gxP4bhNu5Nz4ZWIuRfI4kUACjD7tGQ0Jp8coKBs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVm/7HLDqv/qMaqFbwnc+T1g19WQfi3Cz1YWF7au+/
 7t2Zeu1yR1TWRiEORlkxRRZnsiEnV7evrjKwX7lD5g5rEwgQxi4OAVgIl+cGGvFXvBlLVgUPGvB
 51QX0alme27t0ev+vtOF84T05AnfOdenbp8tEnto+sGZ61/dkN//R2IXY8OxqiXrmNK2/1LbxH2
 8t/bzUb7tR/7+2Sdo3J74r/Z37OELdaZhQRJ9V+c9bLVjf7Cw5ygA
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b356d26faad4acaa25c1fe6f9bd5043b6364ce87..9b198610791d19c7fd276ca59264a961d21caf43 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -295,10 +295,13 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 	}
 
 	for (i = 0; i < state->num_private_objs; i++) {
 		struct drm_private_obj *obj = state->private_objs[i].ptr;
 
+		if (!obj)
+			continue;
+
 		obj->funcs->atomic_destroy_state(obj,
 						 state->private_objs[i].state);
 		state->private_objs[i].ptr = NULL;
 		state->private_objs[i].state = NULL;
 		state->private_objs[i].old_state = NULL;

-- 
2.50.1

