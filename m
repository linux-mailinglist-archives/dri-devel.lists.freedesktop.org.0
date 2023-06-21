Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747F739292
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350810E36C;
	Wed, 21 Jun 2023 22:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net
 (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C8010E36D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=v14Q72PruEDwmH4o+T8D3FApv9VBvr48LzkZegCo/u4=;
 b=rBdphp+s6nKgaYVQW7kNM0FgEY82p1wXQvzHlIC5PkiJlWolj396r9VbEcECshqqISme
 K1/Rm9vjIM5834etPzzojd16lF/NBRZp2BaCqg7Ib29s3myOI4lx50490qsayrRlZLWXvP
 dsaZzA04HgTxD3CFwzFXHIAvcVLhImJWFygnSp5/HxQhih5r7U04aCO7JZOIEBZJHfOd4j
 7NfTIYvPAfycoU0VMdh6VtgzIok7APy8agt8yV2/9iWI00Rw9J5qLpRZgTlId6sS74OXJd
 2TWR+V3/4RkVOIhQ2gW42NRU0Vqr4D7+zJyoFw/SUKhcKTmCa2UmxfYZOROn1Zhg==
Received: by filterdrecv-84b96456cb-hq7z7 with SMTP id
 filterdrecv-84b96456cb-hq7z7-1-64937AB1-C
 2023-06-21 22:33:21.44628361 +0000 UTC m=+3624889.700825056
Received: from bionic.localdomain (unknown) by geopod-ismtpd-0 (SG) with ESMTP
 id vZirRyg8Rfmll8Z_NYscQw Wed, 21 Jun 2023 22:33:21.131 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 4/5] drm/rockchip: vop2: Don't crash for invalid
 duplicate_state
Date: Wed, 21 Jun 2023 22:33:21 +0000 (UTC)
Message-ID: <20230621223311.2239547-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621223311.2239547-1-jonas@kwiboo.se>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h32UvfMM=2F7Im2hDMc?=
 =?us-ascii?Q?k0YtrNlBiYhIMIchAeUrU5n0sre8GH0aHkc25Kj?=
 =?us-ascii?Q?c5HCoIUZZ7FARoKQ=2FsE9PLBlsEjGZQuvkx=2FObop?=
 =?us-ascii?Q?SqLW3QtPBaudvauDz+8cw7CwPzWMAagqcBsOwA5?=
 =?us-ascii?Q?dHHmIoLw0+aYnRZjjGDnmgntbVz2zrUyi6ZHRO?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Andy Yan
 <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>
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

It's possible for users to try to duplicate the CRTC state even when the
state doesn't exist. drm_atomic_helper_crtc_duplicate_state() (and other
users of __drm_atomic_helper_crtc_duplicate_state()) already guard this
with a WARN_ON() instead of crashing, so let's do that here too.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---
v2:
- Collect r-b tag

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ca73b8ccc29f..f725487d02ef 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2099,11 +2099,13 @@ static void vop2_crtc_reset(struct drm_crtc *crtc)
 
 static struct drm_crtc_state *vop2_crtc_duplicate_state(struct drm_crtc *crtc)
 {
-	struct rockchip_crtc_state *vcstate, *old_vcstate;
+	struct rockchip_crtc_state *vcstate;
 
-	old_vcstate = to_rockchip_crtc_state(crtc->state);
+	if (WARN_ON(!crtc->state))
+		return NULL;
 
-	vcstate = kmemdup(old_vcstate, sizeof(*old_vcstate), GFP_KERNEL);
+	vcstate = kmemdup(to_rockchip_crtc_state(crtc->state),
+			  sizeof(*vcstate), GFP_KERNEL);
 	if (!vcstate)
 		return NULL;
 
-- 
2.41.0

