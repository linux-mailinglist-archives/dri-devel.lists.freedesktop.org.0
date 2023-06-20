Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233CE7363C7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 08:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13BC10E260;
	Tue, 20 Jun 2023 06:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net
 (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130EF10E260
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=from:subject:in-reply-to:references:mime-version:to:cc:
 content-transfer-encoding:content-type:cc:content-type:from:subject:to;
 s=s1; bh=7VAyeHaEUSj0bxluLt7sEIx5TaeytzztFbaHZjpZj8k=;
 b=Yaqr4eSXajGdW3zb2Vo2erptc07KneJhPCDUZVBW/po6bK5+S4DfDUx16e3mWY604Vol
 42CmRW44ZDXak2Wf109cwtPdk0m1v3PspGogcKjTcOVTBfOVrA/kcYV+6tM4E108c1005O
 dpNlbjr+yHGZkEzmgRM5GfLRjW/p6OFlLkC4UT18QsQrc9R/RhiuG47nt/MeSBjWIaNWjr
 b4dVBGoSokJnz+D9hN78+vYKuVw1naEeCIjozjR5NJpS3EJP2pfeA8lERb6XKG8fLTjQn4
 ALOG/ILTsSroZahOP6/u51c2PomFzTUbNCcQ8uUjysK3OUxiFxod8W27QcMt5aGw==
Received: by filterdrecv-65f68489c8-knmdt with SMTP id
 filterdrecv-65f68489c8-knmdt-1-64914B88-8
 2023-06-20 06:47:36.28238049 +0000 UTC m=+3481898.218316761
Received: from bionic.localdomain (unknown) by geopod-ismtpd-5 (SG) with ESMTP
 id OucGoYNtQB-78UXqJGyOIw Tue, 20 Jun 2023 06:47:36.053 +0000 (UTC)
From: Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 1/4] drm/rockchip: vop: Fix reset of state in duplicate state
 crtc funcs
Date: Tue, 20 Jun 2023 06:47:36 +0000 (UTC)
Message-ID: <20230620064732.1525594-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620064732.1525594-1-jonas@kwiboo.se>
References: <20230620064732.1525594-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hxFAD2iWJqHQE2VFr?=
 =?us-ascii?Q?fjH7oZLbnsxnWN5pOReYr+8l0s7F6R6sTfG3KkB?=
 =?us-ascii?Q?8tSvbGGbhywgNax29XYxC=2F7RMyoEnmXuuyxfikS?=
 =?us-ascii?Q?AIeAEyYOvGc4gl2WMW=2FEFonfVrK5loNNAe2O+Ne?=
 =?us-ascii?Q?p+bTJ8v+sgstq+DAUQIpcDCFcl19yBDUtAcDbN?=
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Mark Yao
 <markyao0591@gmail.com>
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
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

struct rockchip_crtc_state members such as output_type, output_bpc and
enable_afbc is always reset to zero in the atomic_duplicate_state crtc
funcs.

Fix this by using kmemdup on the subclass rockchip_crtc_state struct.

Fixes: 4e257d9eee23 ("drm/rockchip: get rid of rockchip_drm_crtc_mode_config")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index a530ecc4d207..60b23636a3fe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1614,7 +1614,8 @@ static struct drm_crtc_state *vop_crtc_duplicate_state(struct drm_crtc *crtc)
 	if (WARN_ON(!crtc->state))
 		return NULL;
 
-	rockchip_state = kzalloc(sizeof(*rockchip_state), GFP_KERNEL);
+	rockchip_state = kmemdup(to_rockchip_crtc_state(crtc->state),
+				 sizeof(*rockchip_state), GFP_KERNEL);
 	if (!rockchip_state)
 		return NULL;
 
-- 
2.41.0

