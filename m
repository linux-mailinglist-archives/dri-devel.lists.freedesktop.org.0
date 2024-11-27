Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296C9DA52F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 10:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EAE10E179;
	Wed, 27 Nov 2024 09:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQYnUyMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9B10E179
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732701206; x=1764237206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E+bY82Gis3/BBcmHaMtq5QQ5xGpac+6OObJvpOS1ieg=;
 b=hQYnUyMe5Vcch6Fzv5GOB368g07DsR0sQTEfy2BG0AI6V9DO6fmWZDBh
 fgmRZpA2borymKwzbSe3vm/q02G7TZn/UeI9UaEL1NMgLU14qjBUf/h3n
 A7dnUoQKF1daALNXSqjhZqcVlAHjM3YnDMapiAXGzk8gkAC1Jw/poLYBN
 H0IipdnD8Id4za5J+K3ohkG9AvR8yNWYP61Bk+sIhR0BY2oW6JRwf8f1d
 M/Kak2gjbEGX9dw+rVwQ0CuSxnJ680YlCUamfS6YjBoM6l7yqPnIzJxVi
 omm0WtqckXMCIxNm3ZP+wR8f5PcF92DbEVwvLWCwY0S3N4klHKGxcklml w==;
X-CSE-ConnectionGUID: JlJ197J5TFScgo9sMHYyuA==
X-CSE-MsgGUID: jlnE+z4ARC2/6Wj6LONR4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36820455"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="36820455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:53:15 -0800
X-CSE-ConnectionGUID: 8WjVvBW2R2K/GuoEfNQ/hw==
X-CSE-MsgGUID: BGUAjkkZTUG1Fia+ac9M0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="92297124"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 01:53:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-media@vger.kernel.org
Cc: jani.nikula@intel.com, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: include linux/debugfs.h and linux/seq_file.h
 where needed
Date: Wed, 27 Nov 2024 11:53:08 +0200
Message-Id: <20241127095308.3149411-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having cec.h include linux/debugfs.h leads to all users of all cec
headers include and depend on debugfs.h and its dependencies for no
reason. Drop the include from cec.h, and include debugfs.h and
seq_file.h where needed.

Sort all the modified include lists while at it.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Depends on commit ae19ba915eb7 ("drm/i915/display: include
media/cec-notifier.h and linux/debugfs.h where needed")
---
 drivers/media/cec/core/cec-adap.c | 5 +++--
 drivers/media/cec/core/cec-core.c | 5 +++--
 drivers/media/cec/core/cec-pin.c  | 3 ++-
 include/media/cec.h               | 1 -
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index c7d36010c890..ba6828ef540e 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -7,12 +7,13 @@
 
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
 #include <linux/ktime.h>
-#include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 48282d272fe6..941a7d3cb9dc 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -5,13 +5,14 @@
  * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
  */
 
+#include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/kmod.h>
-#include <linux/slab.h>
 #include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 330d5d5d86ab..a70451d99ebc 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -4,8 +4,9 @@
  */
 
 #include <linux/delay.h>
-#include <linux/slab.h>
 #include <linux/sched/types.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
 
 #include <media/cec-pin.h>
 #include "cec-pin-priv.h"
diff --git a/include/media/cec.h b/include/media/cec.h
index 16b412b3131b..0c8e86115b6f 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -10,7 +10,6 @@
 
 #include <linux/poll.h>
 #include <linux/fs.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/kthread.h>
-- 
2.39.5

