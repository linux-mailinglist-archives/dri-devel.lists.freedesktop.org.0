Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA67363CC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C283910E268;
	Tue, 20 Jun 2023 06:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998410E265
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=DWKAFEQyu98IZ9ZgJni/kueEjxYsF0HocTjSZNu5dc0=;
 b=cMGNWwX+FeprtsjEHvLYOSUZ211lLDMzQXxmXdfQhxXIqJbaWseCwlohRjzI8kWuzPVL
 O2VB9JXBKQsD/DbNxiMXMzrmLn03KrwtiWKFhwPTDUONzAcndz3OJxTXiIAK43QzW2FAgE
 ZBRJwv8azP6NtTHPv24FUCskm796yXLRLWHErC/HoPfWA8IK21mKgKU19TUubA+a121BpS
 Ly4qAioPvfhZiYD2EEmJz8Hamf+flxBeMdXw28hgWOzvmHMFcZWbHUgXLCnEGc4DjPpMSt
 uZHz+RNGL0QnNHtiF32vqkQMt/KjyLSk43zlGMXPfeWilVw59ShCanwl9SXr73IA==
Received: by filterdrecv-77869f68cc-wnrh7 with SMTP id
 filterdrecv-77869f68cc-wnrh7-1-64914B8B-15
 2023-06-20 06:47:39.640836851 +0000 UTC m=+3481899.293266760
Received: from bionic.localdomain (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id HGVB4aOXSe-PK4Ce6TiCSw Tue, 20 Jun 2023 06:47:39.424 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 4/4] drm/rockchip: vop2: Add missing call to crtc reset helper
Date: Tue, 20 Jun 2023 06:47:39 +0000 (UTC)
Message-ID: <20230620064732.1525594-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620064732.1525594-1-jonas@kwiboo.se>
References: <20230620064732.1525594-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h6Y7pOvDXJbRf1XNu?=
 =?us-ascii?Q?rdBi7Uj4gm=2FqSVvpHVBX1ECIzrzeDP264QZlPK8?=
 =?us-ascii?Q?XVyx2htZ01V+Bv6v+2TFKR+yi8Clec05BUDwVQK?=
 =?us-ascii?Q?wMb12slJJOxYugldzOO2ktPOf2FFaO7gknhXFtI?=
 =?us-ascii?Q?5f0iGO4qN04k0sJ6KWAEjW7fFBse3SeU4AJuzQS?=
 =?us-ascii?Q?OFFPQN3brZoB0FJb7TufA=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
X-Entity-ID: P7KYpSJvGCELWjBME/J5tg==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
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
Cc: Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing call to crtc reset helper to properly vblank reset.

Also move vop2_crtc_reset and call vop2_crtc_destroy_state to simplify
and remove duplicated code.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 28 ++++++++------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f725487d02ef..1be84fe0208f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2080,23 +2080,6 @@ static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
 	.atomic_disable = vop2_crtc_atomic_disable,
 };
 
-static void vop2_crtc_reset(struct drm_crtc *crtc)
-{
-	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(crtc->state);
-
-	if (crtc->state) {
-		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-		kfree(vcstate);
-	}
-
-	vcstate = kzalloc(sizeof(*vcstate), GFP_KERNEL);
-	if (!vcstate)
-		return;
-
-	crtc->state = &vcstate->base;
-	crtc->state->crtc = crtc;
-}
-
 static struct drm_crtc_state *vop2_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct rockchip_crtc_state *vcstate;
@@ -2123,6 +2106,17 @@ static void vop2_crtc_destroy_state(struct drm_crtc *crtc,
 	kfree(vcstate);
 }
 
+static void vop2_crtc_reset(struct drm_crtc *crtc)
+{
+	struct rockchip_crtc_state *vcstate =
+		kzalloc(sizeof(*vcstate), GFP_KERNEL);
+
+	if (crtc->state)
+		vop2_crtc_destroy_state(crtc, crtc->state);
+
+	__drm_atomic_helper_crtc_reset(crtc, &vcstate->base);
+}
+
 static const struct drm_crtc_funcs vop2_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-- 
2.41.0

