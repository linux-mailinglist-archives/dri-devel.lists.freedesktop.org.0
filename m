Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8997EEA6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 17:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF9010E41F;
	Mon, 23 Sep 2024 15:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bTwIBCXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B0810E41F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727107084; x=1758643084;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W5gtcbCYp4vJg4Flsqj3JabmZDfdkYxI+vhYsmZg/pU=;
 b=bTwIBCXQbo+JQhmI+q6vLAOvo+qh8Yd6840IhRk14dwJltn+gNvTEkBl
 01f6uJLM7jTA/XOn8ZWqF+ctGWdz83/rIjc/GrZCT3ztURbrScc/FhfEy
 kZexnyt9jwALLXc1kj2eUJkbJzVIrP1iW4DbB3EnXnsNBRs8zrwh4zxds
 3+UwL4/Bi/luEO+MnFPssZ8Vr2bXrSI06273uyrXHhHmHHBrYVdr48CK5
 E3paJMm3fFr6shXA9/rqImv20VymcrI/qw8exNgIdsS4dedpaGdb+8oui
 3hM9v0wmml3NByAizPtIv32mORmuFkpc03WhrRINCu/a0plXC1VN0TPoU A==;
X-CSE-ConnectionGUID: hzEG3tMWQ7mxETFZWat3BA==
X-CSE-MsgGUID: Fu+QbjDRRzKD7U8sLh7Q3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="28957235"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="28957235"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 08:58:04 -0700
X-CSE-ConnectionGUID: +1YXDUogTT+AIac5L1RowA==
X-CSE-MsgGUID: e1tmV5n9QKGm46YWyYlpqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="71250782"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 08:58:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 18:58:00 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] fbcon: fbcon_cursor_noblink -> fbcon_cursor_blink
Date: Mon, 23 Sep 2024 18:57:46 +0300
Message-ID: <20240923155749.30846-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
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

Invert fbcon_cursor_noblink into fbcon_cursor_blink so that:
- it matches the sysfs attribute exactly
- avoids having to do these NOT operations all over the place

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/video/fbdev/core/fbcon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index bbe332572ca7..eb30aa872371 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -166,7 +166,7 @@ static const struct consw fb_con;
 
 #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + (delta) * vc->vc_size_row)
 
-static int fbcon_cursor_noblink;
+static int fbcon_cursor_blink;
 
 #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
 
@@ -399,7 +399,7 @@ static void fbcon_add_cursor_work(struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (!fbcon_cursor_noblink)
+	if (fbcon_cursor_blink)
 		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
 				   ops->cur_blink_jiffies);
 }
@@ -3214,7 +3214,7 @@ static ssize_t rotate_show(struct device *device,
 static ssize_t cursor_blink_show(struct device *device,
 				 struct device_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
+	return sysfs_emit(buf, "%d\n", fbcon_cursor_blink);
 }
 
 static ssize_t cursor_blink_store(struct device *device,
@@ -3230,7 +3230,7 @@ static ssize_t cursor_blink_store(struct device *device,
 	console_lock();
 	idx = con2fb_map[fg_console];
 
-	fbcon_cursor_noblink = !blink;
+	fbcon_cursor_blink = blink;
 
 	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
 		goto err;
-- 
2.44.2

