Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB359FC8FF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 07:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8B10E752;
	Thu, 26 Dec 2024 06:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="McH+MVFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15577.qiye.163.com (mail-m15577.qiye.163.com
 [101.71.155.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6282210E751
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 06:33:51 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6dc51182;
 Thu, 26 Dec 2024 14:33:47 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org,
 vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 11/17] drm/bridge: analogix_dp: Add a new member aux to
 struct analogix_dp_plat_data
Date: Thu, 26 Dec 2024 14:33:07 +0800
Message-Id: <20241226063313.3267515-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlJS1YfSEsZS0xKTxhLSk9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abdc4a03a3kunm6dc51182
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Vio5MjINLkwiCTpCK09O
 GTcKCQhVSlVKTEhOSkJPQ0lCTUlDVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCQks3Bg++
DKIM-Signature: a=rsa-sha256;
 b=McH+MVFCMlLaxvdy9YIx+//j7qFgWSnbqnbrf7WVVNghO5EP8XbwFQ6c1BuyKWJJubLfBSawZ8HO5c1jXVKF79hgHz498+j6T3xiwcf/u0em1BAZXDge4nymPbW9r8L+zF7EGgeMONqaCC9yYali7MH2ySR0DKMmooR18v50VRA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=xFn9WNhIZrh97636o3Cx6G1eC6K6jAagGXa9qEDTNUg=;
 h=date:mime-version:subject:message-id:from;
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

The member struct drm_dp_aux aux of struct analogix_dp_plat_data can
help to get panel information through the DP AUX bus, which is the
more recommended way to obtain eDP panel compared with platform bus.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 include/drm/bridge/analogix_dp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 54086cb2d97d..d069852f3e7d 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -7,6 +7,7 @@
 #ifndef _ANALOGIX_DP_H_
 #define _ANALOGIX_DP_H_
 
+#include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
 
 struct analogix_dp_device;
@@ -28,6 +29,7 @@ struct analogix_dp_plat_data {
 	struct drm_panel *panel;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	struct drm_dp_aux aux;
 	bool skip_connector;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
-- 
2.34.1

