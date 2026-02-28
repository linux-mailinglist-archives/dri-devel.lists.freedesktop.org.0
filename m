Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oASROB2Homn03gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:11:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760161C07E8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50E610E20F;
	Sat, 28 Feb 2026 06:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VL/9WSGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569B810E20E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:11:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 494D161335;
 Sat, 28 Feb 2026 06:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D93C116D0;
 Sat, 28 Feb 2026 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772259095;
 bh=+g2QiSGulufBYTf88A0NuxfMzHRY+qym1+cY0Bpkebg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VL/9WSGy9+HWXCIPJm9lmA8DgD/pGkD2OXr/HhCTuwP2cK0MzrHaBOaqivFILjXpQ
 uQMj8wW5IkOTmJOyhIMiNMtYQZ6B0XwMKgYqKwkQ9OnoDVR6TfKRwUBnxbtbynoY6o
 7VgZuq6mzKVcNwEILwH5ks4awAKgq9ivSTnlerJvuqiBs8KxFmgIOXLo0otf/C7Hk1
 cbKWICKQpsCLFru7bi5AZJsxPH89cAebfVHuOXPXP2h+U7MDeFmMN1U/1av9RwQpsk
 J/Sfrkchi/Ffd187ry4uZ5YQjZzpf12GJ/14DeYPb5RkONWSXBXmarf3s0xtjOw4qb
 yOQZgOzcPYoZQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, lizhi.hou@amd.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mripard@kernel.org,
 ogabbay@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: Mario Limonciello <superm1@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU power
 estimate
Date: Sat, 28 Feb 2026 00:10:57 -0600
Message-ID: <20260228061109.361239-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228061109.361239-1-superm1@kernel.org>
References: <20260228061109.361239-1-superm1@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:airlied@gmail.com,m:lizhi.hou@amd.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mripard@kernel.org,m:ogabbay@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:superm1@kernel.org,m:Shyam-sundar.S-k@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 760161C07E8
X-Rspamd-Action: no action

From: Lizhi Hou <lizhi.hou@amd.com>

The AMD PMF driver provides an interface to obtain realtime power
estimates for the NPU. Expose this information to userspace through a
new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
the current NPU power level.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
(Update comment to indicate power and utilization)
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 20 +++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 85079b6fc5d90..a2e586512e26c 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/firmware.h>
@@ -783,6 +784,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 	return ret;
 }
 
+static int aie2_get_sensors(struct amdxdna_client *client,
+			    struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_sensor sensor = {};
+	int ret;
+
+	if (args->buffer_size < sizeof(sensor))
+		return -EINVAL;
+
+	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
+	if (ret)
+		return ret;
+	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
+	sensor.unitm = -3;
+	scnprintf(sensor.label, sizeof(sensor.label), "Total Power");
+	scnprintf(sensor.units, sizeof(sensor.units), "mW");
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
+		return -EFAULT;
+
+	args->buffer_size = sizeof(sensor);
+
+	return 0;
+}
+
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
 	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
@@ -986,6 +1012,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
 		ret = aie2_get_clock_metadata(client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_SENSORS:
+		ret = aie2_get_sensors(client, args);
+		break;
 	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
 		ret = aie2_get_hwctx_status(client, args);
 		break;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index b20a3661078cc..1bb88711bedb3 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -7,6 +7,7 @@
 #define _AIE2_PCI_H_
 
 #include <drm/amdxdna_accel.h>
+#include <linux/limits.h>
 #include <linux/semaphore.h>
 
 #include "amdxdna_mailbox.h"
@@ -46,6 +47,25 @@
 	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
 })
 
+#if IS_ENABLED(CONFIG_AMD_PMF)
+#define AIE2_GET_PMF_NPU_DATA(field, val)				\
+({									\
+	struct amd_pmf_npu_metrics _npu_metrics;			\
+	int _ret;							\
+									\
+	_ret = amd_pmf_get_npu_data(&_npu_metrics);			\
+	val = _ret ? U32_MAX : _npu_metrics.field;			\
+	(_ret);								\
+})
+#else
+#define SENSOR_DEFAULT_npu_power	U32_MAX
+#define AIE2_GET_PMF_NPU_DATA(field, val)				\
+({									\
+	val = SENSOR_DEFAULT_##field;					\
+	(-EOPNOTSUPP);							\
+})
+#endif
+
 enum aie2_smu_reg_idx {
 	SMU_CMD_REG = 0,
 	SMU_ARG_REG,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index a4384593bdccb..98720ddc9818e 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -35,9 +35,10 @@ MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
  * 0.4: Support getting resource information
  * 0.5: Support getting telemetry data
  * 0.6: Support preemption
+ * 0.7: Support getting power and utilization data
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		6
+#define AMDXDNA_DRIVER_MINOR		7
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
-- 
2.43.0

