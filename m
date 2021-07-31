Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF23DC276
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 03:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8A06E517;
	Sat, 31 Jul 2021 01:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9986E517
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:40:13 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02763E81;
 Sat, 31 Jul 2021 03:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627695611;
 bh=AYL6GFoeD+crZns3tBIIFsN+kRzv0ihNWl3ak38Yu9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pH/ZGh/kcA87XNIttHFobtNJq/2Ex41Mc8y+gPszSqxQcXIOI8b+QMeZe4qK2VBTd
 NrvfrkPbpjSYig1YzS7cjCswIfik6JWE9T0rUHcX4ghF2cS/MDovW99DS2CFLZnXuN
 zITWx36NXvtoc+0vG0VWsJ4zMC1reymVjUvfHLXw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 3/9] drm/sti: Use correct printk format specifiers for
 size_t
Date: Sat, 31 Jul 2021 04:39:48 +0300
Message-Id: <20210731013954.11926-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
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

The correct format specifier for size_t is %zu. Using %d (or %u)
generates a warning on 64-bit platforms. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index d09b08995b12..3c61ba8b43e0 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -927,12 +927,12 @@ static void sti_hqvdp_start_xp70(struct sti_hqvdp *hqvdp)
 
 	header = (struct fw_header *)firmware->data;
 	if (firmware->size < sizeof(*header)) {
-		DRM_ERROR("Invalid firmware size (%d)\n", firmware->size);
+		DRM_ERROR("Invalid firmware size (%zu)\n", firmware->size);
 		goto out;
 	}
 	if ((sizeof(*header) + header->rd_size + header->wr_size +
 		header->pmem_size + header->dmem_size) != firmware->size) {
-		DRM_ERROR("Invalid fmw structure (%d+%d+%d+%d+%d != %d)\n",
+		DRM_ERROR("Invalid fmw structure (%zu+%d+%d+%d+%d != %zu)\n",
 			  sizeof(*header), header->rd_size, header->wr_size,
 			  header->pmem_size, header->dmem_size,
 			  firmware->size);
-- 
Regards,

Laurent Pinchart

