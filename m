Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D73B80383
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B66110E883;
	Wed, 17 Sep 2025 14:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="On2rB54F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C6E10E87D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8DC29403B8;
 Wed, 17 Sep 2025 14:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AE1C4CEE7;
 Wed, 17 Sep 2025 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120464;
 bh=VF6EMS16zHsF3go/3S9J6FhsKpwHW0LXdTZWlNRf2NM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=On2rB54FmKD2aJ2PFXUaNV77fyusZT8Zd3TYxFD+l3+TOjA5AcukBEv0/EHedunTp
 VN0hgXTALlp7Sfy2IQ21lXFYan9lV90o+SCAUKW5iFAk035HWPXY426k78CxG016XX
 DCRTBvdvLncqpf338qNymPvzCcxXqhAAkOBSvUytxFZhgo7InoCzf1sPTJLRD/CJrG
 P5EdMmgjLrViqtRI4liujH9Di4YleSLUmzvOsBrvztq9B2Y8Nds/Pq0BnRnvs0ftt5
 OWCoGnpFgL3PbCiHpvlLBA+gDrMAQUWFLeWuTSTHodCBVGU5Kxy2Sdu1nt9oQFvwMy
 w3Du9I8N+S7qA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:14 +0200
Subject: [PATCH v4 33/39] drm/atomic: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-33-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VF6EMS16zHsF3go/3S9J6FhsKpwHW0LXdTZWlNRf2NM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq6VfH/jstm/ivQb8TleGx4eVe9m+b2KoTe//n4nb
 +2cwuwbHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiy9oZ61Nq1YrbT65xVrya
 VxMT8WKOTr7Mkg9TVNq9w+QPJq302sjgWLWsY9ukTXrv2sMChEUeMzZMusnTFTUj5MJqs5y3q+e
 ytLxeaPrD+VZoxpzTEx5J8ZfOfvJ93/QyoeV7A28/6LzFcM8QAA==
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

The drm_atomic_connector_check() function uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 435a93c83149e60e4a1bf4310ee5e865242cac7b..d6a53b678e7b52c0852b2e590d8bc041616cb80d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -478,12 +478,12 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 			       connector->base.id, connector->name);
 		return -EINVAL;
 	}
 
 	if (state->crtc)
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-								state->crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state->state,
+							   state->crtc);
 
 	if (writeback_job->fb && !crtc_state->active) {
 		drm_dbg_atomic(connector->dev,
 			       "[CONNECTOR:%d:%s] has framebuffer, but [CRTC:%d] is off\n",
 			       connector->base.id, connector->name,

-- 
2.50.1

