Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C74298F788
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A782A10E925;
	Thu,  3 Oct 2024 20:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZvX+Rr83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29D210E90F;
 Thu,  3 Oct 2024 20:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbM6iTSgPLsYGTFOpiD4uPFLacuTRENtFU6ZY0z+hvmdD8Y1GjWzq44ZTV47qTtdiEjbiHZLu5Lfe55VjzDGBytMWlvoENNqlIlpNa8f0LTzMbOt3uZAAursIOtQynLiHnmYdeHNGa1dpkuS3MGPxpb1O0+OrkXq5f9jcGY5zxFyJflwNl9ZI95VD/xmHcmJf6E3JZ9FGs8iYk1YTCcoydrw+neWsNJt0f2OHcLUBnIeiK4FOOVX92s0CZutBD2uBoe7ddD/0hhEfuEhUR2whcCXn6atOUrpoKW0wbm4z0kH74F6i791qXSwP2ZjEM60kMQD4OyaK5vqnAS3ZdzkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9GQ8d0mtw9wSfTSz23nkF1dIKD0AhmfFGKaCDl9uck=;
 b=YuF1y4jHHMImzrDxfKd+azl8cufXDfzzsIxybKkga+K/BiMnFUW997dFP6Vt86HyNnXB62YEzF45RHjDMk13mhm9m9SQF+Z3YThc2t1Hr+8UtYDmS/XpsmwFRkRndyjjgXR4IX4OzJMo+delSqwP5C0nIlhXZjB3hFxHhycH66S/hGw04Qcu0ocicVfSzOVa/nLV18mIXllXkaFSf/PR8hRV1qsR82ZiNBaNFJLenatX6b4bE1kskRzzIP4kDEL+4DDEHFdzXVU+9A+SkTZJquG/zSpfJCMnpWrdL+RhiGI/DeuF/4gG6B59L9sPJWw8f9pZraQac5GWTVTM8ONsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9GQ8d0mtw9wSfTSz23nkF1dIKD0AhmfFGKaCDl9uck=;
 b=ZvX+Rr83khTsYLPbcNAOKj9oHNYJrAF3rEsFwvR5bsB+q2hKkZPEMLbz/8Fw2wOxMm6b7zRWtqbOsTxv21gxECmzn8VYZQmVqDLLyaNKB5NPY43j8zRMJoQqvDm8ChGYIPs5wxxy9KIoqvxkl6tASmuFxpVRRUsi03aDeJmCKss=
Received: from CH0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:610:e5::21)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:42 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::db) by CH0PR03CA0256.outlook.office365.com
 (2603:10b6:610:e5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:38 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:38 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 10/44] drm/colorop: Add NEXT property
Date: Thu, 3 Oct 2024 16:00:52 -0400
Message-ID: <20241003200129.1732122-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 83991185-f8f9-44b5-3e82-08dce3e6322f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8BQfKybRV704ORx4BHN96kfHNM0tsAEyvE/o3heMTkfWGexQVEhjUdqM3tar?=
 =?us-ascii?Q?b6IHAGS6ChkSdrAuspc/USGHrgK0DOh9ncjGB4P19N3+BFl3v05Z+xwT5io2?=
 =?us-ascii?Q?IN+yr2y/0bLstB7QeB3aPDq2ImpO9FfRMLMnAfxVWocWfmHFhtJDbO2SMG9J?=
 =?us-ascii?Q?sB7ELL/JuWMFvL+iFGgiPUqIlaHhd6Vj+3oiSg8m6UTR13LsGS3hF118Jh7P?=
 =?us-ascii?Q?2zshl1AiIn6o9iG+0J/9o044Kt2YjYm541Vc0dI96vAd5vFtkEsCxT7+twio?=
 =?us-ascii?Q?md5/aLY6ESWUYs20zSzYRULxs8Zzd/dGjvZpJtrMQsupkUkNjg013zVCzs4b?=
 =?us-ascii?Q?imfid3CWFWtM7EscR/sUi4mkxXI5YzGy+27XQOt/ckzVY6CvJOkzg75wvh9p?=
 =?us-ascii?Q?Fx3p/8qBZXBkhmhEc1aIOsG2Z+rfdSwWlt4B+IVaAYkUwvlOrS6u1Zo7a2EK?=
 =?us-ascii?Q?gQ1oVJoRXgF+VZkPJu29Dvh2UoQWYQZY2Nb8zSV+9RUmK3eKrH/0cS9K8qfd?=
 =?us-ascii?Q?v8+CjLk3lFZOuaxKn7N+Bcl9G2bhfALBd79F5BfAitSo4srIgQYVGHTdpN/6?=
 =?us-ascii?Q?y69pbjUdtlN93fcrkvxfbPWiGnLXia1R+4FMTmqCGFLFIQML5EN7SghF7lc2?=
 =?us-ascii?Q?+e37MVw2esFiRBXaWfcLD2Lc+5BZijKoE0jVYBcIV/LO5fLReB2V2K/rmf9h?=
 =?us-ascii?Q?8Sb6XJ6/g7QvfcCNZBe7TgGHNSIIQXn07VTq9BpF1cfXAPSEUQ8EDBdcqhoR?=
 =?us-ascii?Q?2QxBXmhPUNDEztYgBkCsY3kdVFt6y4Rzfpgg1z7qnIrV145MPqKGXo70S/LV?=
 =?us-ascii?Q?i/LlyRmEJVcm6+OWyZrI07GyvealNl8HMgWWn3r2suR9xoF/wDuARdd6z4kW?=
 =?us-ascii?Q?dZ5w5llxUTQchsDvzBMVWpDCSdUq1VbtoBnFYeUvdyngkIolP4JQaoHTvkFe?=
 =?us-ascii?Q?XETUKMSVhi6nlH2eroGnAASCM423zKESl3OVU6+HtoMBf/NEbi/PE2GqvML7?=
 =?us-ascii?Q?eoPrHVBUkDqPf1yCvrShxchXkk9bqVzR3qVRkMNSN2+13OKcHsBy2A0zA6KN?=
 =?us-ascii?Q?qpqpZ3gLou49WMvhY0sTvTCJtCGBWJa//fontDgMNMyt5SNZTtitcyAFfQr0?=
 =?us-ascii?Q?P3sLe/Uyv83et725nL6xqBF1yk0LcehJ7dLRq3pMaJ1gRoOjOByi9nRBCCcU?=
 =?us-ascii?Q?HAFiGgUkqp4gBzDSVkMb9Uo1nE5521ew7IsSxJiVLmcepjZTvEh+6J64Dzhg?=
 =?us-ascii?Q?5yb5vLjSjVx1IYpxQx4RMqB5G8I+ecFR0SiQKnxUWir8IqjU9y/qqFhUrPMI?=
 =?us-ascii?Q?bPRrE5bVPtky5UoAihlFLKlRqfiqSnKF82/qK12E09kcArNpPIzzEdPOAlb8?=
 =?us-ascii?Q?Kgt34cs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:40.0582 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83991185-f8f9-44b5-3e82-08dce3e6322f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374
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

We'll construct color pipelines out of drm_colorop by
chaining them via the NEXT pointer. NEXT will point to
the next drm_colorop in the pipeline, or by 0 if we're
at the end of the pipeline.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v5:
 - move next comment here from Add 3x4 CTM patch (Sebastian)
 - Add kernel doc

v4:
 - Allow setting of NEXT property to NULL (Chaitanya Kumar Borah)

v3:
 - Add next pointer to colorop to be used by drivers
   and in DRM core

 drivers/gpu/drm/drm_colorop.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 054e7f01151b..685dd18126aa 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -88,6 +88,7 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;

 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -120,6 +121,16 @@ static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->bypass_property,
 				   1);

+	/* next */
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					  "NEXT", DRM_MODE_OBJECT_COLOROP);
+	if (!prop)
+		return -ENOMEM;
+	colorop->next_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->next_property,
+				   0);
+
 	return ret;
 }

@@ -293,3 +304,22 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty

 	return colorop_curve_1d_type_names[type];
 }
+
+/**
+ * drm_colorop_set_next_property - sets the next pointer
+ * @colorop: drm colorop
+ * @next: next colorop
+ *
+ * Should be used when constructing the color pipeline
+ */
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next)
+{
+	if (!colorop->next_property)
+		return;
+
+	drm_object_property_set_value(&colorop->base,
+				      colorop->next_property,
+				      next ? next->base.id : 0);
+	colorop->next = next;
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 29be3563eda1..9721f90bdf90 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -164,6 +164,14 @@ struct drm_colorop {
 	 */
 	enum drm_colorop_type type;

+	/**
+	 * @next:
+	 *
+	 * Read-only
+	 * Pointer to next drm_colorop in pipeline
+	 */
+	struct drm_colorop *next;
+
 	/**
 	 * @type_property:
 	 *
@@ -191,10 +199,20 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;

+	/**
+	 * @next_property:
+	 *
+	 * Read-only property to next colorop in the pipeline
+	 */
+	struct drm_property *next_property;
+
 };

 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)

+
+
+
 /**
  * drm_colorop_find - look up a Colorop object from its ID
  * @dev: DRM device
@@ -266,4 +284,6 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);

+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 #endif /* __DRM_COLOROP_H__ */
--
2.46.2

