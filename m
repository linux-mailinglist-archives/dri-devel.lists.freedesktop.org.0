Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEBABA9E07
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA2B10E23E;
	Mon, 29 Sep 2025 15:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ai5JSo7z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A76110E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 15:54:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 726BE625D0;
 Mon, 29 Sep 2025 15:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E3FC4CEF4;
 Mon, 29 Sep 2025 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759161256;
 bh=1sgpF2bI8rK8MTu4hZLFvvYX/glp3S5AUL3GAJHaBm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ai5JSo7zUk3to/LzSUvUGHBklP7YShOsCjmo/QW+YodDNDC2ysAQtarB5xoO4TN0u
 GyKFSCRZsJjNnH/LXWNGx/QlL0nTzxNyz8DMeCnwiddeF6ToRh7JjLGg+j8ZJJh1Lu
 I3ajADpO5kp2UXM1NgPlwH4sh7xnAyWZjeu61ibBFNlFA0GuOgj/qRwD9B7jR/8hRL
 xrBd5qd4ROh5mIFCgrVwhs00YQjGvV/Wbe8bmc29n0V/Z+AQslOJViYVenpzlskGvc
 XnrjsE5YouCabI6wO229S+rJrUZmLJtSxF8I0JXgTWCYg1JQYoKhdF2a57/zfxHJnN
 5ROSEnnlQ4WpA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Nirmoy Das <nirmoyd@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1.y] drm/ast: Use msleep instead of mdelay for edid read
Date: Mon, 29 Sep 2025 11:54:09 -0400
Message-ID: <20250929155412.141429-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025092921-consensus-mystified-6396@gregkh>
References: <2025092921-consensus-mystified-6396@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nirmoy Das <nirmoyd@nvidia.com>

[ Upstream commit c7c31f8dc54aa3c9b2c994b5f1ff7e740a654e97 ]

The busy-waiting in `mdelay()` can cause CPU stalls and kernel timeouts
during boot.

Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Carol L Soto csoto@nvidia.com<mailto:csoto@nvidia.com>
Fixes: 594e9c04b586 ("drm/ast: Create the driver for ASPEED proprietory Display-Port")
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/r/20250917194346.2905522-1-nirmoyd@nvidia.com
[ Applied change to ast_astdp_read_edid() instead of ast_astdp_read_edid_block() ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index a4a23b9623ad3..7d2fb34c72b75 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -51,7 +51,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			 *	  of right-click of mouse.
 			 * 2. The Delays are often longer a lot when system resume from S3/S4.
 			 */
-			mdelay(j+1);
+			msleep(j + 1);
 
 			if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1,
 							ASTDP_MCU_FW_EXECUTING) &&
-- 
2.51.0

