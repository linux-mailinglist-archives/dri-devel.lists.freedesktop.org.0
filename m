Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C726948E3C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 13:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73C310E037;
	Tue,  6 Aug 2024 11:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="R714CinT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2581610E037
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 11:59:27 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id bIqZs62idOGeabIqZs47Ch; Tue, 06 Aug 2024 13:59:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1722945565;
 bh=mW9ZcWagssNfhkWbLgfoqDnd9YloaoRJ2fJF6CbDTio=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=R714CinTBNFgikHK9WQedEvyWA0fcKeRWugctGMHmpaNM6RiRZeQSYawLWnxCUTMn
 EDlqGyyO4S3F4OM2/lMb8lnHoG43IYZ85kG78KfIPgN+fmAdX+hdZkmihZj8Be/eZa
 o0fqmW/9vxkht2Qo1LPqJtm5/WE25rg26IrrLwtH1NTICmBjt36fvV5uMY2cnje5Q8
 QbACgLu1Dsa1cEtKd1QDvNmOdEAYEU9Sgvwi6YhzSNszYOji2D1JvIclyMfgUJIRaG
 VWATgQMciqNx5PjPoXjb+W4oxLHd2rtqioTmaYuCvJa2TR18uTXUJ22D0yhKAcpgnI
 mZPtWLC2Tep1g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 06 Aug 2024 13:59:25 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/dp_mst: Slightly optimize drm_dp_mst_i2c_write() (1/2)
Date: Tue,  6 Aug 2024 13:59:10 +0200
Message-ID: <2705cf4c0df41f335cbe91bfd9984fcd95208788.1722945487.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
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

'txmsg' is memset()'ed in the for loop below, before usage. So we can save
another initialization txmsg when it is allocated.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
In case of interest, on x86_64, with allmodconfig, sizeof(*txmsg) is 768
bytes.
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 379a449a28a2..7bf6157eb3a3 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5886,7 +5886,7 @@ static int drm_dp_mst_i2c_write(struct drm_dp_mst_branch *mstb,
 	struct drm_dp_sideband_msg_tx *txmsg = NULL;
 	int ret;
 
-	txmsg = kzalloc(sizeof(*txmsg), GFP_KERNEL);
+	txmsg = kmalloc(sizeof(*txmsg), GFP_KERNEL);
 	if (!txmsg) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.45.2

