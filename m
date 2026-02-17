Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HyxL6ySlGl3FgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:09:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8D14DE77
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 17:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E20F10E507;
	Tue, 17 Feb 2026 16:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jdI9ajUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA9B10E508
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771344550;
 bh=oj5P0IlCAmq5u6uQiTJRMhcL4zzj1vWIrVqyNs511+g=;
 h=From:Date:Subject:To:Cc:From;
 b=jdI9ajUoFpYWROHwud5emVcYcYmdduhc4kQ35JUNOO7peCot0an1riXYdVpy15UpO
 ETLXfKFK9efVmrR0I7cvtB8gz8Zqb9dClE4kf1PY4LdYdeZzuhD/JSGPZIupvTZMRL
 lIKT8Nw+Yc5u2kRixBUdseS+yw6SLx1sGdZRwNWRCFD/sPmb8bRkQaUTRyQEy36UtF
 tSwV6duRVjUbt3EMAQVjMWG3rvOALn3umccshdhZoBp/Dni4V0/GVYChJwpGdm1/It
 OJsqn5kj31WVRb8S9n6FIA6uBvdXcqtveY2BbYRaOakOhoH/ydI+ka/5zCfWA3XMoh
 Z3dRmuCuTAF1g==
Received: from jupiter.universe (dyndsl-091-248-212-099.ewe-ip-backbone.de
 [91.248.212.99])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 66E9A17E0330;
 Tue, 17 Feb 2026 17:09:10 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 0DDB4480024; Tue, 17 Feb 2026 17:09:10 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 17 Feb 2026 17:08:45 +0100
Subject: [PATCH RFC] drm/rockchip: vop2: Add clock rate mode check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-vop2-clk-rate-check-v1-1-989b569119ba@collabora.com>
X-B4-Tracking: v=1; b=H4sIAIySlGkC/x3MwQpAQBCA4VfRnE0xh11clQdwlcM2BhOhXUnJu
 9scv8P/PxDEqwSokge8XBp03yLyNAGe3TYJ6hANlJHJKLd47Qchrwt6dwryLLwgmYJMaW3BjiG
 Wh5dR7//aQdvU0L/vB10WRr5qAAAA
X-Change-ID: 20260217-vop2-clk-rate-check-268269778cac
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: Daniel Stone <daniels@collabora.com>, Alexey Charkov <alchark@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5101;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=oj5P0IlCAmq5u6uQiTJRMhcL4zzj1vWIrVqyNs511+g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmUkqVmnkE0ziEh65jDJYT0fQOrGQj+8CiIZ
 y0teNN50VKhdokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJplJKlAAoJENju1/PI
 O/qa2+AQAIC1BxwLivVGw37HyasWny64ye/T3KMZr+M2AIFOa6P6p7HlyS9arV1Mx5qPzo846bV
 F48bjx/uX0G8TeO8DHyNNjRnqg/aVxruL2INDUJ3B0PKSBkTHj/VxLhXYf6rSR0TLPopPDmnTQS
 tRO6i60rNK5kONUyaNTWVvQiANUmkkteC5sq2wzq2VYyBus2iSvsnpQSP6SkTldEqS0nv7UXQx0
 tC9MBxMN7FwyHR1r5qXh3PvB1jjzU5zAaVrSdOqGPm1hMIN737/i4In6LSYqDGFWqHHuA0KIV98
 4DWInIrWHZyfUdQLFpuSkpezKZwu3r5gk0lLVyYKpbZGefMQV0ys6R0Ie5Cr8brMQcTR1dWQbIN
 Xbe4To763dEiW76Iywx5jWUu3vH0T2lPiX95+NHdmrjNAVyzyTwfBCXlKzZJIm0k6jgIw1lPxxn
 LyYZ0n8DGusM3jryXYsF+hqKQ1ugBW3wgDb1zlZvyUtIf8RADSGCzx+jRHCnYJqpX6zKxo1Zuzu
 4nWXK0UoqLnONQgEHiGvfxSKEBu8QgqkHMjlxlp3EAYiZTQxgrpJVQ0IHJJcDG0o+er50MN+dG6
 oMVFOBIKu56OtSD51wlElnjHkJoOmGV8kp6S9lbv6ZjhJnH0pXGHnLyVkCZqy81nisr+xVM36QW
 8CZJTJB1H4K4ladVaMlk17Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:daniels@collabora.com,m:alchark@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sebastian.reichel@collabora.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sebastian.reichel@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 19B8D14DE77
X-Rspamd-Action: no action

The display might offer modes, which exceed the maximum clock rate of a
video output. This usually happens for displays that offer refresh rates
above 60 Hz. This results in no picture being displayed without manual
intervention. Fix this by teaching the driver about the maximum
achievable clock rates.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
I've taken the max. clock rate information from the video output
information of the RK3568/RK3588/RK3576 datasheets. The real max. clock
rates should be above those to take blank times into account. I haven't
found the proper information source for this. I hope Andy can help out.
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  3 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 ++++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ec3b4fde10db..1051418e5fff 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1434,6 +1434,9 @@ static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
 	if (mode->hdisplay > vp->data->max_output.width)
 		return MODE_BAD_HVALUE;
 
+	if (mode->clock > vp->data->max_clock_rate / 1000)
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 9124191899ba..42d70426bf08 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -225,6 +225,7 @@ struct vop2_video_port_data {
 	u16 gamma_lut_len;
 	u16 cubic_lut_len;
 	struct vop_rect max_output;
+	u32 max_clock_rate;
 	const u8 pre_scan_max_dly[4];
 	unsigned int offset;
 	/**
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index f3950e8476a7..8be2cf0c47b6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -559,18 +559,21 @@ static const struct vop2_video_port_data rk3568_vop_video_ports[] = {
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 9 * 9 * 9,
 		.max_output = { 4096, 2304 },
+		.max_clock_rate = 4096 * 2304 * 60,
 		.pre_scan_max_dly = { 69, 53, 53, 42 },
 		.offset = 0xc00,
 	}, {
 		.id = 1,
 		.gamma_lut_len = 1024,
 		.max_output = { 2048, 1536 },
+		.max_clock_rate = 2048 * 1536 * 60,
 		.pre_scan_max_dly = { 40, 40, 40, 40 },
 		.offset = 0xd00,
 	}, {
 		.id = 2,
 		.gamma_lut_len = 1024,
 		.max_output = { 1920, 1080 },
+		.max_clock_rate = 1920 * 1080 * 60,
 		.pre_scan_max_dly = { 40, 40, 40, 40 },
 		.offset = 0xe00,
 	},
@@ -775,6 +778,7 @@ static const struct vop2_video_port_data rk3576_vop_video_ports[] = {
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 9 * 9 * 9, /* 9x9x9 */
 		.max_output = { 4096, 2304 },
+		.max_clock_rate = 4096 * 2304 * 120,
 		/* win layer_mix hdr  */
 		.pre_scan_max_dly = { 10, 8, 2, 0 },
 		.offset = 0xc00,
@@ -785,6 +789,7 @@ static const struct vop2_video_port_data rk3576_vop_video_ports[] = {
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 729, /* 9x9x9 */
 		.max_output = { 2560, 1600 },
+		.max_clock_rate = 2560 * 1600 * 60,
 		/* win layer_mix hdr  */
 		.pre_scan_max_dly = { 10, 6, 0, 0 },
 		.offset = 0xd00,
@@ -793,6 +798,7 @@ static const struct vop2_video_port_data rk3576_vop_video_ports[] = {
 		.id = 2,
 		.gamma_lut_len = 1024,
 		.max_output = { 1920, 1080 },
+		.max_clock_rate = 1920 * 1080 * 60,
 		/* win layer_mix hdr  */
 		.pre_scan_max_dly = { 10, 6, 0, 0 },
 		.offset = 0xe00,
@@ -1061,6 +1067,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 9 * 9 * 9, /* 9x9x9 */
 		.max_output = { 4096, 2304 },
+		.max_clock_rate = 7680 * 4320 * 60,
 		/* hdr2sdr sdr2hdr hdr2hdr sdr2sdr */
 		.pre_scan_max_dly = { 76, 65, 65, 54 },
 		.offset = 0xc00,
@@ -1070,6 +1077,7 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 729, /* 9x9x9 */
 		.max_output = { 4096, 2304 },
+		.max_clock_rate = 4096 * 2304 * 60,
 		.pre_scan_max_dly = { 76, 65, 65, 54 },
 		.offset = 0xd00,
 	}, {
@@ -1078,12 +1086,14 @@ static const struct vop2_video_port_data rk3588_vop_video_ports[] = {
 		.gamma_lut_len = 1024,
 		.cubic_lut_len = 17 * 17 * 17, /* 17x17x17 */
 		.max_output = { 4096, 2304 },
+		.max_clock_rate = 4096 * 2304 * 60,
 		.pre_scan_max_dly = { 52, 52, 52, 52 },
 		.offset = 0xe00,
 	}, {
 		.id = 3,
 		.gamma_lut_len = 1024,
 		.max_output = { 2048, 1536 },
+		.max_clock_rate = 1920 * 1080 * 60,
 		.pre_scan_max_dly = { 52, 52, 52, 52 },
 		.offset = 0xf00,
 	},

---
base-commit: 9702969978695d9a699a1f34771580cdbb153b33
change-id: 20260217-vop2-clk-rate-check-268269778cac

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

