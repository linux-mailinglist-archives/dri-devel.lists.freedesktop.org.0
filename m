Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3F4F7B4D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503710E7AC;
	Thu,  7 Apr 2022 09:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C6B10E79B;
 Thu,  7 Apr 2022 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322918; x=1680858918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WlseI06oLD1o/3w1z+xz8NZPg8aEkfTpFA8hd3JR7fw=;
 b=UOI4++HddGLnHLMGsr2GsZ4xHDXAiJo7xZOx1YhYmQzCQOx3ikA7Y1Jr
 oKvEQMF0LQOgf7ClRfO/eC28Zd4Nh8w0DekmAvjLVfOd4XfLO11aBc69R
 lUa8NIHcJPvbvc1oEFEeGdIsJbsQ3grMmvwIjDzDAHQ9hvCLM/RB7EMUZ
 geB5/kGgONXOiHbffFs40M2xILdj22jhQGmt8LKqvvTCyMIEFp6yIuihP
 C9UoNFKDX/V/0F6YRDaCTK3jG75tsfHH5pP/kazGjaEqitUEZc09zSWCK
 1KjlFTiTbqaZOA4AFEh7lojig1A0B1cPA+XcTin7zAsjYYxeZBpKJkEv+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="241865153"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="241865153"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="524844767"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm/edid: add typedef for block read function
Date: Thu,  7 Apr 2022 12:14:32 +0300
Message-Id: <94e414efe8d127f3fd0b4fd7948aafbe7be079a9.1649322799.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the callback a bit easier on the eye.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ba54701f91f6..926ffe5cd97e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2037,10 +2037,11 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_add_override_edid_modes);
 
+typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
+
 static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
-	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-			      size_t len),
-	void *data)
+					       read_block_fn read_block,
+					       void *context)
 {
 	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
 	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
@@ -2053,7 +2054,7 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 
 	/* base block fetch */
 	for (try = 0; try < 4; try++) {
-		if (get_edid_block(data, edid, 0, EDID_LENGTH))
+		if (read_block(context, edid, 0, EDID_LENGTH))
 			goto out;
 		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
 			break;
@@ -2097,9 +2098,8 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
  * Return: Pointer to valid EDID or NULL if we couldn't find any.
  */
 struct edid *drm_do_get_edid(struct drm_connector *connector,
-	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-			      size_t len),
-	void *data)
+			     read_block_fn read_block,
+			     void *context)
 {
 	int j, invalid_blocks = 0;
 	struct edid *edid, *new, *override;
@@ -2108,7 +2108,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	edid = drm_do_get_edid_base_block(connector, get_edid_block, data);
+	edid = drm_do_get_edid_base_block(connector, read_block, context);
 	if (!edid)
 		return NULL;
 
@@ -2125,7 +2125,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		int try;
 
 		for (try = 0; try < 4; try++) {
-			if (get_edid_block(data, block, j, EDID_LENGTH))
+			if (read_block(context, block, j, EDID_LENGTH))
 				goto out;
 			if (drm_edid_block_valid(block, j, false, NULL))
 				break;
-- 
2.30.2

