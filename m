Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E0739290
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 00:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDC210E11E;
	Wed, 21 Jun 2023 22:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net
 (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE42410E135
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 22:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=N3/rzRG3o23sD+ICspFZR3Hn+pKFLqALOJeNlqnKgj4=;
 b=odo6I7Jt7vJMGUnTiX003h/h8HEQt1HFOUB00tQROehfkL77cpEvY37AZmQGVQkAjjO1
 +vExX5bMazjGKH1Kak0ROyBhP7gG4VQ4mKNf2kOPWts/wX01JJiYLvcURr4p8QRHMzLVYw
 enwvkMPNRdMtVo4za6tO8B/xk8FvH+GsScKALqG3YwK6BTRHLkek1QpTfgR+pADi1KPTW7
 OtcUXI9ClAufLMKUWkoD1BYAoFBYNZogpZL4+Snt4P+unpFxwqsEqTxsbH+ieJc5kc8O09
 H4x4ZykiaZS9cfKtysqt4m0I+DQuF6WWklCLiG9IMOeCUl+TZ4KK4iU2RBcOeFQA==
Received: by filterdrecv-84b96456cb-hq7z7 with SMTP id
 filterdrecv-84b96456cb-hq7z7-1-64937AAF-22
 2023-06-21 22:33:19.939834959 +0000 UTC m=+3624888.194376328
Received: from bionic.localdomain (unknown) by geopod-ismtpd-0 (SG) with ESMTP
 id ZVQYkneORxuup128izvcVw Wed, 21 Jun 2023 22:33:19.491 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 3/5] drm/rockchip: vop: Fix call to crtc reset helper
Date: Wed, 21 Jun 2023 22:33:20 +0000 (UTC)
Message-ID: <20230621223311.2239547-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621223311.2239547-1-jonas@kwiboo.se>
References: <20230621223311.2239547-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h8LrEgJzY5ktvBu14?=
 =?us-ascii?Q?zmHPK0tdeaF=2FrED9ytrdgA=2FZcc=2FZBkGuBtyyJes?=
 =?us-ascii?Q?jdWC3QvDOV0X9yW1R=2FVKEfNKLQZiqi0emqSmFWn?=
 =?us-ascii?Q?b6Db7bFjpfA5VRp9eJkTC4sMsR1EwlaBsjuLVZN?=
 =?us-ascii?Q?rnyD6AWdNB9KXSMVVWp3keF6BIe7wtPEvUBRR6y?=
 =?us-ascii?Q?pTvZbOOJdeJ3ibNrOikVQ=3D=3D?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

Allocation of crtc_state may fail in vop_crtc_reset, causing an invalid
pointer to be passed to __drm_atomic_helper_crtc_reset.

Fix this by adding a NULL check of crtc_state, similar to other drivers.

Fixes: 01e2eaf40c9d ("drm/rockchip: Convert to using __drm_atomic_helper_crtc_reset() for reset.")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2:
- New patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 25c873d4ff53..23bc79064e78 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1630,7 +1630,10 @@ static void vop_crtc_reset(struct drm_crtc *crtc)
 	if (crtc->state)
 		vop_crtc_destroy_state(crtc, crtc->state);
 
-	__drm_atomic_helper_crtc_reset(crtc, &crtc_state->base);
+	if (crtc_state)
+		__drm_atomic_helper_crtc_reset(crtc, &crtc_state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
 }
 
 #ifdef CONFIG_DRM_ANALOGIX_DP
-- 
2.41.0

