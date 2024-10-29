Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47079B4625
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC58610E604;
	Tue, 29 Oct 2024 09:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="nT1GAGRm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9FDAB10E5FF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=sWL+u
 A6N3RP7S0oEEy+dt5J028U96XG2qpaI3whbCC8=; b=nT1GAGRm3e1rS7G0nQxdk
 c12589OMffZqPCBHdrB63piwn1vO3q01+e6Y5o76j5mt75cxO1DDhI63vta2bqkI
 SNHF2pXbY+bwfkrbz9d595BqKvUtBiLptepisQ7O/p5qu+toYnxeaIwSl0LJe83k
 zkyqKB1cbZBVnTH2lu9/7Q=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3nxoCsSBn8+3dEA--.3291S5; 
 Tue, 29 Oct 2024 17:55:22 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 minhuadotchen@gmail.com, detlev.casanova@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v4 03/14] drm/rockchip: vop2: Fix the mixer alpha setup for
 layer 0
Date: Tue, 29 Oct 2024 17:54:56 +0800
Message-ID: <20241029095513.391006-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029095513.391006-1-andyshrk@163.com>
References: <20241029095513.391006-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3nxoCsSBn8+3dEA--.3291S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWDGF1UXryfGrWrXr4fXwb_yoW8Gr43pF
 s8uFWj9w40krsFqr1DJan7uF4Syan7Cay7Grs7J3W3X3W3KF9rCwnxWr98ArZ8JF4xWF4a
 krZrKr98Wa12vrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jBD73UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwqHXmcgqJmjwgABs2
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

The alpha setup should start from the second layer, the current calculation
starts incorrectly from the first layer, a negative offset will be obtained
in the following formula:

offset = (mixer_id + zpos - 1) * 0x10

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Derek Foreman <derek.foreman@collabora.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bff190151ae8c..c50d93df84046 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2282,6 +2282,12 @@ static void vop2_setup_alpha(struct vop2_video_port *vp)
 		struct vop2_win *win = to_vop2_win(plane);
 		int zpos = plane->state->normalized_zpos;
 
+		/*
+		 * Need to configure alpha from second layer.
+		 */
+		if (zpos == 0)
+			continue;
+
 		if (plane->state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 			premulti_en = 1;
 		else
-- 
2.34.1

