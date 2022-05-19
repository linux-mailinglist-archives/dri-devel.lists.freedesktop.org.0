Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0AD52CFD4
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4896111B30D;
	Thu, 19 May 2022 09:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365811B31F;
 Thu, 19 May 2022 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652954092; x=1684490092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=plFOLTLngwoNBjFUVX6aU7gcKAPQohRqSHqBX4QPpR4=;
 b=QI8Ww2xl5/m5R4rnB+rBVmqvhBzJCaSlRaSIQzrHtl2gonVFRFDAMd4W
 nj1b8BZFHQN4xhEablFUX+hZAPApVEJQeo9hbC9H6YsTwU0i6S/GOR2rt
 yfkBk7QqD0T8vOeHIb48wqH/G/u/CoAXQfgNPsQfgrz/uIuagrs1gksCC
 jh8GA8ILKtEdsffa+bLb+ReLBH6lXioCJCC/HF6As+qTY5uRnLW6mH1lf
 q3pDnopY4BaEciMTI0z2Su4kfnoh8WSKiaYnoO+4xvJfYvqcWTeoCsGgj
 ZW4Mo8+SwL7/EmYXF7Roc2neEtlqZFONzfr6kk49CA2KfX8ZGMtzsf8rp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="252019947"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="252019947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:52 -0700
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="606404165"
Received: from bhanu-nuclab.iind.intel.com ([10.145.162.173])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 02:54:49 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [CI 1/3] drm/debug: Expose connector's max supported bpc via debugfs
Date: Thu, 19 May 2022 15:21:47 +0530
Message-Id: <20220519095149.3560034-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
References: <20220519095149.3560034-1-bhanuprakash.modem@intel.com>
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
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

