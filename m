Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED70A7E5B5E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A75510E7B2;
	Wed,  8 Nov 2023 16:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3198D10E7B2;
 Wed,  8 Nov 2023 16:37:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIYrtci5YXG9DejbroiecjFQKmx38vuJEutuEWahIiZ9Hdse5CUCb68IKltkApnILwkMDAUOQZjZF9UEkxHS/9D61DexbKidCrIK+sa/lPvagh87lic09uBTfGCX5d7nZGRqoDlJ8O6p+ynsONCrlu7Px2bP2zVtA1hBRsJJi4/GiCH5OxaIJcuKBznSsq8TErlrDgmiWeBEQ0nt4dqKTDa1slU8YtXZhRaxHoo8vfqsoxj/Lqdh7rvaIh9jd3MbHYTolzntFq54/q3E8yW6nPX8MgDNaIt1zp3RYNbeCCOPM2zap67EEZjLkXTKK91cOaIrPoZ4LV/2X/15ta4eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN7q3H1fLgtQBtd5WIysl3Ekf7Efou4YstmIgpqkOzA=;
 b=fpNFFHZPK6mrwt8vPpYOlddhV3/kEC/626lG7pLeM0nlYTYNgSB3/ozh0Sd8YhyQiScNMB04/eWAahwciSTeMP/AouBes0hUZazLmcHrVMdCS7Whjl5W7mCzJMV94AMDJ2bzY/Oyjcnu7sod5J1/at28ZoV0pkC/CD+sSjve/M7YJnoqpBrL/ZlcxXz4Ytc1W9WjsoFnJeRCWsuo1Xu0fzuR4lXoHcg7jRTmbXhrU59y6AddFihMOJnTwQQYo1m3Oz+lyPQZE3E9VCSJAMB3/DRenIb+EssmCY/rG67B8PnDjdkaZg9/4kQIMX+NgwO5TRiLJdBRRgIqWjA8dGnwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GN7q3H1fLgtQBtd5WIysl3Ekf7Efou4YstmIgpqkOzA=;
 b=istczf/G8MPgr+ULd6NAm8oNeFRmM0SrJUj3F63We0mMAaxltjqEJ5gNCZdRaqh+5+295hzOGaYhtQxApVI5y6FbxmM7MohKId98bxUzoGHcqZJtzUN4uHJ3Ecd5rXtQDdLBp1Ld2uLQ2+JmyqIk8P6aRJEyDpsd22wp+9BLyQg=
Received: from BLAPR03CA0089.namprd03.prod.outlook.com (2603:10b6:208:329::34)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 16:37:54 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::2c) by BLAPR03CA0089.outlook.office365.com
 (2603:10b6:208:329::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:15 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:15 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 11/23] drm/colorop: Add NEXT property
Date: Wed, 8 Nov 2023 11:36:30 -0500
Message-ID: <20231108163647.106853-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: c2708358-b40a-4968-24b5-08dbe0790ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6cJIEsCzJZQTzwnCpGTaFaAZJAc73mrezoO0uplMj17kga1A0KeHquY1V6bJObLlmTM3qgqQoNtfKJPRydHj+M/Mv99lFF8QsiuNKqFNkrpPX8ri8lgLPRtO7cIsisHwA5a1ZTRy8jmm8NbwmfTDu4+ab1UnBmJ8O+daGvk+g6mIVUcMQCKEjtX6VYPFwyt+/+WiYAPFAt1R4acocBnIKico79p85YFCaUq4jRqLc/dQOqwTJgpJmhL2g/XDujQNkMwnv4wPpx/bkKS1mvV/1LpOrT/s8rTtbLHiHsln4nz92hM1mSg6QjTijGfpw7f0UfmVqE4w3Z69zLjVmoRdaz9MyV+tPkrA0CxX5rEjZf4RyyhbneHunPEUI7x9sizBucMSCQl24MWvrN8sjfguC4xVsMH0yEIaVnLR6waomzscxAIuDPFX9m9F/pCpqOEE9CC1kvy1I65m4wdgb2KJBgIgbCtfqut7TXUrSwxt9N5cueU9H0+bNhy8gukJv565doTyUeNBy+O4yJu0fHtf0u67puEHtu3s2hkxCw3S8JMBW19lKFI6WLSsaBMXtlTfLwbzD7YFk9vZXFDp1NTZQu+l1EBubiwcYk6dlS5MCdxZXMzlFq/C3+0HuZsKqFusaOzmCyYtA1CI2/PuQQVsYugFP2bdvtMEeMKNqRWoowC8bAxhi0tuQfeCgKjfKZPHjnWidYYR761E5N2O0QPxhaSK8duzGJ6jbmMSksDX+0tftGEGdhG0umjjfB6tUI7L5Wf9upMyIVyh/+t5A9tayg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(82310400011)(451199024)(186009)(1800799009)(64100799003)(46966006)(36840700001)(40470700004)(1076003)(336012)(426003)(2906002)(26005)(41300700001)(5660300002)(2616005)(40480700001)(40460700003)(36860700001)(47076005)(81166007)(356005)(450100002)(44832011)(6666004)(36756003)(8936002)(478600001)(86362001)(4326008)(8676002)(70206006)(70586007)(54906003)(316002)(6916009)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:54.5464 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2708358-b40a-4968-24b5-08dbe0790ebc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll construct color pipelines out of drm_colorop by
chaining them via the NEXT pointer. NEXT will point to
the next drm_colorop in the pipeline, or by 0 if we're
at the end of the pipeline.

v3:
 - Add next pointer to colorop to be used by drivers
   and in DRM core

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 20 ++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 17ba11ae205b..e62acf68bf9e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -58,6 +58,7 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 	colorop->dev = dev;
 	colorop->type = type;
 	colorop->plane = plane;
+	colorop->next = NULL;
 
 	list_add_tail(&colorop->head, &config->colorop_list);
 	colorop->index = config->num_colorop++;
@@ -104,6 +105,15 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->curve_1d_type_property,
 				   0);
 
+	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+			"NEXT", DRM_MODE_OBJECT_COLOROP);
+	if (!prop)
+		return -ENOMEM;
+	colorop->next_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->next_property,
+				   0);
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_colorop_init);
@@ -245,3 +255,22 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 
 	return colorop_curve_1d_type_name[type];
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
+				      next->base.id);
+	colorop->next = next;
+}
+EXPORT_SYMBOL(drm_colorop_set_next_property);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 053d1aa72e1b..c44f076a0606 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -131,6 +131,14 @@ struct drm_colorop {
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
@@ -158,10 +166,20 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @next_property
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
  * drm_crtc_find - look up a Colorop object from its ID
  * @dev: DRM device
@@ -208,5 +226,7 @@ static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
 #define drm_for_each_colorop(colorop, dev) \
 	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
 
+void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+
 
 #endif /* __DRM_COLOROP_H__ */
-- 
2.42.1

