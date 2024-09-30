Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E5B98AD6B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CCC10E581;
	Mon, 30 Sep 2024 19:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfyYzyn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071EE10E57D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726023; x=1759262023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t7HzY/5phFmJPGAGRqM9vY2jdyrFQIFWa+W6EJ6zDtM=;
 b=VfyYzyn4eGT9j/CtRBG3qetMJhsAkCvbXu3n2njBuLFh8LiRy6PcLARI
 mOUfExeMtdrhG0vwB3qqKc4FoCFJv1IkOQ3dDro7K7WIbkYK6qtRpuW3R
 16+rmJ9oVnDk3gFX5ZCk3lqQ+2wL8SxbzTbBzYBuVJsFuQ2+qvV+yu5JG
 lrWpXEnUY0dUtsP0DxQDTSbGqP7LDBKtY4pTrBUGKNeSb0Af6LfOb0vPj
 HTkTN1ZeAJV7v+5sgUuJ3TCJ2sUIX3YKH+Sy+gW54DYSZSsy9NGrTyOQ2
 /HYXG/Nmnx8VfUIb+55nrw8pxqSFPlfWr62ZImcYe7qJsRE7GdUXpoAuL w==;
X-CSE-ConnectionGUID: KsETNDd4StedegImVEsmJA==
X-CSE-MsgGUID: wFrJpNr9Qoq/S/i/3bwVuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962318"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962318"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:43 -0700
X-CSE-ConnectionGUID: vQ606JEMQVy/XpMyubCRag==
X-CSE-MsgGUID: uIruAFTLQL22PpYKz4YlOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370031"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:41 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 11/31] accel/ivpu: Add FW version debugfs entry
Date: Mon, 30 Sep 2024 21:53:02 +0200
Message-ID: <20240930195322.461209-12-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Add debugfs that prints current firmware version string on read.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index cd3ac08f0409a..55dc2d883b444 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -45,6 +45,14 @@ static int fw_name_show(struct seq_file *s, void *v)
 	return 0;
 }
 
+static int fw_version_show(struct seq_file *s, void *v)
+{
+	struct ivpu_device *vdev = seq_to_ivpu(s);
+
+	seq_printf(s, "%s\n", vdev->fw->version);
+	return 0;
+}
+
 static int fw_trace_capability_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = seq_to_ivpu(s);
@@ -111,6 +119,7 @@ static int reset_pending_show(struct seq_file *s, void *v)
 static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"bo_list", bo_list_show, 0},
 	{"fw_name", fw_name_show, 0},
+	{"fw_version", fw_version_show, 0},
 	{"fw_trace_capability", fw_trace_capability_show, 0},
 	{"fw_trace_config", fw_trace_config_show, 0},
 	{"last_bootmode", last_bootmode_show, 0},
-- 
2.45.1

