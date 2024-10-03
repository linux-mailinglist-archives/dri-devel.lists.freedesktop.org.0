Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB998F795
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D989C10E93F;
	Thu,  3 Oct 2024 20:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AR4tYd/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E53810E90E;
 Thu,  3 Oct 2024 20:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcKPhT9PkOufEmD5btZZzDtigVVsiDnSsoBw91fZUNqy+sTglekb7oI+gacwZNTIPkvMK1QTT7j6oMqAJ25HaNte1iEqcBR4kaQWyypEra2jFO0q13jpBzc7S8fcCNA0l5r3KIBrbaxYM7G/ywZMf9kGqH9F890sw56v0HYK8Sc4qdU1T5U4lt+7D+ckvXyMXo56D3vJ5+M40zKRAoeSD/Lp9kuwQGoBwbkSy5MU9l7YCI2tZ3JTCn4/Daibe2Tss+MBxTWnjuiZ1QajILsGbhnBg8cd+up9HWWO98F+mTDs8UWUkU1e9ghdt9IY4rl18OWsSrc1zhPBwmt2+3968A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbRvHvFxktLcNpDBArcaqW0Wy6jB9hssMZEFYtK41UY=;
 b=k7MNHBdt8oVeIemdBEO2K+pMRmizMFF5YP5KFRP3paIh2DuVFbKcTX8pdHcQNB9Q+6whp2BrK3mXNyg2AhhC3rdNj4L5bmZgQzV9LeL4PPY8zQGp+BzvYrDaMzvl0ym/9pLWr+q7OBHggAh/qlVRQmBqtHzLM4UFOp7DrD6b0MjLBWJihjUDuCr4DBU1LPlCoqZmxFZsFsN+fltf3LQb7AOb3+91gtDBeyMwnfgCP/PwqRpb9CZcAOViNrJJ8bR2scEOZprXcH+74BWmCu76snNXG2seNrF85LtKXG/diU2llmYbUxGecw8+uDGW1fMAy5zacrRkyKMItECN52gvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbRvHvFxktLcNpDBArcaqW0Wy6jB9hssMZEFYtK41UY=;
 b=AR4tYd/RxVKcbQSD2Ukep3l4bTZ8Q3O9Qdy6SBgWIQshz/Nq8c68crfOu1b5XgYogSjUlzVmXstHBArRDdQfRFYprW1DFf9wFJYnf7Wj+6vMzpoavK74WN4CpAw+Ja/YbNTTZl6FMvzG4C0gGo8J58dIXsDz6PVEcJGFFxv25l4=
Received: from CH2PR14CA0040.namprd14.prod.outlook.com (2603:10b6:610:56::20)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 20:01:45 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::94) by CH2PR14CA0040.outlook.office365.com
 (2603:10b6:610:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 17/44] drm/colorop: Add 3x4 CTM type
Date: Thu, 3 Oct 2024 16:00:59 -0400
Message-ID: <20241003200129.1732122-18-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: aca8de4f-b3ff-4de3-18a6-08dce3e634df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZfWdzHhXk9vg/U7JZii8sLmIHciW8Y3ZLCYtpWt2kPyHax2dM/eSlnCk/tSs?=
 =?us-ascii?Q?NNkphmZQr7NYLfosB1PSBMFvvvt2O60mye5DqvmCST1/9LazhxhLWwbn3MkH?=
 =?us-ascii?Q?y0Ldj8cymW/mMhaKOGqc4F22vmQVcbTpEALN29BVkhg9jMN4SnOUQtpd9EDn?=
 =?us-ascii?Q?VpfgEWdI2w9Qh8RTk7JZA1DOsE26qdB4CwQhoy95vRTHFndo5VT118C+p+HV?=
 =?us-ascii?Q?qPn3QNV9L5ppMtU31ZPeLc39riuZp3ib/PFtZ0PnSewoSTrB/4HR7TLRQ6kK?=
 =?us-ascii?Q?z/S4em1ORe0cihceu3xnjmq3nOvPMs5/g+cqgV+LG/tLR9yz0TN+59Rg2Gvi?=
 =?us-ascii?Q?tuiQpmrSMPLC6a8Xt6z/y62fq3RRE4FILxcVapYWyAbcN3R0xelexLs5N1Iw?=
 =?us-ascii?Q?+fahyVMaEuM2gwdP/4zL9nNAQItlPUHIxgNa889nBQ4DwnbrizHYsQYzEr3h?=
 =?us-ascii?Q?RiMyw4/3ZfaGZPUUnRHE7cXE+E1CQ4hG7IP3pcGdKSU7bnu1/DqeEpUqG7kC?=
 =?us-ascii?Q?bpUp1ZYxpHJfyFD5OJB0XA/vW1AA+a8MGRijWS3dwcsJ0veYfuDwbypfZcWO?=
 =?us-ascii?Q?gVTJ6HFG4LP+P6L7BggNP0fbsXcCRmROQg+YWbs0KLUWu9kk3NfbfeoteLoC?=
 =?us-ascii?Q?7Bfq5OlkqfQGq3i7XRvdXSOUEKx0a32Ir4ZtqL05NlLNpdMz357fTORVwOSw?=
 =?us-ascii?Q?8nt+7dHd9VaWTGfrpxQLzix4+v7NPcPkf0GN1G0xj2o5KoiGABIay+lQNlH5?=
 =?us-ascii?Q?GVDXMMvz7nv+49RRjwnDj5wqeS+bPEMtvdLCOx4CtTkuFDL/0NcnGIUf+V45?=
 =?us-ascii?Q?SKcEOv+Kqz8oWut9/HyX/1Nhhs41JMBIVe0kxZ884ie0UyzhBjubrhBwwjVD?=
 =?us-ascii?Q?ds9AEda6h/KuOJvT3KfWS2/VL/JkGUP6V0WqDSb9xvihkf5oMJ66W56jzS8V?=
 =?us-ascii?Q?y8ime05rEjSlqQKKf1UGh6QBZeR7DpRIP/gAB2Co49JRGCRHXSkNwp61a+Uu?=
 =?us-ascii?Q?1ZJNX+6q9HUBmvU1M3arBK9kjCl6FBoWXiGS1k+HGhytf1gtYA6di/zv68mS?=
 =?us-ascii?Q?BeLXuhAfH7AGBTlcytKL6N/AbnthwPKamLAZa2R13QPeFFEzwNaykEtZdClJ?=
 =?us-ascii?Q?YMHq8yIuzdor9xBPU8Jt+7mbU0drkSfow2p3IcX9Ak8fJH91B5OOlZB6VSta?=
 =?us-ascii?Q?eusVZRREiCdYw3wezqShBjzC566AGBQ+6chMb8mWxCO4mzKZkHh1XA8qI1t4?=
 =?us-ascii?Q?uH/Si7Ndwcswvxm1bctq7DoctYVcXVlPdVbrGy4YxOTsDEwRbHTZQAVUN74h?=
 =?us-ascii?Q?Tg5H1A2zyRPUWWGs3/ojT3jdCWa/OxEiDiBSuZf4RTKAuiq57NJGE+dN6Io8?=
 =?us-ascii?Q?Y2aLZ7J/WfcOzsZMvf8iCD0L0B54?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:44.7537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca8de4f-b3ff-4de3-18a6-08dce3e634df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706
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

This type is used to support a 3x4 matrix in colorops. A 3x4
matrix uses the last column as a "bias" column. Some HW exposes
support for 3x4. The calculation looks like:

 out   matrix    in
 |R|   |0  1  2  3 |   | R |
 |G| = |4  5  6  7 | x | G |
 |B|   |8  9  10 11|   | B |
                       |1.0|

This is also the first colorop where we need a blob property to
program the property. For that we'll introduce a new DATA
property that can be used by all colorop TYPEs requiring a
blob. The way a DATA blob is read depends on the TYPE of
the colorop.

We only create the DATA property for property types that
need it.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v6:
 - take ref for DATA blob in duplicate_state func (Xaver Hugl)

v5:
 - Add function signature for init (Sebastian)
 - Fix kernel-doc

v4:
 - Create helper function for creating 3x4 CTM colorop
 - Fix CTM indexes in comment (Pekka)

 drivers/gpu/drm/drm_atomic.c      | 14 ++++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c | 29 +++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 42 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 ++++++++++++++++
 include/uapi/drm/amdgpu_drm.h     |  9 -------
 include/uapi/drm/drm_mode.h       | 24 +++++++++++++++++-
 6 files changed, 128 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 35136987d5e8..c58663327e6b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -787,7 +787,19 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
-	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		drm_printf(p, "\tcurve_1d_type=%s\n",
+			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
+	default:
+		break;
+	}
+
 	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index a9a95431c31f..12d9d18c1c78 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -691,6 +691,30 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }

+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t val)
+{
+	ssize_t elem_size = -1;
+	ssize_t size = -1;
+	bool replaced = false;
+
+	switch (colorop->type) {
+	case DRM_COLOROP_CTM_3X4:
+		size = sizeof(struct drm_color_ctm_3x4);
+		break;
+	default:
+		/* should never get here */
+		return -EINVAL;
+	}
+
+	return drm_property_replace_blob_from_id(colorop->dev,
+					&state->data,
+					val,
+					size,
+					elem_size,
+					&replaced);
+}

 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
@@ -700,6 +724,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop,
+					state, property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -722,6 +749,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 685dd18126aa..a995a0e25a34 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -63,6 +63,7 @@

 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };

 static const char * const colorop_curve_1d_type_names[] = {
@@ -201,11 +202,51 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 }
 EXPORT_SYMBOL(drm_colorop_curve_1d_init);

+static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
+{
+	struct drm_property *prop;
+
+	/* data */
+	prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+					"DATA", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->data_property = prop;
+	drm_object_attach_property(&colorop->base,
+					colorop->data_property,
+					0);
+
+	return 0;
+}
+
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane)
+{
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
 	memcpy(state, colorop->state, sizeof(*state));

+	if (state->data)
+		drm_property_blob_get(state->data);
+
 	state->bypass = true;
 }

@@ -287,6 +328,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)

 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };

 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 9721f90bdf90..edad9c579781 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -95,6 +95,14 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;

+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 */
+	struct drm_property_blob *data;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -199,6 +207,17 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;

+	/**
+	 * @data_property:
+	 *
+	 * blob property for any TYPE that requires a blob of data,
+	 * such as 1DLUT, CTM, 3DLUT, etc.
+	 *
+	 * The way this blob is interpreted depends on the TYPE of
+	 * this
+	 */
+	struct drm_property *data_property;
+
 	/**
 	 * @next_property:
 	 *
@@ -234,6 +253,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,

 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane);

 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index efe5de6ce208..e44362e74fa1 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1283,15 +1283,6 @@ struct drm_amdgpu_info_gpuvm_fault {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */

-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 53985d2b7eea..6fc1ce24800a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -847,6 +847,20 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };

+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -872,7 +886,15 @@ enum drm_colorop_type {
 	 * A 1D curve that is being applied to all color channels. The
 	 * curve is specified via the CURVE_1D_TYPE colorop property.
 	 */
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
+	DRM_COLOROP_CTM_3X4,
 };

 /**
--
2.46.2

