Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E69877BC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 18:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C922610EBA1;
	Thu, 26 Sep 2024 16:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4kiX8Ly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BDD10EBA1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727368929; x=1758904929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I+opJ+sKzyWHL0fLfeTbq/94GDwV8C4jq/Mltr9UjB4=;
 b=E4kiX8LyZaZjjIw61kR9K4MYw7qz1ib/G7Z5EfSMS4WqxZY0IMovndgh
 5LXhpqBRe6f18VSE407PYXn6xLA6xynnrINTuY43oWMostHwkWfZY/0l+
 QoffgF5hj3h78BV+zDimAbfaWyeWR59tDVyg6mdyOjCUn+4eNOpfwWoWq
 +owQPk37tIxuBP47f6lpcGem5BWUn0HIoxA7rg/nS1AtZm28Q1/lsyS+f
 9yAHWrzI3f++Y4FxWtWg6jU1T61/AfA0pakMc/0/eszU5YIGUHdoM/x4l
 IQg78cOB1WHKNig/exq2ZAPwMGGconUYDUlD8gqy4Hk7iKgzQKwALPuAV Q==;
X-CSE-ConnectionGUID: kI9W6XqAS8ieWx8zk6UsZg==
X-CSE-MsgGUID: t8RhBr7FSpiAj5d96jtIHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="25992226"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="25992226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 09:42:09 -0700
X-CSE-ConnectionGUID: 9jJPo6l5QyScncqYgxnl2w==
X-CSE-MsgGUID: UAiQK2irRleXDOtUAEQunQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="76304028"
Received: from tassilo.jf.intel.com ([10.54.38.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 09:42:08 -0700
From: Andi Kleen <ak@linux.intel.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Andi Kleen <ak@linux.intel.com>
Subject: [PATCH v2] drm: Print bad EDID notices less often
Date: Thu, 26 Sep 2024 09:42:02 -0700
Message-ID: <20240926164202.2668922-1-ak@linux.intel.com>
X-Mailer: git-send-email 2.46.1
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

I have an old monitor that reports a zero EDID block, which results in a
warning message. This happens on every screen save cycle, and maybe in
some other situations, and over time the whole kernel log gets filled
with these redundant messages.

Make most of these prints conditional on bad_edid_count like other verbose EDID
messages.

Signed-off-by: Andi Kleen <ak@linux.intel.com>

---

v2: Use bad_edid_count instead of _once.
---
 drivers/gpu/drm/drm_edid.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..52c8f08152fd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1902,10 +1902,17 @@ static bool edid_block_valid(const void *block, bool base)
 				       edid_block_tag(block));
 }
 
-static void edid_block_status_print(enum edid_block_status status,
+static void edid_block_status_print(struct drm_connector *connector,
+				    enum edid_block_status status,
 				    const struct edid *block,
 				    int block_num)
 {
+	if (status != EDID_BLOCK_OK &&
+		connector &&
+		!connector->bad_edid_counter++ &&
+		!drm_debug_enabled(DRM_UT_KMS))
+		return;
+
 	switch (status) {
 	case EDID_BLOCK_OK:
 		break;
@@ -2004,7 +2011,7 @@ static bool drm_edid_block_valid(void *_block, int block_num, bool print_bad_edi
 			*edid_corrupt = true;
 	}
 
-	edid_block_status_print(status, block, block_num);
+	edid_block_status_print(NULL, status, block, block_num);
 
 	/* Determine whether we can use this block with this status. */
 	valid = edid_block_status_valid(status, edid_block_tag(block));
@@ -2375,7 +2382,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 
 	status = edid_block_read(edid, 0, read_block, context);
 
-	edid_block_status_print(status, edid, 0);
+	edid_block_status_print(connector, status, edid, 0);
 
 	if (status == EDID_BLOCK_READ_FAIL)
 		goto fail;
@@ -2409,7 +2416,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 
 		status = edid_block_read(block, i, read_block, context);
 
-		edid_block_status_print(status, block, i);
+		edid_block_status_print(connector, status, block, i);
 
 		if (!edid_block_status_valid(status, edid_block_tag(block))) {
 			if (status == EDID_BLOCK_READ_FAIL)
@@ -2842,7 +2849,7 @@ const struct drm_edid *drm_edid_read_base_block(struct i2c_adapter *adapter)
 
 	status = edid_block_read(base_block, 0, drm_do_probe_ddc_edid, adapter);
 
-	edid_block_status_print(status, base_block, 0);
+	edid_block_status_print(NULL, status, base_block, 0);
 
 	if (!edid_block_status_valid(status, edid_block_tag(base_block))) {
 		edid_block_dump(KERN_NOTICE, base_block, 0);
-- 
2.46.1

