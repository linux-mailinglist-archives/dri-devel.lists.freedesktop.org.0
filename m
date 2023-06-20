Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAC7363C8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A31110E264;
	Tue, 20 Jun 2023 06:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E3C10E264
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=5pbgdWNmSy9aPDMPkbL8AbjV9U0EnRo0+ZChKli6JfM=;
 b=eVrS5554pcjPfv9qQqL7hGY0jyiDvsj9RT7apUoZX0grmM3rUFRKnLhEDdf4ygOm1p1Q
 0r3S4yOzh2Rqg2ol1RfyIADEiNF/f+K2skcpAAZwtoT7B9cIZe9JerudoUS5PHLLWN0lBA
 gwj2sQZssKqPGbWx0LdzP9ZMxjP8azYEKdVZEl78Joe+ftZF0V9buBCwNynFdPHd0FiYWZ
 HVq50Ln69Irhwmf5ZSzV/eUAlDJKUVOzoOEqYnTBvwJ5VIktfdqbKRKuheFxvCA6akmLvf
 tIJxBJrfY+FMZf0GXdg3Bw4U10ByCZcH6kXilzSMw63jIncJb96Bo5tCIvgOOQrg==
Received: by filterdrecv-84b96456cb-5hl7m with SMTP id
 filterdrecv-84b96456cb-5hl7m-1-64914B8A-11
 2023-06-20 06:47:38.471885304 +0000 UTC m=+3481762.440632816
Received: from bionic.localdomain (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id RoZFBd_nQNK1YqBzlZ8GTA Tue, 20 Jun 2023 06:47:38.183 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 3/4] drm/rockchip: vop2: Don't crash for invalid
 duplicate_state
Date: Tue, 20 Jun 2023 06:47:38 +0000 (UTC)
Message-ID: <20230620064732.1525594-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620064732.1525594-1-jonas@kwiboo.se>
References: <20230620064732.1525594-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h+eHmV8Nkxhx=2FpGei?=
 =?us-ascii?Q?3g0n+d3x8Np2TBP3wBP6EHYLmaspDk9WVqgJCxM?=
 =?us-ascii?Q?F3L9wcKO7JYi6qnKjNs2IVQjlFzRSo+RckLnclP?=
 =?us-ascii?Q?pUTqdMq4GIBuYPFy8hH7=2FF9cw4P6eIW7nd9n1V8?=
 =?us-ascii?Q?Kj1AyOKyrp6P=2FFOYTdB2JIAMWcujtyu1du5YlrW?=
 =?us-ascii?Q?c4uD353qthBtqroHvV84w=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Andy Yan
 <andy.yan@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring
 <robh@kernel.org>
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
---
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

