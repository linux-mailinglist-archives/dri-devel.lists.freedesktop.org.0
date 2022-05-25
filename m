Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F260533FA8
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4425F10FA83;
	Wed, 25 May 2022 14:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC5310FA94
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id B43D81F450F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490693;
 bh=V/KfHPBGZosfbKnwVHQPcXJblhj5zBtBpc0Z5yGRgrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WRQHhRiAFVBl75rpUn357RwSiO3Ibg5i7H5HD80WWA47v2CIh4h04LlD2pld3R5kC
 JnRx2TrbiCB6fYd5FerW2SxAIZuR34ir3EZTxm6Pb+ChtF8k5b0MM/YEi4PvfHhYIB
 acxZqLeD9ysQIrR9s2ekfZSezWPsVqQ6TvVR5kYgTt8jrEBgOq6LmYqy51LCntGtlF
 eT1TPhFSM8rx9dr/HD3qlKWEWkKIhUWabzpp9FrITzLIRcUIGl9BUaFcaVLp1jreOY
 n1oEKNn1Krhl8x5CI+V3Xu6linExP5xVh+Jth4Ob7dQ8FPGRI36HBnuT/fE8kQs8MS
 RFUk1lXfIfUYw==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/panfrost: Constify argument to has_hw_issue
Date: Wed, 25 May 2022 10:57:48 -0400
Message-Id: <20220525145754.25866-4-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Logically, this function is free of side effects, so any pointers it
takes should be const. Needed to avoid a warning in the next patch.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_issues.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 41a714ce6fce..14670ee58ace 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -251,7 +251,7 @@ enum panfrost_hw_issue {
 
 #define hw_issues_g76 0
 
-static inline bool panfrost_has_hw_issue(struct panfrost_device *pfdev,
+static inline bool panfrost_has_hw_issue(const struct panfrost_device *pfdev,
 					 enum panfrost_hw_issue issue)
 {
 	return test_bit(issue, pfdev->features.hw_issues);
-- 
2.35.1

