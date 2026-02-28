Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAXJNx6Homn03gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:11:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A91C07EF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 07:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF22110E210;
	Sat, 28 Feb 2026 06:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HQCy6FjZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5D10E20F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 06:11:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A517D6133A;
 Sat, 28 Feb 2026 06:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B14C19425;
 Sat, 28 Feb 2026 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772259096;
 bh=pbmm7gwghzfjlFueHY+i26kTwplTc9Y/DH07zc829hI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HQCy6FjZkCu93hjaj2iDkKVb3FRluw74lVjjvKpfqzqU+JCeDdwusQj37P+fI0BKj
 dtcz74P0BSbtSdWLnw7KQ0+uBQsZyP/6W4oVHKqVFAG9/65hsfyf38H7ocpo5wSVK4
 U9YBkox5WcFKnUNHJbpfSfXgiOMxHeTISbg65LxLIFH3U8zK3Z075TSCgScyPeH8Th
 2Vk+3Hd4sj7p9IlZ/MOmsFlYLOitXkAquULJ64Y0no/Bt02W4D0qplheu8cpoHwA+F
 s3MreVoaG/7p6dxRkJHHPTIBqV+wnJLlpjboCt05yETj6hhAWQ9D+J/gqSMu4fBhm+
 Shy9o+G0Y1AQw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, airlied@gmail.com, lizhi.hou@amd.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mripard@kernel.org,
 ogabbay@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] accel/amdxdna: Support sensors for column utilization
Date: Sat, 28 Feb 2026 00:10:58 -0600
Message-ID: <20260228061109.361239-3-superm1@kernel.org>
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:airlied@gmail.com,m:lizhi.hou@amd.com,m:maarten.lankhorst@linux.intel.com,m:mamin506@gmail.com,m:mripard@kernel.org,m:ogabbay@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:superm1@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 936A91C07EF
X-Rspamd-Action: no action

The AMD PMF driver provides realtime column utilization (npu_busy)
metrics for the NPU. Extend the DRM_IOCTL_AMDXDNA_GET_INFO sensor
query to expose these metrics to userspace.

Add AMDXDNA_SENSOR_TYPE_COLUMN_UTILIZATION to the sensor type enum
and update aie2_get_sensors() to return both the total power and up
to 8 column utilization sensors if the user buffer permits.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/accel/amdxdna/aie2_pci.c | 27 ++++++++++++++++++++++++---
 drivers/accel/amdxdna/aie2_pci.h |  2 ++
 include/uapi/drm/amdxdna_accel.h |  3 ++-
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index a2e586512e26c..1f11822f0bfda 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -787,16 +787,24 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 static int aie2_get_sensors(struct amdxdna_client *client,
 			    struct amdxdna_drm_get_info *args)
 {
+	struct amdxdna_dev_hdl *ndev = client->xdna->dev_handle;
 	struct amdxdna_drm_query_sensor sensor = {};
+	struct amd_pmf_npu_metrics npu_metrics;
+	u32 sensors_count, util_count, i;
 	int ret;
 
-	if (args->buffer_size < sizeof(sensor))
+	util_count = min_t(u32, ndev->total_col, 8);
+	sensors_count = 1 + util_count;
+
+	if (args->buffer_size < sensors_count * sizeof(sensor))
 		return -EINVAL;
 
-	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
+	ret = AIE2_GET_PMF_NPU_METRICS(&npu_metrics);
 	if (ret)
 		return ret;
+
 	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
+	sensor.input = npu_metrics.npu_power;
 	sensor.unitm = -3;
 	scnprintf(sensor.label, sizeof(sensor.label), "Total Power");
 	scnprintf(sensor.units, sizeof(sensor.units), "mW");
@@ -804,7 +812,20 @@ static int aie2_get_sensors(struct amdxdna_client *client,
 	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
 		return -EFAULT;
 
-	args->buffer_size = sizeof(sensor);
+	for (i = 0; i < util_count; i++) {
+		memset(&sensor, 0, sizeof(sensor));
+		sensor.input = npu_metrics.npu_busy[i];
+		sensor.type = AMDXDNA_SENSOR_TYPE_COLUMN_UTILIZATION;
+		sensor.unitm = 0;
+		scnprintf(sensor.label, sizeof(sensor.label), "Column %d Utilization", i);
+		scnprintf(sensor.units, sizeof(sensor.units), "%%");
+
+		if (copy_to_user(u64_to_user_ptr(args->buffer) + (i + 1) * sizeof(sensor),
+				 &sensor, sizeof(sensor)))
+			return -EFAULT;
+	}
+
+	args->buffer_size = sensors_count * sizeof(sensor);
 
 	return 0;
 }
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 1bb88711bedb3..424fd6d852191 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -48,6 +48,7 @@
 })
 
 #if IS_ENABLED(CONFIG_AMD_PMF)
+#define AIE2_GET_PMF_NPU_METRICS(metrics) amd_pmf_get_npu_data(metrics)
 #define AIE2_GET_PMF_NPU_DATA(field, val)				\
 ({									\
 	struct amd_pmf_npu_metrics _npu_metrics;			\
@@ -58,6 +59,7 @@
 	(_ret);								\
 })
 #else
+#define AIE2_GET_PMF_NPU_METRICS(metrics) (-EOPNOTSUPP)
 #define SENSOR_DEFAULT_npu_power	U32_MAX
 #define AIE2_GET_PMF_NPU_DATA(field, val)				\
 ({									\
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 9c44db2b3dcd4..5bd13f4435f55 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -353,7 +353,8 @@ struct amdxdna_drm_query_clock_metadata {
 };
 
 enum amdxdna_sensor_type {
-	AMDXDNA_SENSOR_TYPE_POWER
+	AMDXDNA_SENSOR_TYPE_POWER,
+	AMDXDNA_SENSOR_TYPE_COLUMN_UTILIZATION
 };
 
 /**
-- 
2.43.0

