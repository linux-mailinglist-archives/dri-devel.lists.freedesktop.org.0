Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B35F9D4315
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 21:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C674410E3DC;
	Wed, 20 Nov 2024 20:33:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 20 Nov 2024 15:08:56 UTC
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C248810E771
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 15:08:56 +0000 (UTC)
X-CSE-ConnectionGUID: C/0++ZR+QH2Ah413ePAsOw==
X-CSE-MsgGUID: YEsMYqFkQK6G2IUnl9lYNA==
X-IronPort-AV: E=Sophos;i="6.12,170,1728918000"; d="scan'208";a="229423401"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2024 00:03:52 +0900
Received: from lenovo-p330.. (unknown [132.158.152.97])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A97D4005B44;
 Thu, 21 Nov 2024 00:03:39 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>, stable@vger.kernel.org
Subject: [PATCH] drm: renesas: rz-du: Increase supported resolutions
Date: Wed, 20 Nov 2024 10:03:28 -0500
Message-Id: <20241120150328.4131525-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Nov 2024 20:33:14 +0000
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

The supported resolutions were misrepresented in earlier versions of
hardware manuals.

Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index b99217b4e05d..90c6269ccd29 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -311,11 +311,11 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 	dev->mode_config.helper_private = &rzg2l_du_mode_config_helper;
 
 	/*
-	 * The RZ DU uses the VSP1 for memory access, and is limited
-	 * to frame sizes of 1920x1080.
+	 * The RZ DU was designed to support a frame size of 1920x1200 (landscape)
+	 * or 1200x1920 (portrait).
 	 */
 	dev->mode_config.max_width = 1920;
-	dev->mode_config.max_height = 1080;
+	dev->mode_config.max_height = 1920;
 
 	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
 
-- 
2.34.1

