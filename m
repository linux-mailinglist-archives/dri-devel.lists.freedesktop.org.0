Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107C74F8EEF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 08:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920910F6BE;
	Fri,  8 Apr 2022 06:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF1510EA7A;
 Fri,  8 Apr 2022 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649400964; x=1680936964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X7h6Rq2fncDvYYeN26vr/R1teO2kuk1NKHI3CHMhZQ0=;
 b=cTTgesZZT0dZ8wOz5blelSvd8fa3PhhtZDyPZnPq50UwCqgbpNVLwvgI
 s6zIMghVG8dEbUHEZTKNba85V+9sA6urlfQkmT1cbauMVhqsop0/OBKDq
 J3BwtrbVO4kuJ+h+pVsiGivgClfm3nstUy160mn7PVH+sVpFaARSC2/4W
 PjiZz/lvirM9bSzQbKqGxSu0pr1zOh0NrPVVs0GI9n8qU7GAVWeo6S2ss
 4SEVBCbAjWfBd4eMe0GCDnct01E78RUvvgaLzpHtDo9cls4PmBrI2EbCe
 6HsV37ypb4Hl9FugbPsJ2mpsIiyPGh3/Q3W/YZcUWH6xTLTQtIf3VF0w0 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261219253"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261219253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="506457593"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 23:55:51 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Subject: [PATCH 1/3] drm/debug: Expose connector's max supported bpc via
 debugfs
Date: Fri,  8 Apr 2022 12:23:48 +0530
Message-Id: <20220408065350.1485328-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
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

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 drivers/gpu/drm/drm_debugfs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 7f1b82dbaebb..33e5345c6f3e 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -395,6 +395,23 @@ static int vrr_range_show(struct seq_file *m, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(vrr_range);
 
+/*
+ * Returns Connector's max supported bpc through debugfs file.
+ * Example usage: cat /sys/kernel/debug/dri/0/DP-1/max_bpc
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

