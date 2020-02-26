Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FAB170851
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AD86EBC5;
	Wed, 26 Feb 2020 19:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44606EBA9;
 Wed, 26 Feb 2020 19:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUMMbuZM8ZuxYLqIzil8RdXG6RMy0cPBljgeiJ7VG/IX3dPFycGIBLpMj1PQ5iiFKcX0nMxQHIMFBs7EuwJnxm+V8qvhsUyqWOB86yekCMgCRcIJfutof4GJ4B1/vhXhbxS1Owfj9jADb48xVKmZ33I34fC59s93QL/C+69N5jH7oc5ldCdJLKymCvh+qKEW3Ye3+thU6IrZhYDcSEzHMh8a2sDEU/4tt3jSWhJ9ZYectMwbYsVq2IiZH5LjeUHTDo61c590QItiO0EB3qDI0Gb6ElWn+tumBKvDNumg0OOIhJ9EkD541tbsTcPb3CHUz2j30Y2HEniROxMUJEiG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZS7Y5c64/ZEFBwFzkh5BDxJTRdiicRP1BQpcSK8Pf4=;
 b=mZ/Ywv72rCQsi7MZFcFFiXgoum2yOqu2Cj59FADByhoMhJ8kot4DMt3CR9mTI2AdGOdYJ1NkKOXCmIL8QOElgIXbhqNSKxl58VTvbLad90CzqQDq36fo65MaSBY13PQXCAfsEY2o1jlbYnmjZdZZ1c+E0z2FhqAQkOACD3zDLpxdI6zZbw40BVysACAdlCUU23O0KuP9A7oLZVy+48Mymsva2DXveRimpJ3M2y1a2rcEeC9wtpQAzjupVKKwV59C52DntOOZNkFt9CLO0PDwl0ZrVPEZa8yIDApZElOEkwDt0AqR+Wt8d5ti0VSrvBdeRMKBijpjdBr2ciRg3vLl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZS7Y5c64/ZEFBwFzkh5BDxJTRdiicRP1BQpcSK8Pf4=;
 b=PIMxun9I+kyJMFzZGLPIWePdBPuyMJDae3MkHwey25jHG2DWdowd1GYYUveoGs4+gHT80yORKBy+3zlv+p9CCKqs8m31uaGVMDku0dOCpfALlCyUg6V/EbivxK7sXR19Nx59/IIQgSjxgJk2Bq0lwHRWXamiQxBKMAypfFAAYjA=
Received: from DM5PR04CA0066.namprd04.prod.outlook.com (2603:10b6:3:ef::28) by
 DM6PR12MB2969.namprd12.prod.outlook.com (2603:10b6:5:115::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Wed, 26 Feb 2020 19:02:10 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ef:cafe::b6) by DM5PR04CA0066.outlook.office365.com
 (2603:10b6:3:ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:09 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:09 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:08 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 09/11] drm, cgroup: Add compute as gpu cgroup resource
Date: Wed, 26 Feb 2020 14:01:50 -0500
Message-ID: <20200226190152.16131-10-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226190152.16131-1-Kenny.Ho@amd.com>
References: <lkaplan@cray.com; daniel@ffwll.ch; nirmoy.das@amd.com;
 damon.mcdougall@amd.com; juan.zuniga-anaya@amd.com; hannes@cmpxchg.org>
 <20200226190152.16131-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(428003)(199004)(189003)(70206006)(356004)(6666004)(5660300002)(81156014)(81166006)(70586007)(8676002)(1076003)(36756003)(4326008)(86362001)(7696005)(30864003)(316002)(2906002)(478600001)(8936002)(186003)(26005)(2616005)(336012)(426003)(110136005)(921003)(83996005)(2101003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2969; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f200430-4511-432a-43e3-08d7baee61e1
X-MS-TrafficTypeDiagnostic: DM6PR12MB2969:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2969CFC8AD27B3FED5610EBF83EA0@DM6PR12MB2969.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hudmHUcIjsfGTeIrJyggKrIhUo0DyjInxYJHdzQvFbb49YlS0R9/VkqKEZxOb/tOC7NPeF4oMm/Q3xjWhaEaav+aPuRyIa4dkFu+3IZH7Gt6ZjF2fp8R5kj8B2LO/nA+3YDtXdspiIZlQPcaeLU+fs7eEMpNYcRUvMVH/iaav6owvUC4RwGZ76j2kx7j1s05p0LC8t4Ps5mFhNu914CXB117Xxe8tsY4KZrV5/jkECL0yaGSRsqGtycGXm6DxQcyJDCAmx56sc3GaaPLqoOlrkzbW+LnPCsHVdaMZRe9KVBaw79TTBK9rwqMwVe+H8/vZbdXhnSrWczIEBiHoY90aPuAY+PqTAMjsOHVLxGUkzguc9Si+2Z2OuhpFoBrE0enYZbryOSrRtcAWrKB8XjHgB4Kl26ns46AhITJTmeXN5sHTK2GTfTGj3ma/+/XheoItFwn3SPF7ZOqGwtGMT55B5rgo5OB1E9HpJQBnpoowaIdrO6L6Fn+8pjsRQkfEbPgqGxN4m/ocqWi66uXXSY2o/s8anYo5gj1gaEwDt9sPpo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:10.2320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f200430-4511-432a-43e3-08d7baee61e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2969
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gpu.compute.weight
      A read-write flat-keyed file which exists on all cgroups.  The
      default weight is 100.  Each entry is keyed by the DRM device's
      major:minor (the primary minor).  The weights are in the range [1,
      10000] and specifies the relative amount of physical partitions
      the cgroup can use in relation to its siblings.  The partition
      concept here is analogous to the subdevice of OpenCL.

gpu.compute.effective
      A read-only nested-keyed file which exists on all cgroups.  Each
      entry is keyed by the DRM device's major:minor.

      It lists the GPU subdevices that are actually granted to this
      cgroup by its parent.  These subdevices are allowed to be used by
      tasks within the current cgroup.

      =====     ==============================================
      count     The total number of granted subdevices
      list      Enumeration of the subdevices
      =====     ==============================================

Change-Id: Idde0ef9a331fd67bb9c7eb8ef9978439e6452488
Signed-off-by: Kenny Ho <Kenny.Ho@amd.com>
---
 Documentation/admin-guide/cgroup-v2.rst |  21 +++
 include/drm/drm_cgroup.h                |   3 +
 include/linux/cgroup_drm.h              |  16 +++
 kernel/cgroup/drm.c                     | 177 +++++++++++++++++++++++-
 4 files changed, 215 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 581343472651..f92f1f4a64d4 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2126,6 +2126,27 @@ GPU Interface Files
 	Set largest allocation for /dev/dri/card1 to 4MB
 	echo "226:1 4m" > gpu.buffer.peak.max
 
+  gpu.compute.weight
+	A read-write flat-keyed file which exists on all cgroups.  The
+	default weight is 100.  Each entry is keyed by the DRM device's
+	major:minor (the primary minor).  The weights are in the range
+	[1, 10000] and specifies the relative amount of physical partitions 
+	the cgroup can use in relation to its siblings.  The partition
+	concept here is analogous to the subdevice concept of OpenCL.
+
+  gpu.compute.effective
+  	A read-only nested-keyed file which exists on all cgroups.
+	Each entry is keyed by the DRM device's major:minor.
+
+	It lists the GPU subdevices that are actually granted to this
+	cgroup by its parent.  These subdevices are allowed to be used
+	by tasks within the current cgroup.
+
+	  =====		==============================================
+	  count		The total number of granted subdevices
+	  list		Enumeration of the subdevices
+	  =====		==============================================
+
 GEM Buffer Ownership
 ~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
index 2b41d4d22e33..5aac47ca536f 100644
--- a/include/drm/drm_cgroup.h
+++ b/include/drm/drm_cgroup.h
@@ -17,6 +17,9 @@ struct drmcg_props {
 
 	s64			bo_limits_total_allocated_default;
 	s64			bo_limits_peak_allocated_default;
+
+	int			compute_capacity;
+	DECLARE_BITMAP(compute_slots, MAX_DRMCG_COMPUTE_CAPACITY);
 };
 
 void drmcg_bind(struct drm_minor (*(*acq_dm)(unsigned int minor_id)),
diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
index aba3b26718c0..fd02f59cabab 100644
--- a/include/linux/cgroup_drm.h
+++ b/include/linux/cgroup_drm.h
@@ -11,10 +11,14 @@
 /* limit defined per the way drm_minor_alloc operates */
 #define MAX_DRM_DEV (64 * DRM_MINOR_RENDER)
 
+#define MAX_DRMCG_COMPUTE_CAPACITY 256
+
 enum drmcg_res_type {
 	DRMCG_TYPE_BO_TOTAL,
 	DRMCG_TYPE_BO_PEAK,
 	DRMCG_TYPE_BO_COUNT,
+	DRMCG_TYPE_COMPUTE,
+	DRMCG_TYPE_COMPUTE_EFF,
 	__DRMCG_TYPE_LAST,
 };
 
@@ -32,6 +36,18 @@ struct drmcg_device_resource {
 	s64			bo_limits_peak_allocated;
 
 	s64			bo_stats_count_allocated;
+
+        /* compute_stg is used to calculate _eff before applying to _eff
+	 * after considering the entire hierarchy
+	 */
+	DECLARE_BITMAP(compute_stg, MAX_DRMCG_COMPUTE_CAPACITY);
+	/* user configurations */
+	s64			compute_weight;
+	/* effective compute for the cgroup after considering
+	 * relationship with other cgroup
+	 */
+	s64			compute_count_eff;
+	DECLARE_BITMAP(compute_eff, MAX_DRMCG_COMPUTE_CAPACITY);
 };
 
 /**
diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
index 62d2a9d33d0c..2eadabebdfea 100644
--- a/kernel/cgroup/drm.c
+++ b/kernel/cgroup/drm.c
@@ -9,6 +9,7 @@
 #include <linux/seq_file.h>
 #include <linux/mutex.h>
 #include <linux/kernel.h>
+#include <linux/bitmap.h>
 #include <linux/cgroup_drm.h>
 #include <drm/drm_file.h>
 #include <drm/drm_drv.h>
@@ -98,6 +99,11 @@ static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
 	ddr->bo_limits_peak_allocated =
 		dev->drmcg_props.bo_limits_peak_allocated_default;
 
+	bitmap_copy(ddr->compute_stg, dev->drmcg_props.compute_slots,
+			MAX_DRMCG_COMPUTE_CAPACITY);
+
+	ddr->compute_weight = CGROUP_WEIGHT_DFL;
+
 	return 0;
 }
 
@@ -121,6 +127,104 @@ static inline void drmcg_update_cg_tree(struct drm_device *dev)
 	mutex_unlock(&cgroup_mutex);
 }
 
+static void drmcg_calculate_effective_compute(struct drm_device *dev,
+		const unsigned long *free_weighted,
+		struct drmcg *parent_drmcg)
+{
+	int capacity = dev->drmcg_props.compute_capacity;
+	DECLARE_BITMAP(compute_unused, MAX_DRMCG_COMPUTE_CAPACITY);
+	DECLARE_BITMAP(compute_by_weight, MAX_DRMCG_COMPUTE_CAPACITY);
+	struct drmcg_device_resource *parent_ddr;
+	struct drmcg_device_resource *ddr;
+	int minor = dev->primary->index;
+	struct cgroup_subsys_state *pos;
+	struct drmcg *child;
+	s64 weight_sum = 0;
+	s64 unused;
+
+	parent_ddr = parent_drmcg->dev_resources[minor];
+
+	/* no static cfg, use weight for calculating the effective */
+	bitmap_copy(parent_ddr->compute_stg, free_weighted, capacity);
+
+	/* calculate compute available for dist by weight for children */
+	bitmap_copy(compute_unused, parent_ddr->compute_stg, capacity);
+	unused = bitmap_weight(compute_unused, capacity);
+	css_for_each_child(pos, &parent_drmcg->css) {
+		child = css_to_drmcg(pos);
+		ddr = child->dev_resources[minor];
+
+		/* no static allocation, participate in weight dist */
+		weight_sum += ddr->compute_weight;
+	}
+
+	css_for_each_child(pos, &parent_drmcg->css) {
+		int c;
+		int p = 0;
+		child = css_to_drmcg(pos);
+		ddr = child->dev_resources[minor];
+
+		bitmap_zero(compute_by_weight, capacity);
+		for (c = ddr->compute_weight * unused / weight_sum;
+				c > 0; c--) {
+			p = find_next_bit(compute_unused, capacity, p);
+			if (p < capacity) {
+				clear_bit(p, compute_unused);
+				set_bit(p, compute_by_weight);
+			}
+		}
+
+		drmcg_calculate_effective_compute(dev, compute_by_weight, child);
+	}
+}
+
+static void drmcg_apply_effective_compute(struct drm_device *dev)
+{
+	int capacity = dev->drmcg_props.compute_capacity;
+	int minor = dev->primary->index;
+	struct drmcg_device_resource *ddr;
+	struct cgroup_subsys_state *pos;
+	struct drmcg *drmcg;
+
+	if (root_drmcg == NULL) {
+		WARN_ON(root_drmcg == NULL);
+		return;
+	}
+
+	rcu_read_lock();
+
+	/* process the entire cgroup tree from root to simplify the algorithm */
+	drmcg_calculate_effective_compute(dev, dev->drmcg_props.compute_slots,
+                                            root_drmcg);
+
+	/* apply changes to effective only if there is a change */
+	css_for_each_descendant_pre(pos, &root_drmcg->css) {
+		drmcg = css_to_drmcg(pos);
+		ddr = drmcg->dev_resources[minor];
+
+		if (!bitmap_equal(ddr->compute_stg,
+                            ddr->compute_eff, capacity)) {
+			bitmap_copy(ddr->compute_eff, ddr->compute_stg,
+                                capacity);
+			ddr->compute_count_eff =
+				bitmap_weight(ddr->compute_eff, capacity);
+		}
+	}
+	rcu_read_unlock();
+}
+
+static void drmcg_apply_effective(enum drmcg_res_type type,
+		struct drm_device *dev, struct drmcg *changed_drmcg)
+{
+	switch (type) {
+	case DRMCG_TYPE_COMPUTE:
+		drmcg_apply_effective_compute(dev);
+		break;
+	default:
+		break;
+	}
+}
+
 /**
  * drmcg_register_dev - register a DRM device for usage in drm cgroup
  * @dev: DRM device
@@ -143,7 +247,13 @@ void drmcg_register_dev(struct drm_device *dev)
 	{
 		dev->driver->drmcg_custom_init(dev, &dev->drmcg_props);
 
+		WARN_ON(dev->drmcg_props.compute_capacity !=
+				bitmap_weight(dev->drmcg_props.compute_slots,
+					MAX_DRMCG_COMPUTE_CAPACITY));
+
 		drmcg_update_cg_tree(dev);
+
+		drmcg_apply_effective(DRMCG_TYPE_COMPUTE, dev, root_drmcg);
 	}
 	mutex_unlock(&drmcg_mutex);
 }
@@ -297,7 +407,8 @@ static void drmcg_print_stats(struct drmcg_device_resource *ddr,
 }
 
 static void drmcg_print_limits(struct drmcg_device_resource *ddr,
-		struct seq_file *sf, enum drmcg_res_type type)
+		struct seq_file *sf, enum drmcg_res_type type,
+		struct drm_device *dev)
 {
 	if (ddr == NULL) {
 		seq_puts(sf, "\n");
@@ -311,6 +422,17 @@ static void drmcg_print_limits(struct drmcg_device_resource *ddr,
 	case DRMCG_TYPE_BO_PEAK:
 		seq_printf(sf, "%lld\n", ddr->bo_limits_peak_allocated);
 		break;
+	case DRMCG_TYPE_COMPUTE:
+		seq_printf(sf, "%lld\n", ddr->compute_weight);
+		break;
+	case DRMCG_TYPE_COMPUTE_EFF:
+		seq_printf(sf, "%s=%lld %s=%*pbl\n",
+				"count",
+				ddr->compute_count_eff,
+				"list",
+				dev->drmcg_props.compute_capacity,
+				ddr->compute_eff);
+		break;
 	default:
 		seq_puts(sf, "\n");
 		break;
@@ -358,7 +480,7 @@ static int drmcg_seq_show_fn(int id, void *ptr, void *data)
 		drmcg_print_stats(ddr, sf, type);
 		break;
 	case DRMCG_FTYPE_LIMIT:
-		drmcg_print_limits(ddr, sf, type);
+		drmcg_print_limits(ddr, sf, type, minor->dev);
 		break;
 	case DRMCG_FTYPE_DEFAULT:
 		drmcg_print_default(&minor->dev->drmcg_props, sf, type);
@@ -499,9 +621,25 @@ static ssize_t drmcg_limit_write(struct kernfs_open_file *of, char *buf,
 
 			ddr->bo_limits_peak_allocated = val;
 			break;
+		case DRMCG_TYPE_COMPUTE:
+			rc = drmcg_process_limit_s64_val(sattr, true,
+				CGROUP_WEIGHT_DFL, CGROUP_WEIGHT_MAX,
+				&val);
+
+			if (rc || val < CGROUP_WEIGHT_MIN ||
+						val > CGROUP_WEIGHT_MAX) {
+				drmcg_pr_cft_err(drmcg, rc, cft_name, minor);
+				break;
+			}
+
+			ddr->compute_weight = val;
+			break;
 		default:
 			break;
 		}
+
+		drmcg_apply_effective(type, dm->dev, drmcg);
+
 		mutex_unlock(&dm->dev->drmcg_mutex);
 
 		mutex_lock(&drmcg_mutex);
@@ -560,12 +698,44 @@ struct cftype files[] = {
 		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_BO_COUNT,
 						DRMCG_FTYPE_STATS),
 	},
+	{
+		.name = "compute.weight",
+		.seq_show = drmcg_seq_show,
+		.write = drmcg_limit_write,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_COMPUTE,
+						DRMCG_FTYPE_LIMIT),
+	},
+	{
+		.name = "compute.effective",
+		.seq_show = drmcg_seq_show,
+		.private = DRMCG_CTF_PRIV(DRMCG_TYPE_COMPUTE_EFF,
+						DRMCG_FTYPE_LIMIT),
+	},
 	{ }	/* terminate */
 };
 
+static int drmcg_online_fn(int id, void *ptr, void *data)
+{
+	struct drm_minor *minor = ptr;
+	struct drmcg *drmcg = data;
+
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
+	drmcg_apply_effective(DRMCG_TYPE_COMPUTE, minor->dev, drmcg);
+
+	return 0;
+}
+
+static int drmcg_css_online(struct cgroup_subsys_state *css)
+{
+	return drm_minor_for_each(&drmcg_online_fn, css_to_drmcg(css));
+}
+
 struct cgroup_subsys gpu_cgrp_subsys = {
 	.css_alloc	= drmcg_css_alloc,
 	.css_free	= drmcg_css_free,
+	.css_online	= drmcg_css_online,
 	.early_init	= false,
 	.legacy_cftypes	= files,
 	.dfl_cftypes	= files,
@@ -585,6 +755,9 @@ void drmcg_device_early_init(struct drm_device *dev)
 	dev->drmcg_props.bo_limits_total_allocated_default = S64_MAX;
 	dev->drmcg_props.bo_limits_peak_allocated_default = S64_MAX;
 
+	dev->drmcg_props.compute_capacity = MAX_DRMCG_COMPUTE_CAPACITY;
+	bitmap_fill(dev->drmcg_props.compute_slots, MAX_DRMCG_COMPUTE_CAPACITY);
+
 	drmcg_update_cg_tree(dev);
 }
 EXPORT_SYMBOL(drmcg_device_early_init);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
