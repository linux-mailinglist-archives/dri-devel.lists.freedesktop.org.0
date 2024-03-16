Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF7887DBF5
	for <lists+dri-devel@lfdr.de>; Sun, 17 Mar 2024 00:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6BC10F48C;
	Sat, 16 Mar 2024 23:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PjZnPFEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE3710F31D
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Mar 2024 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710630796;
 bh=IhpBXYmi/BsEsq/CSAb6QqrLjEY2i/Yps1Od4RNhUH8=;
 h=From:To:Cc:Subject:Date:From;
 b=PjZnPFEYAUQQQG4/5HoJ3yMf5wRmZ+oxtmYJcXJq0qpIUlLS7HCVBsNgTWSPRL3g9
 QnxyEuWAjUg0iGqVLcNj1xQ9oAJqlwLThwZkO8SfAd/TYvXDRpiO1uyxFgpdTe2qN7
 /ZkTelRCYSlR8e/9pUvP9h5RrBmBH2BYRe/7QG4vKZxn3+NPfmwd+GL1c1bkqG2Uv4
 AXQoQizkCZBHZqcE+8NuhqAt0eRMizUJ9MfSVcAaOqeYUup5opRFQWOmm0zSB/q7tr
 fY/Cs1ufXMrenlU2T7MJ01FKEng6+ydGyeAeFipjSD0g+Nqz5/DJmWcMZ6+27hsQXf
 I48YaIaHeyumA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 726D6378020D;
 Sat, 16 Mar 2024 23:13:15 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panfrost: Only display fdinfo's engine and cycle tags
 when profiling is on
Date: Sat, 16 Mar 2024 23:13:04 +0000
Message-ID: <20240316231306.293817-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If job accounting is disabled, then both fdinfo's drm-engine and drm-cycle
key values will remain immutable. In that case, it makes more sense not to
display them at all to avoid confusing user space profiling tools.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index eec250114114..ef9f6c0716d5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -550,10 +550,12 @@ static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
 	BUILD_BUG_ON(ARRAY_SIZE(engine_names) != NUM_JOB_SLOTS);
 
 	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
-		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
-			   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
-		drm_printf(p, "drm-cycles-%s:\t%llu\n",
-			   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
+		if (pfdev->profile_mode) {
+			drm_printf(p, "drm-engine-%s:\t%llu ns\n",
+				   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
+			drm_printf(p, "drm-cycles-%s:\t%llu\n",
+				   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
+		}
 		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
 			   engine_names[i], pfdev->pfdevfreq.fast_rate);
 		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",

base-commit: 97252d0a4bfbb07079503d059f7522d305fe0f7a
-- 
2.43.0

