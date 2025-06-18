Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3EADE54A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07410E79C;
	Wed, 18 Jun 2025 08:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cRLKLibd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 629AB10E79E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SG
 cSb4qrOG3O9MCBW38eyABjbPdzTYy8UGZPX8GL5eE=; b=cRLKLibdzKL7O6/s2W
 oiWr984pUzdHjrV76NkRvyzUKkYBM664azoIVHvWJpfRZB+bnVvh11MeFqFq2vYA
 5ia7nMpmX4YHYoURc8ZDEUm7J9ZUsA540PR8RtqONOwUevtxmRxwZjiLzoFZAu/S
 WvodH5CB8VAevGADD8rabp2jU=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wBXuD9adFJoIEHGAA--.6009S2; 
 Wed, 18 Jun 2025 16:10:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/panel: raydium-rm67200: Add missing drm_display_mode flags
Date: Wed, 18 Jun 2025 16:09:55 +0800
Message-ID: <20250618080955.691048-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXuD9adFJoIEHGAA--.6009S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1kXFWrWw4UGw4rtr45Awb_yoWkCrg_KF
 18uF43Xw4Uu3W3ursFva909FWxt3s5WFZ5u340ka4akrnFvr18Xan7Cry0y3Z8Gr42yas8
 Xa4xXryjkas7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8FPfJUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gJwXmhSc6oZowAAsn
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

From: Andy Yan <andy.yan@rock-chips.com>

Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
flags. Those are used by various bridges(e.g. dw-mipi-dsi) in the
pipeline to correctly configure its sync signals polarity.

Tested on rk3568/rk3576/rk3588 EVB.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index add6099ae8a64..92c3e20b903f0 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -478,6 +478,7 @@ static const struct raydium_rm67200_panel_info w552793baa_info = {
 		.vtotal = 1952,
 		.width_mm = 68, /* 68.04mm */
 		.height_mm = 121, /* 120.96mm */
+		.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 		.type = DRM_MODE_TYPE_DRIVER,
 	},
 	.regulators = w552793baa_regulators,
-- 
2.43.0

base-commit: e1070ed6f01f471547b67ee23b0cb8febaaccaca
branch: rk356x_rk3588_rk3576_dsi

