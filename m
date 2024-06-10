Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B09590289B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 20:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7E310E1DC;
	Mon, 10 Jun 2024 18:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D5C910E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:21:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06B9C12FC;
 Mon, 10 Jun 2024 03:21:45 -0700 (PDT)
Received: from e127519.cambridge.arm.com (e127519.arm.com [10.1.32.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 455343F73B;
 Mon, 10 Jun 2024 03:21:18 -0700 (PDT)
From: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Smitha T Murthy <smitha.tmurthy@arm.com>,
 Deepak Pandey <deepak.pandey@arm.com>
Subject: [PATCH] drm/komeda: check for error-valued pointer
Date: Mon, 10 Jun 2024 11:20:56 +0100
Message-Id: <20240610102056.40406-1-amjad.ouled-ameur@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jun 2024 18:25:33 +0000
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

komeda_pipeline_get_state() may return an error-valued pointer, thus
check the pointer for negative or null value before dereferencing.

Signed-off-by: Amjad Ouled-Ameur <amjad.ouled-ameur@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index f3e744172673..f4e76b46ca32 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
 	u32 avail_scalers;
 
 	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
-	if (!pipe_st)
+	if (IS_ERR_OR_NULL(pipe_st))
 		return NULL;
 
 	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
-- 
2.25.1

