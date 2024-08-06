Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EFA948E3D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 13:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0310E32D;
	Tue,  6 Aug 2024 11:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Prp9mtiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CD410E32D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 11:59:29 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id bIqZs62idOGeabIqfs47Hs; Tue, 06 Aug 2024 13:59:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722945569;
 bh=U1wmPO7Z7uDvQZNVQuE2oZwHbLILE0+Mf/ztBlL3Y7M=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Prp9mtiM5plHfJXL5GVci2DPl1AvTEDkTqYeDOstFlrA3VlvCb9SroTXIu6PaLSkm
 7uibvH2B2qW7S2f4M6stGaBR8RXIusTmY5636yqJp/mJQK1NSMuEZDQc0s3Ylxompr
 wr0dvdIUAll59EQWcD1sEYjQCi0yhb9Wz4Rq58rq8N5iSeJm17dz5So156nWGdVyxG
 I421MuslIUnoh7hZeYOdDjfqyE3P+o0eISFQzCsYJSE7iEHTXmy15yhAIsCYCvaPx8
 kuxSbiJrkxlXr8jZwTl71EZiUQ3ZvmZE6lSq4r4ohTSoiB6zG00g/LchjSaxeglj9I
 Yp4JbXYyFf0Yg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 06 Aug 2024 13:59:29 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/dp_mst: Slightly optimize drm_dp_mst_i2c_write() (2/2)
Date: Tue,  6 Aug 2024 13:59:11 +0200
Message-ID: <123bc9f79f60de14aad6f46e1c2268cf6f1c27a5.1722945487.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <2705cf4c0df41f335cbe91bfd9984fcd95208788.1722945487.git.christophe.jaillet@wanadoo.fr>
References: <2705cf4c0df41f335cbe91bfd9984fcd95208788.1722945487.git.christophe.jaillet@wanadoo.fr>
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

'msg' is only used with drm_dp_encode_sideband_req() which takes a
"const struct drm_dp_sideband_msg_req_body *".

So some initializations can be done only once outside of the for loop.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
In case of interest, on x86_64, with allmodconfig, sizeof(*msg) is 420
bytes.
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 7bf6157eb3a3..a149ff3f70ad 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5891,10 +5891,16 @@ static int drm_dp_mst_i2c_write(struct drm_dp_mst_branch *mstb,
 		ret = -ENOMEM;
 		goto out;
 	}
+
+	/*
+	 * 'msg' is not modified by drm_dp_encode_sideband_req(). So
+	 * some initializations can be done only once.
+	 */
+	memset(&msg, 0, sizeof(msg));
+	msg.req_type = DP_REMOTE_I2C_WRITE;
+	msg.u.i2c_write.port_number = port->port_num;
+
 	for (i = 0; i < num; i++) {
-		memset(&msg, 0, sizeof(msg));
-		msg.req_type = DP_REMOTE_I2C_WRITE;
-		msg.u.i2c_write.port_number = port->port_num;
 		msg.u.i2c_write.write_i2c_device_id = msgs[i].addr;
 		msg.u.i2c_write.num_bytes = msgs[i].len;
 		msg.u.i2c_write.bytes = msgs[i].buf;
-- 
2.45.2

