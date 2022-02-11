Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A044B2E6B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660B010EB89;
	Fri, 11 Feb 2022 20:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040C10EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 19C071F46DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611270;
 bh=O83Vp1hSHy3eMKJZOtnubu6FskK5/Z0o+pHADmBx2Bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N7/ezwvxyFgxZoLSeOIytabeMu82yI6ZDrFPwTRMtRMmHDPEaXwvkY+msMij0+PSP
 SfSSgsPl8TnPCV3Utkyqgb7J0Z2VKWtA9bOVOncTcWqtzrhSrCpY4+MDAN/pqq6LhH
 x2jy2MsqVKnsA0xOdVNZr08+VS8RKE6jy2VJncoW+F1/pSiC3RS8+yd9oEn5YllMk7
 PYmy0xJqe0qv9pZ/c/1shAreVMBrh1wxIJgET0tqupiKDto5xES8jwwZ9O4SMLWuOp
 cJE8kX8dFJn43DR/CEvmLKOEW+qj0sQ/GeMBTgZWeaBm/Vs50mC9MHyIQqNK5l2Hq6
 LiDhMN1tbfPYw==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/panfrost: Add "clean only safe" feature bit
Date: Fri, 11 Feb 2022 15:27:25 -0500
Message-Id: <20220211202728.6146-7-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Add the HW_FEATURE_CLEAN_ONLY_SAFE bit based on kbase. When I actually
tried to port the logic from kbase, trivial jobs raised Data Invalid
Faults, so this may depend on other coherency details. It's still useful
to have the bit to record the feature bit when adding new models.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 36fadcf9634e..1a8bdebc86a3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -21,6 +21,7 @@ enum panfrost_hw_feature {
 	HW_FEATURE_TLS_HASHING,
 	HW_FEATURE_THREAD_GROUP_SPLIT,
 	HW_FEATURE_IDVS_GROUP_SIZE,
+	HW_FEATURE_CLEAN_ONLY_SAFE,
 	HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG,
 };
 
-- 
2.34.1

