Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9349BABB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDCF10E38F;
	Tue, 25 Jan 2022 17:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0455210E38F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 960C820D07;
 Tue, 25 Jan 2022 18:57:22 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 2/3] drm/mipi-dbi: Add driver_private member to struct
 mipi_dbi_dev
Date: Tue, 25 Jan 2022 18:56:59 +0100
Message-Id: <20220125175700.37408-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220125175700.37408-1-noralf@tronnes.org>
References: <20220125175700.37408-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f6Fm+t6M c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=Q2Ih0uKjMOPNe-lQhrwA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_dev_alloc() can't allocate structures that embed a structure
which then again embeds drm_device. Workaround this by adding a
driver_private pointer to struct mipi_dbi_dev which the driver can use for
its additional state.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 include/drm/drm_mipi_dbi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 6fe13cce2670..76aac6decfde 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -130,6 +130,8 @@ struct mipi_dbi_dev {
 	 * @dbi: MIPI DBI interface
 	 */
 	struct mipi_dbi dbi;
+
+	void *driver_private;
 };
 
 static inline struct mipi_dbi_dev *drm_to_mipi_dbi_dev(struct drm_device *drm)
-- 
2.33.0

