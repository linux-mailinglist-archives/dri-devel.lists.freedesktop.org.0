Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25084683C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 07:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ECB10E6D2;
	Fri,  2 Feb 2024 06:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="JDQge6j0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3284C10E6D2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 06:43:48 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1134)
 id 4597320B2000; Thu,  1 Feb 2024 22:43:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4597320B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1706856227;
 bh=yJ2N3/HVGxJA0MGmEiSpJS8Lev4/X5f6v9PbC3nQxsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JDQge6j0N748zAX3m40uBjCAofdEIZ3yaeynY2aCazTw07uwLOJStak9RvU57N2nB
 xoyU8AZgWNF+KwYqVPJcCO3VOiAA3OGEzS2cgwoBZQ+GTMxR6EHoPlkGqkcOsWfgsQ
 DN0ZpUT6L7+m8E6ocHeGZSEiIkaw6wQKXDKzYCEo=
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.dev>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
 Shradha Gupta <shradhagupta@microsoft.com>
Subject: [PATCH v4, 2/2] drm: Check polling initialized before enabling in
 drm_helper_probe_single_connector_modes
Date: Thu,  1 Feb 2024 22:43:44 -0800
Message-Id: <1706856224-9725-1-git-send-email-shradhagupta@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
References: <1706856176-9483-1-git-send-email-shradhagupta@linux.microsoft.com>
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

In function drm_helper_probe_single_connector_modes() when we enable
polling again, if it is already uninitialized, a warning is reported.
This patch fixes the warning message by checking if poll is initialized
before enabling it.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202401191128.db8423f1-oliver.sang@intel.com
Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
---
 Changes in v4
 * Clubbed this patch with similar patches and added a cover letter
---
 drivers/gpu/drm/drm_probe_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bd76603dc387..30e6063535cd 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -622,8 +622,12 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 					 0);
 	}
 
-	/* Re-enable polling in case the global poll config changed. */
-	drm_kms_helper_poll_enable(dev);
+	/*
+	 * Re-enable polling in case the global poll config changed but polling
+	 * is still initialized.
+	 */
+	if (dev->mode_config.poll_enabled)
+		drm_kms_helper_poll_enable(dev);
 
 	if (connector->status == connector_status_disconnected) {
 		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
-- 
2.34.1

