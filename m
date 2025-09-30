Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9BBAC9D6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B742510E2A9;
	Tue, 30 Sep 2025 11:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UCBm70fc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6476010E589
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9B48604DF;
 Tue, 30 Sep 2025 11:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DA4C4CEF0;
 Tue, 30 Sep 2025 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230100;
 bh=JTNoLRyXYsnGIRBXwPFD1Vkzf6+WL8HaiDaECxBSgVI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=UCBm70fc9t8keKTzTSrahJ2IF8GG4Fy9IKDrUTxbo0Qo80MxXEyJVRfC3CVmS3cCI
 jbWSVlgQa2EHFGz4OSS5Legf3L/nMyN7OCNVHIvfbqK4sphmNpAYDPkJrYzXNoTb4t
 3pi9OGYYmvZ/hbj6Ni34y3ytEgFmEbCJ7579R4ITKf/CaYwa3hb9cgtyJ5MERerKHz
 LXOXfKCYWBsuZEFm7cmYb5iqlPSI4rIK3GjF2jU7Mc/30eR+id8FqlaKlqVbz7Ezio
 lEMOmx1V1lY/+61Jh8T+ZwUC9XTk7mdxUdceK4Hz2Rg9njlS9TiagWPfS33F3sPUAl
 nsu1+VuTW8qEA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:48 +0200
Subject: [PATCH v5 33/39] drm/atomic: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-33-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=mripard@kernel.org;
 h=from:subject:message-id; bh=JTNoLRyXYsnGIRBXwPFD1Vkzf6+WL8HaiDaECxBSgVI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+jFq6W8nlk0YV1Pjl3ue1nWxZvepLsbMvpEJrq25
 Jj/N3DvmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABN5pcFYH2R0qfFY8IzHi3f9
 9PNUrz1e8WfD4kXSF1huxDa1VC1umlx5NSXyZP+OCeap3+Jd/uqnMdZZzF0559S8ujVnm170Vv4
 SZSvuW8Kp1r7Qdtv0/I1dv6ZfdRXU/JpS5Z5VcXCJ6V2DAgcA
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
2.51.0

