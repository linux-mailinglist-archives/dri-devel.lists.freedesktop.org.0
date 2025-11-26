Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0AC8A6B5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5749910E646;
	Wed, 26 Nov 2025 14:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="m9YfKTMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBF210E646
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1764168414; x=1795704414;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=uItEimpxMhKMbQC9mNUuER9pfb5MZqLce59YpPjjwgM=;
 b=m9YfKTMq38cS4mftp9WN4pBLdJWzJRTqXlHzCNAK46lNHDQYsu+dJAJJ
 P8emZvv/pP5FZhLm7yz6XuZg1bp2Awvxk5CGddfSIKYgsOPfuMXsF/5Zb
 KExTPQ4G3IaRbdyEerV87BlirxqNWJ9jWxEDji4hwXHk8C3bk379usIl3
 lnu08BftMRa9uoZxgqOShwVh6NcMnBP+Bqk8+qvoqEnjc6dKzEyNBQmfr
 hAo1ooPqxG7ppe/5i/LriQz0sqTeL52ZVN4mDwSr4Kf7ME4hiUwWgV41B
 +XigM+2j4ck/wTavoz+85G1rXfFQtc5ZJeVlCDKu6SQsIpvFJGghF2quv Q==;
X-CSE-ConnectionGUID: ST0PCBm8Qw+iBWdyAyLynQ==
X-CSE-MsgGUID: u7i02uanRT+DA9i7JuS8VQ==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="281082112"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:46:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 07:46:15 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 26 Nov 2025 07:46:13 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 26 Nov 2025 15:44:46 +0100
Subject: [PATCH 3/3] drm/gem-vram: revert the 8-byte alignment constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20251126-lcd_pitch_alignment-v1-3-991610a1e369@microchip.com>
References: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
In-Reply-To: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Ludovic Desroches" <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=uItEimpxMhKMbQC9mNUuER9pfb5MZqLce59YpPjjwgM=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpJxKv/P9cTzOfrMXjBUAc5bMy669Ak/orCLiiN
 YZb+Dq1/PuJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaScSrwAKCRA+OeYT93tk
 LYXEEACyKHporx+CQ1TvECv7g/rZFgN91puBurrWWK0za9kA3Ur6ey9AMreV0AElbxBSayBUiGE
 /5nK66fgcLw38mXU43LJO/vowMDpYelADaJ/KF8BjtTL1w8wJwuiJ6WZzwFeFzxgxrdZvDoufXf
 1/a+JZ7FHm44fkIDo2qZ/0rRoJs8+WBVoHNcWDsJBNSow8hj4wuefET4sEdUSuhjENjhw8/9h73
 8d0mnPBSvbin1klV1nnP9bbfDXlJ+bl4KgnNReDdFgYmu03hNY5q9Sb6zBlgf4Shgx6YyiTZ7XV
 xCprO74ZduBHvSRJUYjqZTdUMR/z9l0w5TC+T2tRMH96t+GXA8FQR7LhMApxXWksDj79l54p4lo
 qgtRtNMsEiB1m2wglOcrEfmUemBdYHVQFxf6bv4zNz/EGjC98bgK00jU4nHngg9R/B8Rf02WrFD
 sO4ozu2zpTiXgSEf2tNd8IeITTfBRdAEtz0t5O70Jcma+TbtQ9pE+zMqf0r2zZgp9Orlrrss4jY
 JVfmLnNLrlvglJYjMes8hxldH7KPIr/5v+vsGFBpMakX20Z4vCy2Mt+vndWpum8mpMfPForgihy
 rOoUEo0oXUm0wV3JeB2WXiWLVJEWWorXWp0Nv92stRPUc7UKLydP8gNvNjy+aYXY7Yb6VQNYAtA
 h8qvK3VU3Fmc1pg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

Using drm_mode_size_dumb() to compute the size of dumb buffers introduced
an 8-byte alignment constraint on the pitch that wasn’t present before.
Let’s remove this constraint, which isn’t necessarily required and may
cause buffers to be allocated larger than needed.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index f40f6e167f126681201b13d60be9c508f25d481f..3ab91965ec6f8fa275b9556079dfb335a02664bb 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -553,7 +553,7 @@ int drm_gem_vram_driver_dumb_create(struct drm_file *file,
 	if (WARN_ONCE(!dev->vram_mm, "VRAM MM not initialized"))
 		return -EINVAL;
 
-	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	ret = drm_mode_size_dumb(dev, args, 0, 0);
 	if (ret)
 		return ret;
 

-- 
2.51.0

