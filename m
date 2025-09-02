Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D111CB3F897
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB9F10E5F9;
	Tue,  2 Sep 2025 08:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ROqW1Pv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13AB410E5FC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFB8941531;
 Tue,  2 Sep 2025 08:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85923C4CEF7;
 Tue,  2 Sep 2025 08:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802058;
 bh=6y3aIMSfaSkH8Ni+8XNxtNqvzdtes72Di9oihgPJJu4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ROqW1Pv//GU9c/bbW5HHgd+xBAFtBD8xsXz/Uc4reii0BIBmGEmlQ8OCKuuMpy2J2
 N5a9AMJySEOm5nIs0cI2PoQ4JswyEZIqCXYUAlPU+N7RAYJ1OctTqYNjFuMk3mlX+G
 5q8yNTUrDTW62lfkJ9fHzMFPc9C5+ObaMNDDziva10aHl/74MqLcxvILq/LWmbftw1
 3L/Mb/LU5Gk21uhkUCHrY0s/BkLuKVPPa3dIr0WVvy4wX8bZYHmWiGA5fHgZZ9WFTL
 pOsYCNgSfGHcySt/9Mxp3701b/7IHBDRl/iR6Qh0qvzifnxP33UZOtGN1W9xlkoV8A
 8qRUKfdSGJu+g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:54 +0200
Subject: [PATCH 26/29] drm/tidss: dispc: make accessors accessible to other
 parts of the driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-26-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=mripard@kernel.org;
 h=from:subject:message-id; bh=6y3aIMSfaSkH8Ni+8XNxtNqvzdtes72Di9oihgPJJu4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVh9wOcr5m3HGpdkK/8tfz3TzrfvioLjNav157wiFp
 e/MXrLadUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ2Iox1llMvyhXm+69pWtJ
 Tf8ubeHlqYu2xe/1NchjSm8onnc431PkcnzTsQ2Nf1Vf73m28/m3k4z1Qc2b/sxQPfF1q/jC3B2
 tRybdXPH13Hc2/sK1KYpFLp82rKvO3hu50Nxpwr3YW0wtt57sAwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++--
 drivers/gpu/drm/tidss/tidss_dispc.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 2f9cf95d6d0525a02d8adaae968aa551b7e27077..18b6beddfe51f9b5c164481ee2ef0fa289e63318 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -504,11 +504,11 @@ void dispc_vid_write(struct dispc_device *dispc, u32 hw_plane, u16 reg, u32 val)
 
 	CH(dispc);
 	iowrite32(val, base + reg);
 }
 
-static u32 dispc_vid_read(struct dispc_device *dispc, u32 hw_plane, u16 reg)
+u32 dispc_vid_read(struct dispc_device *dispc, u32 hw_plane, u16 reg)
 {
 	void __iomem *base = dispc->base_vid[hw_plane];
 
 	CH(dispc);
 	return ioread32(base + reg);
@@ -538,11 +538,11 @@ static void dispc_vp_write(struct dispc_device *dispc, u32 hw_videoport,
 
 	CH(dispc);
 	iowrite32(val, base + reg);
 }
 
-static u32 dispc_vp_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg)
+u32 dispc_vp_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg)
 {
 	void __iomem *base = dispc->base_vp[hw_videoport];
 
 	CH(dispc);
 	return ioread32(base + reg);
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index f5d5798de1ba550dedbcba36b1ef41d5ecceaa0c..b249cd0da331bf801992a7f38ff9031a5f8da0b8 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -181,9 +181,12 @@ void dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 		       u32 hw_videoport);
 void dispc_plane_enable(struct dispc_device *dispc, u32 hw_plane, bool enable);
 const u32 *dispc_plane_formats(struct dispc_device *dispc, unsigned int *len);
 u32 dispc_plane_find_fourcc_by_dss_code(u8 code);
 
+u32 dispc_vid_read(struct dispc_device *dispc, u32 hw_plane, u16 reg);
+u32 dispc_vp_read(struct dispc_device *dispc, u32 hw_videoport, u16 reg);
+
 int dispc_init(struct tidss_device *tidss);
 void dispc_remove(struct tidss_device *tidss);
 
 #endif

-- 
2.50.1

