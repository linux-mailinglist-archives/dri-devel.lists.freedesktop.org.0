Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B922A78D3A0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4C610E4C8;
	Wed, 30 Aug 2023 07:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A45110E113
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 09:30:41 +0000 (UTC)
Received: from dsgsiengine01 ([10.8.1.61])
 by mail03.siengine.com with ESMTPS id 37T9UBnI006104
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 29 Aug 2023 17:30:11 +0800 (+08)
 (envelope-from lucas.liu@siengine.com)
Received: from SEEXMB04-2019.siengine.com (SEEXMB04-2019.siengine.com
 [10.8.1.34])
 by dsgsiengine01 (SkyGuard) with ESMTPS id 4RZhwf3MPkz7ZMc9;
 Tue, 29 Aug 2023 17:30:10 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB04-2019.siengine.com (10.8.1.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1258.25; Tue, 29 Aug 2023 17:30:09 +0800
Received: from localhost.localdomain (10.12.6.21) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1258.25
 via Frontend Transport; Tue, 29 Aug 2023 17:30:09 +0800
From: "baozhu.liu" <lucas.liu@siengine.com>
To: <liviu.dudau@arm.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: add NV12 format to support writeback layer type
Date: Tue, 29 Aug 2023 17:30:03 +0800
Message-ID: <20230829093004.22860-1-lucas.liu@siengine.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: mail03.siengine.com 37T9UBnI006104
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:32:27 +0000
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
Cc: "baozhu.liu" <lucas.liu@siengine.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When testing the d71 writeback layer function,
the output format is set to NV12, and the following error message is displayed:

[drm:komeda_fb_is_layer_supported] Layer TYPE: 4 doesn't support fb FMT: NV12 little-endian (0x3231564e) with modifier: 0x0..

Check the d71 data manual, writeback layer output formats includes NV12 format.

Signed-off-by: baozhu.liu <lucas.liu@siengine.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 6c56f5662bc7..80973975bfdb 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -521,7 +521,7 @@ static struct komeda_format_caps d71_format_caps_table[] = {
 	{__HW_ID(5, 1),	DRM_FORMAT_YUYV,	RICH,		Rot_ALL_H_V,	LYT_NM, AFB_TH}, /* afbc */
 	{__HW_ID(5, 2),	DRM_FORMAT_YUYV,	RICH,		Flip_H_V,		0, 0},
 	{__HW_ID(5, 3),	DRM_FORMAT_UYVY,	RICH,		Flip_H_V,		0, 0},
-	{__HW_ID(5, 6),	DRM_FORMAT_NV12,	RICH,		Flip_H_V,		0, 0},
+	{__HW_ID(5, 6),	DRM_FORMAT_NV12,	RICH_WB,	Flip_H_V,		0, 0},
 	{__HW_ID(5, 6),	DRM_FORMAT_YUV420_8BIT,	RICH,		Rot_ALL_H_V,	LYT_NM, AFB_TH}, /* afbc */
 	{__HW_ID(5, 7),	DRM_FORMAT_YUV420,	RICH,		Flip_H_V,		0, 0},
 	/* YUV 10bit*/
-- 
2.17.1

