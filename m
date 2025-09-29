Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B2BBA9DBF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 17:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431C510E23D;
	Mon, 29 Sep 2025 15:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f3Gk08rU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA14C10E23D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 15:50:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C8E69625A9;
 Mon, 29 Sep 2025 15:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DD5C4CEF4;
 Mon, 29 Sep 2025 15:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759161035;
 bh=wKmOh745tYdiNYayfBQhqKGeiFvELvAKu0H3ipoIBlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f3Gk08rU+/MyoqC9q19pOUBx41gA+CfO0OGQlWzDL+XsH3R2uo9EFsqdYMbVrKwO+
 mCMGwfvm1EULUuYZh0fhOCcXOlcT4UW1VirsiSWF7dkRVidKuy/sw+ebeZAAxCYUOK
 HN/5kyI3a7CGpUSVMX5omyK+YLnJjdej14eCmVLUVsSTP2qFwL1FWsT8Wuv0w2ToqA
 OecNUrUBHdbOCmAunawIKpZXUMcKLCjxOLftvqhJrYpH6pGQS9yIKew0h+m+7kqNe0
 s1U2g8an7Tv12OtUyQYCgy0PswAzcCLPBEmrWCGn3znhxYBj549P091d3QAJ4DNNLY
 AZ8UfaZB8qX4w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Nirmoy Das <nirmoyd@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 csoto@nvidia.com, KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6.y] drm/ast: Use msleep instead of mdelay for edid read
Date: Mon, 29 Sep 2025 11:50:10 -0400
Message-ID: <20250929155031.137825-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025092920-backspin-glade-7b6c@gregkh>
References: <2025092920-backspin-glade-7b6c@gregkh>
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
index c6f226b6f0813..fc9c36c8b81b9 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -62,7 +62,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			 *	  of right-click of mouse.
 			 * 2. The Delays are often longer a lot when system resume from S3/S4.
 			 */
-			mdelay(j+1);
+			msleep(j + 1);
 
 			if (!(ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1,
 							ASTDP_MCU_FW_EXECUTING) &&
-- 
2.51.0

