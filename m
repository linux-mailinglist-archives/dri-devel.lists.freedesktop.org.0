Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD839371AD2
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DBD6E9B4;
	Mon,  3 May 2021 16:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7256E9B4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:41:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C1E6613D1;
 Mon,  3 May 2021 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060089;
 bh=FqcImUzwlWx68XIL7FSsigEb+DOc06Fj0MnUhXLhxs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cRYgSjDSHjWjO4/A1KxwhfkNp1e3KIv1i/B+jynKWznM6buxAx8cjC6iysLD/YRAk
 6IbSjxxXoU5K+ueiUK9SLb+aoeEUCkrppJepLxPIKbGRjEFhkULtBJDqDI1QKffjMM
 ctO2JRrS92JxL0cX5ysCzis9vqE8uIicWQCye0f/6JUIM3yfK6XSPDxPFaBD80K4Cx
 8ib7fx98O/GVAUCH2mvzZ4zOtVZYyVg59sxl0cXUZJUMbMHZe3nZT/OMz7ZWna/gzH
 68wzIomkX39wz0YwoGg9bXr3jH6ucSPdfVpdpEsoaFLD0oJeIQ9XzP3a+IYv+aiqM0
 H4GLxNctZKKJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/35] drm/bridge/analogix/anx78xx: Cleanup on
 error in anx78xx_bridge_attach()
Date: Mon,  3 May 2021 12:40:47 -0400
Message-Id: <20210503164109.2853838-13-sashal@kernel.org>
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

[ Upstream commit 212ee8db84600f7b279b8645c62a112bff310995 ]

Just another issue I noticed while correcting usages of
drm_dp_aux_init()/drm_dp_aux_register() around the tree. If any of the
steps in anx78xx_bridge_attach() fail, we end up leaking resources. So,
let's fix that (and fix leaking a DP AUX adapter in the process) by
unrolling on errors.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210219215326.2227596-10-lyude@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/analogix-anx78xx.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
index 9fa1610b237a..84a261c1b54f 100644
--- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
@@ -1036,7 +1036,7 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (err) {
 		DRM_ERROR("Failed to initialize connector: %d\n", err);
-		return err;
+		goto aux_unregister;
 	}
 
 	drm_connector_helper_add(&anx78xx->connector,
@@ -1048,16 +1048,21 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge)
 					   bridge->encoder);
 	if (err) {
 		DRM_ERROR("Failed to link up connector to encoder: %d\n", err);
-		return err;
+		goto connector_cleanup;
 	}
 
 	err = drm_connector_register(&anx78xx->connector);
 	if (err) {
 		DRM_ERROR("Failed to register connector: %d\n", err);
-		return err;
+		goto connector_cleanup;
 	}
 
 	return 0;
+connector_cleanup:
+	drm_connector_cleanup(&anx78xx->connector);
+aux_unregister:
+	drm_dp_aux_unregister(&anx78xx->aux);
+	return err;
 }
 
 static enum drm_mode_status
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
