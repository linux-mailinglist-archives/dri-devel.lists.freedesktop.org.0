Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6465B3FA9D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6521410E627;
	Tue,  2 Sep 2025 09:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HthmEeVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE0C10E629
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3767C6020A;
 Tue,  2 Sep 2025 09:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916EAC4CEED;
 Tue,  2 Sep 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805760;
 bh=2G+6fjdtRCSzH+T+5f3kfndzD2pDxu+514DbJJoPCE4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HthmEeVvh3NjfOAHLbwvTdO7Ez3Q/JxS/0Vhyghu/QB9v5bSUaD2JvmrXeladugXG
 ZwIb6GNFHOUgKKQ+++LX0hQFCNuF6qWaxYbiaZ2pxBi6960ysBdbn2a+z/z2MpXFJb
 HMGUIvKAmntFjjxnGmMRbtRwQo+haWmHKuNKAzVR+19THrEvWUICZnt++Wi4R3nyFy
 Cblpt9l1MKo0g4QNbiez6S4gc3f5XEHj1JXJFGJBnQM6gBt/RaNIBPPxm4ZCTmXAA+
 B1bV4wWPa9ZDzuUgycv05GHVS1jvAmshYsmHc99/b0kb1AEehyNvL7L5767h86fTZq
 0qIstrr9FGKJg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:12 +0200
Subject: [PATCH v2 13/37] drm/armada: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-13-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2G+6fjdtRCSzH+T+5f3kfndzD2pDxu+514DbJJoPCE4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdgWeZZz7TGJGa4FkGqf0gx9L3sd8Ve0xubNb5g2n8
 PMvNTvOdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHHjH2HC2Msa0P9HGQJxr
 Et93o3TvT48LPafualog8ZUzq9Y3WJvVtLzb6tPeuhUtfWeaLu1vY2w4dG3qa8ZJ9Q8S0zfeftd
 ZqXP/tLfN5Ee8S9IerbHP37mHsWiud6j213pXxjrRc5KxXBsB
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

The armada atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index cc47c032dbc151a463cbd0b0d048c74c2828f253..786bcce0dc20eadab14c5bee97593ae3e05732b1 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -93,12 +93,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 		new_plane_state->visible = false;
 		return 0;
 	}
 
 	if (state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state,
-								crtc);
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	else
 		crtc_state = crtc->state;
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  0,

-- 
2.50.1

