Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AFB80311
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F224D10E85C;
	Wed, 17 Sep 2025 14:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mEFmUlvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80BE10E86B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 289166023B;
 Wed, 17 Sep 2025 14:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7956DC4CEF0;
 Wed, 17 Sep 2025 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120407;
 bh=OB/Q4vPWe/4S2RKlqHmY5tPnkXflJZm9QnL9xu8cLOY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mEFmUlvgq8qVjrKOZwTYraiIvNYnhYSh2Urxb0/ibFyOIaHnI36mxBDxyx6cABS2u
 A4SqBmq1kAYEMRCC/0SssIkw9D0nypelBc9MNBZx9NAcPWCjo95cItn0kYIPjktRCQ
 YNjOXcfPiQNlpKjj6qGo/2qXmWX5z5yF9phGkV6XsZYuB6TJ9hTZunxZE/jy3Oy3Yy
 lG2wtib7I+o8nd4iRH8eHb57DECj4vkVVJztklgGcLQ0SgQ8SzzNygfpFGq7POCrgb
 Va0pKtSdWyxHGFQ5bwfEQg8W8yFEpgRy4zteMK0sHw8nQYm3DQf9Nq9DvJzK02lp4O
 qtXHkTBngs+xg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:54 +0200
Subject: [PATCH v4 13/39] drm/armada: Drop always true condition in
 atomic_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-13-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OB/Q4vPWe/4S2RKlqHmY5tPnkXflJZm9QnL9xu8cLOY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5tE+ut2tItxRr3bpLcX6cHtgvdj3z+XMHW3fbzS
 Myqd3PndExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHOxgbGh1aq5UXeZ9w+nY
 260/j/z+OdHzXOlFe++Gs6skj7kn7Nbf8pmh523Hi7Vl1w9pbv0S8JGxTtFqi4tt5955wSn/hR+
 fanEQ2PLoa/JqNolm2zfse+L2Z5ZE775olGWZG/txzmfewLO9AA==
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

The drm_atomic_state pointer passed to atomic_check is always valid, so
checking if it's NULL or not is pointless. Remove the check.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index cc47c032dbc151a463cbd0b0d048c74c2828f253..12a01a51d6fb7dc0e9264d4e4bf6dc4e1b472cb6 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -92,16 +92,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
 		new_plane_state->visible = false;
 		return 0;
 	}
 
-	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								crtc);
-	else
-		crtc_state = crtc->state;
-
+	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  0,
 						  INT_MAX, true, false);
 	if (ret)
 		return ret;

-- 
2.50.1

