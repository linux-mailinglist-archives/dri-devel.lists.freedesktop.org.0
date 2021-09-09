Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A79A8404B9F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB536E7DA;
	Thu,  9 Sep 2021 11:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50386E7DA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 11:52:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8817561B20;
 Thu,  9 Sep 2021 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188335;
 bh=6dNN8OQPe/wsB34uoI/ICMKD2qSsK5yWqTj8ezysK4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pc3Qv4SGdOsz4zMrw/bcxpyZJC1eldDJPqtIK9m1gxgxP6u9/+u12h81kwWKJvBWm
 yVu5KWvc6ZDSCpK8h2aDs6nHAaNBBA43/wWHqpKPe8qFtRMXbWFY1zF4UXmMeqOMO0
 y7D9BgzuCTm4wWP8DYtbvUvQVyh9Cvb6XgYBUh1WL4w9vV6R/yjhyoBKyf+YKgMh1q
 pjXFGHKRNnlw+lzP5heLncLXkqgP/DW1pQXvdfi6BmHwwWbPV+nbkKwz7e7Dnw4Pwx
 quAXRoJOKc0YAd5N/ztx+ygHQXSRIKhAuJbglk2oQnw2n8H5z7aCCNHu/jRf19TK34
 n6Rh/Y7EE6eOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 044/176] drm/bridge: nwl-dsi: Avoid potential
 multiplication overflow on 32-bit
Date: Thu,  9 Sep 2021 07:49:06 -0400
Message-Id: <20210909115118.146181-44-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 47956bc86ee4e8530cac386a04f62a6095f7afbe ]

As nwl_dsi.lanes is u32, and NSEC_PER_SEC is 1000000000L, the second
multiplication in

    dsi->lanes * 8 * NSEC_PER_SEC

will overflow on a 32-bit platform.  Fix this by making the constant
unsigned long long, forcing 64-bit arithmetic.

As iMX8 is arm64, this driver is currently used on 64-bit platforms
only, where long is 64-bit, so this cannot happen.  But the issue will
start to happen when the driver is reused for a 32-bit SoC (e.g.
i.MX7ULP), or when code is copied for a new driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/ebb82941a86b4e35c4fcfb1ef5a5cfad7c1fceab.1626255956.git.geert+renesas@glider.be
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index c65ca860712d..6cac2e58cd15 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -196,7 +196,7 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
 	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 
 	return DIV64_U64_ROUND_UP(ps * dsi->mode.clock * bpp,
-				  dsi->lanes * 8 * NSEC_PER_SEC);
+				  dsi->lanes * 8ULL * NSEC_PER_SEC);
 }
 
 /*
-- 
2.30.2

