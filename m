Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 850122B41FC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 12:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5FB89DFD;
	Mon, 16 Nov 2020 11:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909ED89DFD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 11:03:29 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kecI0-0006oY-Jv; Mon, 16 Nov 2020 11:03:16 +0000
From: Colin King <colin.king@canonical.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/atomic: avoid null pointer dereference on pointer
 crtc
Date: Mon, 16 Nov 2020 11:03:16 +0000
Message-Id: <20201116110316.269934-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Since moving to the new debug helper functions we now have a debug message
that dereferences crtc to print a kernel debug message when crtc is null
and so this debug message will now cause a null pointer dereference. Since
this is a debug message it probably is just simplest to fix this by just
removing the debug message altogether.

Addresses-Coverity: ("Dereference after null check")
Fixes: e3aae683e861 ("drm: convert drm_atomic_uapi.c to new debug helpers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9df7f2a170e3..3fd84590560a 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -338,11 +338,6 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
 			       connector->base.id, connector->name,
 			       conn_state, crtc->base.id, crtc->name);
-	} else {
-		drm_dbg_atomic(crtc->dev,
-			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
-			       connector->base.id, connector->name,
-			       conn_state);
 	}
 
 	return 0;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
