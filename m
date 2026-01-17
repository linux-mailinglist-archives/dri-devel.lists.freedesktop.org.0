Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0951D38B75
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 03:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48C10E044;
	Sat, 17 Jan 2026 02:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="gb+09gFi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0957B10E044
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 02:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kz
 AShONMxakgZx0sMYCMguuiF9B/PMQXpLKQ0x5T1IA=; b=gb+09gFiNvV18PWSlk
 VqTY1i2FJ54L0Lea7/OtUu8wuFTH9Gp4NnrmyAump/wnoIuvnnHCMQd4kiRi/1Vh
 L55S/vpsLoSnHR9oc7iytM0C8Qk/21OzCEFFxe+Ms2LNLXzZ/bbK54eTMNdjoxCy
 z5MEYxaVaoOS87xEfFAZspMXM=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDn8vbr7mpp2WGKGA--.116S2;
 Sat, 17 Jan 2026 10:07:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Sat, 17 Jan 2026 10:07:30 +0800
Message-ID: <20260117020738.294825-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn8vbr7mpp2WGKGA--.116S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urWrGw1UXrWDZr43uF15Arb_yoW8CF4xpa
 17JFWYgr48WFZFgF1kJF1DCr1Ykw1ayayxJrs3W3W3Zas3tr4DX3WrCryUCry3XFy7Ga43
 KrnrAFW5AFWI9F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxhDsS2lq7vBudAAA32
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

The different Video Ports support different maximum resolutions.
Reject resolutions that are not supported by a specific VP.

Only the output width is checked because the hardware itself does
not have a hard output height limit.

Filter the mode that can't output by the VP/crtc.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- Add more detailed commit message

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

base-commit: 1613a67b5360d6ff78f62143a1cf123414a1b4d9
branch: rk3576-dp-upstream

