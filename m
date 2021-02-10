Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BEB316109
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 09:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7789BF4;
	Wed, 10 Feb 2021 08:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E26B89BF4;
 Wed, 10 Feb 2021 08:31:53 +0000 (UTC)
IronPort-SDR: b8bPAII28ogPUX8p+U74hyFVOMzEhxk5n2KiX6mlczyXUFcBjlUHQ+KYTVxEFQbmmZOSbz/Wcp
 z73CxN6CKWMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="161183223"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="161183223"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 00:31:34 -0800
IronPort-SDR: cMot+QnVB3nGtIBsiSGXLR1jtBFJtVepq1iZ0PuEeDHg7/Vv+GQJ/kcGKkNqp2ffK9jPsXs7XU
 UjNqi7SVdTuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="361212725"
Received: from kialmah1-desk.jf.intel.com ([10.23.15.164])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2021 00:31:34 -0800
From: Khaled Almahallawy <khaled.almahallawy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable by
 display drivers.
Date: Wed, 10 Feb 2021 00:33:37 -0800
Message-Id: <20210210083338.100068-1-khaled.almahallawy@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: seanpaul@chromium.org, Khaled Almahallawy <khaled.almahallawy@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of AUX retries specified in the DP specs is 7. Currently, to make Dell 4k monitors happier, the number of retries are 32.
i915 also retries 5 times (intel_dp_aux_xfer) which means in the case of AUX timeout we actually retries 32 * 5 = 160 times.

So making the number of aux retires a variable to allow for fine tuning and optimization of aux timing.

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 10 +++-------
 include/drm/drm_dp_helper.h     |  1 +
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index eedbb48815b7..8fdf57b4a06c 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -249,13 +249,7 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 
 	mutex_lock(&aux->hw_mutex);
 
-	/*
-	 * The specification doesn't give any recommendation on how often to
-	 * retry native transactions. We used to retry 7 times like for
-	 * aux i2c transactions but real world devices this wasn't
-	 * sufficient, bump to 32 which makes Dell 4k monitors happier.
-	 */
-	for (retry = 0; retry < 32; retry++) {
+	for (retry = 0; retry < aux->num_retries; retry++) {
 		if (ret != 0 && ret != -ETIMEDOUT) {
 			usleep_range(AUX_RETRY_INTERVAL,
 				     AUX_RETRY_INTERVAL + 100);
@@ -1744,6 +1738,8 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
 	aux->ddc.retries = 3;
 
 	aux->ddc.lock_ops = &drm_dp_i2c_lock_ops;
+	/*Still making the Dell 4k monitors happier*/
+	aux->num_retries = 32;
 }
 EXPORT_SYMBOL(drm_dp_aux_init);
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index edffd1dcca3e..16cbfc8f5e66 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1876,6 +1876,7 @@ struct drm_dp_aux {
 	struct mutex hw_mutex;
 	struct work_struct crc_work;
 	u8 crc_count;
+	int num_retries;
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
 	/**
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
