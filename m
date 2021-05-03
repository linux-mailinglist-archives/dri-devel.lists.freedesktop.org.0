Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A48371AD1
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5246E9AE;
	Mon,  3 May 2021 16:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CA96E9AE
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:41:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E80961935;
 Mon,  3 May 2021 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060087;
 bh=YHj3TkN8BPSTi3dqMJV4QeO/TaCdPDNyt2ZpMxdt+Ms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ECLVY//emdY3FHoU9JszjqXe4FpOjG9EtlPryGAYDQCI9V62i5Y4FBSt4bRzr4+4n
 vJChuj+81Tg9WvOFW5EG1qAxVK8u576QTkgbcbggUy5jjkuMiCHo6ADLx9SoI9IArE
 17+U6BnGz+qDeIb95bYM0wP1DXcLG7bE9kKsVPlYvSqhlr5LKwn7C3e//u+ysAATVT
 jh5D/jvQXq6voJq417N4heMvhaDnO59YWfB1weCkkHHn+MpdXtx0Lc8bsBcm9Gwqud
 m1ZDx62nfAH54b+2yORGDA4I0VDiEFl05KOpc+hLj4A5ZsWIbf913gQwTqmatWjJO2
 tRpMk9LrDlTHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/35] drm/bridge/analogix/anx78xx: Setup encoder
 before registering connector
Date: Mon,  3 May 2021 12:40:46 -0400
Message-Id: <20210503164109.2853838-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503164109.2853838-1-sashal@kernel.org>
References: <20210503164109.2853838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

[ Upstream commit 9962849d0871f5e53d0e3b3d84561f8f2847fbf4 ]

Since encoder mappings for connectors are exposed to userspace, we should
be attaching the encoder before exposing the connector to userspace. Just a
drive-by fix for an issue I noticed while fixing up usages of
drm_dp_aux_init()/drm_dp_aux_register() across the tree.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210219215326.2227596-9-lyude@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/analogix-anx78xx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index cc820e9aea1d..9fa1610b237a 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -1042,12 +1042,6 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
 	drm_connector_helper_add(&anx78xx->connector,
 				 &anx78xx_connector_helper_funcs);
 
-	err = drm_connector_register(&anx78xx->connector);
-	if (err) {
-		DRM_ERROR("Failed to register connector: %d\n", err);
-		return err;
-	}
-
 	anx78xx->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	err = drm_connector_attach_encoder(&anx78xx->connector,
@@ -1057,6 +1051,12 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
 		return err;
 	}
 
+	err = drm_connector_register(&anx78xx->connector);
+	if (err) {
+		DRM_ERROR("Failed to register connector: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
