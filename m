Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2858B4ABC5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF7310E6A8;
	Tue,  9 Sep 2025 11:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xnf9onRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531C10E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:27:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6CB6144AC5;
 Tue,  9 Sep 2025 11:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC215C4CEF4;
 Tue,  9 Sep 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417273;
 bh=z1XF1Rnz3XY6QTs7brP5nMEpkpbd1NvbUtFXrNw26aI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Xnf9onRhdi+EdJ2wGS4DV6aj2v8p11caN9XOrfnXJtPSdZGgWzrxFGzfg/B4SAzUU
 0nQjgFCzrCvZJt+O+NwTdRBZ9CRdGPBBuGphWGUNRjcnOy9P7sVWL1buWWPBKMO6ib
 0ttJMiPNSQk5lCK4RlSL2tIbpj8p5L3H8AFd3stvp1vDP7+9e+bWhcKUU5abUjB9ZW
 1+wkuD8kwKmg5OQqlq5Yw5IJwFtq03D4AeOkRjidp4RrSeNbrn0a8iFbxLbYLYiesE
 JljOCQ1sULcIoXAjKCPAYgouQ7SQRadmtT3KyDSb6D4u3DAgHPBo0eZXFpTahcbpxj
 6BjU1M1XG9BXg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:20 +0200
Subject: [PATCH v3 01/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-1-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=mripard@kernel.org;
 h=from:subject:message-id; bh=z1XF1Rnz3XY6QTs7brP5nMEpkpbd1NvbUtFXrNw26aI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+BXdC5Nt1+Z8WMjxwCDV8/HqhMzZAbmrp98yLNvUX
 3P5XGdox1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiINAtjfUjOrefhXy+umHT1
 ylLD85Zuyz7vCmpzqthqV9YicqVgxsyafFld6Xau2ib5xKkmR7O4GBuehUmEHX1j9ed99JMl973
 O6a2pdbDb/WFl3vpYvff1t2Zr+t6zlu7YmbpSNm3m3AcTBHwA
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

The drm_atomic_get_connector_state() function calls a hand-rolled
implementation of the deprecated
drm_atomic_get_existing_connector_state() helper to get find if a
connector state had already been allocated and was part of the given
drm_atomic_state.

At the point in time where drm_atomic_get_connector_state() can be
called (ie, during atomic_check), the existing state is the new state
and drm_atomic_get_existing_connector_state() can thus be replaced by
drm_atomic_get_new_connector_state().

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # on imx8mp
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..6d10a3e40b00c58030e4dc9fdf47bd252cac0189 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1150,12 +1150,13 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		       sizeof(*state->connectors) * (alloc - state->num_connector));
 
 		state->num_connector = alloc;
 	}
 
-	if (state->connectors[index].state)
-		return state->connectors[index].state;
+	connector_state = drm_atomic_get_new_connector_state(state, connector);
+	if (connector_state)
+		return connector_state;
 
 	connector_state = connector->funcs->atomic_duplicate_state(connector);
 	if (!connector_state)
 		return ERR_PTR(-ENOMEM);
 

-- 
2.50.1

