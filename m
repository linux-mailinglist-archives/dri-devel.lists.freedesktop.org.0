Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8234FB282
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 05:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1717510E944;
	Mon, 11 Apr 2022 03:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E9E10E93E;
 Mon, 11 Apr 2022 03:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649649549; x=1681185549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ok3k1pYqcDUiDwzvRFwLE4OjlX08F4KrNImpdVl6fAc=;
 b=MqC8cnk0TlhRTZjkLyg9TFMhZ2hEwrZu+JERaK5Trvf0PvqtTn/4EAfs
 pxxEC4k5RLD8LPosvSZGbPJkTqn1mmsRfv6A2ICio1evtJtSVJlvUEsve
 wU0LUf43Rjz94ezJbZ/OqDrUoVbGKHKOJhcnZukbUDmFqNsWyjklIWtSH
 39uVCoRjk+S/HXFJ1H9S5cG1z5fzp+UR7OtMP46ZSROwJBSxF7DKUOuyw
 y8m8Z/+XRUw8WKdp+R7nGJ8lSX1vhtjcFRM4+Ic3xMXe0iCxRvl/JwAEZ
 D8fTQBzkJwTYyUn/O9rw63qIn9tqNc3S3u0ZH4JVX2MxkECyMNifY5lnZ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="259621750"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; d="scan'208";a="259621750"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2022 20:59:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; d="scan'208";a="654456606"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2022 20:59:06 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [V2 1/3] drm/debug: Expose connector's max supported bpc via debugfs
Date: Mon, 11 Apr 2022 09:27:03 +0530
Message-Id: <20220411035703.1595171-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408065350.1485328-2-bhanuprakash.modem@intel.com>
References: <20220408065350.1485328-2-bhanuprakash.modem@intel.com>
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's useful to know the connector's max supported bpc for IGT
testing. Expose it via a debugfs file on the connector "output_bpc".

Example: cat /sys/kernel/debug/dri/0/DP-1/output_bpc

V2:
* Fix typo in comments (Harry)

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/drm_debugfs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 7f1b82dbaebb..fb04b7a984de 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -395,6 +395,23 @@ static int vrr_range_show(struct seq_file *m, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(vrr_range);
 
+/*
+ * Returns Connector's max supported bpc through debugfs file.
+ * Example usage: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
+ */
+static int output_bpc_show(struct seq_file *m, void *data)
+{
+	struct drm_connector *connector = m->private;
+
+	if (connector->status != connector_status_connected)
+		return -ENODEV;
+
+	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(output_bpc);
+
 static const struct file_operations drm_edid_fops = {
 	.owner = THIS_MODULE,
 	.open = edid_open,
@@ -437,6 +454,10 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
 			    &vrr_range_fops);
 
+	/* max bpc */
+	debugfs_create_file("output_bpc", 0444, root, connector,
+			    &output_bpc_fops);
+
 	if (connector->funcs->debugfs_init)
 		connector->funcs->debugfs_init(connector, root);
 }
-- 
2.35.1

