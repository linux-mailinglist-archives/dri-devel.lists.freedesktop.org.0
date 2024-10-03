Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB998EE39
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8CC10E821;
	Thu,  3 Oct 2024 11:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cL/f57Lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BE010E821;
 Thu,  3 Oct 2024 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955212; x=1759491212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PGZLCcVIH9CT89YkamNILT79DNR60PJ7u1AA9UGz0F8=;
 b=cL/f57LreOOAq8MJH/ScZ8BPk8NvOh7qdGeWaaG8gfnA6cDr6I72DRVR
 BPCRxW/0KNivGbcXQjYfVCVjt28zdEpeZanMz7ZSrk/Y43NTI2O1wLmkm
 LzqccX7ggutrsWyuYvA66QLRNg/l066O/JBMiB7txMYhr2SKbaXYrygdj
 wSdLr4Wrfvsiq4hzszaUJ53v67XsWJGXoxAhvstRy8WAQQV2Vp2mx1P/R
 5HcK8mog8GrKbKBxwLEdnXQyJxt1tXiKQTFtaiL8lVT1/ygo6w0knGj1k
 uprxtIbGJ2n1kkmbS6GDQhktev3/J0SmlkKnCFNb2+imZoBW6fSOAuHJe Q==;
X-CSE-ConnectionGUID: DtqQTXzkQ+mwMgjs1556HA==
X-CSE-MsgGUID: uNvbvoj6RTimeChqAuw2Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38503021"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38503021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:32 -0700
X-CSE-ConnectionGUID: 70JAljCWQH2HkfiFo64EQw==
X-CSE-MsgGUID: ner3WqVYQZOpa5PWkpW/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426565"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] drm/client: s/unsigned int i/int i/
Date: Thu,  3 Oct 2024 14:33:04 +0300
Message-ID: <20241003113304.11700-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the 'unsigned int i' footguns with plain old signed
int. Avoids accidents if/when someone decides they need
to iterate backwards.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index ccf5c9b5537b..875d517fa8f2 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -39,7 +39,7 @@ int drm_client_modeset_create(struct drm_client_dev *client)
 	unsigned int max_connector_count = 1;
 	struct drm_mode_set *modeset;
 	struct drm_crtc *crtc;
-	unsigned int i = 0;
+	int i = 0;
 
 	/* Add terminating zero entry to enable index less iteration */
 	client->modesets = kcalloc(num_crtc + 1, sizeof(*client->modesets), GFP_KERNEL);
@@ -75,7 +75,7 @@ static void drm_client_modeset_release(struct drm_client_dev *client)
 	struct drm_mode_set *modeset;
 
 	drm_client_for_each_modeset(modeset, client) {
-		unsigned int i;
+		int i;
 
 		drm_mode_destroy(client->dev, modeset->mode);
 		modeset->mode = NULL;
@@ -925,7 +925,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 	struct drm_plane *plane = modeset->crtc->primary;
 	struct drm_cmdline_mode *cmdline;
 	u64 valid_mask = 0;
-	unsigned int i;
+	int i;
 
 	if (!modeset->num_connectors)
 		return false;
-- 
2.45.2

