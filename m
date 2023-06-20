Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5727363C9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC15410E267;
	Tue, 20 Jun 2023 06:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net
 (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731B910E260
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=WIftQBIpIy4TYM/w/l437zYjnaja+iEv9fSTQdcIaxc=;
 b=DD8iiQ3BAznRD1abNxYFKd9FHfceipbNMrV1hgdm7Tior8YDCBRjEgOXsTiSHl10CIFg
 c9EJnBeSFAU/kN1aAyQld2KFKR61y8VXWQExNua3TYlYNv4v7sbgDt3wWlCID2MvbIQE1H
 TKK/Qm0UXcDm3Wbp/tFsqOISysV8dMJjAdgjo0t4IooRVDydt9d1Sp7IVsCIGMQflMGMTJ
 QkvgEoQ9zQGRA4IeTiwzwWvVEv7GPpNdgtH6MrSUu1t6qaUsB4GRZfBWqXkHNnWPtd6gVS
 2kmfOP2nxBtMo+eVPQndktCzKStTkBNpLQgqSMCyGoIucG8Rk+d99MUwSt+NIiDA==
Received: by filterdrecv-84b96456cb-rsmc4 with SMTP id
 filterdrecv-84b96456cb-rsmc4-1-64914B89-1E
 2023-06-20 06:47:37.498149536 +0000 UTC m=+3481757.706840986
Received: from bionic.localdomain (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id ZMjEKrw4Qmu6N8KSTS7lHQ Tue, 20 Jun 2023 06:47:37.177 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 2/4] drm/rockchip: vop: Use cleanup helper directly as destroy
 funcs
Date: Tue, 20 Jun 2023 06:47:37 +0000 (UTC)
Message-ID: <20230620064732.1525594-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620064732.1525594-1-jonas@kwiboo.se>
References: <20230620064732.1525594-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h+3K61RI4BbEH1Wyo?=
 =?us-ascii?Q?vFH13WxQgrm+3EFl7eTAtcTWehbd5CjXWBfBMem?=
 =?us-ascii?Q?cOLPT8tHF4GvEfty=2FJ9+9b1lO9STEgA3p6sjKim?=
 =?us-ascii?Q?F6svmCUWhXzhAFWyhpjlFzkimkb+Q7YDxbtZ4Xj?=
 =?us-ascii?Q?74hGtLc17Lh4J7LWbgUOH3hMIrrXidJV3+Oz0sO?=
 =?us-ascii?Q?Z1HLxcP4xVTcKeLoeABmw=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vop_plane_destroy and vop_crtc_destroy are plain wrappers around
drm_plane_cleanup and drm_crtc_cleanup. Use them directly as plane and
crtc funcs to closer match VOP2 driver.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 60b23636a3fe..25c873d4ff53 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -766,11 +766,6 @@ static void vop_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 }
 
-static void vop_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-}
-
 static inline bool rockchip_afbc(u64 modifier)
 {
 	return modifier == ROCKCHIP_AFBC_MOD;
@@ -1131,7 +1126,7 @@ static const struct drm_plane_helper_funcs plane_helper_funcs = {
 static const struct drm_plane_funcs vop_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.destroy = vop_plane_destroy,
+	.destroy = drm_plane_cleanup,
 	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
@@ -1602,11 +1597,6 @@ static const struct drm_crtc_helper_funcs vop_crtc_helper_funcs = {
 	.atomic_disable = vop_crtc_atomic_disable,
 };
 
-static void vop_crtc_destroy(struct drm_crtc *crtc)
-{
-	drm_crtc_cleanup(crtc);
-}
-
 static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct rockchip_crtc_state *rockchip_state;
@@ -1711,7 +1701,7 @@ vop_crtc_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 static const struct drm_crtc_funcs vop_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.destroy = vop_crtc_destroy,
+	.destroy = drm_crtc_cleanup,
 	.reset = vop_crtc_reset,
 	.atomic_duplicate_state = vop_crtc_duplicate_state,
 	.atomic_destroy_state = vop_crtc_destroy_state,
@@ -1962,7 +1952,7 @@ static void vop_destroy_crtc(struct vop *vop)
 	 */
 	list_for_each_entry_safe(plane, tmp, &drm_dev->mode_config.plane_list,
 				 head)
-		vop_plane_destroy(plane);
+		drm_plane_cleanup(plane);
 
 	/*
 	 * Destroy CRTC after vop_plane_destroy() since vop_disable_plane()
-- 
2.41.0

