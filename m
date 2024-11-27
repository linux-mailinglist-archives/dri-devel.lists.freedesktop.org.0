Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CFA9DA45A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912D410EA59;
	Wed, 27 Nov 2024 09:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="X+YK0uts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17240.xmail.ntesmail.com (mail-m17240.xmail.ntesmail.com
 [45.195.17.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6702A10EA46
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 08:08:12 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3f86cd9d;
 Wed, 27 Nov 2024 15:53:03 +0800 (GMT+08:00)
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
Subject: [PATCH v1 05/10] drm/bridge: analogix_dp: add support for RK3588
Date: Wed, 27 Nov 2024 15:51:52 +0800
Message-Id: <20241127075157.856029-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127075157.856029-1-damon.ding@rock-chips.com>
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5OTlYYSUoaGE8fThofGUNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a936c9c011903a3kunm3f86cd9d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Shw6ODIjDS8PAU45NU0q
 Mx4KCxZVSlVKTEhJTUJIQkNOSE9MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDTEw3Bg++
DKIM-Signature: a=rsa-sha256;
 b=X+YK0utsza+LlU/Tgb+0CNEG/cxo/390OO7SgwJrm0QqhQETvjjLVGEaK8FKeGfwZbw2UB6A5IOXoPef/R1ghCq799caWzR63qgaKXFfvvMU+LaZ8cH8kYvc9Kvx/fl2mGBJgzzl6n31bmBo6ewdJqrzSVnjxqJ8UOw1OdDcmz4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=E81q0mlHKARsxeEjOtAQLSuYK/wvdEx4XVvmaBJNUbs=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 27 Nov 2024 09:01:48 +0000
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

Add max_link_rate and max_lane_count configs for RK3588.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..6f10d88a34c5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1513,6 +1513,10 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 		video_info->max_link_rate = 0x0A;
 		video_info->max_lane_count = 0x04;
 		break;
+	case RK3588_EDP:
+		video_info->max_link_rate = 0x14;
+		video_info->max_lane_count = 0x04;
+		break;
 	case EXYNOS_DP:
 		/*
 		 * NOTE: those property parseing code is used for
-- 
2.34.1

