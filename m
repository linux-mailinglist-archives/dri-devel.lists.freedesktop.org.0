Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2B3GNKgsoWk/qwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F51B2E24
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6DB10E617;
	Fri, 27 Feb 2026 05:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FedWBTnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC4010E617
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 05:33:25 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-82748095892so505593b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772170404; x=1772775204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
 b=FedWBTnYsztGTlY/KIih5M5NZiAIbUeGqsy5r/GfD0ndwQtUaMnodVlfWNnwzWGuFR
 SNnuDdmqRLJzTA6RiEIyh9nvKtqYs/TkFCOA2l06koah11x7Z3pn9ZmsSl+cgaUf2gNn
 epe7hMFnGTyy2pA2Av7DhbetmAm/P6j80U1YTalLxfpvE5d+SFVq8d4XVcJFNUiKsgnb
 fyC88oaIuDaK/KHJhdZfNborzMZW+e2DEywTgO0C+WQVdVamUNX9tpKPpFxDrvvQK4Fn
 2x2aytnIv2xFvVztDphGS13paczOPpHbZ6O4V5FJ6DCLhAWvjgG+E1lRfTlw6iJglddP
 PwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772170404; x=1772775204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
 b=l47nPT/yMQtUafCittmBk6up8qMrRtfO6aSLb5XWuYlybmzBDuGJzqrDgWlD9Gdojt
 sJZpJRKIWqwFjpyraqZYfD0BtBNMQAIxxxXAAdAXh9Vu2BlR6dR3OvjBDu0i+3FEoKAV
 DmC40o/AzIqbKV5OaIpj9/2IFls4GqOwCjB5s5EHo4JLfZDHdKAxukSRzT6aR+iUVagt
 Q2kWIlKCKxcL0SwL0gNcvHJ3UwKDGzvlASg930o0+MxGkkDV9k/bmhHWiGreWOg45776
 HKVVIBLwQl88LtCDXaagAEKm0BonwjVH6uLNzS4/mlXt4DxniXiR1O8RXhkW7NCIKlhW
 W8GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNvDez0RDW5v+Q+LrJGID+BqceUzpl0QkgzqeeN8byJTMQQw2ivBWgODMsqst0OPDPn+U3jM6I7Ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHddaTZuF3umPebPQmahSGL01md2yaGMIYWrMnLDSfda/kD9XO
 EYhluY6o9zop1L7DQxr22rueg9772c/51Ir/wsmd5AgsdaZ4aOnRlT3p
X-Gm-Gg: ATEYQzyPBckfcjeJV+sEogenCTcpglyNPtkm/kWOKWR2Tqg8AUKhaAUKgzFKyIN/g/S
 bmu/yRKHSDlNKv2hYvLJ6cF7BMw3ZX6t5o3NAkI0EsgyGWGV5fJpPufqOsY3UUmpe7iujE0Tn7M
 BKsidTCoCchGadEn7gvci6QFsuj/x/+v+Hp+hof98MBnmY236xcUWAcHVqOg64aUXrsBhgxBIlt
 pgz1T5CZ7zmp1Up0pNekJvGJGd9lhwpgNVZc1Htp3kNkAVtCNahswUVnr71Mi/f+17BlTL4wRsx
 F+v3rMM3ILSScP+tDTkpISJOGvRK4ixxgXvU6SnUCPb0SHW8CHXwHEdrWK9kDvSHyC1VP1pJRLq
 IGQakTqORX32yEbyfcMFFcaRrR0buseKHTap3DEi2B1Umx0t9JhK3EOnfgadjBnm/wkBzdVPnLB
 TqfyPXeVvSlABrhzADFhFKfaEu/op4IgJ5mxKkcTsVBv/EtVeFwA==
X-Received: by 2002:a05:6a00:2d11:b0:824:16ae:9ec4 with SMTP id
 d2e1a72fcca58-8274da248famr1742089b3a.63.1772170404587; 
 Thu, 26 Feb 2026 21:33:24 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 21:33:24 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.1.y 5.15.y 5.10.y 1/3] drm/exynos: vidi: use priv->vidi_dev
 for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 14:33:15 +0900
Message-Id: <20260227053317.426000-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 255F51B2E24
X-Rspamd-Action: no action

[ Upstream commit d3968a0d85b211e197f2f4f06268a7031079e0d0 ]

vidi_connection_ioctl() retrieves the driver_data from drm_dev->dev to
obtain a struct vidi_context pointer. However, drm_dev->dev is the
exynos-drm master device, and the driver_data contained therein is not
the vidi component device, but a completely different device.

This can lead to various bugs, ranging from null pointer dereferences and
garbage value accesses to, in unlucky cases, out-of-bounds errors,
use-after-free errors, and more.

To resolve this issue, we need to store/delete the vidi device pointer in
exynos_drm_private->vidi_dev during bind/unbind, and then read this
exynos_drm_private->vidi_dev within ioctl() to obtain the correct
struct vidi_context pointer.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 23646e55f142..06c29ff2aac0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *vidi_dev;
 	void *mapping;
 
 	/* for atomic commit */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 6de0cced6c9d..b31eefb3a8b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -223,9 +223,14 @@ ATTRIBUTE_GROUPS(vidi);
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = priv ? priv->vidi_dev : NULL;
+	struct vidi_context *ctx = dev ? dev_get_drvdata(dev) : NULL;
 	struct drm_exynos_vidi_connection *vidi = data;
 
+	if (!ctx)
+		return -ENODEV;
+
 	if (!vidi) {
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "user data for vidi is null.\n");
@@ -374,6 +379,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -381,6 +387,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -426,8 +434,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	del_timer_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--
