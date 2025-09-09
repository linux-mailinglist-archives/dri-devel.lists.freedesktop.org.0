Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09926B4ABF5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D30610E6C6;
	Tue,  9 Sep 2025 11:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hX4+xNA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3310E6C7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 35D09404E3;
 Tue,  9 Sep 2025 11:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7765C4CEF5;
 Tue,  9 Sep 2025 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417362;
 bh=VF6EMS16zHsF3go/3S9J6FhsKpwHW0LXdTZWlNRf2NM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hX4+xNA6Nhz/tTcsQHT9SIp51hd1gIVfEDFIt1uYLXWv2ptz5r1RtdwYucn+a9cTD
 0exD/UaKDDBb8/vbXwGRENLABGXfnBlWCruV9MoW0TZu/tO8oHajy1a/gfMT2BENdX
 du8h6Qh/mCSeu0IdSJGt3Ko3/vlJpSZr764K+oVlb4Sr2OhT07OK7jiyZlIVM+Mp12
 h/DI982Pb8q4/KMAp8Ce+cQbDfsavW8kleBq7iEryMuCXxZryQHNdhBRrAATP/sd0o
 mix1jQgAj72x/dXVCMhyAyhV9PxCvlASxM26Hbey3/XE7vPkj85NCvTe7gkJlehvmR
 t97GmbIOWrO9w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:52 +0200
Subject: [PATCH v3 33/39] drm/atomic: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-33-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=mripard@kernel.org;
 h=from:subject:message-id; bh=VF6EMS16zHsF3go/3S9J6FhsKpwHW0LXdTZWlNRf2NM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+A2UV2XXxltw5/T92Wvz5pLOGbZt/j+n77IrK9l71
 HKPiOnmjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRWYKMdWb8S5I7tR9N9d2r
 /ujYY7ZVh5eXnzzHph177sv5jO+22zv2l115o6qdnhkionFk/6FFYYz1VdyvPoW2MW4+EJJUu35
 K06qb/DPKXV7W7U5X05n/MID9/onb4tKn1j1tOhXBfW6HgvIfAA==
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

