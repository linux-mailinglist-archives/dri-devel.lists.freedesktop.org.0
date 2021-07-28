Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC43D9235
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 17:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AEF6E7E2;
	Wed, 28 Jul 2021 15:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B6E6E16F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 15:37:50 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E43644FB;
 Wed, 28 Jul 2021 17:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627486668;
 bh=7Q7V+jsv3j0J2Ca8fqxRrHdhfNI0Nw4sUBrOglR+KR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LMw58EBTxjsgP/i5vJg/z7T48NOAM+djEzgfuaoKx+kdqwMlbp25pKJvYGAPUSP+p
 +XPESJp4/vGiLxwYFPLFDNYbguXaoHF31gAMJ4sW1OzkwP+evxk28PZIXQCWTyFlsF
 K1eZI7B6G831IBkGvnmyBA1g3JnNpzR3v7sFrtnc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/sti: Use correct printk format specifiers for size_t
Date: Wed, 28 Jul 2021 18:37:31 +0300
Message-Id: <20210728153736.15240-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-imx@nxp.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The correct format specifier for size_t is %zu. Using %d (or %u)
generates a warning on 64-bit platforms. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

