Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C4B739293
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFC110E142;
	Wed, 21 Jun 2023 22:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net
 (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6644310E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=gpt4shW9Az8HQBaGBESfhw3ZJgloP+jLONDW/keDorI=;
 b=A8qHE49+Rg910ao7nsxF5wejLhadp5zf4H3oduW0IvhB6JgcqzK642zeQKPYN3xd6Kz+
 bZnriW/wigqdWrwPerUr09sTPqBJt1oeH+WKLmj6f4fuLH+uXvBViFsnAkB5KmwqIV7FXf
 DOJdKVGEcwKWyiwnz5XFki6bDwuRZxiFpFMO2mdKfZ8kK5OZkZaaqS7RiotSwKZ7ZHQP5W
 QiOanLgQtVB5gyhNfl4RX6hS3/sHP8wvXV1jWLkCu4lJ3rLePPLxPizm/1ir69yz97MbZC
 umfuwRmM0t1fB2ftWFwruJmeMlIXXqNMVbpPcCJ3qaB0IA3OcRvKyEfhubPU/Mcw==
Received: by filterdrecv-65f68489c8-k2rl8 with SMTP id
 filterdrecv-65f68489c8-k2rl8-1-64937AB2-32
 2023-06-21 22:33:23.019043275 +0000 UTC m=+1463598.288798320
Received: from bionic.localdomain (unknown) by geopod-ismtpd-0 (SG) with ESMTP
 id W7fz8D3QRnife75m7ND9CA Wed, 21 Jun 2023 22:33:22.815 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 5/5] drm/rockchip: vop2: Add missing call to crtc reset
 helper
Date: Wed, 21 Jun 2023 22:33:23 +0000 (UTC)
Message-ID: <20230621223311.2239547-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621223311.2239547-1-jonas@kwiboo.se>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hz78e=2FvfUnHx3mUyD?=
 =?us-ascii?Q?KgumjHDaRQIPiL31NJ2du6oz01DwPK8KoRoBpmL?=
 =?us-ascii?Q?Yyy0WPk79Cbsu101l84dCjvPY43LcPBGkpHUpBM?=
 =?us-ascii?Q?E5dJVsi=2FAO1LGUqErWFQtCHcouHJis=2FySk+s1Kw?=
 =?us-ascii?Q?16FT=2FMnLpe1CbbXaR967oa4m2cYKk5BsQ5aDz2Y?=
 =?us-ascii?Q?p81HNYfHNijIuCZyKm65Q=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>
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
v2:
- Add check for allocation failure (Sascha)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 31 +++++++++-----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f725487d02ef..5ba83121a1b9 100644
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
@@ -2123,6 +2106,20 @@ static void vop2_crtc_destroy_state(struct drm_crtc *crtc,
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
+	if (vcstate)
+		__drm_atomic_helper_crtc_reset(crtc, &vcstate->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
+}
+
 static const struct drm_crtc_funcs vop2_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-- 
2.41.0

