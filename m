Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E49878CE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 20:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481F10EBC1;
	Thu, 26 Sep 2024 18:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BqVJJMMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D8710EBC1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727373719; x=1758909719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G15Bzbc2IbU/19Bo1RvHEHBdILuhpAjUc3+YKl+hS6Q=;
 b=BqVJJMMa1Y9JqQmwQCl7zjP+r4nIQqIgDPVH8hfF2iquf25502J4MNSW
 1WJ5KB+pTKN/ZeS+YMkrDHJ/SUfHOLbKnVGQflB7ueCG06fzCiyO6m4Aq
 LO1laLzL0nQQ63quv/NIx/GriLssGHYiQQKZuEkRz51qJ7wPw44syhPgw
 bXguoxB6PBoqsEwFncFqcTOKl8gqzuoQ11RpV+S+kDbDvkmbj6Pm9GRf/
 o3KXWavVpXYzAognevvv2CwxCRD8Rkv+al3ynJF9Rd5D/cXMt9TQhofvY
 zi9SimqCKwgyu2O2oJ4+BRFHMnxlAVjmf3AOVe/tjiabgMi66Ob0RIwcO A==;
X-CSE-ConnectionGUID: 5+f4QdttRN+FELJsoHV19g==
X-CSE-MsgGUID: AdGZUUB6StymtDqP9LYqtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37077403"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="37077403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:01:55 -0700
X-CSE-ConnectionGUID: hlMHMxX6SFa+AoGQzWQyHw==
X-CSE-MsgGUID: Q+IGMVN0SbeAwKJRn33Fjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72335188"
Received: from tassilo.jf.intel.com ([10.54.38.190])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:01:56 -0700
From: Andi Kleen <ak@linux.intel.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Andi Kleen <ak@linux.intel.com>
Subject: [PATCH v3] drm: Print bad EDID notices less often
Date: Thu, 26 Sep 2024 11:01:50 -0700
Message-ID: <20240926180150.2674763-1-ak@linux.intel.com>
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
v3: Move rate limit logic into dedicated wrapper.
---
 drivers/gpu/drm/drm_edid.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..64d41dd605f1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1949,6 +1949,18 @@ static void edid_block_status_print(enum edid_block_status status,
 	}
 }
 
+static void edid_block_status_print_rl(struct drm_connector *connector,
+				    enum edid_block_status status,
+				    const struct edid *block,
+				    int block_num)
+{
+	if (status != EDID_BLOCK_OK &&
+		!connector->bad_edid_counter++ &&
+		!drm_debug_enabled(DRM_UT_KMS))
+		return;
+	edid_block_status_print(status, block, block_num);
+}
+
 static void edid_block_dump(const char *level, const void *block, int block_num)
 {
 	enum edid_block_status status;
@@ -2375,7 +2387,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 
 	status = edid_block_read(edid, 0, read_block, context);
 
-	edid_block_status_print(status, edid, 0);
+	edid_block_status_print_rl(connector, status, edid, 0);
 
 	if (status == EDID_BLOCK_READ_FAIL)
 		goto fail;
@@ -2409,7 +2421,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 
 		status = edid_block_read(block, i, read_block, context);
 
-		edid_block_status_print(status, block, i);
+		edid_block_status_print_rl(connector, status, block, i);
 
 		if (!edid_block_status_valid(status, edid_block_tag(block))) {
 			if (status == EDID_BLOCK_READ_FAIL)
-- 
2.46.1

