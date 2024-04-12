Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738D8A38B8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 01:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F57610F91E;
	Fri, 12 Apr 2024 23:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kernel-space.org header.i=@kernel-space.org header.b="jpt7E1qq";
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="WqcerSlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Fri, 12 Apr 2024 19:56:50 UTC
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1310F82E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 19:56:50 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id d5468626;
 Fri, 12 Apr 2024 19:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=s1; bh=O8WG5lFRYUHwH7sMeHclDIq16WI
 =; b=jpt7E1qquc+W4WiOleVHl5BRJ5WeMMDIlOVZ8S/guMYOoF8ebPsWOFlDakv
 vl6bKcXedjn/iiLc5amM8TloRRqHZx6Gd+FC7o+WfDXSbPYlNXBoKD+BYo61HaAd
 /tCDx6cWX5MNwlapyFmb9RrvNkwgGT/wsoe6m/AmwQ7E/tg8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=from:to
 :cc:subject:date:message-id:mime-version
 :content-transfer-encoding; q=dns; s=s1; b=Ok98og8KFq5/qCRZp370O
 yEfteiq14m9EBLmCx5tpYfBJ4I/b0yYgUSXn7uJlf+aklxoLKZUDrPz2+lFa7to8
 aPl6jMK+GTQsFc+LT3mAPxPRQNtmcUg7uZRKuKfgjGMooy4ve2S2j9nxTZMH5jtV
 uOqh+cmW3uVsKnbscVhgvI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1712951408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nmAEe55rSvZr0yzEZ8g5SkejEeHr+xynYhnI8N+J0sc=;
 b=WqcerSlglMIAR/fuS02rFCkArzBrWWp3ZKldVM0gmrVVEIGOhrzSZ2K63phvkLk+jp/RED
 l9veVfeq6d0tXKOEwjTi/f8rAdmakiHWnWMvz97C3kazCeGfi1HrGBUqlm6HTqaqTmc8tG
 PwD4gQLxuur+zLjSBRKKc7TOJ7wF080=
Received: from yamato.homenet.telecomitalia.it
 (host-79-50-77-159.retail.telecomitalia.it [79.50.77.159])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id f85d54ac
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 12 Apr 2024 19:50:08 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH v2 1/2] drm/nouveau/disp: add backlight for ada lovelace
Date: Fri, 12 Apr 2024 21:49:00 +0200
Message-ID: <20240412194901.1596-1-angelo@kernel-space.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Apr 2024 23:06:04 +0000
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

Add working backlight for "ada lovelace" missing case.

The nvif method is actually not working for this chipset so
used the drm apis. Also, by dpcd, drm layer is calculating a
max brightness of 255, but to get a real correct max brightnes
the maximum must be multiplied by a factor of 16.

Tested to work properly in Legion Lenovo Pro 5

Lenovo Legion 5 Pro 16ARX8
Bios ver LPCN49WW
	 LPEC49WW
SN PF4T63AZ
Nvidia RTX4060 MaxQ/Mobile rev a1 (ADA LOVELACE AD107M)
AMD Ryzen 9 7945HX + Radeon

and wayland.

---
Changes for v2:
- add some comments
- remove x16 multiplication (hack)
- remove forgot debug printk

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 54 +++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa1..7b7306d18ad7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -286,6 +286,56 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 	return 0;
 }
 
+static int
+nv19x_backlight_init(struct nouveau_backlight *bl,
+		     struct nouveau_connector *nv_conn,
+		     struct nouveau_encoder *nv_encoder,
+		     struct backlight_properties *props,
+		     const struct backlight_ops **ops)
+{
+	int ret;
+	u16 current_level;
+	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
+	u8 current_mode;
+	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
+
+	/*
+	 * nvif functions, so also nvif_outp_bl_get, are not working with this
+	 * connector (return -22), using only drm layer.
+	 */
+	if (nv_conn->type == DCB_CONNECTOR_eDP) {
+
+		ret = drm_dp_dpcd_read(&nv_conn->aux, DP_EDP_DPCD_REV, edp_dpcd,
+				       EDP_DISPLAY_CTL_CAP_SIZE);
+		if (ret < 0)
+			return ret;
+		if (!drm_edp_backlight_supported(edp_dpcd))
+			return -ENODEV;
+
+		ret = drm_edp_backlight_init(&nv_conn->aux, &bl->edp_info, 0, edp_dpcd,
+					 &current_level, &current_mode);
+		if (ret < 0)
+			return ret;
+
+		ret = drm_edp_backlight_enable(&nv_conn->aux, &bl->edp_info, current_level);
+		if (ret < 0) {
+			NV_ERROR(drm, "Failed to enable backlight on %s: %d\n",
+				 nv_conn->base.name, ret);
+			return ret;
+		}
+
+		*ops = &nv50_edp_bl_ops;
+
+		props->max_brightness = bl->edp_info.max;
+		props->brightness = current_level;
+		bl->uses_dpcd = true;
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 int
 nouveau_backlight_init(struct drm_connector *connector)
 {
@@ -332,6 +382,10 @@ nouveau_backlight_init(struct drm_connector *connector)
 		ret = nv50_backlight_init(bl, nouveau_connector(connector),
 					  nv_encoder, &props, &ops);
 		break;
+	case NV_DEVICE_INFO_V0_ADA:
+		ret = nv19x_backlight_init(bl, nouveau_connector(connector),
+					   nv_encoder, &props, &ops);
+		break;
 	default:
 		ret = 0;
 		goto fail_alloc;
-- 
2.44.0

