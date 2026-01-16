Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD9D297A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 02:00:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9394410E192;
	Fri, 16 Jan 2026 01:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="galtRY90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 526E410E192
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ME
 f0DHBWe9wPAEndIy61oCPwiRgDkfJY9Tvwbfp9TWI=; b=galtRY90/scvUYiiqi
 R1/BDctSZsJyCULal6+W/axAI5CMzUGIw3sof82uUF7JrrmZTlZZC1d2ALOQ39YI
 BvCNy19aIN90CRYfdMxBTXkQPwuZiOxDUmkTI2YR5aSvvuGQ/DE8/sWUpRQje9Hz
 im+5Wk0Juf7PIlHwhyZFRVxA8=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wDXRJeKjWlpWfAVGQ--.9426S2; 
 Fri, 16 Jan 2026 08:59:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Fri, 16 Jan 2026 08:59:49 +0800
Message-ID: <20260116005953.286225-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXRJeKjWlpWfAVGQ--.9426S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykGr1kGFy5KF1DtryUAwb_yoW8XF15pa
 17ArWYgr4rKFZFgFn7JF4DCw1akw1ayayxJrs3Ww13uFyftr4DX3WrC34DCry3XFy7Ga43
 KrnFyFW5AF1I9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrl1kUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7Q87mWlpjY+34wAA3W
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

Filter the mode that can't output by the crtc.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..74fba29bfff3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1439,6 +1439,17 @@ static void vop2_crtc_disable_vblank(struct drm_crtc *crtc)
 	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
 }
 
+static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
+						 const struct drm_display_mode *mode)
+{
+	struct vop2_video_port *vp = to_vop2_video_port(crtc);
+
+	if (mode->hdisplay > vp->data->max_output.width)
+		return MODE_BAD_HVALUE;
+
+	return MODE_OK;
+}
+
 static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adj_mode)
@@ -1884,6 +1895,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
 	.mode_fixup = vop2_crtc_mode_fixup,
+	.mode_valid = vop2_crtc_mode_valid,
 	.atomic_check = vop2_crtc_atomic_check,
 	.atomic_begin = vop2_crtc_atomic_begin,
 	.atomic_flush = vop2_crtc_atomic_flush,
-- 
2.43.0

