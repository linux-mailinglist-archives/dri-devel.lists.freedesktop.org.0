Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB17D06AD2
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 02:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF80910E113;
	Fri,  9 Jan 2026 01:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="EWua2mP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60B810E113
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=D/
 VSrq7csKTtY4ym1mmKLQ17C8VC9XmKyawZ0uQoYIU=; b=EWua2mP/i+cn9EoUdD
 M2DobcKCUb/bjH31GRxuLpB5Ya8TnOtnxisj7Pbx0Iwdzv7Tp9lk8q8139pzRJ9q
 oGYdC1efn4a+yXuGwkzOqHXQJ9q2p1nxHuGPTnlA/Aq0NTQEsUNEMLvR2aV05w3o
 J9Z2i+44mQWmvE52s/YiyDYEQ=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wCn4bSuUmBphHPcFA--.19981S2; 
 Fri, 09 Jan 2026 08:58:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Fri,  9 Jan 2026 08:58:07 +0800
Message-ID: <20260109005821.225235-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCn4bSuUmBphHPcFA--.19981S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykGr1kGFy5KF1DtryUAwb_yoW8Wr4kpa
 17JrWYgr48KFZFgFn7JF1qkr1akw1ayayxJrs3Ww13ZFyftr4DX3WrCryDCry3XF17Ga43
 KFnrtFW5AF1I9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jr5r7UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhIzkWlgUrJa3AAA3Z
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

base-commit: 84f1d42065381b7c3fbdeefe917e5e24ec0c6d87
branch: rk3576-dp-upstream

